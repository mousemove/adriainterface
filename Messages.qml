import QtQuick 2.0
import QtQuick.Controls 2.12
Column
{
    id:mcl
    //anchors.top: parent


    spacing:0
    History
    {
    }

    Rectangle
    {
        z: -1
        id: messageRect
        color: "lightgray"
        width: parent.width;
        height:0.15*parent.height;

        Row
        {
            anchors.fill: parent

            TextArea {
                anchors.margins: 5

                width: parent.width-0.2*parent.width;
                height:parent.height;
                text: "Hello,how are you?"
                focus: true
            }
            Button {
                width: parent.width*0.2;
                height:parent.height;
                text: "Send"

            }
        }

    }

    //    Rectangle
    //    {
    //        z: -1
    //        id: sendRect
    //        color: "gray"
    //         width: parent.width;
    //         height:0.05*parent.height;
    //         Button {
    //             anchors.fill: parent
    //                 text: "Ok"

    //             }
    //    }
}
