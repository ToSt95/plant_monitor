#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include "connector.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{

    Connector serverConnector;
    serverConnector.connectToServer();


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

    return app.exec();
}
