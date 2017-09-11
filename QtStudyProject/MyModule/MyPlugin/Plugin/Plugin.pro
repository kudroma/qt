TEMPLATE = lib
CONFIG += qt plugin
QT += qml

DESTDIR = $$PWD/../..
TARGET = MyPlugin

HEADERS += \
    PluginType.h \
    QmlExamplePlugin.h

SOURCES += \
    PluginType.cpp \
    QmlExamplePlugin.cpp
