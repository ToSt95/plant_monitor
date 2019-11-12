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
                title: "2"
                visible: false
                Layout.alignment: Qt.AlignHCenter
                anchors.fill: parent
                anchors.margins: 5

                LineSeries {
                    name: "temperatura powietrza"
                    color: "blue"
                    XYPoint { x: 0; y: 0 }
                    XYPoint { y: 41; x: 12.00 }
                    XYPoint { y: 54; x: 13.00 }
                    XYPoint { y: 33; x: 14.00 }
                    XYPoint { y: 21; x: 15.00 }
                    XYPoint { y: 23; x: 16.00 }
                    XYPoint { y: 14; x: 17.00 }
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
                title: "3"
                Layout.alignment: Qt.AlignHCenter
                anchors.fill: parent
                anchors.margins: 5

                LineSeries {
                    name: "wilgotność gleby"
                    color: "blue"
                    XYPoint { x: 0; y: 0 }
                    XYPoint { y: 41; x: 12.00 }
                    XYPoint { y: 54; x: 13.00 }
                    XYPoint { y: 33; x: 14.00 }
                    XYPoint { y: 21; x: 15.00 }
                    XYPoint { y: 23; x: 16.00 }
                    XYPoint { y: 14; x: 17.00 }
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

                LineSeries {
                    name: "nasłonczenienie"
                    color: "blue"
                    XYPoint { x: 0; y: 0 }
                    XYPoint { y: 41; x: 12.00 }
                    XYPoint { y: 54; x: 13.00 }
                    XYPoint { y: 33; x: 14.00 }
                    XYPoint { y: 21; x: 15.00 }
                    XYPoint { y: 23; x: 16.00 }
                    XYPoint { y: 14; x: 17.00 }
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
                    ChartView {
                        title: "Line"
                        Layout.alignment: Qt.AlignHCenter
                        width: 300
                        height: 300
                        antialiasing: true

                        SplineSeries {
                            name: "wilgotność powietrza"
                            color: "red"


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

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainList.visible = false
                                fullScreenRect.visible = true
                                rec1.visible = true
                            }
                        }
                    }

                    ChartView {
                        title: "temperatura powietrza"
                        Layout.alignment: Qt.AlignHCenter
                        width: 300
                        height: 300
                        antialiasing: true

                        LineSeries {
                            name: "C"
                            color: "blue"
                            XYPoint { x: 0; y: 0 }
                            XYPoint { y: 41; x: 12.00 }
                            XYPoint { y: 54; x: 13.00 }
                            XYPoint { y: 33; x: 14.00 }
                            XYPoint { y: 21; x: 15.00 }
                            XYPoint { y: 23; x: 16.00 }
                            XYPoint { y: 14; x: 17.00 }
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainList.visible = false
                                fullScreenRect.visible = true
                                rec2.visible = true
                            }
                        }
                    }

                    ChartView {
                        title: "wilgotność gleby"
                        Layout.alignment: Qt.AlignHCenter
                        width: 300
                        height: 300
                        antialiasing: true

                        LineSeries {
                            name: "wilgotność"
                            color: "brown"
                            XYPoint { x: 0; y: 0 }
                            XYPoint { y: 41; x: 12.00 }
                            XYPoint { y: 54; x: 13.00 }
                            XYPoint { y: 33; x: 14.00 }
                            XYPoint { y: 21; x: 15.00 }
                            XYPoint { y: 23; x: 16.00 }
                            XYPoint { y: 14; x: 17.00 }
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainList.visible = false
                                fullScreenRect.visible = true
                                rec3.visible = true
                            }
                        }
                    }

                    ChartView {
                        title: "nasłonecznienie"
                        Layout.alignment: Qt.AlignHCenter
                        width: 300
                        height: 300
                        antialiasing: true

                        LineSeries {
                            name: "lum"
                            color: "yellow"
                            XYPoint { x: 0; y: 0 }
                            XYPoint { y: 41; x: 12.00 }
                            XYPoint { y: 54; x: 13.00 }
                            XYPoint { y: 33; x: 14.00 }
                            XYPoint { y: 21; x: 15.00 }
                            XYPoint { y: 23; x: 16.00 }
                            XYPoint { y: 14; x: 17.00 }
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainList.visible = false
                                fullScreenRect.visible = true
                                rec4.visible = true
                            }
                        }
                    }

                }
            }

        }
    }
}
