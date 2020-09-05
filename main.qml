import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
    visible: true
    width: 1280
    height: 800
    title: qsTr("TestInterface")



    Row
    {
        id:rl
        //anchors.top: parent

        anchors.topMargin: 5
        spacing:0




        Rectangle
        {
            z: -1
            id: menuRect
            color: "white"
            width: 180; height: window.height - tb.height

            Component {
                id: contactDelegate
                Item {
                    width: 180; height: 40
                    Column {
                        Text { text: '<b>Id:</b> ' + name }
                        Text { text: '<b>From:</b> ' + programm }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log(name);
                            contacts.currentIndex = index

                            stack.pop(StackView.Immediate); stack.push("Messages.qml",StackView.Immediate);
                        }
                    }
                }

            }

            ListView {
                id:contacts
                anchors.fill: parent
                model: ContactModel {}
                delegate: contactDelegate
                highlight: Rectangle { color: "lightsteelblue"; radius: 0 }
                currentIndex: -1
                focus: true
            }
        }



        Rectangle
        {
            z: -1
            id: messagesRect
            height: window.height - tb.height
            width: window.width - 180
            color: "aqua"



            StackView {
                id: stack
                initialItem: "NoSelect.qml"
                anchors.fill: parent
            }
        }




    }

    footer: ToolBar {
        id: tb
        RowLayout {
            anchors.fill: parent
            Rectangle
            {

                width: 1
                height: 1
                color: "#E8E8E8"
            }
            Rectangle
            {

                width: 20
                height: 20
                color:  "green"
            }
        Label {
            text: "Adria interface alpha build "
            elide: Label.ElideLeft
            horizontalAlignment: Qt.AlignRight
            verticalAlignment: Qt.AlignVCenter
            Layout.fillWidth: true
        }
        }
    }



}
