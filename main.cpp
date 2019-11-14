#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include "connector.h"
#include <QQmlContext>
#include <QTimer>
#include "schedule.h"
#include "airdatamodel.h"
#include "soildatamodel.h"
#include "lightdatamodel.h"
#include "settings.h"

int main(int argc, char *argv[])
{

    Connector serverConnector;
    ScheduleModel wateringModel(serverConnector);
    AirDataModel airModel(serverConnector);
    SoilDataModel soilModel(serverConnector);
    LightDataModel lightModel(serverConnector);
    Settings settings(serverConnector);

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* ctxt = engine.rootContext();

    ctxt->setContextProperty(QStringLiteral("connector"), &serverConnector);
    ctxt->setContextProperty(QStringLiteral("datesModel"), &wateringModel);
    ctxt->setContextProperty(QStringLiteral("airModel"), &airModel);
    ctxt->setContextProperty(QStringLiteral("soilModel"), &soilModel);
    ctxt->setContextProperty(QStringLiteral("lightModel"), &lightModel);
    ctxt->setContextProperty(QStringLiteral("appsettings"), &settings);


    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    serverConnector.connectToServer();
    serverConnector.m_timer->start(std::chrono::seconds(30));
    serverConnector.m_timer2->start(std::chrono::seconds(17));
    serverConnector.m_timer3->start(std::chrono::seconds(7));

    return app.exec();
}
