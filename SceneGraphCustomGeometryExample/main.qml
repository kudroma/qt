import QtQuick 2.6
import CustomGeometry 1.0
import QtQuick.Window 2.2

    Item {
        width: 600
        height: 400

        BezierCurve {
            id: line
            anchors.fill: parent
            anchors.margins: 20
            property real t
            SequentialAnimation on t {
                NumberAnimation { to: 1; duration: 2000; easing.type: Easing.InOutQuad }
                NumberAnimation { to: 0; duration: 2000; easing.type: Easing.InOutQuad }
                loops: Animation.Infinite
            }

            p2: Qt.point(t, 1 - t)
            p3: Qt.point(1 - t, t)
        }

        Text {
            anchors.bottom: line.bottom

            x: 20
            width: parent.width - 40
            wrapMode: Text.WordWrap

            text: "This curve is a custom scene graph item, implemented using GL_LINE_STRIP"
        }
    }

