import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
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
                spacing: 5

                Rectangle {
                    id: watering
                    Layout.alignment: Qt.AlignHCenter

                    color: "#f5f5ba"
                    border.color: "#733a31"
                    border.width: 5

                    width: 300
                    height: 800

                    GridLayout {
                        anchors.fill: parent
                        anchors.margins: 5
                        anchors.leftMargin: 25
                        columns: 2
                        columnSpacing: 1

                        Text {
                            id: maxTemp
                            text: qsTr("MAKS. TEMP. [C]")
                        }

                        Input {
                             width: 70
                             id: maxTempInput
                             placeholder: appsettings.maxTemp


                        }

                        Text {
                            id: minMep
                            text: qsTr("MIN. TEMP. [C]")
                        }

                        Input {
                            id: minMepInput
                             width: 70
                             placeholder: appsettings.minTemp

                        }

                        Text {
                            id: maxHumAir
                            text: qsTr("MAKS. WIL. POW. [%]")
                        }

                        Input {
                            id: maxHumAirInput
                             width: 70
                             placeholder: appsettings.maxWA

                        }
                        Text {
                            id: minHumAir
                            text: qsTr("MIN. WIL. POW. [%]")
                        }

                        Input {
                            id: minHumAirInput
                             width: 70
                             placeholder: appsettings.minWA

                        }

                        Text {
                            id: minHumSoil
                            text: qsTr("MIN. WIL. GLEB. [%]")
                        }

                        Input {
                            id: minHumSoilInput
                             width: 70
                             placeholder: appsettings.minWS

                        }

                        Text {
                            id: maxHumSoil
                            text: qsTr("MAKS. WIL. GLEB. [%]")
                        }

                        Input {
                            id: maxHumSoilInput
                             width: 70
                             placeholder: appsettings.maxWS

                        }

                        Text {
                            id: maxLigh
                            text: qsTr("MAKS. NASŁ. [LUX]")
                        }

                        Input {
                            id: maxLighInput
                             width: 70
                             placeholder: appsettings.maxL


                        }

                        Text {
                            id: minMLight
                            text: qsTr("MIN. NASŁ. [LUX]")

                        }

                        Input {
                            id: minMLightInput
                            placeholder: appsettings.minL

                            width: 70

                        }


                        Text {
                            id: hourWater

                            text: qsTr("GODZINA PODLEWANIA")
                        }

                        Input {
                            id: hourWaterInput
                            placeholder: appsettings.hour

                             width: 70

                        }

                        Text {
                            id: timeWater

                            text: qsTr("CZAS PODLEWANIA")
                        }

                        Input {
                            id: timeWaterInput
                            placeholder: appsettings.wateringTime

                             width: 70

                        }

                        Text {
                            id: notificationMail
                            text: qsTr("EMAIL")
                        }

                        Input {
                            placeholder: appsettings.email

                            id: notificationMailinput
                             width: 70

                        }

                        Text {
                            text: qsTr("POWIADOMIENIA")
                        }
                        Switch {
                            id: notifications
                        }

                        Button {
                            id: saveButton

                            onClicked: {
                                if (minMepInput.text !== "") appsettings.minTemp = minMepInput.text;
                                if (maxTempInput.text !== "") appsettings.maxTemp = maxTempInput.text;
                                if (maxHumAirInput.text !== "") appsettings.maxWA = maxHumAirInput.text
                                if (minHumAirInput.text !== "") appsettings.minWA = minHumAirInput.text
                                if (minHumSoilInput.text !== "") appsettings.minWS = minHumSoilInput.text
                                if (maxHumSoilInput.text !== "") appsettings.maxWS = maxHumSoilInput.text
                                if (maxLighInput.text !== "") appsettings.maxL = maxLighInput.text
                                if (minMLightInput.text !== "") appsettings.minL = minMLightInput.text
                                if (notificationMailinput.text !== "") appsettings.email = notificationMailinput.text
                                if (hourWaterInput.text !== "") appsettings.hour = hourWaterInput.text
                                if (timeWaterInput.text !== "") appsettings.wateringTime = timeWaterInput.text



                                connector.saveSettingsValues(appsettings.minTemp, appsettings.maxTemp,
                                                             appsettings.minWA, appsettings.maxWA,
                                                             appsettings.minWS, appsettings.maxWS,
                                                             appsettings.minL, appsettings.maxL,
                                                             appsettings.email, appsettings.hour, appsettings.wateringTime)


                            }
                            text: "Zapisz zmiany"

                            Layout.columnSpan: 2
                            Layout.alignment: Qt.AlignHCenter


                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 25
                                border.color: "#888"
                                radius: 4
                            }
                        }
                    }
                }
            }
        }
    }
}
