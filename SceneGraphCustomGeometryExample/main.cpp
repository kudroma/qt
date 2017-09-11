#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "beziercurve.h"

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<BezierCurve>("CustomGeometry", 1, 0, "BezierCurve");

    QQuickView view;
    QSurfaceFormat format = view.format();
    format.setSamples(16);
    view.setFormat(format);
    view.setSource(QUrl("qrc:///main.qml"));
    view.show();

    app.exec();
}
