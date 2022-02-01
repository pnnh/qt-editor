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

            ColumnLayout {
                Layout.fillHeight: true
                width: 150
                Layout.minimumHeight: 150
                Layout.leftMargin: 8
                Layout.rightMargin: 8
                Layout.topMargin: 8
                Layout.bottomMargin: 8

                Rectangle {
                    id: newTask
                    height: 40
                    Layout.fillWidth: true
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
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    onItemPressed: pk => {
                        console.log("onItemPressed", pk)
                        var item = sqlite.getTask(pk)

                        console.log("onItemPressed2", item.pk, item.body)

                        if (taskBody.currentItemPk) {
                            sqlite.updateTaskBody(taskBody.currentItemPk,
                                                  taskBody.text)
                        }
                        taskBody.text = item.body
                        taskBody.currentItemPk = item.pk
                    }
                }
            }
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 200
                Layout.topMargin: 8
                Layout.rightMargin: 8
                RowLayout {
                    Layout.fillWidth: true
                    CheckBox {
                        Layout.preferredWidth: 15
                    }
                    Text {
                        Layout.preferredWidth: 100
                        Layout.leftMargin: 8
                        Layout.fillWidth: true
                        text: "设置日期"
                    }

                    Image {
                        Layout.alignment: Qt.AlignRight
                        source: "qrc:/QtEditor/res/images/flag-fill.png"
                        sourceSize.width: 16
                        sourceSize.height: 16
                        fillMode: Image.Stretch
                    }
                }
                RowLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.topMargin: 8
                    TextEdit {
                        id: taskBody
                        property string currentItemPk
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        width: 240
                        textFormat: Text.PlainText
                        text: "Hello World!"
                        font.family: "Helvetica"
                        font.pointSize: 20
                        selectByMouse: true
                        color: "blue"
                        focus: true
                        onEditingFinished: {
                            console.log("taskBodyFinished", text,
                                        currentItemPk, "dddd")
                            if (currentItemPk) {
                                sqlite.updateTaskBody(currentItemPk, text)
                            }
                        }
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}D{i:4}D{i:3}D{i:2}D{i:6}
D{i:10}D{i:9}D{i:8}D{i:12}D{i:7}D{i:15}D{i:16}D{i:17}D{i:14}D{i:19}D{i:18}D{i:13}
D{i:5}D{i:1}
}
##^##*/

