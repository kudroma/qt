#pragma once

#include <QObject>
#include <QQmlEngine>
#include <QTimer>
#include <QQmlProperty>

class RandomNumberGenerator : public QObject, public QQmlPropertyValueSource
{
    Q_OBJECT
    Q_INTERFACES(QQmlPropertyValueSource)
    Q_PROPERTY(int maxValue READ maxValue WRITE setMaxValue NOTIFY maxValueChanged)

public:
    explicit RandomNumberGenerator(QObject *parent = 0);

    int maxValue(){return m_maxValue;}
    void setMaxValue(int value){m_maxValue = value;}

    virtual void setTarget(const QQmlProperty &prop) { m_targetProperty = prop; }

signals:
    void maxValueChanged();

private slots:
    void updateProperty(){
        m_targetProperty.write(qrand() % m_maxValue);
    }

private:
    QQmlProperty m_targetProperty;
    int m_maxValue;
    QTimer m_timer;
};

