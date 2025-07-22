import qs.config
import qs.services
import qs.widgets
import Quickshell
import QtQuick
import QtQuick.Layouts

Item
{
	id: root
	implicitWidth: wrapper.width

	required property Item bar
	readonly property var occupied: Hyprland.workspaces.values.reduce((acc, curr) => {
        acc[curr.id] = curr.lastIpcObject.windows > 0;
        return acc;
    }, {})
		
		Rectangle
	{
		id: wrapper
		anchors.centerIn: parent

		color: Config.altUIBgColor
		height: bar.implicitHeight - (2 * Config.wrapperRectPadding)
		width: layout.width + 40
		radius: 8

		RowLayout
		{
			id: layout
			anchors.centerIn: parent
			spacing: 5

			Repeater
			{
				model: Hyprland.workspaces

				MaterialIcon
				{
					required property int index

					text: occupied[index + 1] ? BarConfig.occupiedWorkspaceIcon : BarConfig.emptyWorkspaceIcon
					color: Hyprland.activeWsId === (index + 1) ? BarConfig.focusedWorkspaceColor : BarConfig.baseWorkspaceColor
				}
			}
		}
		
		Behavior on width
		{
			Anim {}
		}

		 component Anim: NumberAnimation {
			duration: Appearance.anim.durations.normal
			easing.type: Easing.BezierSpline
			easing.bezierCurve: Appearance.anim.curves.standard
    }
	}
}
