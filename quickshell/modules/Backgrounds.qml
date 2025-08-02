import QtQuick
import QtQuick.Shapes

import qs.config
import qs.modules.launcher as Launcher
import qs.modules.bar.popouts as BarPopouts

Shape
{
	id: root
	anchors.fill: parent
	anchors.topMargin: BarConfig.size

	required property BarPopouts.Content popouts
	required property Panels panels

	preferredRendererType: Shape.CurveRenderer

	BarPopouts.Background
	{
		popouts: root.popouts
	}

	Launcher.Background
	{
		content: root.panels.launcher
		startX: ( root.width / 2 ) - ( panels.launcher.width / 2) 
		startY: root.height - panels.launcher.height
	}

}


