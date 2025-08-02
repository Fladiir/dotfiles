import QtQuick
import QtQuick.Shapes

import qs.config
import qs.modules.launcher

ShapePath
{
	id: root
	
	required property Content content
	
	//fillColor: "blue"
	fillColor: Config.mainUIBgColor
	strokeWidth: -1

	PathLine 
	{
		relativeX: 0
		relativeY: content.height
	}
	PathLine 
	{
		relativeX: content.width
		relativeY: 0
	}
	PathLine 
	{
		relativeX: 0
		relativeY: -content.height
	}
	PathLine 
	{
		relativeX: -content.width
		relativeY: 0
	}
}
