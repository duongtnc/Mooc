import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 360
    height: 582
    title: qsTr("Hello World")
    color: "transparent"


    Rectangle {
        id: container
        color: "transparent"
        anchors.fill: parent
        property real scaleScreen: 582/360

        //content : top, background, loader
        Rectangle {
            id: content
            height: parent.height
            width: parent.height/container.scaleScreen
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"
            // background img
            Image {
                anchors.fill: parent
                source: "qrc:/imgSrc/bg.png"
            }
            //background top
            Image {
                anchors.top: parent.top
                width: parent.width
                source: "qrc:/imgSrc/darkbg.png"

            }


            Loader {
                id: playView
                active: false
                anchors.fill: parent
                source: "Playing.qml"
                //anchors.centerIn: parent


            }
            SongList {
                anchors.fill: parent
                id: songlist
            }

            Connections {
                target: songlist
                onShowPlay: {
                    songlist.visible = false
                    if(playView.active == false){
                        playView.active = true
                    }else {
                        playView.visible = true
                    }

                }
            }
            Connections {
                target: playView.item
                onShowList: {
                    playView.visible = false
                    songlist.visible = true
                }
            }
        }

    }



}
