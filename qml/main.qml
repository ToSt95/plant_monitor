import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Plant monitor")

  Rectangle {
      id: background
      anchors.fill: parent
      color: "green"
  }
}
