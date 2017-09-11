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
        color: "black"
        width: 640
        height: 480
        ParticleSystem {
            id: sys
        }

        ImageParticle {
            system: sys
            source: "qrc:///glowdot.bmp"
            width: 5
            height: 5
            color: "white"
            colorVariation: 1.0
            alpha: 0.1
            entryEffect: ImageParticle.None
        }

        Emitter {
            id: emitter
            system: sys
            width: parent.width/2
            velocity: PointDirection {y: 72; yVariation: 50}
            lifeSpan: 10000
            emitRate: 1500
            enabled: false
            size: 32
        }

        Item {
            id: fakeEmitter
            function burst(number) {
                while (number > 0) {
                    var item = fakeParticle.createObject(root);
                    item.lifeSpan = Math.random() * 5000 + 5000;
                    item.x = Math.random() * (root.width/2) + (root.width/2);
                    item.y = 0;
                    number--;
                }
            }

            Component {
                id: fakeParticle
                Image {
                    id: container
                    property int lifeSpan: 10000
                    width: 32
                    height: 32
                    source: "qrc:///glowdot.bmp"
                    y: 0
                    PropertyAnimation on y {from: -16; to: root.height-16; duration: container.lifeSpan; running: true}
                    SequentialAnimation on opacity {
                        running: true
                        NumberAnimation { from:0; to: 1; duration: 500}
                        PauseAnimation { duration: container.lifeSpan - 1000}
                        NumberAnimation { from:1; to: 0; duration: 500}
                        ScriptAction { script: container.destroy(); }
                    }
                }
            }
        }

        //Hooked to a timer, but click for extra bursts that really stress performance
        Timer {
            interval: 10000
            triggeredOnStart: true
            repeat: true
            running: true
            onTriggered: {
                emitter.burst(20);
                fakeEmitter.burst(20);
            }
        }
        Text {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            text: "100 particles"
            color: "white"
            MouseArea {
                anchors.fill: parent
                onClicked: emitter.burst(100);
            }
        }
        Text {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            text: "1000 items"
            color: "white"
            MouseArea {
                anchors.fill: parent
                onClicked: fakeEmitter.burst(100);
            }
        }
    }
}
