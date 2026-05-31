import QtQuick
import Quickshell
import Quickshell.Io
import qs.Services.UI

Item {
  id: root

  // Required by Noctalia for bar widgets
  // (these are read by the shell; other official bar widgets define them too)
  property int sectionWidgetIndex: 0
  property var pluginApi: null

  // Our status
  property string status: "inactive"

  // Process that checks if wf-recorder is running
  Process {
    id: statusProcess
    // We’ll control .running from the timer
    running: false
    command: ["sh", "-c", "pgrep -x wf-recorder >/dev/null && echo running || echo inactive"]

    stdout: StdioCollector {
      onStreamFinished: {
        const out = this.text.trim()
        if (out === "running" || out === "inactive") {
          root.status = out
        }
      }
    }
  }

  // Poll every second
  Timer {
    interval: 1000
    repeat: true
    running: true
    triggeredOnStart: true
    onTriggered: statusProcess.running = true
  }

  // Visible label in the bar
  Text {
    id: label
    anchors.verticalCenter: parent.verticalCenter
    text: root.status
    color: root.status === "running"
           ? Theme.palette.accent    // or pluginApi?.theme?.accent if you prefer
           : Theme.palette.text
  }

  // Optional click: toggle or open something
  MouseArea {
    anchors.fill: parent
    onClicked: {
      // Example: show a toast when you click the widget
      ToastService.showNotice(
        root.status === "running"
          ? pluginApi?.tr("wf-recorder.running")
          : pluginApi?.tr("wf-recorder.inactive"),
        "",
        "screen-share"
      )
    }
  }

  // Size: keep it tight to the text
  implicitWidth: label.implicitWidth + 8
  implicitHeight: label.implicitHeight
}
