import QtQuick
import QtQuick.Shapes

import qs.config
import qs.modules.bar.popouts as BarPopouts

Shape
{
	id: root
	anchors.fill: parent
	anchors.topMargin: BarConfig.size
	required property BarPopouts.Content popouts
	preferredRendererType: Shape.CurveRenderer

	ShapePath
	{
		id: path
		fillColor: Config.mainUIBgColor
		strokeWidth: -1
		readonly property real rounding: 8
		readonly property bool flatten: popouts.height < rounding * 2
		readonly property real roundingY: flatten ? popouts.height / 2 : rounding
		property real ibr: -1
		property real sideRounding: 1

		startX: popouts.x - rounding
		startY: popouts.y
		PathArc {
			relativeY: path.roundingY
			relativeX: path.rounding * path.sideRounding
			radiusY: Math.min(path.rounding, root.popouts.height)
			radiusX: path.rounding
			direction: PathArc.Clockwise 
		}

		PathLine {
      relativeY: root.popouts.height - path.roundingY * 2
      relativeX: 0
    }

		PathArc {
      relativeX: path.rounding
			relativeY: path.roundingY
      radiusY: Math.min(path.rounding, root.popouts.height)
      radiusX: path.rounding
			direction: PathArc.Counterclockwise
    }

		PathLine {
      relativeX: root.popouts.width - path.rounding * 2
      relativeY: 0
    }

		PathArc {
      relativeX: path.rounding
			relativeY: -path.roundingY
      radiusY: Math.min(path.rounding, root.popouts.height)
      radiusX: path.rounding
			direction: PathArc.Counterclockwise
    }

		PathLine {
      relativeY: -root.popouts.height + path.roundingY * 2
      relativeX: 0
    }

		PathArc {
			relativeY: -path.roundingY
			relativeX: path.rounding * path.sideRounding
			radiusY: Math.min(path.roundingY, root.popouts.height)
			radiusX: path.rounding
			direction: PathArc.Clockwise 
    }
		//PathLine { x: popouts.x + popouts.width; y: popouts.y }
		//PathLine { x: popouts.x + popouts.width; y: popouts.y + popouts.height}
		//PathLine { x: popouts.x; y: popouts.y + popouts.height }
		//PathLine { x: popouts.x; y: popouts.y }
	}
}


