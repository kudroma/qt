import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        width: 75; height: 75
        id: button
        anchors.centerIn: parent
        state: "RELEASED"

        MouseArea {
            anchors.fill: parent
            onPressed: button.state = "PRESSED"
            onReleased: button.state = "RELEASED"
        }

        states: [
            State {
                name: "PRESSED"
                PropertyChanges { target: button; color: "red"; width: 200; height: 200}
            },
            State {
                name: "RELEASED"
                PropertyChanges { target: button; color: "lightsteelblue"; width: 75; height: 75}
            }
        ]

        transitions: [
            Transition {
                from: "PRESSED"
                to: "RELEASED"
                PropertyAnimation { target: button; properties: "color, width, height";  duration: 1000}
            },
            Transition {
                from: "RELEASED"
                to: "PRESSED"
                PropertyAnimation { target: button; properties: "color, width, height"; duration: 1000}
            }
        ]
    }

    Rectangle {
        width: 75; height: 75; radius: width

        id: ball
        color: "salmon"

        Behavior on x {
            NumberAnimation {
                id: bouncebehavior
                easing {
                    type: Easing.OutElastic
                    amplitude: 1.0
                    period: 0.5
                }
                duration: 3000
            }
        }
        Behavior on y {
            animation: bouncebehavior
        }
        Behavior {
            ColorAnimation { target: ball; duration: 100 }
        }

        MouseArea{
            anchors.fill: parent
            onClicked: ball.y = 100;
        }
    }

    Rectangle {
        id: rect2
        width: 60; height: 60
        x: rect1.x - 5; y: rect1.y - 5
        color: "green"

        Behavior on x { SmoothedAnimation { velocity: 200 } }
        Behavior on y { SmoothedAnimation { velocity: 200 } }
    }

    Rectangle {
        x: 200; y: 200
        id: rect1
        width: 50; height: 50
        color: "red"
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: rect1.focus = true;
            onExited: rect1.focus = false;
        }

        Keys.onRightPressed: rect1.x = rect1.x + 100
        Keys.onLeftPressed: rect1.x = rect1.x - 100
        Keys.onUpPressed: rect1.y = rect1.y - 100
        Keys.onDownPressed: rect1.y = rect1.y + 100
    }
}
