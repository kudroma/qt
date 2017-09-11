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
            color: "white"
            colorVariation: 1.0
            alpha: 0.1
        }

        Component {
            id: emitterComp
            Emitter {
                id: container
                Emitter {
                    id: emitMore
                    system: sys
                    emitRate: 120
                    lifeSpan: 600
                    size: 16
                    endSize: 8
                    velocity: AngleDirection {angleVariation:360; magnitude: 60}
                }

                property int life: 2600
                property real targetX: 0
                property real targetY: 0
                function go() {
                    xAnim.start();
                    yAnim.start();
                    container.enabled = true
                }
                system: sys
                emitRate: 32
                lifeSpan: 600
                size: 24
                endSize: 8
                NumberAnimation on x {
                    id: xAnim;
                    to: targetX
                    duration: life
                    running: false
                }
                NumberAnimation on y {
                    id: yAnim;
                    to: targetY
                    duration: life
                    running: false
                }
                Timer {
                    interval: life
                    running: true
                    onTriggered: container.destroy();
                }
            }
        }

        function customEmit(x,y) {
            for (var i=0; i<5; i++) {
                var obj = emitterComp.createObject(root);
                obj.x = x
                obj.y = y
                obj.targetX = Math.random() * 240 - 120 + obj.x
                obj.targetY = Math.random() * 240 - 120 + obj.y
                obj.life = Math.round(Math.random() * 2400) + 200
                obj.emitRate = Math.round(Math.random() * 32) + 32
                obj.go();
            }
        }

        Timer {
            interval: 10000
            triggeredOnStart: true
            running: true
            repeat: true
            onTriggered: root.customEmit(Math.random() * 320, Math.random() * 480)
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.customEmit(mouse.x, mouse.y);
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Click Somewhere"
            color: "white"
            font.pixelSize: 24
        }
    }
}
