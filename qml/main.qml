import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.3

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Plant monitor")

    Image {
        id: background
        anchors.fill: parent
        source: "qrc:/img/background.jpg"
    }

    Drawer {
        id: drawer
        width: 0.5 * window.width
        height: window.height
        interactive: loader.sourceComponent !== loginView

        background: Rectangle {
            id: drawerBackground
            color: "black"
            opacity: 0.8
        }

        ListView {
            id:menuView
            anchors.fill: parent
            model: ListModel {
                ListElement {
                    name: "Urządzenie"
                }
                ListElement {
                    name: "Odczyt"
                }
                ListElement {
                    name: "Podlewanie"
                }
                ListElement {
                    name: "Zestawienia"
                }
                ListElement {
                    name: "Ustawienia"
                }
                ListElement {
                    name: "O aplikacji"
                }
                ListElement {
                    name: "Wyloguj"
                }
            }

            delegate: listDelegate
        }
    }
    Loader {
        id: loader
        anchors.fill: parent
        sourceComponent: loginView
    }

    Component {
        id:loginView
        LoginView {
        }
    }
    Component {
        id:measurementPage
        MeasurementView {}
    }
    Component {
        id:orderPage
        OrderView {}
    }
    Component {
        id:reportsPage
        RaportsView {}
    }
    Component {
        id:settingsPage
        SettingsView {}
    }
    Component {
        id:aboutPage
        AboutView {}
    }
    Component {
        id:devicePage
        DeviceView {}
    }


    Component {
        id: listDelegate

        Rectangle {
            id: wraper
            width: parent.width
            height: 40
            color: "transparent"
            Text {
                text:name
                color: wraper.ListView.isCurrentItem ? "gray" : "white"
                anchors.centerIn: parent
                verticalAlignment: Text.AlignHCenter
            }

            Rectangle {
                id: separator
                height: wraper.ListView.isCurrentItem ? 3 : 2
                width: parent.width
                color: wraper.ListView.isCurrentItem ? "gray" : "white"
                anchors.bottom: parent.bottom
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    switch(index) {
                    case 0:
                        loader.sourceComponent = devicePage
                        break;
                    case 1:
                        loader.sourceComponent = measurementPage
                        break;
                    case 2:
                        loader.sourceComponent = orderPage
                        break;
                    case 3:
                        loader.sourceComponent = reportsPage
                        break;
                    case 4:
                        loader.sourceComponent = settingsPage
                        break;
                    case 5:
                        loader.sourceComponent = aboutPage
                        break;
                    case 6:
                        messageDialog.visible = true

                        break;
                    }
                    menuView.currentIndex = index
                }
            }
        }
    }


    MessageDialog {
        id: messageDialog
        title: "Czy chcesz się wylogować?"
        standardButtons: StandardButton.Yes | StandardButton.No
        onYes: {
            loader.sourceComponent = loginView
            drawer.close()
        }
        onNo: drawer.close()

        Component.onCompleted: visible = false
    }

    Rectangle {
        id:overlay
        anchors.fill: parent
        color: "gray"
        opacity: 0.8
        visible: false

        Image {
            id: busyImg
            anchors.centerIn: parent
            width: parent.width * 0.3
            height: width
            source: "qrc:/img/busy.png"

            RotationAnimation on rotation {
                loops: Animation.Infinite
                from: 0
                to: 360
            }
            PropertyAnimation {
                running: true
                target: busyImg
                property: "rotation"
                duration: 2000
                from: 0
                to: 359

                onStopped: {

                        busyImg.rotation = 0;
                        start()

                }
            }
        }
    }

    Connections {
        target: connector

        onLoginResponse: {
            loader.sourceComponent = devicePage
            menuView.currentIndex = 0
            drawer.open()
        }
        onLedON: {
            overlay.visible = false
        }

        onLedOFF: {
            overlay.visible = false
        }
    }
}
