import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Controls

import qs.config
import qs.widgets

Item
{
	id: root

	required property PersistentProperties visibilities

	property list<DesktopEntry> apps: DesktopEntries.applications.values
	property string currentState: "apps"

	implicitHeight: visibilities.launcher ? apps.implicitHeight + 2 * PanelsConf.launcher.paddingV : 0
	implicitWidth: apps.implicitWidth + 2 * PanelsConf.launcher.paddingH

	MouseArea
	{
		anchors.fill: parent
		hoverEnabled: true

		onContainsMouseChanged:
		{
			if(!containsMouse && !apps.input.hovered)
			{
				root.visibilities.launcher = false;
			}
		}
	}

	AppList
	{
		id: apps
		visibilities: root.visibilities
		anchors.horizontalCenter: parent.horizontalCenter
	}

	property int animLength: Appearance.anim.durations.large
	property list<real> animCurve: Appearance.anim.curves.emphasizedDecel

	Behavior on x
	{
		enabled: root.implicitHeight > 0
		Anim {}
	}

	//Behavior on y
	//{
	//	Anim {}
	//}

	Behavior on implicitWidth 
	{
		enabled: root.implicitHeight > 0
		Anim {
			duration: root.animLength
			easing.bezierCurve: root.animCurve
		}
	}

	Behavior on implicitHeight 
	{

		Anim 
		{
			duration: root.animLength
			easing.bezierCurve: root.animCurve
		}
	}

	component Anim: NumberAnimation 
	{
		duration: Appearance.anim.durations.normal
		easing.type: Easing.BezierSpline
		easing.bezierCurve: Appearance.anim.curves.emphasized
	}
}

