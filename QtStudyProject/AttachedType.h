#pragma once

#include <QObject>

class AttachedType : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal attachedProperty READ getAttachedProperty WRITE setAttachedProperty)
public:
    explicit AttachedType(QObject *parent = 0);

    qreal getAttachedProperty(){return attachedProperty;}
    void setAttachedProperty(qreal property){attachedProperty = property;}

private:
    qreal attachedProperty;
};
