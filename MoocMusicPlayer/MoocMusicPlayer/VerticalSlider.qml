import QtQuick 2.0

Rectangle {
    id: vSlider
    width: 100
    height: 250
    //clip: true
    property int numberDot: 10
    //anchors.centerIn: parent
    //border.color: "brown"
    color: "transparent"

    // drag area
    Rectangle {
        id: leftSide

        width: parent.width/2
        height: parent.height
        anchors.left: parent.left

        property int minY: bg.y
        property int heightSlider: 198
        property int maxY: leftSide.minY + leftSide.heightSlider + 5  // 290

        property int stepLevel : 0
        property int volumeLevel: leftSide.maxVolume - stepLevel
        property int maxVolume: 9
        property int stepHeight: leftSide.heightSlider / leftSide.maxVolume

        property int widthSlider: 13
        property int radiusSlider: 10
        color: "transparent"
        //border.color: "black"
        //background
        Rectangle{
            id: bg
            width: leftSide.widthSlider * 2
            height: leftSide.heightSlider
            anchors.centerIn: parent
            color: "transparent"
            Image {

                source: "qrc:/imgSrc/blackBGVolume.png"
                anchors.centerIn: parent

            }
            radius: leftSide.radiusSlider
             //clip: true
             // handle
            // window show current volume level
            Rectangle{
                id: handle



                color: "transparent"
                clip: true
                //border.color: "blue"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -4
                //border.color: "red"
                Image {

                    source: "qrc:/imgSrc/volbar.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                }
                anchors.left: parent.left

                Component.onCompleted: {
                    handle.width = leftSide.widthSlider * 2
                    handle.height = (leftSide.maxVolume - leftSide.stepLevel) * leftSide.stepHeight //+ spearkerImg.height/2

                }
            }

            }

        // button
        Rectangle {
            id: dragBtn
            //anchors.centerIn: parent
            width: 1
            height: 1

            x: 25
            y: leftSide.height/2
            color: "transparent"
            //border.color: "blue"
            Image {
                id: spearkerImg

                anchors.centerIn: parent
                source: "qrc:/imgSrc/VolumnButton.png"
            }
            onYChanged: {
                handle.height = (leftSide.maxVolume - leftSide.stepLevel) * leftSide.stepHeight //+ spearkerImg.height/2
            }



        }
        Rectangle {
            id: invisibleDragBtn
            //anchors.centerIn: parent
            width: 1
            height: 1

            x: leftSide.width/2 - handle.width*8/10
            y: leftSide.height/2
           // border.color: "black"
            color: "transparent"

            onYChanged: {

                leftSide.stepLevel =  (invisibleDragBtn.y - bg.y ) / leftSide.stepHeight

                console.log("vol:" + leftSide.volumeLevel)
                dragBtn.y = leftSide.stepLevel * leftSide.stepHeight + bg.y //+  spearkerImg.height/2
            }
        }

        MouseArea {
           anchors.fill: parent
             drag{
               target: invisibleDragBtn
               //axis:  Drag.axis
               minimumY: leftSide.minY
               maximumY: leftSide.maxY
               minimumX: leftSide.width/2 - handle.width*3/4
               maximumX: leftSide.width/2 - handle.width*3/4

             }
             onPressed: {
                 if(mouseY > leftSide.maxY){
                    invisibleDragBtn.y = leftSide.maxY
                 }else {
                     if(mouseY < leftSide.minY){
                        invisibleDragBtn.y = leftSide.minY
                     }else{
                        invisibleDragBtn.y = mouseY
                     }

                 }


             }
        }
        Component.onCompleted: {
            stepLevel = 4;
        }


    }

    // light dot
    Rectangle {
        id: rightSide
        width: parent.width/2
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 12
        color: "transparent"
        //border.color: "black"
        ListView {
            width: parent.width
            height: leftSide.heightSlider
            anchors.centerIn: parent
            interactive: false
            model: leftSide.maxVolume + 1
            delegate: Rectangle {
                color: "transparent"
                width: leftSide.stepHeight
                height: leftSide.stepHeight - 1
                property bool blueDot: false
                Image {
                    id: dot
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.top
                    anchors.bottomMargin: -8
                    source: "qrc:/imgSrc/blackDot.png"
                }
                Connections{
                    target: leftSide
                    onStepLevelChanged: {
                        if(index < leftSide.stepLevel){
                            dot.source = "qrc:/imgSrc/blackDot.png"
                        }else {
                            dot.source = "qrc:/imgSrc/blueDot.png"
                        }
                    }
                }
                Component.onCompleted: {
                    console.log("index: "+ index)
                    console.log("vol level: "+ leftSide.stepLevel)
                    if(index < leftSide.stepLevel){
                        dot.source = "qrc:/imgSrc/blackDot.png"
                    }else {
                        dot.source = "qrc:/imgSrc/blueDot.png"
                    }

                }

            }



            }





        }

    }




