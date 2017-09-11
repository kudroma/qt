#pragma once

#include <QObject>

class PluginType : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString string READ string WRITE setString)

public:
    explicit PluginType(QObject *parent = 0);

    QString string(){return m_string;}
    void setString(QString string){m_string = string;}

private:
    QString m_string;
};
