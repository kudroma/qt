import QtQuick 2.0
import "function.js" as MyFunction

Rectangle {
    id: rect
    color: "green"
    border.color: "black"
    width: 20
    height: 20

    property alias mouseArea: mouse

    signal activated()

    function doubleSize() {
            width *= 2;
            height *= 2;
        }

    Component.onCompleted: {
            rect.activated.connect(logConnectedFunction)
            rect.activated.connect(MyFunction.func)
        }

    function logConnectedFunction(){
       console.log("function connected to activated signal!");
        //console.log(JSFunction.func());
    }

    property alias buttonText: textId.text
    property alias buttonColor: rect.color

    Text{
        id: textId
        anchors.centerIn: parent
    }
    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: {
            console.log("Click!")
            parent.activated()
        }
    }
}
