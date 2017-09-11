#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "MyClass.h"
#include "Theme.h"
#include "MyClassExtension.h"
#include "AttachingType.h"
#include "RandomNumberGenerator.h"
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<MyClass>("com.myclass", 1, 0, "MyClass");
    qmlRegisterType<AttachingType>("com.myclass", 1, 0, "AttachingType");
    qmlRegisterType<RandomNumberGenerator>("com.myclass", 1, 0, "RandomNumberGenerator");
    qmlRegisterType<AttachedType>();
    //qmlRegisterExtendedType<MyClass,MyClassExtension>("com.myclass", 1, 0, "MyClass");
    qmlRegisterType<MyClass,1>("com.myclass", 1, 1, "MyClass");
    qmlRegisterSingletonType<Theme>("theme", 1, 0, "Theme", theme_qobject_singletontype_provider);

    QQmlApplicationEngine engine;
    engine.setOfflineStoragePath("C:/Users/Roman/Desktop/Programming/qt/QtStudyProject/LocalStorage");
    engine.addImportPath("C:/Users/Roman/Desktop/Programming/qt/QtStudyProject");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    qDebug() << engine.offlineStoragePath();

    return app.exec();
}
