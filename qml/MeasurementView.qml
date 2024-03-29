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
                    border.color: "#733a31"
                    border.width: 5
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
                            font.pixelSize: 25
                            font.bold: true
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
                            id: airHumValue
                            text: airModel.getNewestHumidity() + "%"
                        }
                        Text {

                            text: "TEMPERATURA"
                        }
                        Text {
                            id: airTempValue
                            text: airModel.getNewestTemperature() + "C"
                        }
                        Text {
                            text: "DATA"
                        }
                        Text {
                            id: airDateValue
                            text: airModel.getNewestDate()
                        }
                        Text {
                            text: "GODZINA"
                        }
                        Text {
                            id: airTimeValue
                            text: airModel.getNewestTime()
                        }

                        Text {
                            id: maxAirTempLabel
                            text: "MAX TEMP"
                        }
                        Text {
                            color: parseInt(airTempValue.text) > parseInt(appsettings.maxTemp) ? "red" : "black";
                            text: appsettings.maxTemp
                        }

                        Text {
                            id: minAirTempLabel
                            text: "MIN TEMP."
                        }
                        Text {
                            color: parseInt(airTempValue.text) < parseInt(appsettings.minTemp) ? "red" : "black";
                            text: appsettings.minTemp
                        }

                        Text {
                            id: maxAirHumLabel
                            text: "MAX WILG."
                        }
                        Text {
                            color: parseInt(airHumValue.text) > parseInt(appsettings.maxWA) ? "red" : "black";
                            text: appsettings.maxWA
                        }

                        Text {
                            id: minHumTempLabel
                            text: "MIN WILG."
                        }
                        Text {
                            color: parseInt(airHumValue.text) < parseInt(appsettings.minWA) ? "red" : "black";
                            text: appsettings.minWA
                        }

                    }

                    Rectangle {
                        anchors.margins: 10
                        anchors.top: headerAir.bottom
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.left: airData.right
                        color: "transparent"

                        Image {
                            id: imgAir
                            anchors.centerIn: parent
                            smooth: true
                            source: "qrc:/img/thermometer.svg"
                            width: 60
                            height: 120
                        }
                    }



                }

                Rectangle {
                    id: soil
                    color: "white"
                    border.color: "#733a31"
                    border.width: 5
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
                            font.pixelSize: 25
                            font.bold: true
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
                            id: soilHumValue
                            text: soilModel.getNewestHumidity() + "%"
                        }
                        Text {
                            text: "DATA"
                        }
                        Text {
                            id: soilDateValue
                            text: soilModel.getNewestDate()
                        }
                        Text {
                            text: "GODZINA"
                        }
                        Text {
                            id: soilTimeValue
                            text: soilModel.getNewestTime()
                        }

                        Text {
                            id: maxSoilHumLabel
                            text: "MAX WILG."
                        }
                        Text {
                            color: parseInt(soilHumValue.text) > parseInt(appsettings.maxWS) ? "red" : "black";
                            text: appsettings.maxWS
                        }

                        Text {
                            id: minSoilTempLabel
                            text: "MIN WILG."
                        }
                        Text {
                            color: parseInt(soilHumValue.text) < parseInt(appsettings.minWS) ? "red" : "black";
                            text: appsettings.minWS
                        }

                    }
                    Rectangle {
                        anchors.margins: 10
                        anchors.top: headerSoil.bottom
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.left: soilData.right
                        color: "transparent"

                        Image {
                            id: soilAir
                            anchors.centerIn: parent
                            smooth: true
                            source: "qrc:/img/grass.svg"
                            width: 100
                            height: 100
                        }
                    }


                }

                Rectangle {
                    id: light
                    border.color: "#733a31"
                    border.width: 5
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
                            font.pixelSize: 25
                            font.bold: true
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
                            text: "LUKS"
                        }
                        Text {
                            id: lightValue
                            text: lightModel.getNewestLumens() + " L"
                        }
                        Text {
                            text: "DATA"
                        }
                        Text {
                            id: lightDateValue
                            text: lightModel.getNewestDate()
                        }
                        Text {
                            text: "GODZINA"
                        }
                        Text {
                            id:lightTimeValue
                            text: lightModel.getNewestTime()
                        }

                        Text {
                            id: maxLighLabel
                            text: "MAX WILG."
                        }
                        Text {
                            color: parseInt(lightValue.text) > parseInt(appsettings.maxL) ? "red" : "black";
                            text: appsettings.maxL
                        }

                        Text {
                            id: minLighLabel
                            text: "MIN WILG."
                        }
                        Text {
                            color: parseInt(lightValue.text) < parseInt(appsettings.minL) ? "red" : "black";
                            text: appsettings.minL
                        }

                    }

                    Rectangle {
                        anchors.margins: 10
                        anchors.top: headerLight.bottom
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.left: lightData.right
                        color: "transparent"

                        Image {
                            id: lightAir
                            anchors.centerIn: parent
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

    Connections {
        target: airModel

        onNewDataAvailable: {
            airTempValue.text = airModel.getNewestTemperature() + "C"
            airHumValue.text = airModel.getNewestHumidity() + "%"
            airDateValue.text = airModel.getNewestDate()
            airTimeValue.text = airModel.getNewestTime()
        }
    }
    Connections {
        target: soilModel

        onNewDataAvailable: {
            soilHumValue.text = soilModel.getNewestHumidity() + "%"
            soilDateValue.text = soilModel.getNewestDate()
            soilTimeValue.text = soilModel.getNewestTime()
        }
    }

    Connections {
        target: lightModel

        onNewDataAvailable: {
            lightValue.text = lightModel.getNewestLumens() + " L"
            lightDateValue.text = lightModel.getNewestDate()
            lightTimeValue.text = lightModel.getNewestTime()
        }
    }
}
