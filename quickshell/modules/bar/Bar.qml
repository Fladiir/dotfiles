import Quickshell
import QtQuick

import qs.config
import qs.services
import qs.modules.bar.components
import qs.modules.bar.popouts as BarPopouts

Item
{
	id: root

	readonly property int exclusiveZone: BarConfig.size
	required property BarPopouts.Content popouts

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

		StatusBar
		{
			id: statusbar
			bar: root
			//anchors.right: clock.left
			anchors.centerIn: parent
			//anchors.right: parent.right
			anchors.verticalCenter: parent.verticalCenter
			anchors.rightMargin: 5
		}

		Clock 
		{
			id: clock
			anchors.right: parent.right
			//anchors.centerIn: parent
			anchors.verticalCenter: parent.verticalCenter
		}

	}

	function checkHover(x: real): void
	{
		const statusbarx = statusbar.x
		const networkx = statusbar.x + statusbar.network.x + 20
		const networksize = statusbar.network.width
		const batteryx = statusbar.x + statusbar.battery.x + 20
		const batterysize = statusbar.battery.width

		if(x >= networkx && x <= networkx + networksize) 
		{
			popouts.currentName = "network";
			popouts.currentCenter = networkx + ( networksize / 2 )
			popouts.hasCurrent = true;
		}
		else if(x >= batteryx && x <= batteryx + batterysize) 
		{
			popouts.currentName = "battery"
			popouts.currentCenter = batteryx + ( batterysize / 2 )
			popouts.hasCurrent = true
		}
		else
		{
			popouts.currentName = "EMPTY"
			popouts.hasCurrent = false
		}
		
		//console.log(popouts.currentName);
	
	}
}

