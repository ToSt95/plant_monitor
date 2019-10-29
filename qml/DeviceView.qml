import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {

    Rectangle {
        id: placeHolder
        anchors.fill: parent
        color: "brown"

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            Switch {
                id: ledSwitch
                Layout.alignment: Qt.AlignHCenter
                text: "LED"

                onToggled: {
                    var isChecked = ledSwitch.checked
                    connector.ledRequest(isChecked)
                    overlay.visible = true
                }
            }

            Row {
                Layout.alignment: Qt.AlignHCenter

                Text {
                    id: temLabel
                    text: qsTr("TEMPERATURE:")
                }
                Text {
                    id: temValue
                    text: qsTr("-")
                }

            }

            Row {
               Layout.alignment: Qt.AlignHCenter
               Text {
                   id: humLabel
                   text: qsTr("HUMADITY:")
               }
               Text {
                   id: humValue
                   text: qsTr("-")
               }

            }
        }
    }

    Connections {
        target: connector

        onTempResponse: {
            temValue.text = temp + "C"
            humValue.text = hum + "%"
        }
    }

}
