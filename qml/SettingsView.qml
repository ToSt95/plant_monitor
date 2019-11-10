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

                    color: "red"
                    width: 300
                    height: 300
                }
                Rectangle {
                    id: values
                    Layout.alignment: Qt.AlignHCenter

                    color: "orange"
                    width: 300
                    height: 300
                }
                Rectangle {
                    id: generals
                    color: "blue"
                    Layout.alignment: Qt.AlignHCenter

                    width: 300
                    height: 300
                }
            }
        }
    }
}
