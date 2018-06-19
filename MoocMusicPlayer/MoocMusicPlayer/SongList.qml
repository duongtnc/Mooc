import QtQuick 2.0

//this file show full screen list song, width and height from loader of main
Rectangle {
    id: listsong
    color: "transparent"
    signal showPlay()



    // mid viet duoi cung height item 71
    Rectangle {
        id: mid
        color: "transparent"
        height: parent.height - top.height - mid.height
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: top.height
        ListView {
            anchors.fill: parent
            model: SONGMODEL
            delegate: Rectangle{
                height: 70
                width: parent.width
                Rectangle{
                    color: "black"
                    width: parent.width
                    height: 1
                    anchors.bottom: parent.bottom
                }
                Rectangle {
                    width: parent.width - 20
                    height: parent.height - 2
                    anchors.centerIn: parent
                    RunningText {
                        text: name
                    }
                }
            }


        }
    }

    //top
    Rectangle {
        id:top
        height: 50
        width: parent.width
        color: "transparent"
        anchors.top: parent.top
        //background top
        Image {
            anchors.top: parent.top
            width: parent.width
            source: "qrc:/imgSrc/darkbg.png"

        }
        Image {
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 30
            source: "qrc:/imgSrc/backBtn.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listsong.showPlay()

                }
            }

        }
        Text {
            color: "#4f974c"
            text: qsTr("Song List")
            font.pixelSize: 20
    //        anchors.centerIn:  parent
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter

        }

        Image {
            anchors.top: parent.top
            anchors.topMargin: 14
            anchors.right: parent.right
            anchors.rightMargin: 34
            source: "qrc:/imgSrc/clearBtn.png"
        }



    }
    // bottom
    Rectangle{
        id:bot
        height: 50
        anchors.bottom: parent.bottom
        color: "transparent"
        TextInput {

        }
    }

}
