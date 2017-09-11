
function func() {
    console.log("my js function!!!");
    createComponent();
}

function createComponent(){
    var newObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle {color: "red"; width: 20; height: 20; anchors.centerIn: parent;}',
                                       rect);
}
