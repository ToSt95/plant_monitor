#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include "connector.h"
#include <QQmlContext>
#include <QTimer>

int main(int argc, char *argv[])
{

    Connector serverConnector;
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* ctxt = engine.rootContext();
    ctxt->setContextProperty(QStringLiteral("connector"), &serverConnector);

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);



    serverConnector.connectToServer();
    serverConnector.m_timer->start(std::chrono::seconds(21));
    serverConnector.m_timer2->start(std::chrono::seconds(17));
    serverConnector.m_timer3->start(std::chrono::seconds(7));

    return app.exec();
}
