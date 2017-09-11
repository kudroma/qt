#pragma once

#include <QObject>
#include <QQmlEngine>

class Theme : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString themeName READ getThemeName WRITE setThemeName)
public:
    explicit Theme(QObject *parent = 0);

    QString getThemeName(){return themeName;}
    void setThemeName(QString name){themeName = name;}

private:
    QString themeName;
};

// Second, define the singleton type provider function (callback).
static QObject *theme_qobject_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    Theme *theme = new Theme();
    return theme;
}
