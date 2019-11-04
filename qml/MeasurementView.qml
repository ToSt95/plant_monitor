import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item
{
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

                Rectangle {
                    id: airHum
                    color: "transparent"
                    border.color: "black"
                    border.width: 4
                    radius: 10
                    Layout.alignment: Qt.AlignHCenter
                    width: 300
                    height: 300

                    Image {
                        anchors.fill: parent
                        source: "qrc:/img/wood.jpg"
                        anchors.margins: 4
                    }

                    Rectangle {
                        id: headerAir
                        height: 50
                        anchors.top: parent.top
                        anchors.left: parent.left
                        color: "transparent"

                        anchors.right: parent.right

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "POWIETRZE"
                        }
                    }

                    GridLayout {
                        id: airData
                        columns: 2
                        width: parent.width * 0.5
                        anchors.top: headerAir.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        columnSpacing: 5

                        Text {
                            text: "WILGOTNOŚĆ"
                        }
                        Text {
                            text: "-"
                        }
                        Text {
                            text: "TEMPERATURA"
                        }
                        Text {
                            text: "-"
                        }
                        Text {
                            text: "DATA"
                        }
                        Text {
                            text: "-"
                        }
                        Text {
                            text: "GODZINA"
                        }
                        Text {
                            text: "-"
                        }

                    }

                    Image {
                        id: imgAir
                        anchors.margins: 10
                        anchors.top: headerAir.bottom
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.left: airData.right
                        smooth: true
                        source: "qrc:/img/thermometer.svg"
                    }

                }

                Rectangle {
                    id: soil
                    color: "white"
                    border.color: "black"
                    border.width: 4
                    radius: 10
                    Layout.alignment: Qt.AlignHCenter
                    width: 300
                    height: 300

                    Image {
                        anchors.fill: parent
                        source: "qrc:/img/wood.jpg"
                        anchors.margins: 4
                    }

                    Rectangle {
                        id: headerSoil
                        radius: 10
                        color: "transparent"
                        height: 50
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "GLEBA"
                        }
                    }

                    GridLayout {
                        id: soilData
                        columns: 2
                        width: parent.width * 0.5
                        anchors.top: headerSoil.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        columnSpacing: 5

                        Text {
                            text: "WILGOTNOŚĆ"
                        }
                        Text {
                            text: "-"
                        }
                        Text {
                            text: "DATA"
                        }
                        Text {
                            text: "-"
                        }
                        Text {
                            text: "Godzina"
                        }
                        Text {
                            text: "-"
                        }

                    }

                    Image {
                        id: soilAir
                        anchors.margins: 10
                        anchors.top: headerSoil.bottom
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.left: soilData.right
                        smooth: true
                        source: "qrc:/img/grass.svg"
                    }
                }

                Rectangle {
                    id: light
                    border.color: "black"
                    border.width: 4
                    radius: 10
                    Layout.alignment: Qt.AlignHCenter
                    width: 300
                    height: 300

                    Image {
                        anchors.fill: parent
                        source: "qrc:/img/wood.jpg"
                        anchors.margins: 4
                    }

                    Rectangle {
                        id: headerLight
                        height: 50
                        color: "transparent"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "NASŁONECZNIENIE"
                        }
                    }


                    GridLayout {
                        id: lightData
                        columns: 2
                        width: parent.width * 0.5
                        anchors.top: headerLight.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        columnSpacing: 5

                        Text {
                            text: "NASŁONECZNIENIE"
                        }
                        Text {
                            text: "-"
                        }
                        Text {
                            text: "DATA"
                        }
                        Text {
                            text: "-"
                        }
                        Text {
                            text: "GODZINA"
                        }
                        Text {
                            text: "-"
                        }

                    }

                    Image {
                        id: lightAir
                        anchors.margins: 10
                        anchors.top: headerLight.bottom
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.left: lightData.right
                        smooth: true
                        source: "qrc:/img/sunny.svg"
                        width: 100
                        height: 100
                    }
                }
            }
        }
    }
}
