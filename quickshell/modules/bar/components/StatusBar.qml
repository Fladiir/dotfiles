import qs.config
import qs.services
import qs.widgets
import Quickshell
import QtQuick
import QtQuick.Layouts

Item
{
	id: root
	implicitWidth: wrapper.width

	required property Item bar

	readonly property Item network: network
	readonly property Item battery: battery 
		
	Rectangle
	{
		id: wrapper
		anchors.centerIn: parent

		color: Config.altUIBgColor
		height: bar.implicitHeight - (2 * Config.wrapperRectPadding)
		width: layout.width + 40
		radius: 8

		RowLayout
		{
			id: layout
			anchors.centerIn: parent
			spacing: 5
			
			MaterialIcon
			{
				id: network
				text: "network_wifi"
				color: "#dddddd"
			}

			MaterialIcon
			{
				id: battery
				text: "battery_0_bar"
				color: "#dddddd"
			}

			//MaterialIcon
			//{
			//	id: volume 
			//	text: "volume_up"
			//	color: "#dddddd"
			//}

			//MaterialIcon
			//{
			//	id: krx 
			//	text: "sensors_krx"
			//	color: "#dddddd"
			//}
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
	}
}
