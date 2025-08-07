import Quickshell.Widgets
import QtQuick
import QtQuick.Controls

import qs.config

TextField
{
	required property int barWidth

	id: input
	font.family: Appearance.font.family.sans
	font.pointSize: Appearance.font.size.smaller
	leftInset: -10
	implicitWidth: bg.implicitWidth
	implicitHeight: bg.implicitHeight
	leftPadding: 28
	activeFocusOnTab: true

	background: 
	Rectangle{
		id: bg
		antialiasing: true
		color: "transparent"
		border.width: 2
		border.color: !input.focus ? "#55ffffff" : "#ff9966"
		implicitWidth: barWidth
		implicitHeight: 42
		radius: 4

		Behavior on border.color
		{
			ColorAnimation 
			{
				duration: Appearance.anim.durations.normal
				easing.type: Easing.BezierSpline
				easing.bezierCurve: Appearance.anim.curves.standard
			}
		}

		Row
		{
			anchors.verticalCenter: parent.verticalCenter

			WrapperItem
			{
				leftMargin: 5
				topMargin: 2

				MaterialIcon
				{
					text: "search"
					//color: !input.focus ? "#55ffffff" : "#bbffffff"
					color: !input.focus ? "#55ffffff" : "#ff9966"
					font.pointSize: 24

					Behavior on color
					{
						ColorAnimation 
						{
							duration: Appearance.anim.durations.normal
							easing.type: Easing.BezierSpline
							easing.bezierCurve: Appearance.anim.curves.standard
						}
					}
				}
			}
		}
	}

	color: "#dddddd"
	renderType: TextField.NativeRendering
}

