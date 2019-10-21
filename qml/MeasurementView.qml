import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    RowLayout {
        anchors.fill: parent

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
                    id: m1
                    color: "green"
                    width: 300
                    height: 300
                    Layout.alignment: Qt.AlignHCenter

                    Text {
                        anchors.centerIn: parent
                        text: "WILOGTNOŚĆ POWIETRZA";
                    }
                }

                Rectangle {
                    id: m2
                    color: "red"
                    width: 300
                    height: 300
                    Layout.alignment: Qt.AlignHCenter

                    Text {
                        anchors.centerIn: parent
                        text: "WILOGTNOŚĆ GLEBY";
                    }
                }

                Rectangle {
                    id: m3
                    color: "orange"
                    width: 300
                    height: 300
                    Layout.alignment: Qt.AlignHCenter

                    Text {
                        anchors.centerIn: parent
                        text: "NASŁONECZNIENIE";
                    }
                }

                Rectangle {
                    id: m4
                    color: "yellow"
                    width: 300
                    height: 300
                    Layout.alignment: Qt.AlignHCenter

                    Text {
                        anchors.centerIn: parent
                        text: "WILGOTNOŚĆ POWIETRZA";
                    }
                }
            }
        }
    }
}
