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
				
				mask: Region 
				{
					x: Config.borderThickness
					y: bar.implicitHeight
					width: mainWindow.width - 2 * Config.borderThickness
					height: mainWindow.height - bar.implicitHeight
					intersection: Intersection.Xor
				}

				// TODO: add panels regions

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

					Border {
							bar: bar
					}
				}

				Bar	
				{
					id: bar
				}
			}
		}
	}
}
