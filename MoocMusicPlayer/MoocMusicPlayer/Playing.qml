import QtQuick 2.9
import QtQuick.Dialogs 1.2

//this file show full play screen, width and height from loader of main
Rectangle {
    id: playIng
    color: "transparent"
    clip: true
    signal showList()

    // mid
    Rectangle {
        height: 480
        color: "transparent"
        width: parent.width
        anchors.centerIn: parent
        // cd image
        Image {
            source: "qrc:/imgSrc/cd2.png"
            anchors.left: parent.left
            anchors.leftMargin: -157
            anchors.top: parent.top
            anchors.topMargin: 13


        }
        // needle
        Image {
            anchors.left: parent.left
            anchors.leftMargin: 226
            anchors.top: parent.top
            anchors.topMargin: 12
            source: "qrc:/imgSrc/TrackRotor.png"
            rotation: -25

            //track rotation
            Image {
                source: "qrc:/imgSrc/Needle.png"
                anchors.centerIn: parent
            }
        }
        //volume bar
        VerticalSlider {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.right: parent.right
            anchors.rightMargin: -20
        }


    }

    // bottom button
    Rectangle {
        width: parent.width
        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        color: "transparent"
        // shuffle song btn
        Image {
            source: "qrc:/imgSrc/shuffle.png"
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.verticalCenter: parent.verticalCenter

        }
        // prev button
        Image {
            source: "qrc:/imgSrc/preBtn.png"
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.verticalCenter: parent.verticalCenter
        }
        //pause btn
        Image {
            source: "qrc:/imgSrc/pauseBtn.png"
            anchors.centerIn: parent

        }


        // next button
        Image {
            source: "qrc:/imgSrc/nextBtn.png"
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.verticalCenter: parent.verticalCenter
        }
        // repeat button
        Image {
            source: "qrc:/imgSrc/RepeatBtn.png"
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    //top
    Rectangle {
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
        // btn to show list song
        Image {
            anchors.top: parent.top
            anchors.topMargin: 12
            anchors.right: parent.right
            anchors.rightMargin: 120
            source: "qrc:/imgSrc/RoundedRect.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    playIng.showList()
                }
            }
        }
        // setting btn
        Image {
            anchors.top: parent.top
            anchors.topMargin: 12
            anchors.right: parent.right
            anchors.rightMargin: 63
            source: "qrc:/imgSrc/settingBtn.png"
            Rectangle {
                id: addMedia
                width: 128
                height: 54
                visible: false
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -60
                anchors.left: parent.left
                anchors.leftMargin: -30
                Text {
                    text: qsTr("ADD FOLDER")
                    anchors.top: parent.top
                    anchors.topMargin: 7
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            fileDialog.selectFolder = true
                            fileDialog.visible = true
                            addMedia.visible = false

                        }
                    }
                }
                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    text: qsTr("ADD SONGS")
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            fileDialog.selectFolder = false
                            fileDialog.visible = true
                            addMedia.visible = false

                        }

                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked:  {
                    addMedia.visible = !addMedia.visible
                }

            }
            FileDialog {
                    id: fileDialog
                    title: "Please choose a file"
                    folder: shortcuts.home
                    selectFolder: false
                    visible: false

                    onAccepted: {
                        console.log("You chose: " + fileDialog.fileUrl)
                        SONGMODEL.addSongFromQML(fileDialog.fileUrl,fileDialog.selectFolder)

                    }
                    onRejected: {
                        console.log("Canceled")

                    }

                }
        }
        // end setting btn

    }


}
