import qs.config
import qs.modules.bar.popouts as BarPopouts

import Quickshell
import QtQuick

MouseArea
{
	id: root

	required property Item bar
	required property Panels panels
	required property PersistentProperties visibilities

	anchors.fill: parent
	hoverEnabled: true

	onPositionChanged: event => 
	{
		const x = event.x
		const y = event.y
		
		if ( y > root.height - 3 && (x > mainWindow.width / 2 - 250 && x < mainWindow.width / 2 + 250))
		{
			visibilities.launcher = true;		
		}
	}
}
