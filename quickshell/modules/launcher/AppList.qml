import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick
import QtQuick.Controls

import qs.config
import qs.widgets
import qs.utils

Item
{
	id: root

	required property PersistentProperties visibilities
	property list<DesktopEntry> apps: DesktopEntries.applications.values
	readonly property Item input: input


	implicitWidth: input.implicitWidth
	implicitHeight: col.implicitHeight


	Column
	{
		id: col

		WrapperItem
		{
			//anchors.horizontalCenter: parent.horizontalCenter
			topMargin: 20
			bottomMargin: 20
			leftMargin: 10

			Connections 
			{
				target: root.visibilities

				function onLauncherChanged(): void {
					if (root.visibilities.launcher)
					{
						input.focus = true;
						input.forceActiveFocus();
					}
					else 
					{
						input.text = "";
						root.apps = DesktopEntries.applications.values
					}
				}
			}

			Searchbar
			{
				id: input

				barWidth: 500
				onTextEdited:
				{
					//root.apps = DesktopEntries.applications.values.filter(a => a.name.includes(input.text));
					root.apps = AppsSearcher.query(input.text);
				}

				Keys.onPressed: event => {

					if (event.key == Qt.Key_Escape)
					{
						root.visibilities.launcher = false;
					}


					if (event.key == Qt.Key_Down)
					{
						listView.forceActiveFocus();
					}
				}

				onAccepted:
				{
					const app = root.apps[listView.currentIndex];
					root.launch(app);
					root.visibilities.launcher = false;
				}
			}
		}
		
		ListView	
		{
			id: listView
			model: root.apps
			width: input.implicitWidth
			//height: root.implicitHeight - input.height - 40
			height: 200
			//anchors.horizontalCenter: parent.horizontalCenter
			activeFocusOnTab: true


			focus: true
			delegate: 
			WrapperRectangle
			{
				property int index
				topMargin: 16
				leftMargin: 10
				color: ListView.isCurrentItem ? Config.altUIBgColor : "transparent"
				radius: 4
				height: 32
				width: input.implicitWidth - 15

				Behavior on color
				{
					ColorAnimation 
					{
						duration: Appearance.anim.durations.small
						easing.type: Easing.BezierSpline
						easing.bezierCurve: Appearance.anim.curves.standard
					}
				}

				Text
				{
					id: text
					font.family: Appearance.font.family.sans
					font.pointSize: Appearance.font.size.smaller
					color: "#dddddd"
					text: name
					anchors.verticalCenter: parent.verticalCenter
				}

			}

			ScrollBar.vertical:
			ScrollBar
			{
				policy: ScrollBar.AlwaysOn
				anchors.right: parent.right
			}

			Keys.onPressed: event => {

				if (event.key == Qt.Key_Escape)
				{
					root.visibilities.launcher = false;
				}

				if (event.key == Qt.Key_Return)
				{
					const app = root.apps[listView.currentIndex];
					root.launch(app);
					root.visibilities.launcher = false;
				}

				if (event.key == Qt.Key_Up)
				{
					if(listView.currentIndex == 0)
					{
						input.forceActiveFocus();
					}
				}

			}

			add: Transition {
				Anim {
					properties: "opacity,scale"
					from: 0
					to: 1
				}
			}

			remove: Transition {
				Anim {
					properties: "opacity,scale"
					from: 1
					to: 0
				}
			}

			move: Transition {
				Anim {
					property: "y"
				}
				Anim {
					properties: "opacity,scale"
					to: 1
				}
			}

			addDisplaced: Transition {
				Anim {
					property: "y"
					duration: Appearance.anim.durations.small
				}
				Anim {
					properties: "opacity,scale"
					to: 1
				}
			}

			displaced: Transition {
				Anim {
					property: "y"
				}
				Anim {
					properties: "opacity,scale"
					to: 1
				}
			}
		}
	}

	Process
	{
		id: termProc
	}

	function launch(app: DesktopEntry): void
	{
		if(!app.runInTerminal)
		{
			app.execute();
		}
		else
		{
			termProc.command = ["kitty", "--hold", ...app.command]
			termProc.startDetached();
		}
	}

	component Anim: NumberAnimation {
		duration: Appearance.anim.durations.normal
		easing.type: Easing.BezierSpline
		easing.bezierCurve: Appearance.anim.curves.standard
	}
}
