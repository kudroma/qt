import QtQuick 2.2
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        width: 200
        height: 140

        ListView {
            id: clippedList
            x: 20
            y: 20
            width: 70
            height: 100
            clip: true
            model: ["Item A", "Item B", "Item C", "Item D"]

            delegate: Rectangle {
                color: "lightblue"
                width: parent.width
                height: 25

                Text {
                    text: modelData
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        ListView {
            id: clippedDelegateList
            x: clippedList.x + clippedList.width + 20
            y: 20
            width: 70
            height: 100
            clip: true
            model: ["Item A", "Item B", "Item C", "Item D"]

            delegate: Rectangle {
                color: "lightblue"
                width: parent.width
                height: 25
                clip: true

                Text {
                    text: modelData
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
}
