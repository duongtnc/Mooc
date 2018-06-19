import QtQuick 2.0



Text {
    anchors.verticalCenter: parent.verticalCenter
    id: rText

    text: ""

    color: "black"

    font.pixelSize: 14

    property int dur: 0

    property alias aliasDur: rText.dur

    property int des : 0

    property int delay: 0



    Text {

        id: childT

        text: parent.text

        anchors.left: parent.right

        anchors.leftMargin: 50

        font.pixelSize: parent.font.pixelSize



    }





    Component.onCompleted: {

        if(rText.contentWidth > 200){



            if(rText.dur == 0){

                rText.dur = (rText.contentWidth + 120)*20
            }



            childT.visible = true

            rText.des = -rText.contentWidth - 50

            rText.delay = 1000




        }else {

            rText.dur = 0

            childT.visible = false

            rText.des = 0

            rText.delay = 0



        }





    }

}
