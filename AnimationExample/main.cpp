#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick/QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
//    view.setSource(QUrl("qrc:///basics/color-animation.qml"));
//    view.setSource(QUrl("qrc:///basics/property-animation.qml"));
//    view.setSource(QUrl("qrc:///basics/animators.qml"));
//    view.setSource(QUrl("qrc:///behaviors/behavior-example.qml"));
//    view.setSource(QUrl("qrc:///behaviors/wigglytext.qml"));
//    view.setSource(QUrl("qrc:///behaviors/tvtennis.qml"));
//    view.setSource(QUrl("qrc:///easing/easing.qml"));
//    view.setSource(QUrl("qrc:///states/states.qml"));
//    view.setSource(QUrl("qrc:///states/transitions.qml"));
//    view.setSource(QUrl("qrc:///pathanimation/pathanimation.qml"));
    view.setSource(QUrl("qrc:///pathinterpolator/pathinterpolator.qml"));
    view.show();

    return app.exec();
}
