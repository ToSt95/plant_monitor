import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12

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

    Loader {
        id: loader
        anchors.fill: parent
        sourceComponent: loginView
    }

    Component {
        id:loginView
        LoginView {
            onLoginRequest: {
                if (email == "1" && password == "1") {
                   loader.sourceComponent = mainView
                }
            }
        }
    }
    Component {
        id:mainView
        MainView {}
    }
}
