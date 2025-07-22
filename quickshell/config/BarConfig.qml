pragma Singleton

import Quickshell
import QtQuick

Singleton {
	id: root

	readonly property int size: 32

	readonly property string emptyWorkspaceIcon: "radio_button_unchecked"
	readonly property string occupiedWorkspaceIcon: "radio_button_checked"
	
	readonly property string baseWorkspaceColor: "#44dddddd"
	readonly property string focusedWorkspaceColor: "#4960ab"
}
