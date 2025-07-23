import qs.config
import qs.services
import Quickshell
import QtQuick


Row 
{
	id: root
	//anchors.centerIn: parent
	anchors.rightMargin: 10

	Text
	{
		text: Time.format("dd MMMM hh:mm")
		color: "#dddddd"
		font.family: Appearance.font.family.mono
		font.pointSize: Appearance.font.size.small
		font.weight: 700
		//anchors.centerIn: parent
	}

}

