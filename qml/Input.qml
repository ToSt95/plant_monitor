import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    property string text: textInput.text
    property string placeholder
    property alias echoMode: textInput.echoMode

    width: 200
    height: 30

    TextField  {
        id: textInput
        font.pixelSize: 15
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        clip: true
        verticalAlignment: TextInput.AlignVCenter
        placeholderText: placeholder

        background:     Rectangle {
            id: background
            anchors.fill: parent
            color: "white"
            border.color: "black"
            border.width: 1
            radius: 5
        }
    }
}

