import QtQuick 2.15
import QtQuick.Layouts 1.15
import Noctalia 1.0

Item {
    id: root
    width: statusText.implicitWidth + 12
    height: bar.height

    property string status: "inactive"

    Timer {
        id: pollTimer
        interval: 1000       // 1s
        repeat: true
        running: true
        onTriggered: statusCheck.start()
    }

    // Runs pgrep to check if wf-recorder is running
    Process {
        id: statusCheck
        command: "sh"
        arguments: ["-c", "pgrep -x wf-recorder >/dev/null && echo running || echo inactive"]
        onFinished: {
            var out = stdout.trim()
            if (out === "running" || out === "inactive") {
                root.status = out
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 4

        Text {
            id: statusText
            text: root.status
            color: root.status === "running" ? palette.accent : palette.text
            font.pixelSize: bar.font.pixelSize
            verticalAlignment: Text.AlignVCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Optional: open plugin settings or start/stop recording
            // shell.execute("wf-recorder ...")
        }
    }
}
