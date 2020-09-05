import QtQuick 2.0
import QtQuick.Layouts 1.12

Rectangle
{
    z: -1
    id: historyRect
    //color: "white"
    width: parent.width; height: parent.height - 0.15*parent.height;



    ListView {
        id:contacts
        anchors.fill: parent
        model: HistoryModel {}
        clip: true
        delegate:
            Item {
            width: parent.width;
            height:  60//todo переписать под динамику для больших текстов


            RowLayout {
                id: layout
                anchors.fill: parent
                spacing: 15
                Rectangle {
                    color: 'white'
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width/2
                    Layout.preferredWidth: parent.width/2
                    Layout.maximumWidth: parent.width/2
                    Layout.minimumHeight: 50
                //Layout.maximumHeight: 200

                    visible: from === "operator"
                }
                Rectangle {

                    color: from === "operator" ? '#e6ffff' : "#ffffe6"
                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width/2 -18
                    Layout.preferredWidth: parent.width/2 - 18
                    Layout.maximumWidth: parent.width/2 -18

                    Layout.minimumHeight: 50
                     //Layout.maximumHeight: 200
                    radius: 30
                    Text {
                        // anchors.centerIn: parent
                        id:messageText
                        anchors.fill:parent
                        anchors.leftMargin: 12

                        text:    message
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                        elide :Text.ElideRight
                    }

                }

            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log(message );


                }
            }
        }


        currentIndex: -1
        focus: true
    }
}
