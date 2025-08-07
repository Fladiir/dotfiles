import Quickshell
import QtQuick
import QtQuick.Shapes

import qs.config
import qs.modules.launcher

ShapePath
{
	id: root
	
	required property Content content
	required property PersistentProperties visibilities

	property real ibr: root.x + root.width + 1 >= mainWindow.width ? -1 : 1
	readonly property bool open: visibilities.launcher
	readonly property real rounding: PanelsConf.rounding
	
	//fillColor: "blue"
	fillColor: open ? Config.mainUIBgColor : "transparent"
	strokeWidth: -1

	PathArc
	{
		relativeX: root.rounding
		relativeY: -root.rounding
		radiusX: root.rounding
		radiusY: root.rounding
		direction: PathArc.Counterclockwise
	}

	PathLine 
	{
		relativeX: 0
		relativeY: -content.height + root.rounding
	}

	PathArc
	{
		relativeX: root.rounding
		relativeY: -root.rounding
		radiusX: root.rounding
		radiusY: root.rounding
		direction: PathArc.Clockwise
	}

	PathLine 
	{
		relativeX: content.width - root.rounding
		relativeY: 0
	}

	PathArc
	{
		relativeX: root.rounding
		relativeY: root.rounding
		radiusX: root.rounding
		radiusY: root.rounding
		direction: PathArc.Clockwise
	}

	PathLine 
	{
		relativeX: 0
		relativeY: content.height - root.rounding
	}

	PathArc
	{
		relativeX: root.rounding
		relativeY: root.rounding
		radiusX: root.rounding
		radiusY: root.rounding
		direction: PathArc.Counterclockwise
	}

	Behavior on fillColor
	{
		ColorAnimation
		{
			duration: Appearance.anim.durations.normal
			easing.type: Easing.BezierSpline
			easing.bezierCurve: Appearance.anim.curves.standard
		}
	}

	Behavior on ibr {
		NumberAnimation {
				duration: Appearance.anim.durations.normal
				easing.type: Easing.BezierSpline
				easing.bezierCurve: Appearance.anim.curves.standard
		}
	}
}
