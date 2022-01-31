import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    anchors.top: parent.top
    color: "#ffffff"
    border.color: "#ffffff"

    ColumnLayout {
        anchors.fill: parent
        anchors.top: parent.top
        spacing: 0
        RowLayout {
            id: rowLayout
            Layout.alignment: Qt.AlignCenter
            Rectangle {
                color: '#00B1D7'
                Layout.fillWidth: true
                Layout.minimumHeight: 50
                Layout.maximumHeight: 100
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 20
                    color: "#FFF"
                    text: "待办事项"
                }
            }
        }
        RowLayout {
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 0
            NavList {}

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 50
                Layout.preferredWidth: 100
                Layout.maximumWidth: 300
                Layout.minimumHeight: 150
                Layout.leftMargin: 8
                Layout.rightMargin: 8
                Layout.topMargin: 8
                Layout.bottomMargin: 8

                Rectangle {
                    id: newTask
                    height: 40
                    anchors.left: parent.left
                    anchors.right: parent.right
                    color: "#f3f3f3"
                    RowLayout {
                        anchors.fill: parent
                        TextField {
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignVCenter
                            selectByMouse: true
                            verticalAlignment: Text.AlignVCenter
                            placeholderText: qsTr("请输入原密码")
                            focus: true
                            onAccepted: {
                                if (text.length < 1) {
                                    return
                                }
                                taskList.model.add({
                                                       "name": text
                                                   })
                                text = ''
                            }

                            background: Rectangle {
                                color: "#f2f2f2"
                            }
                        }
                    }
                }
                TaskList {
                    id: taskList
                }
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 100
                Layout.preferredWidth: 200
                Layout.preferredHeight: 100
                TextEdit {
                    width: 240
                    textFormat: Text.RichText
                    text: "<b>Hello</b> <i>World!</i>"
                    font.family: "Helvetica"
                    font.pointSize: 20
                    selectByMouse: true
                    color: "blue"
                    focus: true
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}D{i:4}D{i:3}D{i:2}D{i:6}
D{i:10}D{i:9}D{i:8}D{i:12}D{i:7}D{i:14}D{i:13}D{i:5}D{i:1}
}
##^##*/

