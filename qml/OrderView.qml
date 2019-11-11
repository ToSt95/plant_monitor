import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

Item {
    property bool leadState: false
    signal reloadView

    RowLayout {
        anchors.centerIn: parent
        anchors.topMargin: 10
Rectangle {
    Layout.fillHeight: true
    Layout.fillWidth: true
    color: "orange"
}
        ScrollView {
            id: scroller
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true


            ColumnLayout {
                width: Math.max(implicitWidth, scroller.availableWidth)
                Layout.fillHeight: true
                Layout.fillWidth: true

                Calendar {
                    id: calendar
                    Layout.alignment: Qt.AlignHCenter

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

                Row {
                    width: parent.width
                    height: 50
                    Layout.alignment: Qt.AlignHCenter

                    Input {
                        id: name
                        placeholder: qsTr("Czas[s]")
                    }
                }

                Button {
                    id: waterbutton
                    text: "Podlewanie"
                    Layout.alignment: Qt.AlignHCenter

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
