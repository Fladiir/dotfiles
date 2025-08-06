import qs.config
import qs.services
import qs.widgets
import qs.modules.bar.popouts as BarPopouts


import Quickshell
import QtQuick
import QtQuick.Layouts

Item
{
	id: root
	implicitWidth: wrapper.width

	required property Item bar
	required property BarPopouts.Content popouts

	readonly property Item network: network
	readonly property Item battery: battery 
		
	Rectangle
	{
		id: wrapper
		anchors.centerIn: parent

		color: Config.altUIBgColor
		height: bar.implicitHeight - (2 * Config.wrapperRectPadding)
		//color: "transparent"
		//height: bar.implicitHeight
		width: layout.width + 20
		radius: 8

		RowLayout
		{
			id: layout
			anchors.centerIn: parent
			spacing: 5
			
			StatusItem
			{
				id: network
				name: "network"
				icon: "network_wifi"
			}

			StatusItem
			{
				id: battery
				name: "battery"
				icon: "battery_0_bar"
			}
		}
		
		Behavior on width
		{
			Anim {}
		}

		component Anim: NumberAnimation {
			duration: Appearance.anim.durations.normal
			easing.type: Easing.BezierSpline
			easing.bezierCurve: Appearance.anim.curves.standard
    }

		component StatusItem: Rectangle
		{
			id: wrapper
			color: "transparent"
			//width: bar.implicitHeight
			//height: bar.implicitHeight
			width: micon.implicitHeight
			height: micon.implicitHeight
			
			required property string name
			required property string icon

			MouseArea
			{
				anchors.fill: parent
				hoverEnabled: true

				onContainsMouseChanged:
				{
					if(containsMouse)
					{
						popouts.currentName = name;
						popouts.currentCenter = root.x + wrapper.x + micon.x + 10 + ( micon.width / 2 );
						popouts.hasCurrent = true;
					}
					else
					{

						if((mouseX <= 1 || mouseX >= wrapper.width - 1)) 
						{
							popouts.currentName = "EMPTY";
							popouts.hasCurrent = false;
						}
					}
				}
			}
			MaterialIcon
			{
				id: micon 
				text: icon
				color: "#dddddd"
				anchors.centerIn: parent
			}
		}
	}
}
