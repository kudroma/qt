#include "RandomNumberGenerator.h"
#include <QDateTime>

RandomNumberGenerator::RandomNumberGenerator(QObject *parent) : QObject(parent), m_maxValue(1000)
{
    qsrand(QDateTime::currentMSecsSinceEpoch() / 1000);
    QObject::connect(&m_timer, SIGNAL(timeout()), SLOT(updateProperty()));
            m_timer.start(1000);
}
