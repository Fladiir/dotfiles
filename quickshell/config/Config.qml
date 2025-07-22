pragma Singleton

import Quickshell
import QtQuick

Singleton {
	id: root

	readonly property int borderThickness: 1
	readonly property int wrapperRectPadding: 4
	
	readonly property string mainUIBgColor: "#ff020008"
	readonly property string altUIBgColor: "#10ffffff"

}
