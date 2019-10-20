import QtQuick 2.0

Item {
    width: 150
    height: 30
    signal buttonClicked;
    property string text

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#888a89"
        border.color: "black"
        border.width: 1
        radius: 5

        Text {
            id: textLabel
            anchors.centerIn: parent
            text: textLabel.text
            color: "black"
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            console.log("button clicked")

           buttonClicked()
        }
    }
}
