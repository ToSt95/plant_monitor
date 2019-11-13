import QtQuick 2.0
import QtQuick.Controls 2.5
import QtCharts 2.3
import QtQuick.Layouts 1.12

Item {
    Rectangle {
        id: background
        anchors.fill: parent
        anchors.rightMargin: 25
        anchors.leftMargin: 25

        border.width: 5
        border.color: "#733a31"

        Image {
            anchors.fill: parent
            source: "qrc:/img/wood.jpg"
            anchors.leftMargin: 5
            anchors.rightMargin: 5
        }

        Rectangle {
            id: fullScreenRect
            anchors.fill: parent
            color: "transparent"


            DateTimeAxis {
                id: dateAxis
            }

            ValueAxis {
                id: valueAxis
            }

            ChartView {
                id: rec1
                title: "wilgotność powietrza [y(%), x(godziny)]"
                visible: false
                Layout.alignment: Qt.AlignHCenter
                anchors.fill: parent
                anchors.margins: 5


                SplineSeries {
                    id: seria1
                    name: "wilgotność"
                    color: "red"
                    width: 3


                    axisY:  ValueAxis {
                        min: 0
                        max: 100
                    }

                    axisX: ValueAxis {
                        min: 0
                        max: 23
                        tickCount: 12
                        tickInterval: 2
                        tickType: ValueAxis.TicksDynamic
                        labelFormat: "%.2f"
                    }

                    XYPoint { y: 54; x: 0 }
                    XYPoint { y: 44; x: 1 }
                    XYPoint { y: 44; x: 2 }
                    XYPoint { y: 54; x: 3 }
                    XYPoint { y: 34; x: 4 }
                    XYPoint { y: 44; x: 5 }
                    XYPoint { y: 34; x: 6 }
                    XYPoint { y: 51; x: 7 }
                    XYPoint { y: 54; x: 8 }
                    XYPoint { y: 52; x: 9 }
                    XYPoint { y: 49; x: 10 }
                    XYPoint { y: 37; x: 12 }
                    XYPoint { y: 51; x: 12 }
                    XYPoint { y: 54; x: 13 }
                    XYPoint { y: 33; x: 14 }
                    XYPoint { y: 41; x: 15 }
                    XYPoint { y: 61; x: 16 }
                    XYPoint { y: 63; x: 17 }
                    XYPoint { y: 64; x: 18 }
                    XYPoint { y: 51; x: 19 }
                    XYPoint { y: 52; x: 20 }
                    XYPoint { y: 46; x: 21 }
                    XYPoint { y: 31; x: 22 }
                    XYPoint { y: 34; x: 23 }
                }

                SplineSeries {
                    name: "min. wilgotność"
                    color: "green"

                    width: 3
                    XYPoint { y: 30; x: 0 }
                    XYPoint { y: 30; x: 1 }
                    XYPoint { y: 30; x: 2 }
                    XYPoint { y: 30; x: 3 }
                    XYPoint { y: 30; x: 4 }
                    XYPoint { y: 30; x: 5 }
                    XYPoint { y: 30; x: 6 }
                    XYPoint { y: 30; x: 7 }
                    XYPoint { y: 30; x: 8 }
                    XYPoint { y: 30; x: 9 }
                    XYPoint { y: 30; x: 10 }
                    XYPoint { y: 30; x: 12 }
                    XYPoint { y: 30; x: 12 }
                    XYPoint { y: 30; x: 13 }
                    XYPoint { y: 30; x: 14 }
                    XYPoint { y: 30; x: 15 }
                    XYPoint { y: 30; x: 16 }
                    XYPoint { y: 30; x: 17 }
                    XYPoint { y: 30; x: 18 }
                    XYPoint { y: 30; x: 19 }
                    XYPoint { y: 30; x: 20 }
                    XYPoint { y: 30; x: 21 }
                    XYPoint { y: 30; x: 22 }
                    XYPoint { y: 30; x: 23 }
                }

                SplineSeries {
                    name: "max. wilgotność"
                    color: "blue"

                    width: 3
                    XYPoint { y: 60; x: 0 }
                    XYPoint { y: 60; x: 1 }
                    XYPoint { y: 60; x: 2 }
                    XYPoint { y: 60; x: 3 }
                    XYPoint { y: 60; x: 4 }
                    XYPoint { y: 60; x: 5 }
                    XYPoint { y: 60; x: 6 }
                    XYPoint { y: 60; x: 7 }
                    XYPoint { y: 60; x: 8 }
                    XYPoint { y: 60; x: 9 }
                    XYPoint { y: 60; x: 10 }
                    XYPoint { y: 60; x: 12 }
                    XYPoint { y: 60; x: 12 }
                    XYPoint { y: 60; x: 13 }
                    XYPoint { y: 60; x: 14 }
                    XYPoint { y: 60; x: 15 }
                    XYPoint { y: 60; x: 16 }
                    XYPoint { y: 60; x: 17 }
                    XYPoint { y: 60; x: 18 }
                    XYPoint { y: 60; x: 19 }
                    XYPoint { y: 60; x: 20 }
                    XYPoint { y: 60; x: 21 }
                    XYPoint { y: 60; x: 22 }
                    XYPoint { y: 60; x: 23 }
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        mainList.visible = !mainList.visible
                        fullScreenRect.visible = !mainList.visible
                    }
                }
            }

            ChartView {
                id: rec2
                title: "temperatura powietrza [y(C), x(godziny)]"
                visible: false
                Layout.alignment: Qt.AlignHCenter
                anchors.fill: parent
                anchors.margins: 5

                SplineSeries {
                    id: seria2
                    name: "temperatura powietrza"
                    color: "red"
                    width: 3


                    axisY:  ValueAxis {
                        min: 0
                        max: 100
                    }

                    axisX: ValueAxis {
                        min: 0
                        max: 23
                        tickCount: 12
                        tickInterval: 2
                        tickType: ValueAxis.TicksDynamic
                        labelFormat: "%.2f"
                    }

                    XYPoint { y: 5; x: 0 }
                    XYPoint { y: 4; x: 1 }
                    XYPoint { y: 4; x: 2 }
                    XYPoint { y: 5; x: 3 }
                    XYPoint { y: 6; x: 4 }
                    XYPoint { y: 5; x: 5 }
                    XYPoint { y: 7; x: 6 }
                    XYPoint { y: 7; x: 7 }
                    XYPoint { y: 10; x: 8 }
                    XYPoint { y: 12; x: 9 }
                    XYPoint { y: 12; x: 10 }
                    XYPoint { y: 13; x: 12 }
                    XYPoint { y: 14; x: 12 }
                    XYPoint { y: 13; x: 13 }
                    XYPoint { y: 14; x: 14 }
                    XYPoint { y: 15; x: 15 }
                    XYPoint { y: 11; x: 16 }
                    XYPoint { y: 10; x: 17 }
                    XYPoint { y: 6; x: 18 }
                    XYPoint { y: 3; x: 19 }
                    XYPoint { y: 3; x: 20 }
                    XYPoint { y: 4; x: 21 }
                    XYPoint { y: 3; x: 22 }
                    XYPoint { y: 3; x: 23 }
                }

                SplineSeries {
                    name: "min. temperatura"
                    color: "green"

                    width: 3
                    XYPoint { y: 10; x: 0 }
                    XYPoint { y: 10; x: 1 }
                    XYPoint { y: 10; x: 2 }
                    XYPoint { y: 10; x: 3 }
                    XYPoint { y: 10; x: 4 }
                    XYPoint { y: 10; x: 5 }
                    XYPoint { y: 10; x: 6 }
                    XYPoint { y: 10; x: 7 }
                    XYPoint { y: 10; x: 8 }
                    XYPoint { y: 10; x: 9 }
                    XYPoint { y: 10; x: 10 }
                    XYPoint { y: 10; x: 12 }
                    XYPoint { y: 10; x: 12 }
                    XYPoint { y: 10; x: 13 }
                    XYPoint { y: 10; x: 14 }
                    XYPoint { y: 10; x: 15 }
                    XYPoint { y: 10; x: 16 }
                    XYPoint { y: 10; x: 17 }
                    XYPoint { y: 10; x: 18 }
                    XYPoint { y: 10; x: 19 }
                    XYPoint { y: 10; x: 20 }
                    XYPoint { y: 10; x: 21 }
                    XYPoint { y: 10; x: 22 }
                    XYPoint { y: 10; x: 23 }
                }

                SplineSeries {
                    name: "max. temperatura"
                    color: "blue"

                    width: 3
                    XYPoint { y: 30; x: 0 }
                    XYPoint { y: 30; x: 1 }
                    XYPoint { y: 30; x: 2 }
                    XYPoint { y: 30; x: 3 }
                    XYPoint { y: 30; x: 4 }
                    XYPoint { y: 30; x: 5 }
                    XYPoint { y: 30; x: 6 }
                    XYPoint { y: 30; x: 7 }
                    XYPoint { y: 30; x: 8 }
                    XYPoint { y: 30; x: 9 }
                    XYPoint { y: 30; x: 10 }
                    XYPoint { y: 30; x: 12 }
                    XYPoint { y: 30; x: 12 }
                    XYPoint { y: 30; x: 13 }
                    XYPoint { y: 30; x: 14 }
                    XYPoint { y: 30; x: 15 }
                    XYPoint { y: 30; x: 16 }
                    XYPoint { y: 30; x: 17 }
                    XYPoint { y: 30; x: 18 }
                    XYPoint { y: 30; x: 19 }
                    XYPoint { y: 30; x: 20 }
                    XYPoint { y: 30; x: 21 }
                    XYPoint { y: 30; x: 22 }
                    XYPoint { y: 30; x: 23 }
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        mainList.visible = !mainList.visible
                        fullScreenRect.visible = !mainList.visible
                    }
                }
            }

            ChartView {
                id: rec3
                visible: false
                title: "Wilgotność gleby [y(%), x(godziny)]"
                Layout.alignment: Qt.AlignHCenter
                anchors.fill: parent
                anchors.margins: 5


                SplineSeries {
                    name: "wilgotność gleby"
                    color: "blue"

                    axisY:  ValueAxis {
                        min: 0
                        max: 100
                    }

                    axisX: ValueAxis {
                        min: 0
                        max: 23
                        tickCount: 12
                        tickInterval: 2
                        tickType: ValueAxis.TicksDynamic
                        labelFormat: "%.2f"
                    }
                XYPoint { y: 25; x: 0 }
                XYPoint { y: 25; x: 1 }
                XYPoint { y: 25; x: 2 }
                XYPoint { y: 24; x: 3 }
                XYPoint { y: 24; x: 4 }
                XYPoint { y: 23; x: 5 }
                XYPoint { y: 24; x: 6 }
                XYPoint { y: 25; x: 7 }
                XYPoint { y: 25; x: 8 }
                XYPoint { y: 25; x: 9 }
                XYPoint { y: 24; x: 10 }
                XYPoint { y: 78; x: 12 }
                XYPoint { y: 77; x: 12 }
                XYPoint { y: 78; x: 13 }
                XYPoint { y: 78; x: 14 }
                XYPoint { y: 77; x: 15 }
                XYPoint { y: 77; x: 16 }
                XYPoint { y: 76; x: 17 }
                XYPoint { y: 76; x: 18 }
                XYPoint { y: 76; x: 19 }
                XYPoint { y: 77; x: 20 }
                XYPoint { y: 74; x: 21 }
                XYPoint { y: 74; x: 22 }
                XYPoint { y: 70; x: 23 }
            }

            SplineSeries {
                name: "min. wilgotność"
                color: "green"

                width: 3
                XYPoint { y: 15; x: 0 }
                XYPoint { y: 15; x: 1 }
                XYPoint { y: 15; x: 2 }
                XYPoint { y: 15; x: 3 }
                XYPoint { y: 15; x: 4 }
                XYPoint { y: 15; x: 5 }
                XYPoint { y: 15; x: 6 }
                XYPoint { y: 15; x: 7 }
                XYPoint { y: 15; x: 8 }
                XYPoint { y: 15; x: 9 }
                XYPoint { y: 15; x: 10 }
                XYPoint { y: 15; x: 12 }
                XYPoint { y: 15; x: 12 }
                XYPoint { y: 15; x: 13 }
                XYPoint { y: 15; x: 14 }
                XYPoint { y: 15; x: 15 }
                XYPoint { y: 15; x: 16 }
                XYPoint { y: 15; x: 17 }
                XYPoint { y: 15; x: 18 }
                XYPoint { y: 15; x: 19 }
                XYPoint { y: 15; x: 20 }
                XYPoint { y: 15; x: 21 }
                XYPoint { y: 15; x: 22 }
                XYPoint { y: 15; x: 23 }
            }

            SplineSeries {
                name: "max. wilgotność"
                color: "red"

                width: 3
                XYPoint { y: 45; x: 0 }
                XYPoint { y: 45; x: 1 }
                XYPoint { y: 45; x: 2 }
                XYPoint { y: 45; x: 3 }
                XYPoint { y: 45; x: 4 }
                XYPoint { y: 45; x: 5 }
                XYPoint { y: 45; x: 6 }
                XYPoint { y: 45; x: 7 }
                XYPoint { y: 45; x: 8 }
                XYPoint { y: 45; x: 9 }
                XYPoint { y: 45; x: 10 }
                XYPoint { y: 45; x: 12 }
                XYPoint { y: 45; x: 12 }
                XYPoint { y: 45; x: 13 }
                XYPoint { y: 45; x: 14 }
                XYPoint { y: 45; x: 15 }
                XYPoint { y: 45; x: 16 }
                XYPoint { y: 45; x: 17 }
                XYPoint { y: 45; x: 18 }
                XYPoint { y: 45; x: 19 }
                XYPoint { y: 45; x: 20 }
                XYPoint { y: 45; x: 21 }
                XYPoint { y: 45; x: 22 }
                XYPoint { y: 45; x: 23 }
            }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        mainList.visible = !mainList.visible
                        fullScreenRect.visible = !mainList.visible
                    }
                }
            }

            ChartView {
                id: rec4
                title: "4"
                visible: false
                anchors.fill: parent
                anchors.margins: 5

                SplineSeries {
                    id: seria3
                    name: "nasłonecznienie w ciągu dnia [lux]"
                    color: "red"
                    width: 3


                    axisY:  ValueAxis {
                        min: 0
                        max: 500
                    }

                    axisX: ValueAxis {
                        min: 0
                        max: 23
                        tickCount: 12
                        tickInterval: 2
                        tickType: ValueAxis.TicksDynamic
                        labelFormat: "%.2f"
                    }

                    XYPoint { y: 120; x: 0 }
                    XYPoint { y: 320; x: 1 }
                    XYPoint { y: 221; x: 2 }
                    XYPoint { y: 195; x: 3 }
                    XYPoint { y: 102; x: 4 }
                    XYPoint { y: 108; x: 5 }
                    XYPoint { y: 101; x: 6 }
                    XYPoint { y: 99; x: 7 }
                    XYPoint { y: 78; x: 8 }
                    XYPoint { y: 99; x: 9 }
                    XYPoint { y: 109; x: 10 }
                    XYPoint { y: 195; x: 12 }
                    XYPoint { y: 211; x: 12 }
                    XYPoint { y: 221; x: 13 }
                    XYPoint { y: 195; x: 14 }
                    XYPoint { y: 125; x: 15 }
                    XYPoint { y: 105; x: 16 }
                    XYPoint { y: 105; x: 17 }
                    XYPoint { y: 331; x: 18 }
                    XYPoint { y: 312; x: 19 }
                    XYPoint { y: 105; x: 20 }
                    XYPoint { y: 103; x: 21 }
                    XYPoint { y: 261; x: 22 }
                    XYPoint { y: 103; x: 23 }
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        mainList.visible = !mainList.visible
                        fullScreenRect.visible = !mainList.visible
                    }
                }
            }
        }





        RowLayout {
            id: mainList
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
                        color: "#f5f5ba"
                        border.color: "#733a31"
                        border.width: 5
                        radius: 10
                        Layout.alignment: Qt.AlignHCenter
                        width: 300
                        height: 300

                        Image {
                            id: imgAir
                            anchors.centerIn: parent
                            smooth: true
                            source: "qrc:/img/drop.svg"
                            width: 60
                            height: 120
                        }

                        Rectangle {
                            id: headerAir
                            height: 70
                            anchors.top: parent.top
                            anchors.left: parent.left
                            color: "#733a31"
                            anchors.right: parent.right


                            Text {
                                anchors.fill: parent
                                anchors.topMargin: 10

                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "WILGOTNOŚĆ \n POWIETRZA"
                                font.pixelSize: 25
                                font.bold: true
                            }
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainList.visible = false
                                fullScreenRect.visible = true
                                rec1.visible = true
                                rec2.visible = false
                                rec3.visible = false
                                rec4.visible = false
                            }
                        }

                    }




                    Rectangle {
                        color: "#f5f5ba"
                        border.color: "#733a31"
                        border.width: 5
                        radius: 10
                        Layout.alignment: Qt.AlignHCenter
                        width: 300
                        height: 300

                        Image {
                            anchors.centerIn: parent
                            smooth: true
                            source: "qrc:/img/thermometer.svg"
                            width: 60
                            height: 120
                        }

                        Rectangle {
                            height: 50
                            anchors.top: parent.top
                            anchors.left: parent.left
                            color: "#733a31"
                            anchors.right: parent.right

                            Text {
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "TEMPERATURA"
                                font.pixelSize: 25
                                font.bold: true
                            }
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainList.visible = false
                                fullScreenRect.visible = true
                                rec1.visible = false
                                rec2.visible = true
                                rec3.visible = false
                                rec4.visible = false
                            }
                        }

                    }

                    Rectangle {
                        color: "#f5f5ba"
                        border.color: "#733a31"
                        border.width: 5
                        radius: 10
                        Layout.alignment: Qt.AlignHCenter
                        width: 300
                        height: 300

                        Image {
                            anchors.centerIn: parent
                            smooth: true
                            source: "qrc:/img/grass.svg"
                            width: 60
                            height: 120
                        }

                        Rectangle {
                            height: 70
                            anchors.top: parent.top
                            anchors.left: parent.left
                            color: "#733a31"
                            anchors.right: parent.right

                            Text {
                                anchors.fill: parent
                                anchors.topMargin: 15
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "WILGOTNOŚĆ \n GLEBY"
                                font.pixelSize: 25
                                font.bold: true
                            }
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainList.visible = false
                                fullScreenRect.visible = true
                                rec1.visible = false
                                rec2.visible = false
                                rec3.visible = true
                                rec4.visible = false
                            }
                        }

                    }

                    Rectangle {
                        color: "#f5f5ba"
                        border.color: "#733a31"
                        border.width: 5
                        radius: 10
                        Layout.alignment: Qt.AlignHCenter
                        width: 300
                        height: 300

                        Image {
                            anchors.centerIn: parent
                            smooth: true
                            source: "qrc:/img/sunny.svg"
                            width: 60
                            height: 120
                        }

                        Rectangle {
                            height: 50
                            anchors.top: parent.top
                            anchors.left: parent.left
                            color: "#733a31"
                            anchors.right: parent.right

                            Text {
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "NASŁONECZNIENIE"
                                font.pixelSize: 25
                                font.bold: true
                            }
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainList.visible = false
                                fullScreenRect.visible = true
                                rec1.visible = false
                                rec2.visible = false
                                rec3.visible = false
                                rec4.visible = true
                            }
                        }

                    }

                }
            }

        }
    }
}
