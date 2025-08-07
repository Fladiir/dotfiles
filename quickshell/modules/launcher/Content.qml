import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Controls

import qs.config
import qs.widgets

Item
{
	id: root

	required property PersistentProperties visibilities

	property list<DesktopEntry> apps: DesktopEntries.applications.values
	property int selectedIndex: 0

	implicitHeight: visibilities.launcher ? content.height + PanelsConf.launcher.paddingV : 0
	implicitWidth: visibilities.launcher ? apps.width + 2 * PanelsConf.launcher.paddingH : 0

	MouseArea
	{
		anchors.fill: parent
		hoverEnabled: true

		onContainsMouseChanged:
		{
			if(!containsMouse && !apps.input.hovered)
			{
				root.visibilities.launcher = false;
			}
		}
	}

	Column
	{
		id: content
		visible: root.visibilities.launcher
		topPadding: PanelsConf.launcher.paddingV
		height: 300
		width: apps.implicitWidth + 2 * PanelsConf.launcher.paddingH

		AppList
		{
			id: apps
			visibilities: root.visibilities
			anchors.horizontalCenter: parent.horizontalCenter
		}

		//WrapperItem
		//{
		//	anchors.horizontalCenter: parent.horizontalCenter
		//	bottomMargin: 20
		//	leftMargin: 10

		//	Connections 
		//	{
		//		target: root.visibilities

		//		function onLauncherChanged(): void {
		//			if (root.visibilities.launcher)
		//			{
		//				input.focus = true;
		//				input.forceActiveFocus();
		//			}
		//			else 
		//			{
		//				input.text = "";
		//				root.apps = DesktopEntries.applications.values
		//			}
		//		}
		//	}

		//	Searchbar
		//	{
		//		id: input
		//		
		//		barWidth: 500
		//		onTextEdited:
		//		{
		//			root.apps = DesktopEntries.applications.values.filter(a => a.name.includes(input.text));
		//		}

		//		Keys.onPressed: event => {

		//			if (event.key == Qt.Key_Escape)
		//			{
		//				root.visibilities.launcher = false;
		//			}


		//			if (event.key == Qt.Key_Down)
		//			{
		//				listView.forceActiveFocus();
		//			}
		//		}
		//	}
		//}

		//ListView	
		//{
		//	id: listView
		//	model: root.apps
		//	width: input.implicitWidth
		//	height: root.implicitHeight - input.height - 40
		//	anchors.horizontalCenter: parent.horizontalCenter
		//	activeFocusOnTab: true


		//	focus: true
		//	delegate: 
		//	WrapperRectangle
		//	{
		//		property int index
		//		topMargin: 16
		//		leftMargin: 10
		//		color: ListView.isCurrentItem ? Config.altUIBgColor : "transparent"
		//		radius: 4
		//		height: 32
		//		width: input.implicitWidth - 15

		//		Behavior on color
		//		{
		//			ColorAnimation 
		//			{
		//				duration: Appearance.anim.durations.small
		//				easing.type: Easing.BezierSpline
		//				easing.bezierCurve: Appearance.anim.curves.standard
		//			}
		//		}

		//		Text
		//		{
		//			id: text
		//			font.family: Appearance.font.family.sans
		//			font.pointSize: Appearance.font.size.smaller
		//			color: "#dddddd"
		//			text: name
		//			anchors.verticalCenter: parent.verticalCenter
		//		}

		//	}

		//	ScrollBar.vertical:
		//	ScrollBar
		//	{
		//		policy: ScrollBar.AlwaysOn
		//		anchors.right: parent.right
		//	}

		//	Keys.onPressed: event => {

		//		if (event.key == Qt.Key_Escape)
		//		{
		//			root.visibilities.launcher = false;
		//		}

		//		if (event.key == Qt.Key_Return)
		//		{
		//			root.apps[listView.currentIndex].execute();
		//			root.visibilities.launcher = false;
		//		}

		//		if (event.key == Qt.Key_Up)
		//		{
		//			if(listView.currentIndex == 0)
		//			{
		//				input.forceActiveFocus();
		//			}
		//		}

		//	}
		//}

	}

	property int animLength: Appearance.anim.durations.normal
	property list<real> animCurve: Appearance.anim.curves.emphasized

	Behavior on x
	{
		enabled: root.implicitHeight > 0
		Anim {}
	}

	Behavior on y
	{
		Anim {}
	}

	Behavior on implicitWidth 
	{
		enabled: root.implicitHeight > 0
		Anim {
			duration: root.animLength
			easing.bezierCurve: root.animCurve
		}
	}

	Behavior on implicitHeight 
	{

		Anim 
		{
			duration: root.animLength
			easing.bezierCurve: root.animCurve
		}
	}

	component Anim: NumberAnimation 
	{
		duration: Appearance.anim.durations.normal
		easing.type: Easing.BezierSpline
		easing.bezierCurve: Appearance.anim.curves.emphasized
	}
}

