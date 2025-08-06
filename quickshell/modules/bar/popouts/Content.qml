import qs.config
import Quickshell
import QtQuick

Item
{
	id: root
	property string currentName
	property bool hasCurrent
	property real currentCenter
	readonly property Item contentma: contentma

	implicitWidth: hasCurrent ? ( content.children.find(c => c.shouldBeActive)?.implicitWidth ?? content.implicitWidth ) + 50 : 0
	implicitHeight: hasCurrent ? ( content.children.find(c => c.shouldBeActive)?.implicitHeight ?? content.implicitHeight ) + 40 : 0
	
	Item
	{
		id: content
		anchors.fill: parent

		MouseArea
		{
			id: contentma
			hoverEnabled: true
			anchors.fill: parent

			onContainsMouseChanged:
			{
				if(!containsMouse)
				{
					root.hasCurrent = false
					root.currentName = "EMPTY"
				}
			}
		}

		Popout
		{
			name: "network"
			source: "Network.qml"
		}
		

		Popout
		{
			name: "battery"
			source: "Battery.qml"
		}
	}

	component Popout: Loader
	{
		id: popout

		required property string name
		property bool shouldBeActive: root.currentName === name

		anchors.centerIn: parent

		opacity: 0
		scale: 0.8
		active: false
		asynchronous: true

		states: State
		{
			name: "active"
			when: popout.shouldBeActive

			PropertyChanges
			{
				popout.active: true
				popout.opacity: 1
				popout.scale: 1
			}

		}

		transitions: 
		[
			Transition {
				from: ""
				to: "active"

				SequentialAnimation {
					PropertyAction {
						property: "active"
					}
					Anim {
						property: "opacity"
						easing.bezierCurve: Appearance.anim.curves.standard
					}
				}
			},
			Transition {
				from: "active"
				to: ""

				SequentialAnimation {
					Anim {
						property: "opacity"
						easing.bezierCurve: Appearance.anim.curves.standard
					}
					PropertyAction {
						property: "active"
					}
				}
			}
		]
	}

	property int animLength: Appearance.anim.durations.normal
  property list<real> animCurve: Appearance.anim.curves.emphasized
	
	Behavior on x
	{
		enabled: root.implicitHeight > 0
		Anim {}
	}

	Behavior on y
	{
		Anim {}
	}

	Behavior on implicitWidth 
	{
    enabled: root.implicitHeight > 0
    Anim {
      duration: root.animLength
      easing.bezierCurve: root.animCurve
    }
  }

	Behavior on implicitHeight 
	{

		Anim 
		{
      duration: root.animLength
      easing.bezierCurve: root.animCurve
    }
  }

	component Anim: NumberAnimation 
	{
  	duration: Appearance.anim.durations.normal
    easing.type: Easing.BezierSpline
    easing.bezierCurve: Appearance.anim.curves.emphasized
  }
}
