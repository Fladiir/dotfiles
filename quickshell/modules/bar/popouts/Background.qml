import QtQuick
import QtQuick.Shapes

import qs.modules.bar.popouts as BarPopouts
import qs.config


ShapePath
{
	id: root
	required property BarPopouts.Content popouts
	readonly property real rounding: PanelsConf.rounding
	readonly property bool flatten: popouts.height < rounding * 2
	readonly property real roundingY: flatten ? popouts.height / 2 : rounding

	fillColor: Config.mainUIBgColor
	strokeWidth: -1
	//required property bool invertBottomRounding
	property real ibr: popouts.x + popouts.width + 1 >= root.width ? -1 : 1
	property real sideRounding: 1

	startX: popouts.x - rounding
	startY: popouts.y

	PathArc {
		relativeY: root.roundingY
		relativeX: root.rounding * root.sideRounding
		radiusY: Math.min(root.rounding, root.popouts.height)
		radiusX: root.rounding
		direction: PathArc.Clockwise 
	}

	PathLine {
		relativeY: root.popouts.height - root.roundingY * 2
		relativeX: 0
	}

	PathArc {
		relativeX: root.rounding
		relativeY: root.roundingY
		radiusY: Math.min(root.rounding, root.popouts.height)
		radiusX: root.rounding
		direction: PathArc.Counterclockwise
	}

	PathLine {
		relativeX: root.popouts.width - root.rounding * 2
		relativeY: 0
	}

	PathArc {
		relativeX: root.rounding
		relativeY: -root.roundingY * root.ibr
		radiusY: Math.min(root.rounding, root.popouts.height)
		radiusX: root.rounding
		direction: root.ibr < 0 ? PathArc.Clockwise : PathArc.Counterclockwise
	}

	PathLine {
		relativeY: -(root.popouts.height - root.roundingY - root.roundingY * root.ibr)
		relativeX: 0
	}

	PathArc {
		relativeY: -root.roundingY
		relativeX: root.rounding * root.sideRounding
		radiusY: Math.min(root.roundingY, root.popouts.height)
		radiusX: root.rounding
		direction: PathArc.Clockwise 
	}

	Behavior on fillColor
	{
		ColorAnimation
		{
			duration: Apperance.anim.durations.normal
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
