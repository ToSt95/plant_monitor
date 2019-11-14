import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

Item {
    property bool leadState: false
    signal reloadView

    Rectangle {
        id: background
        anchors.fill: parent
        anchors.rightMargin: 25
        anchors.leftMargin: 25
        anchors.topMargin: 10
        anchors.bottomMargin: 10

        border.width: 5
        border.color: "#733a31"
        Image {
            anchors.fill: parent
            source: "qrc:/img/wood.jpg"
            anchors.margins: 5
        }

        RowLayout {
            anchors.centerIn: parent
            anchors.topMargin: 10
            ScrollView {
                id: scroller
                Layout.fillHeight: true
                Layout.fillWidth: true
                clip: true
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                ColumnLayout {
                    width: Math.max(implicitWidth, scroller.availableWidth)
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    // graficzna reprezentacja kalendarza
                    Calendar {
                        // ustawianie szeregu propert wysokość, szerokość, wyrównanie...
                        id: calendar
                        Layout.alignment: Qt.AlignCenter
                        height: 300
                        width: 300
                        minimumDate: new Date(2019, 0, 1)
                        maximumDate: new Date(2021, 0, 1)
                        // ustawienie stylu kalndarza
                        style: CalendarStyle {
                            // konfiguracja delegaty dla pojedynczego dnia
                            dayDelegate: Item {
                                Rectangle {
                                    id: rect
                                    anchors.fill: parent
                                    // ustawienie koloru pojedycznego dnia jeżeli jest w modelu - niebieski, nie jest - biały
                                    color: datesModel.containsDate(Qt.formatDate(styleData.date,"ddd MMM d yyyy")) ? "blue" : "white"
                                    Label {
                                        // stylizacja tekstu kolor, rozmiar fontu...
                                        id: dayDelegateText
                                        text: styleData.date.getDate()
                                        anchors.centerIn: parent
                                        horizontalAlignment: Text.AlignRight
                                        font.pixelSize: Math.min(parent.height/3, parent.width/3)
                                        color: "black"
                                        font.bold: styleData.selected
                                    }
                                    // wypełnienie delegata obszarem kliknięcia
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            // aktualizacja widoku i modelu
                                            var date_str = Qt.formatDate(styleData.date,"ddd MMM d yyyy")
                                            datesModel.updateDate(date_str)
                                            // przeładowanie widoku
                                            reloadView()
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Button {
                        id: waterbutton
                        text: "Podlewanie"
                        Layout.alignment: Qt.AlignHCenter


                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 25
                            border.color: "#888"
                            radius: 4
                        }


                        onClicked: {
                            connector.ledRequest(true)
                            leadState = !leadState
                            overlay.visible = true
                        }
                    }
                }
            }

        }
    }
}
