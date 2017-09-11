import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        color: "lightsteelblue"; width: 100; height: 50; anchors.centerIn: parent

        ListView {
            anchors.fill: parent
            focus: true

            model: ListModel {
                ListElement { name: "Bob" }
                ListElement { name: "John" }
                ListElement { name: "Michael" }
            }

            delegate: FocusScope {
                    width: childrenRect.width; height: childrenRect.height
                    x:childrenRect.x; y: childrenRect.y
                    TextInput {
                        focus: true
                        text: name
                        Keys.onDigit1Pressed: console.log(name)
                    }
            }
        }
    }
}
