import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Controls

import qs.config

Item
{
	id: root
	
	readonly property string name: "launcher"

	property bool active: false

	property list<DesktopEntry> apps: []
	property int selectedIndex: 0

	implicitHeight: active ? content.height + PanelsConf.launcher.paddingV : 0
	implicitWidth: active ? input.width + 2 * PanelsConf.launcher.paddingH : 0

	Column
	{
		id: content
		visible: active
		//leftPadding: PanelsConf.launcher.paddingH / 2
		//rightPadding: PanelsConf.launcher.paddingH / 2
		topPadding: PanelsConf.launcher.paddingV
		anchors.horizontalCenter: parent.horizontalCenter
		
		WrapperItem
		{
			bottomMargin: 10
			leftMargin: 10

			TextField
			{
				id: input
				//width: 500

				font.family: Appearance.font.family.sans
				font.pointSize: Appearance.font.size.smaller
				leftInset: -10

				background: 
				Rectangle{
					antialiasing: true
					color: "transparent"
					border.width: 2
					border.color: "#33ffffff"
					implicitWidth: 500
					implicitHeight: 42
					radius: 4
				}
				
				color: "#dddddd"
				renderType: TextField.NativeRendering
				
				placeholderText: "> "
				placeholderTextColor: "#55dddddd"
				
				onTextEdited:
				{
					root.apps = DesktopEntries.applications.values.filter(a => a.name.includes(input.text));
				}

				onAccepted:
				{
					apps[selectedIndex].execute();
					root.active = false;
				}

				Keys.onPressed: event => {

					if (event.key == Qt.Key_Escape)
					{
						root.active = false;
					}

					if (event.key == Qt.Key_Down)
					{
						if(selectedIndex < apps.length)
						{
							root.selectedIndex++;
						}
					}

					if (event.key == Qt.Key_Up)
					{
						if(selectedIndex > 0)
						{
							root.selectedIndex--;
						}
					}

				}
			}

		}

		Repeater
		{
			model: root.apps

			WrapperRectangle
			{
				required property int index
				topMargin: 10
				leftMargin: 10
				color: index == root.selectedIndex ? Config.altUIBgColor : "transparent"
				radius: 4
				height: 32
				//width: root.implicitWidth - 2 * PanelsConf.launcher.paddingH
				width: input.implicitWidth + 10

				Text
				{
					id: text
					font.family: Appearance.font.family.sans
					font.pointSize: Appearance.font.size.smaller
					color: "#dddddd"
					text: root.apps[index].name
					anchors.verticalCenter: parent.verticalCenter
				}
			}
		}
	}
}

