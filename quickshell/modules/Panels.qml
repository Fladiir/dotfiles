import Quickshell
import QtQuick

import qs.config
import qs.modules.bar.popouts as BarPopouts

Item
{
	id: root

	readonly property Item popouts: popouts
	required property Item bar 
	anchors.fill: parent
	anchors.topMargin: bar.implicitHeight
	
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
