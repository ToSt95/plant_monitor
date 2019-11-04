import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4

Item {
    Rectangle {
        id: background
        anchors.centerIn: parent
        width: parent.width * 0.75
        height: parent.height * 0.65
        color: "white"
        opacity: 0.4
        radius: 20
        border.color: "black"
        border.width: 3
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 15

        RowLayout {
            id: connectionLabel
            width: 200
            Layout.alignment: Qt.AlignCenter

            Text {
                id: connectionText
                font.pixelSize: 25
                font.bold: true
                text: qsTr("Status serwera:")
            }

            Rectangle {
                id: connectionIcon
                color: connector.isConnected ? "green" : "red"
                width: 30
                height: 30
                radius: 30
            }

        }

        Input {
            id: email
            placeholder: "Użytkownik..."
        }

        Input {
            id: password
            echoMode: TextInput.Password
            placeholder: "hasło..."
        }

        Button {
            text: "Zaloguj"
            Layout.alignment: Qt.AlignHCenter
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ffffff" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ffffff" }
                    }
                }
            }
            onClicked: {
                connector.loginRequest(email.text, password.text)
            }
        }
    }
}



