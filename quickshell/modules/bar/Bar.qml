import Quickshell
import QtQuick

import qs.config
import qs.services
import qs.modules.bar.components

Item
{
	id: root

	readonly property int exclusiveZone: BarConfig.size

	anchors.top: parent.top
	anchors.left: parent.left
	anchors.right: parent.right
	implicitHeight: BarConfig.size
	width: mainWindow.width
	
	Item
	{
		id: child 
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.verticalCenter: parent.verticalCenter
		implicitHeight: clock.implicitHeight

		Workspaces
		{
			id: workspaces
			bar: root 
			anchors.left: parent.left
			anchors.verticalCenter: parent.verticalCenter
			anchors.leftMargin: 5
		}

		Clock 
		{
			id: clock
		}
	}
}

