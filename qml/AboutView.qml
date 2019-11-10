import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    Rectangle {
        id: placeHolder
        anchors.centerIn: parent
        width: 300
        height: 450
        color: "gray"
        opacity: 0.8
        border.width: 5
        radius: 5

        ColumnLayout {
            anchors.fill: parent

            Text {
                text: "Autorzy"
                Layout.alignment: Qt.AlignHCenter
                color: "white"

            }
            Text {
                text: "Piotr Krasowski"
                color: "white"
                Layout.alignment: Qt.AlignHCenter

            }
            Text {
                text: "Damian Gromek"
                color: "white"
                Layout.alignment: Qt.AlignHCenter

            }

            Text {
                text: "Kontakt"
                color: "white"
                Layout.alignment: Qt.AlignHCenter

            }
            Text {
                text: "piotr.krasowski@pollub.edu.pl"
                color: "white"
                Layout.alignment: Qt.AlignHCenter

            }
            Text {
                text: "damian.gromek@pollub.edu.pl"
                color: "white"
                Layout.alignment: Qt.AlignHCenter

            }
        }
    }
}
