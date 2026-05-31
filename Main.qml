import QtQuick
import Quickshell
import Quickshell.Io

Item {

   id: root
   property bool wfRecorderActive: false
   
   Process {
       id: wfRecorderCheck
   
       running: false
   
       command: [
           "sh",
           "-c",
           "pgrep -x wf-recorder >/dev/null && echo active"
       ]
   
       stdout: StdioCollector {
           onStreamFinished: {
               root.wfRecorderActive =
                   text.trim() === "active";
           }
       }
   }
   
   Timer {
       interval: 1000
       repeat: true
       running: true
       triggeredOnStart: true
   
       onTriggered: {
           wfRecorderCheck.running = true;
       }
   }

}
