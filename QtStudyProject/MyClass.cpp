#include "MyClass.h"

MyClass::MyClass(QObject *parent) : QObject(parent)
{
    _creationDate = QDateTime::currentDateTime();
}
