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
        anchors.rightMargin: 35
        anchors.leftMargin: 35
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
            anchors.fill: parent
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

                    Calendar {
                        id: calendar
                        Layout.alignment: Qt.AlignCenter
                        height: 300
                        width: 300

                        minimumDate: new Date(2019, 0, 1)
                        maximumDate: new Date(2021, 0, 1)


                        style: CalendarStyle {
                            dayDelegate: Item {
                                Rectangle {
                                    id: rect
                                    anchors.fill: parent
                                    color: datesModel.containsDate(Qt.formatDate(styleData.date,"ddd MMM d yyyy")) ? "blue" : "white"

                                    Label {
                                        id: dayDelegateText
                                        text: styleData.date.getDate()
                                        anchors.centerIn: parent
                                        horizontalAlignment: Text.AlignRight
                                        font.pixelSize: Math.min(parent.height/3, parent.width/3)
                                        color: "black"
                                        font.bold: styleData.selected
                                    }

                                    MouseArea {
                                        anchors.fill: parent


                                        onClicked: {
                                            var date_str = Qt.formatDate(styleData.date,"ddd MMM d yyyy")
                                            datesModel.updateDate(date_str)
                                            reloadView()

                                        }
                                    }
                                }
                            }

                        }
                    }

                    ListView {
                        Layout.alignment: Qt.AlignHCenter
                        model: datesModel
                        height: 250

                        delegate:Item {
                            width: parent.width
                            height: 40
                            Rectangle {
                                anchors.fill: parent

                            border.width: 1


                            Text {
                                anchors.fill: parent
                                text: Qt.formatDate(dateValue,"ddd MMM d yyyy")
                                color:"white"
                                font.bold: true
                                horizontalAlignment: Qt.AlignHCenter
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
