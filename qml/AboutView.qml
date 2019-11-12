import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    Rectangle {
        id: placeHolder
        anchors.centerIn: parent
        width: 300
        height: 450
        opacity: 0.8
        border.width: 5
        radius: 5

        Image {
            anchors.fill: parent
            source: "qrc:/img/wood.jpg"
            anchors.margins: 4
        }

        ColumnLayout {
            anchors.fill: parent

            TextArea {
                Layout.alignment: Qt.AlignHCenter
                wrapMode: TextArea.WordWrap
                font.bold: true
                font.pixelSize: 16
                text: "Projekt zespołowy: \n \"Aplikacja do monitorowania roślin.\"\n Politechnika Lubelska 2019."
                horizontalAlignment: Qt.AlignHCenter
            }

            Text {
                text: "Autorzy"
                Layout.alignment: Qt.AlignHCenter
                color: "black"
                font.bold: true

            }
            Text {
                text: "Piotr Krasowski"
                color: "white"
                font.bold: true

                Layout.alignment: Qt.AlignHCenter

            }
            Text {
                text: "Damian Gromek"
                color: "white"
                font.bold: true

                Layout.alignment: Qt.AlignHCenter

            }

            Text {
                text: "Kontakt"
                color: "black"
                font.bold: true

                Layout.alignment: Qt.AlignHCenter

            }
            Text {
                text: "piotr.krasowski@pollub.edu.pl"
                color: "white"
                font.bold: true

                Layout.alignment: Qt.AlignHCenter

            }
            Text {
                text: "damian.gromek@pollub.edu.pl"
                color: "white"
                font.bold: true

                Layout.alignment: Qt.AlignHCenter

            }
        }
    }
}
