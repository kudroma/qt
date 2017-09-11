#pragma once

#include <QObject>
#include <QDateTime>

class MyClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString _author READ author WRITE setAuthor NOTIFY authorChanged)
    Q_PROPERTY(QDateTime _creationDate READ creationDate WRITE setCreationDate NOTIFY creationDateChanged)
    Q_PROPERTY(double forRevision1 READ getForRevision1 WRITE setForRevision1 REVISION 1)

public:
    explicit MyClass(QObject *parent = 0);

    QString author(){return _author;}
    QDateTime creationDate(){return _creationDate;}
    double getForRevision1(){return forRevision1;}
    void setAuthor(QString author){_author = author;}
    void setCreationDate(QDateTime date){_creationDate = date;}
    void setForRevision1(double forRevision){forRevision1 = forRevision;}

private:
    QString _author;
    QDateTime _creationDate;
    double forRevision1;

signals:
    void authorChanged();
    void creationDateChanged();
};
