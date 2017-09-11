#include <QCoreApplication>
#include <QTextCodec>
#include <iostream>
#include <qmath.h>
#include <QDebug>
#include <QFile>

using namespace std;

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    // solution of non-linear equation by method of division by two
    //
    qreal a, b, c, x, C, D, epsilon;
    C = -8.25;
    D = 15.33;
    a = 1e-5;
    b = 100.;
    epsilon = 10e-5;
    while((b-a) > epsilon)
    {
        qreal f;
        c = (a+b)/2;
        f = qLn(c) - D/c - C;
        if(f > 0)
        {
            b = c;
        }
        else if(f < 0)
        {
            a = c;
        }
        else
        {
            x = c;
            break;
        }
    }
    x = (a+b)/2;
    qDebug() << x;
    qDebug() << qLn(x) - D/x - C;

    return app.exec();
}
