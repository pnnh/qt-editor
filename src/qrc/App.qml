import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import an.qt.CModel 1.0

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
            ColumnLayout {
                id: colNav
                property string activeRow: ""
                Layout.minimumHeight: 100
                Layout.maximumWidth: 100
                Layout.fillHeight: true
                Layout.leftMargin: 8
                Layout.rightMargin: 8
                Layout.topMargin: 8
                Layout.bottomMargin: 8
                RowLayout {
                    Layout.minimumHeight: 32
                    Layout.maximumHeight: 32
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width

                    Button {
                        Layout.fillWidth: true
                        Layout.minimumWidth: parent.width
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                        contentItem: Text {
                            verticalAlignment: Text.AlignVCenter
                            text: "所有"
                        }
                        onClicked: colNav.activeRow = 'all'
                        background: Rectangle {
                            color: parent.hovered
                                   || (colNav.activeRow === 'all') ? "#EDF3FF" : "#FFF"
                        }
                    }
                }
                RowLayout {
                    Layout.minimumHeight: 32
                    Layout.maximumHeight: 32
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width
                    Button {
                        Layout.fillWidth: true
                        Layout.minimumWidth: parent.width
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                        contentItem: Text {
                            verticalAlignment: Text.AlignVCenter
                            text: "今天"
                        }
                        onClicked: colNav.activeRow = 'today'
                        background: Rectangle {
                            color: parent.hovered
                                   || (colNav.activeRow === 'today') ? "#EDF3FF" : "#FFF"
                        }
                    }
                }
                RowLayout {
                    Layout.minimumHeight: 32
                    Layout.maximumHeight: 32
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width
                    Button {
                        Layout.fillWidth: true
                        Layout.minimumWidth: parent.width
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                        contentItem: Text {
                            verticalAlignment: Text.AlignVCenter
                            text: "明天"
                        }
                        onClicked: colNav.activeRow = 'tomorrow'
                        background: Rectangle {
                            color: parent.hovered
                                   || (colNav.activeRow === 'tomorrow') ? "#EDF3FF" : "#FFF"
                        }
                    }
                }
                RowLayout {
                    Layout.minimumHeight: 32
                    Layout.maximumHeight: 32
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width
                    Button {
                        Layout.fillWidth: true
                        Layout.minimumWidth: parent.width
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                        contentItem: Text {
                            verticalAlignment: Text.AlignVCenter
                            text: "最近七天"
                        }
                        onClicked: colNav.activeRow = 'next7days'
                        background: Rectangle {
                            color: parent.hovered
                                   || (colNav.activeRow === 'next7days') ? "#EDF3FF" : "#FFF"
                        }
                    }
                }
                RowLayout {
                    Layout.minimumHeight: 32
                    Layout.maximumHeight: 32
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width
                    Button {
                        Layout.fillWidth: true
                        Layout.minimumWidth: parent.width
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                        contentItem: Text {
                            verticalAlignment: Text.AlignVCenter
                            text: "收集箱"
                        }
                        onClicked: colNav.activeRow = 'inbox'
                        background: Rectangle {
                            color: parent.hovered
                                   || (colNav.activeRow === 'inbox') ? "#EDF3FF" : "#FFF"
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                }
                RowLayout {
                    Layout.minimumHeight: 32
                    Layout.maximumHeight: 32
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width

                    Button {
                        Layout.fillWidth: true
                        Layout.minimumWidth: parent.width
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                        contentItem: Text {
                            verticalAlignment: Text.AlignVCenter
                            text: "已完成"
                        }
                        onClicked: colNav.activeRow = 'complete'
                        background: Rectangle {
                            color: parent.hovered
                                   || (colNav.activeRow === 'complete') ? "#EDF3FF" : "#FFF"
                        }
                    }
                }
                RowLayout {
                    Layout.minimumHeight: 32
                    Layout.maximumHeight: 32
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width
                    Button {
                        Layout.fillWidth: true
                        Layout.minimumWidth: parent.width
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                        contentItem: Text {
                            verticalAlignment: Text.AlignVCenter
                            text: "已放弃"
                        }
                        onClicked: colNav.activeRow = 'droped'
                        background: Rectangle {
                            color: parent.hovered
                                   || (colNav.activeRow === 'droped') ? "#EDF3FF" : "#FFF"
                        }
                    }
                }
                RowLayout {
                    Layout.minimumHeight: 32
                    Layout.maximumHeight: 32
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.maximumWidth: parent.width
                    Button {
                        Layout.fillWidth: true
                        Layout.minimumWidth: parent.width
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                        contentItem: Text {
                            verticalAlignment: Text.AlignVCenter
                            text: "垃圾箱"
                        }
                        onClicked: colNav.activeRow = 'trash'
                        background: Rectangle {
                            color: parent.hovered
                                   || (colNav.activeRow === 'trash') ? "#EDF3FF" : "#FFF"
                        }
                    }
                }
            }

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
                                listView.model.add({ "name": text })
                                text = ''
                            }

                            background: Rectangle {
                                color: "#f2f2f2"
                            }
                        }
                    }
                }

                Component {
                    id: listDelegate

                    Rectangle {
                        id: wrapper
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 32
                        color: wrapper.ListView.isCurrentItem ? "#EDF3FF" : "#FFF"
                        RowLayout {
                            anchors.fill: parent
                            spacing: 2

                            CheckBox {
                                Layout.preferredWidth: 15
                            }
                            TextField {
                                Layout.alignment: Qt.AlignVCenter
                                Layout.fillWidth: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHLeft
                                text: name
                                selectByMouse: true
                                background: Item {
                                    opacity: 0
                                }

                                onPressed: {
                                    wrapper.ListView.view.currentIndex = index
                                    console.log("clicked on TextInput",
                                                wrapper.ListView.view.currentIndex,
                                                wrapper.ListView.isCurrentItem,
                                                index)
                                }
                            }
                        }
                    }
                }

                ListView {
                    id: listView
                    anchors.top: newTask.bottom
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    topMargin: 16
                    spacing: 4
                    clip: true
                    orientation: ListView.Vertical
                    delegate: listDelegate
                    boundsBehavior: Flickable.StopAtBounds
                    model: VideoListModel {
                        source: "videos.xml"
                    }
                    ScrollBar.vertical: ScrollBar {
                        visible: active
                        background: Item {
                            opacity: 0
                        }
                    }
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
