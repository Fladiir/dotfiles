import qs.config
import qs.modules.bar.popouts as BarPopouts

import Quickshell
import QtQuick

MouseArea
{
	id: root

	required property Item bar
	required property BarPopouts.Content popouts
	required property Panels panels

	anchors.fill: parent
	hoverEnabled: true

	function withinPanelHeight(panel: Item, x: real, y: real): bool {
			const panelY = bar.implicitHeight + panel.y;
			return y >= panelY && y <= panelY + panel.height;
	}

	function withinPanelWidth(panel: Item, x: real, y: real): bool {
			const panelX = panel.x + Config.borderThickness;
			return x >= panelX && x <= panelX + panel.width;
	}
	
	onContainsMouseChanged:
	{
		if (!containsMouse)
		{
			popouts.hasCurrent = false;
			popouts.currentName = "";
		}
	}

	onPositionChanged: event => 
	{
		const x = event.x
		const y = event.y
		
		const popout = panels.popouts;
		if ( y < bar.implicitHeight + popout.height)
		{
			if ( y < bar.implicitHeight)
			{
				root.bar.checkHover(x);
			}
			else
			{
				popouts.hasCurrent = withinPanelHeight(popout, x, y);
			}
		}
		else
		{
			popouts.currentName = "";
			popouts.hasCurrent = false;
		}
	}
}
