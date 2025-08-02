import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects

import qs.config
import qs.modules
import qs.modules.bar
import qs.widgets

ShellRoot 
{
	
	Variants 
	{
		model: Quickshell.screens

		Scope 
		{
			id: scope
			required property ShellScreen modelData

			Exclusions
			{
				screen: scope.modelData
				bar: bar
			}

			CustomWindow
			{
				id: mainWindow
				name: "main"
				screen: scope.modelData
				color: "transparent"
				//color: "#22ff0000"
				WlrLayershell.exclusionMode: ExclusionMode.Ignore
				WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand
				
				mask: Region 
				{
					x: Config.borderThickness
					y: bar.implicitHeight
					width: mainWindow.width - 2 * Config.borderThickness
					height: mainWindow.height - bar.implicitHeight - Config.borderThickness
					intersection: Intersection.Xor

					regions: regions.instances
				}

				Variants
				{
					id: regions
					model: panels.children
					Region 
					{
						required property Item modelData

						x: modelData.x + Config.borderThickness
						y: modelData.y + bar.implicitHeight
						width: modelData.width
						height: modelData.height
						intersection: Intersection.Subtract
          }
				}
				
				anchors.top: true
				anchors.bottom: true
				anchors.left: true
				anchors.right: true
				
				Item
				{
					anchors.fill: parent
					layer.enabled: true
					layer.effect: MultiEffect {
							shadowEnabled: true
							blurMax: 15
							shadowColor: Qt.alpha("#000000", 0.7)
					}

					Backgrounds
					{
						popouts: panels.popouts
						panels: panels
					}

					Border {
							bar: bar
					}
				}


				Interactions
				{
					id: interactions
					bar: bar
					panels: panels
					popouts: panels.popouts

					Panels
					{
						id: panels
						bar: bar
					}
				}

				Bar	
				{
					id: bar
					popouts: panels.popouts
				}
			}
		}
	}
}
