import QtQuick 2.6
import QtQuick.Window 2.2
import com.myclass 1.1
import theme 1.0
import "MyModule" 1.2
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.0
import QtQuick.Particles 2.0
import QtTest 1.0

Window {
    BlackRectangle{
        id: blackRect
        height: 100
        x: 100
        y:100

        property var oldColor: "white"

        Timer{
            interval: 500
            running: true
            repeat: true
            onTriggered: blackRect.x += 5
        }

        MouseArea
        {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            ColorDialog {
                id: colorDialog
                title: "Please choose a color"
                onAccepted: {
                    console.log("You chose: " + colorDialog.color)
                    blackRect.color = colorDialog.currentColor
                    blackRect.oldColor = colorDialog.currentColor
                }
                onRejected: {
                    console.log("Canceled")
                }
                Component.onCompleted: visible = true
            }
            onEntered: {
                blackRect.focus = true
                blackRect.color = "red"
            }
            onExited: blackRect.color = blackRect.oldColor
            onDoubleClicked: colorDialog.open();
        }
        Keys.onDigit9Pressed: height = 500;
        Keys.onDigit4Pressed: height = 100;

        Binding on x{
            id: binding
            target: blackRect
            when: mouse.pressed
            value: 200
        }

        Behavior on height{
            NumberAnimation{
                duration: 6000
                //This selects an easing curve to interpolate with, the default is Easing.Linear
                easing.type: Easing.OutBounce
            }
        }
    }

    RedRectangle{
        id: redRectangle
        height: 50
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        state: "NORMAL"

        Keys.onDigit0Pressed: redRectangle.state = "INCREASED";
        Keys.onDigit1Pressed: redRectangle.state = "NORMAL";

        states: [
            State{
                name: "NORMAL"
                //when: blackRect.color != "red"
                PropertyChanges {
                    target: redRectangle
                    height: 50
                    width: 50
                }
            },
            State{
                name: "INCREASED"
                //when: (blackRect.color == "red")
                PropertyChanges {
                    target: redRectangle
                    height: 500
                    width: 500
                }
            }
        ]

        transitions: [
            Transition {
                from: "NORMAL"
                to: "INCREASED"
                PropertyAnimation { target: redRectangle; properties: "height, width"; duration: 10000}
            },
            Transition {
                from: "INCREASED"
                to: "NORMAL"
                NumberAnimation { target: redRectangle; properties: "height, width"; duration: 10000}
            }
        ]

       // NumberAnimation on height{to: 500; duration: 100000}
        //ColorAnimation on color{to: "black"; duration: 10000}

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: redRectangle.focus = true;
            onExited: redRectangle.focus = false;
            onClicked: {fromTo.start();}
            onDoubleClicked: toFrom.start();
        }

        ColorAnimation {
            id: fromTo
            target: redRectangle
            properties: "color"
            from: redRectangle.color
            to: "black"
            duration: 10000
        }
        ColorAnimation {
            id: toFrom
            target: redRectangle
            properties: "color"
            from: redRectangle.color
            to: "red"
            duration: 10000
        }
    }

    MyClass{
        id: myClass1
        forRevision1: 5
//        extensionProperty: "Extension Property!!!"

//        Component.onCompleted: {
//            console.log(myClass1.extensionProperty);
//        }

        Component.onCompleted: {
            console.log("attached property = " + AttachingType.attachedProperty);
            ColorsList.func();
        }
    }

//    PluginType{
//        id: pluginType
//        Component.onCompleted: {
//            console.log(pluginType.string)
//        }
//    }

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    id: window


    Rectangle {
        id: myRectangle
        z: 0
        width: 100
        height: 100
        property var square: width*height /// user defined var property using JS binding expression
        anchors.centerIn: parent
        color: "green"
        border.width: 1


        RadialGradient{
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "white" }
                GradientStop {
                    position: 0.5; color: "green";
                    SequentialAnimation on color {
                            ColorAnimation { to: "yellow"; duration: 10000 }
                            ColorAnimation { to: "blue"; duration: 10000 }
                        }
                }
            }
        }

        TextInput { id: textInput1; anchors.centerIn: parent;}
        Text{
            font {pixelSize: 12; bold: true;}
            text: myRectangle.square
            parent: textInput1
            anchors.centerIn: parent
            color : "brown"
        }
        MyButton {
            id: button
            z: 1000
            buttonText: "MyButton";
            onActivated: {
                console.log("Activate!")
                doubleSize();
                button.buttonColor = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
            }
            RandomNumberGenerator on width {
                maxValue: 100
            }
            RandomNumberGenerator on height {
                maxValue: 100
            }
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            onEntered:{ focus = true;
            button.focus = true;}
            onExited: focus = false;
        }
        Keys.onPressed:
        {
            if(event.key === Qt.Key_A)
            {
                myRectangle.height = 200;
                event.accepted = true;
            }
            if(event.key === Qt.Key_B)
            {
                myRectangle.height = 100;
                event.accepted = true;
            }
        }
        Keys.onDigit2Pressed: height = 200;
        Keys.onDigit3Pressed: height = 100;

        Behavior on height {
            NumberAnimation {
                //This specifies how long the animation takes
                duration: 6000
                //This selects an easing curve to interpolate with, the default is Easing.Linear
                easing.type: Easing.OutBounce
            }
        }
    }

    MyClass{
        id: myClass
        _author: "Roman Kudaktsin"
        Component.onCompleted: {
            console.log("MyClass created!\n author: " + myClass._author + " creationDate: " + myClass._creationDate);
            console.log(Theme.themeName);
        }
    }

    XmlListModel {
        id: xmlModel
        source: "file:///C:/Users/Roman/Desktop/Programming/qt/QtStudyProject/model(2).xml"
        query: "/rss/channel/item"

        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "pubDate"; query: "pubDate/string()" }

