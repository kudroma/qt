import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Rectangle {
        width: 100
        height: 100
        anchors.centerIn: parent
        color: "red"
        border.width: 1
    }
}
