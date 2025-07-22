pragma ComponentBehavior: Bound

import qs.widgets
import qs.config
import QtQuick
import QtQuick.Effects

Item {
    id: root

    required property Item bar

    anchors.fill: parent

    CustomRect {
        anchors.fill: parent
        color: Config.mainUIBgColor

        layer.enabled: true
        layer.effect: MultiEffect {
            maskSource: mask
            maskEnabled: true
            maskInverted: true
            maskThresholdMin: 0.5
            maskSpreadAtMin: 1
        }
    }

    Item {
        id: mask

        anchors.fill: parent
        layer.enabled: true
        visible: false

        Rectangle {
            anchors.fill: parent
            anchors.margins: Config.borderThickness
            anchors.topMargin: root.bar.implicitHeight
        }
    }
}
