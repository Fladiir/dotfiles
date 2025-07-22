import qs.config
import Quickshell
import Quickshell.Wayland

PanelWindow {
    required property string name

    WlrLayershell.namespace: `jotun-${name}`
    color: "transparent"
}