//        Component.onCompleted: {
//            console.log("TETSTING XMLLISTMODEL: " + xmlModel.get(0).title)
//        }
    }

    ListModel {
        id: myNewModel
        ListElement {
            name: "Bill Smith"
            number: "555 3264"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "Sam Wise"
            number: "555 0473"
        }
    }

    ListView {
        x: 10
        y: 10
        width: 180; height: 300
        model: xmlModel
        delegate: Text { text: title + " : " + pubDate }
    }

    ListView {
        x: 400
        y: 10
        width: 180; height: 300
        model: myNewModel
        delegate: Text { text: name + " : " + number }
    }

    Image{
        x: 10
        y: 300
        height: 100
        width: 100
        source: "file:///C:/Users/Roman/Desktop/Programming/qt/QtStudyProject/1.png"
    }

    Text{
        id: databaseText
        x: 500
        y: 300
        color: "green"
    }

    function findWorkersOfLaboratory()
    {
        var db = LocalStorage.openDatabaseSync("QQmlExampleDB", "1.0", "The Example QML SQL!", 1000000)
        db.transaction(
                function(tx) {
                    // Create the database if it doesn't already exist
                    tx.executeSql('CREATE TABLE IF NOT EXISTS Workers(name TEXT, stuff TEXT, age NUMBER)');
                    tx.executeSql('DELETE FROM Workers');
                    tx.executeSql('INSERT INTO Workers VALUES(?, ?, ?)', [ 'Raman Kudaktsin', 'mns', 27 ]);
                    tx.executeSql('INSERT INTO Workers VALUES(?, ?, ?)', [ 'Pawel Shoronov', 'mns', 30 ]);
                    console.log("insert rows!");

                    var rs = tx.executeSql('SELECT * FROM Workers');

                    var r = ""
                    console.log("number of rows in database: " + rs.rows.length);
                    for(var i = 0; i < rs.rows.length; i++) {
                        r += rs.rows.item(i).name + ", " + rs.rows.item(i).stuff + ", " + rs.rows.item(i).age + "\n"
                    }
                    databaseText.text = r;
                }
         )
    }

    Component.onCompleted: {
        console.log("Read data from dataBase");
        window.findWorkersOfLaboratory();
    }

    ColumnLayout{
        id: rowLayout
        x: 10
        y: 100
        spacing: 6
        Rectangle{
            Layout.fillWidth: true
            Layout.minimumWidth: 1
            Layout.preferredWidth: 50
            Layout.maximumWidth: 300
            Layout.minimumHeight: 1
            Layout.preferredHeight: 20
            color: "red"
        }
        Rectangle{
            Layout.minimumWidth: 1
            Layout.preferredWidth: 30
            Layout.maximumWidth: 300
            Layout.minimumHeight: 1
            Layout.preferredHeight: 40
            color: "green"
        }
        Rectangle{
            Layout.minimumWidth: 1
            Layout.preferredWidth: 25
            Layout.maximumWidth: 300
            Layout.minimumHeight: 1
            Layout.preferredHeight: 20
            color: "pink"
        }
    }

    Rectangle {
        x: 1000; y: 600
        width: 40; height: 40; color: "black"

        Grid {
            x: 5; y: 5
            rows: 5; columns: 5; spacing: 10

            Repeater { model: 24
                       Rectangle { width: 7; height: 7
                                   color: "lightgreen"

                                   Text { text: index
                                          font.pointSize: 7
                                          anchors.centerIn: parent } }
            }
        }
    }
}
