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

	function withinPanelHeight(panel: Item, x: real, y: real): bool 
	{
			const panelY = bar.implicitHeight + panel.y;
			return y >= panelY && y <= panelY + panel.height;
	}

	function withinPanelWidth(panel: Item, x: real, y: real): bool 
	{
			const panelX = panel.x + Config.borderThickness;
			return x >= panelX && x <= panelX + panel.width;
	}
	
	function inBottomPanel(panel: Item, x: real, y: real): bool
	{
		const inH = y > root.height - Config.borderThickness && y < panels.launcher.height;
		const inW = x > panels.launcher.x && x < panels.launcher.x + panels.launcher.width;

		return inH && inW;
	}

	onContainsMouseChanged:
	{
		if (!containsMouse)
		{
			popouts.hasCurrent = false;
			popouts.currentName = "";
			
			panels.launcher.active = false;
		}
	}

	onPositionChanged: event => 
	{
		const x = event.x
		const y = event.y

		if ( y > root.height - 3 )
		{
			panels.launcher.active = true;
		}
		else
		{
			if (!inBottomPanel)
			{
				panels.launcher.active = false;
			}
		}
		
		const popout = panels.popouts;
		if ( y < bar.implicitHeight + popout.height )
		{
			if ( y < bar.implicitHeight )
			{
				root.bar.checkHover(x);
			}
			else
			{
				popouts.hasCurrent = withinPanelHeight( popout, x, y );
			}
		}
		else
		{
			popouts.currentName = "";
			popouts.hasCurrent = false;
		}
	}
}
