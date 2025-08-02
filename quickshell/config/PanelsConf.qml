pragma Singleton

import Quickshell
import QtQuick

Singleton
{
	readonly property real rounding: 8
	readonly property Launcher launcher: Launcher {}


	component Launcher: QtObject
	{
		readonly property int paddingH: 40
		readonly property int paddingV: 20
	}

}
