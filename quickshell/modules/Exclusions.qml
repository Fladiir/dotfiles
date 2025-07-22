pragma ComponentBehavior: Bound

import qs.config
import qs.widgets
import Quickshell
import QtQuick

Scope {
    id: root

    required property ShellScreen screen
    required property Item bar

    ExclusionZone {
        anchors.top: true
        exclusiveZone: root.bar.exclusiveZone
    }

    ExclusionZone {
        anchors.left: true
    }

    ExclusionZone {
        anchors.right: true
    }

    ExclusionZone {
        anchors.bottom: true
    }

    component ExclusionZone: CustomWindow {
        screen: root.screen
        name: "border-exclusion"
        exclusiveZone: Config.borderThickness
        mask: Region {}
    }
}
