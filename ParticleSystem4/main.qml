import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Particles 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: root
        width: 360
        height: 600
        color: "darkblue"
        anchors.fill: parent
        property bool cloneMode: false
        ParticleSystem {
            id: sys
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.cloneMode = !root.cloneMode;
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Click to Toggle"
            color: "white"
            font.pixelSize: 24
        }
        Emitter {
            system: sys
            y:root.height + 20
            width: root.width
            emitRate: 200
            lifeSpan: 4000
            startTime: 4000
            velocity: PointDirection { y: -120; x: 50 }
        }

        ImageParticle {
            system: sys
            visible: !root.cloneMode
            source: "qrc:///particle2.bmp"
        }

        ImageParticle {
            system: sys
            visible: root.cloneMode
            z: 0
            source: "qrc:///particle3.bmp"
        }

        ImageParticle {
            system: sys
            clip: true
            visible: root.cloneMode
            y: 120
            height: 240
            width: root.width
            z: 1
            source: "qrc:///particle1.bmp"
        }
    }
}
