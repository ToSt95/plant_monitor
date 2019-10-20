import QtQuick 2.0

Item {
    property string text: textInput.text

    width: 200
    height: 30

    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
        border.color: "black"
        border.width: 1
        radius: 5
    }

    TextInput {
        id: textInput
        font.pixelSize: 20
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        clip: true
        verticalAlignment: TextInput.AlignVCenter
    }
}

