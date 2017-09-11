import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    AnimatedSprite {
            id: sprite
            width: 170
            height: 170
            anchors.centerIn: parent
            source: "qrc:/sprites.png"
            frameCount: 8
            frameWidth: 80
            frameHeight: 80
            loops: 300
            frameDuration: 1000
        }

//    Sprite {
//        name: "black"
//        source: "qrc:/sprites.png"
//        frameCount: 8
//        frameWidth: 80
//        frameHeight: 80
//        frameRate: 20
//    }
    AnimatedSprite {
        source: "qrc:/sprites.png"
        width: 170
        height: 170
        frameX: 240
        frameCount: 5
        frameWidth: 80
        frameHeight: 80
        frameRate: 1
        loops: 300
    }
//    Image{
//        anchors.centerIn: parent
//        source: "qrc:/sprites.png"
//    }

//    Sprite {
//        name: "blue"
//        source: "image.png"
//        frameX: 40
//        frameCount: 2
//        frameWidth: 40
//        frameHeight: 40
//        frameRate: 20
//    }
}
