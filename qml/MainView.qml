import QtQuick 2.0
import QtQuick.Controls 2.5

Item {

    Drawer {
        id: drawer
        width: 0.66 * window.width
        height: window.height

            ListView {
                id:menuView
                anchors.fill: parent

                model: ListModel {
                    ListElement {
                        name: "Apple"
                        cost: 2.45
                    }
                    ListElement {
                        name: "Orange"
                        cost: 3.25
                    }
                    ListElement {
                        name: "Banana"
                        cost: 1.95
                    }
                }

                delegate: Rectangle{
                    width: parent.width
                    height: 40
                    color: "black"
                    Text {
                        text:name
                        color:"white"
                        anchors.centerIn: parent
                        verticalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

}
