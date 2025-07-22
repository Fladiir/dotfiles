import qs.config
import qs.services
import Quickshell
import QtQuick


Item 
{
	id: root
	anchors.centerIn: parent

	Text
	{
		text: Time.format("dd MMMM yyyy hh:mm")
		color: "#dddddd"
		font.family: Appearance.font.family.mono
		font.pointSize: Appearance.font.size.small
		font.weight: 700
		anchors.centerIn: parent
	}

}

