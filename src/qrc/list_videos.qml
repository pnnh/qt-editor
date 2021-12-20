import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Window 2.9
import QtQuick.Layouts 1.12
import an.qt.CModel 1.0

Rectangle {
    anchors.fill: parent;
//    Text {
//        text: "Videos"
//    }

    Component {
        id: videoDelegate;
        Item {
            id: wrapper;
            height: 120;
            signal remove();
            signal add();

            MouseArea {
                anchors.fill: parent;
                onClicked: wrapper.ListView.view.currentIndex = index;
            }
            ColumnLayout {
                anchors.leftMargin: 4;
                height: parent.height;
                spacing: 2;
                Text {
                    Layout.fillWidth: true;
                    text: name;
                    color: wrapper.ListView.isCurrentItem ? "blue" : "black";
                    font.pixelSize: 18;
                    elide: Text.ElideRight;
                }
            }
        }
    }

    ListView {
        id: listView;
        anchors.fill: parent;
        spacing: 4;
        clip:true
        delegate: videoDelegate;
        model: VideoListModel {
            source: "videos.xml";
        }
        focus: true;
        function addOne() {
            console.log('addOne');
        }
    }

}
