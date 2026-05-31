import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Commons
import qs.Services.UI

Item {
   id: root
   
   property var pluginApi: null
   
   property ShellScreen screen
   property string widgetId: ""
   
   readonly property var mainInstance:
       pluginApi?.mainInstance
   
   property bool recorderActive:
       mainInstance
           ? mainInstance.wfRecorderActive
           : false
   
   property var cfg:
       pluginApi?.pluginSettings || ({})
   
   property var defaults:
       pluginApi?.manifest?.metadata?.defaultSettings || ({})
   
   property bool hideInactive:
       cfg.hideInactive
           ?? defaults.hideInactive
           ?? true
   
   readonly property bool isVisible:
       !hideInactive || recorderActive
   
   implicitWidth: 24
   implicitHeight: 24
   
   visible: isVisible
   opacity: isVisible ? 1.0 : 0.0
   
   Rectangle {
       anchors.centerIn: parent
   
       width: 12
       height: 12
       radius: 6
   
       color: "#ff3333"
   
       SequentialAnimation on opacity {
           running: recorderActive
           loops: Animation.Infinite
   
           NumberAnimation {
               from: 1.0
               to: 0.3
               duration: 800
           }
   
           NumberAnimation {
               from: 0.3
               to: 1.0
               duration: 800
           }
       }
   }
   
   MouseArea {
       anchors.fill: parent
       hoverEnabled: true
   
       onEntered: {
           if (recorderActive) {
               TooltipService.show(
                   root,
                   "wf-recorder is recording",
                   BarService.getTooltipDirection()
               );
           }
       }
   
       onExited: TooltipService.hide()
   }

}

