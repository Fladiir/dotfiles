import qs.widgets
import qs.config
import QtQuick

Column {
    id: root

    spacing: Appearance.spacing.normal

		Text {
				id: t
				text: "Net 1"
				color: "#dddddd"
				renderType: Text.NativeRendering
				textFormat: Text.PlainText
				font.family: Appearance.font.family.sans
				font.pointSize: Appearance.font.size.smaller
		}
		

    Text {
        text: "Net 2"
				color: "#dddddd"
    }

    Text {
        text: "Net 3"
				color: "#dddddd"
    }
}
