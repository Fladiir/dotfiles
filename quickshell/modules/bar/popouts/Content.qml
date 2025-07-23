import qs.config
import Quickshell
import QtQuick

Item
{
	id: root
	property string currentName
	property bool hasCurrent
	property real currentCenter

	//anchors.verticalCenter: anchors.verticalCenter

	implicitWidth: hasCurrent ? ( content.children.find(c => c.shouldBeActive)?.implicitWidth ?? content.implicitWidth ) + 200 : 0
	implicitHeight: hasCurrent ? ( content.children.find(c => c.shouldBeActive)?.implicitHeight ?? content.implicitHeight ) + 40 : 0
	
	Item
	{
		id: content
		anchors.fill: parent
		anchors.leftMargin: 10

		//Rectangle
		//{
		//	color: "transparent"
		//	width: root.width
		//	height: root.height
		//	//anchors.centerIn: parent
		//	anchors.verticalCenter: parent.verticalCenter	
		//}
		Popout
		{
			name: "network"
			source: "Network.qml"
			//anchors.centerIn: parent
			anchors.verticalCenter: parent.verticalCenter	
		}
		

		Popout
		{
			name: "battery"
			source: "Battery.qml"
			//anchors.centerIn: parent
			anchors.verticalCenter: parent.verticalCenter	
		}
	}
	


	component Popout: Loader
	{
		id: popout

		required property string name
		property bool shouldBeActive: root.currentName === name

		//anchors.verticalCenter: parent.verticalCenter
		//anchors.right: parent.right

		opacity: 0
		scale: 0.8
		active: false
		asynchronous: true

		//onStatusChanged: console.log( "[" + popout.state + "] W: " + root.implicitWidth + " H: " + root.implicitHeight) 
		//onStatusChanged: console.log( "[" + name + "] W: " + root.x + " H: " + root.y) 
		states: State
		{
			name: "active"
			when: popout.shouldBeActive

			PropertyChanges
			{
				popout.active: true
				popout.opacity: 1
				popout.scale: 1
			}

		}
	}
}
