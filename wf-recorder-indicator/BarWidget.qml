import QtQuick
import Quickshell
import Quickshell.Io
import qs.Services.UI

Item {
  id: root
  property int sectionWidgetIndex: 0
  property var pluginApi: null

  property bool recording: false

  Process {
    id: statusProcess
    running: false
    command: ["sh", "-c", "pgrep -x wf-recorder >/dev/null && echo running || echo inactive"]

    stdout: StdioCollector {
      onStreamFinished: {
        const out = this.text.trim()
        root.recording = (out === "running")
      }
    }
  }

  Timer {
    interval: 1000
    repeat: true
    running: true
    triggeredOnStart: true
    onTriggered: statusProcess.running = true
  }

  // Capsule container fills bar height; we animate opacity
  Item {
    id: container
    anchors.fill: parent
    opacity: root.recording ? 1 : 0

    Behavior on opacity {
      NumberAnimation {
        duration: 150
        easing.type: Easing.InOutQuad
      }
    }

    // Capsule background, centered vertically
    Rectangle {
      id: capsule
      height: Math.max(parent.height * 0.7, 16)  // 70% of bar height, min 16
      width: height                               // pill-ish, can be wider if you prefer
      radius: height / 2

      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter

      // Background & border colors – you can swap for theme values
      color: Qt.rgba(0, 0, 0, 0.25)               // translucent bg like other widgets
      border.color: Qt.rgba(1, 1, 1, 0.35)        // light border
      border.width: 1

      // Red dot centered inside capsule
      Rectangle {
        id: dot
        height: capsule.height * 0.45
        width: height
        radius: width / 2
        color: "#ff4b4b"
        anchors.centerIn: parent

        scale: root.recording ? 1 : 0.4
        Behavior on scale {
          NumberAnimation {
            duration: 150
            easing.type: Easing.OutBack
          }
        }
      }
    }

  }

  // Push neighbors smoothly: width animates between 0 and capsule width
  implicitWidth: root.recording ? (capsule.width + 6) : 0
  implicitHeight: 0

  Behavior on implicitWidth {
    NumberAnimation {
      duration: 150
      easing.type: Easing.InOutQuad
    }
  }
}
