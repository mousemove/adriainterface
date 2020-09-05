import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.0
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
            height:  ( messageText.lineCount) * 15 + 20

            RowLayout {
                id: layout
                anchors.fill: parent
                spacing: 15
                Rectangle {
                    color: 'white'
                    Layout.minimumWidth: parent.width/2 -18
                    Layout.preferredWidth: parent.width/2 - 18
                    Layout.maximumWidth: parent.width/2 -18

                    Layout.minimumHeight: messageText.lineCount * 15 + 10
                //Layout.maximumHeight: 200

                    visible: from === "operator"
                }
                Rectangle {
                    id:recid
                    color: from === "operator" ? '#e6ffff' : "#ffffe6"
                    Layout.fillWidth: true

                    Layout.minimumWidth: parent.width/2 -18
                    Layout.preferredWidth: parent.width/2 - 18
                    Layout.maximumWidth: parent.width/2 -18

                    Layout.minimumHeight: messageText.lineCount * 15 + 10

                    radius: 30
                    TextArea {
                        // anchors.centerIn: parent
                        id:messageText
                        anchors.fill:parent
                        anchors.leftMargin: 12
                        Layout.fillWidth: true
                        text:    message
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                        //elide :Text.ElideRight
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
