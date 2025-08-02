import Quickshell
import QtQuick

import qs.config
import qs.modules.bar.popouts as BarPopouts
import qs.modules.launcher as Launcher

Item
{
	id: root

	readonly property Item popouts: popouts
	readonly property Item launcher: launcher

	required property Item bar 
	anchors.fill: parent
	anchors.topMargin: bar.implicitHeight

	Launcher.Content
	{
		id: launcher

		x: (root.width / 2) - (implicitWidth / 2)
		y: root.height - implicitHeight
	}
	
	BarPopouts.Content
	{
		id: popouts

		x: 
		{ 
			const off = currentCenter - Config.borderThickness - implicitWidth / 2;
			const diff = root.width - Math.floor(off + implicitWidth);
			if (diff < 0)
				return off + diff;

			return off;
		}
		y: 0
	}
}
