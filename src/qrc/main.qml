import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        anchors.top: parent.top;
        spacing: 0;
        RowLayout {
            id: rowLayout;
            Layout.alignment: Qt.AlignTop
            Rectangle {
                color: 'teal'
                Layout.fillWidth: true
                Layout.minimumHeight: 50
                Layout.maximumHeight: 100
                Text {
                    anchors.centerIn: parent
                    text: parent.width + 'x' + parent.height
                }
            }
        }
        RowLayout {
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 0;
            Rectangle {
                color: 'green'
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: 50
                Layout.preferredWidth: 100
                Layout.maximumWidth: 300
                Layout.minimumHeight: 150
                Text {
                    anchors.centerIn: parent
                    text: parent.width + 'x' + parent.height
                }
                Loader {
                    anchors.fill: parent;
                    source: "list_videos.qml"
                }
            }
            Rectangle {
                color: 'plum'
                Layout.fillWidth: true
                Layout.minimumWidth: 100
                Layout.preferredWidth: 200
                Layout.preferredHeight: 100
                Text {
                    anchors.centerIn: parent
                    text: parent.width + 'x' + parent.height
                }
                Column {
                    Text {
                        text: "A"
                    }
                    Text {
                        text: "B"
                    }
                    Text {
                        text: "C"
                    }
                }
            }
        }
    }

}
