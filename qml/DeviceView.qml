import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {

    Rectangle {
        id: placeHolder
        anchors.fill: parent
        color: "transparent"

        GridLayout {
            columns: 2
            anchors.centerIn: parent
            Text {
               id: deviceName
               text: "NAZWA"
            }

            Input {
                id: deviceNameEdit
                placeholder: "Urządzenie testowe"
            }

            Text {
                id: deviceLocal
                text: "LOKALIZACJA"
            }

            Input {
                id: deviceLocalEdit
                placeholder: "Lublin"
            }

            Text {
                id: deviceIp
                text: "IP"
            }

            Input {
                id: deviceIpEdit
                placeholder: "192.168.1.231"
            }
        }
    }
}
