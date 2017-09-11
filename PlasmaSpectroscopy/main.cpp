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
    C = -23.;
    D = 23.;
    a = 1e-5;
    b = 100;
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
    //qDebug() << x;
    if(x != c)
    {
        x = (a+b)/2;
    }

    cout << QString("%1 ").arg(x).toLocal8Bit().data()<<endl;

    qreal p = 1.;
    for(int i = 323; i <= 365; i++)
    {
        qreal m = i;
        p *= m/365.;
    }

    p = 1-p;

    cout << QString("reault is: %1").arg(p).toLocal8Bit().data() << endl;

    // formula for calculation of plasma temperature

//    QTextCodec::setCodecForLocale(QTextCodec::codecForName("IBM 866"));

//    qreal E2_s, E2, g1_s, g1, f12_s, f12, lambda_s, lambda, J_s, J;

//    QFile file("debug.txt");
//    if(file.open(QIODevice::ReadWrite | QIODevice::Text))
//    {
//        QTextStream out(&file);

//        cout << QString("Введите параметры: ").toLocal8Bit().data()<<endl;

//        cout << QString("Е2': ").toLocal8Bit().data();
//        cin >> E2_s;
//        cout << endl;
//        out << QString("Е2': %1\n").arg(E2_s).toLocal8Bit().data();

//        cout << QString("g1': ").toLocal8Bit().data();
//        cin >> g1_s;
//        cout << endl;
//        out << QString("g1': %1\n").arg(g1_s).toLocal8Bit().data();

//        cout << QString("f12': ").toLocal8Bit().data();
//        cin >> f12_s;
//        cout << endl;
//        out << QString("f12': %1\n").arg(f12_s).toLocal8Bit().data();

//        cout << QString("lambda': ").toLocal8Bit().data();
//        cin >> lambda_s;
//        cout << endl;
//        out << QString("lambda': %1\n").arg(lambda_s).toLocal8Bit().data();

//        cout << QString("J': ").toLocal8Bit().data();
//        cin >> J_s;
//        cout << endl;
//        out << QString("J': %1\n").arg(J_s).toLocal8Bit().data();

//        cout << QString("Е2: ").toLocal8Bit().data();
//        cin >> E2;
//        cout << endl;
//        out << QString("E2: %1\n").arg(E2).toLocal8Bit().data();

//        cout << QString("g1: ").toLocal8Bit().data();
//        cin >> g1;
//        cout << endl;
//        out << QString("g1: %1\n").arg(g1).toLocal8Bit().data();

//        cout << QString("f12: ").toLocal8Bit().data();
//        cin >> f12;
//        cout << endl;
//        out << QString("f12: %1\n").arg(f12).toLocal8Bit().data();

//        cout << QString("lambda: ").toLocal8Bit().data();
//        cin >> lambda;
//        cout << endl;
//        out << QString("lambda: %1\n").arg(lambda).toLocal8Bit().data();

//        cout << QString("J: ").toLocal8Bit().data();
//        cin >> J;
//        cout << endl;
//        out << QString("J: %1\n").arg(f12_s).toLocal8Bit().data();

//        qreal T;
//        qreal param1, param2;
//        param2 = qLn(J*qPow(lambda,3)*g1_s*f12_s);
//        param1 = qLn(J_s*qPow(lambda_s,3)*g1*f12);
//        T = (E2_s - E2)/(param2-param1);
//        cout << QString("%1").arg(T).toLocal8Bit().data();
//        out << QString("param2: %1\n").arg(param2).toLocal8Bit().data();
//        out << QString("param1: %1\n").arg(param1).toLocal8Bit().data();
//        out << QString("T: %1\n").arg(T).toLocal8Bit().data();

//        file.close();
//    }

    return app.exec();
}
