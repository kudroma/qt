#ifndef MYCLASSEXTENSION_H
#define MYCLASSEXTENSION_H

#include <QObject>

class MyClassExtension : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString extensionProperty READ getExtensionProperty WRITE setExtensionProperty)
public:
    explicit MyClassExtension(QObject *parent = 0);

    QString getExtensionProperty(){return extensionProperty;}
    void setExtensionProperty(QString property){extensionProperty = property;}

private:
    QString extensionProperty;
};

#endif // MYCLASSEXTENSION_H
