#pragma once

#include <QQmlExtensionPlugin>
#include "PluginType.h"
#include <QQmlEngine>

class QmlExamplePlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)
    void registerTypes(const char *uri)
    {
        qmlRegisterType<PluginType>(uri, 1, 0, "PluginType");
    }

public:
    QmlExamplePlugin();
};
