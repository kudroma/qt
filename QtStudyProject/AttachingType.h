#pragma once

#include <QObject>
#include "AttachedType.h"
#include <QQmlEngine>

class AttachingType : public QObject
{
    Q_OBJECT
public:
    explicit AttachingType(QObject *parent = 0);

    static AttachedType *qmlAttachedProperties(QObject *object)
    {
        return new AttachedType(object);
    }
};

QML_DECLARE_TYPEINFO (AttachingType, QML_HAS_ATTACHED_PROPERTIES)
