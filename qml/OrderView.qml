import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5

Item {
    property bool leadState: false

    RowLayout {
        anchors.fill: parent
        anchors.topMargin: 10

        ScrollView {
            id: scroller
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true

            ColumnLayout {
                width: Math.max(implicitWidth, scroller.availableWidth)
                Layout.fillHeight: true
                Layout.fillWidth: true

                Button {
                    id: ledSwitch
                    Layout.alignment: Qt.AlignHCenter
                    text: "Podlewanie"
                    onClicked: {
                        connector.ledRequest(!leadState)
                        leadState = !leadState
                        overlay.visible = true
                    }
                }

                Rectangle {
                    id: dateTable
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignHCenter
                    width: 300
                    height: 300
                    border.width: 5
                    radius: 10

                    Calendar {
                        id: calendar
                        anchors.top: dateTable.top
                        anchors.left: dateTable.left
                        anchors.right: dateTable.right

                        height: 300

                        minimumDate: new Date(2019, 0, 1)
                        maximumDate: new Date(2021, 0, 1)

                        onClicked: {
                            console.log(getFormattedDate(date))
                            var date_str = date.toString()
                            dateModel.append({dateText: date_str})
                        }
                    }

                    ListView {
                        anchors.top: calendar.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 300
                        width: parent.width

                        model: dateModel
                        clip: true

                        delegate: Rectangle {
                            id: dateDelegate
                            width: dateTable.width
                            height: 50

                            Text {
                                id: delegateText
                                text: dateText
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter

                            }
                        }
                    }
                }
            }
        }

    }
    ListModel {
        id: dateModel
        //ListElement { dateText: "0" }
    }

    function getFormattedDate(date) {
      var year = date.getFullYear();

      var month = (1 + date.getMonth()).toString();
      month = month.length > 1 ? month : '0' + month;

      var day = date.getDate().toString();
      day = day.length > 1 ? day : '0' + day;

      return month + '/' + day + '/' + year;
    }
}
