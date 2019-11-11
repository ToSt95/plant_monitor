#include "server.h"
#include <QTcpServer>
#include "client.h"
#include "request.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QDateTime>
#include <QString>
#include <QJsonArray>

Server::Server()
{
    connect(&m_arduino, &ArduinoConnector::arduinoDataReady, this, &Server::onArduinoDataReady);
    m_timer = new QTimer;

    connect(m_timer, &QTimer::timeout, [this](){
       m_arduino.sendMessage("/AIR_READ");
    });
    m_timer->start(std::chrono::seconds(30));
}

bool Server::start()
{
    if(!listen(QHostAddress::Any, 9999)) {
        qCritical("Server could not start");
        return false;
    }
    qInfo("Server started!");
    setEmailConfig();
    // creating sender object
    mailSender = new Email::Sender(&m_mailConfig,this);
    connect(mailSender, &Email::Sender::finished, [this](int value){
        qDebug() << "EMAIL RESPONSE CODE:" << mailSender->exitCodeDescription(value);
    });
    const auto& message = createMessage();
    mailSender->send(message);
    return true;
}

void Server::stop()
{
    close();
}

void Server::initConnection()
{
    m_dbManager.createConnection();
}

void Server::onClientDisconnected(qintptr descriptor)
{
    auto client = m_clients.take(descriptor);
    client->closeClient();
    client->deleteLater();
    qInfo("Client %lld disconnected from the server.", static_cast<long long int>(descriptor));
}

void Server::onNewRequest(const QByteArray& data)
{
    if(data.isEmpty()) {
        qDebug() << "Empty request.";
        return;
    }

    Request requestFromClient(data);
    Request::Command command = requestFromClient.command();
    QJsonObject responseJsonObject;

    if(static_cast<int>(command) < 1 || static_cast<int>(command) > 13) {
        responseJsonObject.insert("command", -1);
    } else {
        responseJsonObject.insert("command", command);
    }

    switch (command) {
    case Request::AirHumidity: {
        QVector<QStringList> dbResult = m_dbManager.getAirHumidity();
        int counter = 1;
        for (auto measurement : dbResult) {
            responseJsonObject.insert(QString::number(counter) + ". Air humidity:", measurement.at(0));
            responseJsonObject.insert(QString::number(counter) + ". Date:", measurement.at(1));
            counter++;
        }

        break;
    }
    case Request::AirTemperature: {
        QVector<QStringList> dbResult = m_dbManager.getAirHumidity();
        int counter = 1;
        for (auto measurement : dbResult) {
            responseJsonObject.insert(QString::number(counter) + ". Air temperature:", measurement.at(0));
            responseJsonObject.insert(QString::number(counter) + ". Date:", measurement.at(1));
            counter++;
        }

        break;
    }
    case Request::Login: {

            auto dbResult = m_dbManager.getUserData(requestFromClient.email(), requestFromClient.password());
            bool canLogin = !dbResult.isEmpty();
            responseJsonObject.insert("loginResult", canLogin);
            break;
        }


    case Request::Led: {
        if(requestFromClient.leadState()) {
           m_arduino.sendMessage("/LED=ON");
        } else {
           m_arduino.sendMessage("/LED=OFF");
        }
        return;
    }

    case Request::Air: {
        QVector<QStringList> dbResult = m_dbManager.getAirMesurment();
        for (auto measurement : dbResult) {
            responseJsonObject.insert("temperature", measurement.at(0));
            responseJsonObject.insert("humidity", measurement.at(1));
            auto date = measurement.at(2).split('T').first();
            auto time = measurement.at(2).split('T').last();
            qDebug() << date << time;

            time.chop(7);

            responseJsonObject.insert("date", date);
            responseJsonObject.insert("time", time);
        }
        break;
    }
    case Request::LightIntensity: {
        QVector<QStringList> dbResult = m_dbManager.getLightMesurment();
        for (auto measurement : dbResult) {
            responseJsonObject.insert("intensity", measurement.at(0));

            auto date = measurement.at(1).split('T').first();
            auto time = measurement.at(1).split('T').last();
            time.chop(7);
            responseJsonObject.insert("date", date);
            responseJsonObject.insert("time", time);
        }

        break;
    }
    case Request::SoilMoisture: {
        QVector<QStringList> dbResult = m_dbManager.getSoilMesurment();
        for (auto measurement : dbResult) {
            responseJsonObject.insert("moisture", measurement.at(0));

            auto date = measurement.at(1).split('T').first();
            auto time = measurement.at(1).split('T').last();
            time.chop(7);

            responseJsonObject.insert("date", date);
            responseJsonObject.insert("time", time);
        }
        break;
    }

    case Request::InitAir: {
        QList<QStringList> dbResult = m_dbManager.initAirData();
        QJsonArray array;
        for (auto measurement : dbResult) {
            QJsonObject obj;
            obj.insert("temperature", measurement.at(0));
            obj.insert("humidity" , measurement.at(1));
            auto date = measurement.at(2).split('T').first();
            auto time = measurement.at(2).split('T').last();
            time.chop(7);

            obj.insert("date", date);
            obj.insert("time", time);
            array.append(obj);
        }

        responseJsonObject.insert("data", array);
        break;
    }
    case Request::InitSoil: {
        QList<QStringList> dbResult = m_dbManager.initSoilData();
        QJsonArray array;
        for (auto measurement : dbResult) {
            QJsonObject obj;
            obj.insert("humidity" , measurement.at(0));
            auto date = measurement.at(1).split('T').first();
            auto time = measurement.at(1).split('T').last();
            time.chop(7);

            obj.insert("date", date);
            obj.insert("time", time);
            array.append(obj);
        }

        responseJsonObject.insert("data", array);
        break;
    }
    case Request::InitLight: {
        QList<QStringList> dbResult = m_dbManager.initLightData();
        QJsonArray array;
        for (auto measurement : dbResult) {
            QJsonObject obj;
            obj.insert("light" , measurement.at(0));
            auto date = measurement.at(1).split('T').first();
            auto time = measurement.at(1).split('T').last();
            time.chop(7);

            obj.insert("date", date);
            obj.insert("time", time);
            array.append(obj);
        }

        responseJsonObject.insert("data", array);
        break;
    }
    case Request::ScheduleUpdate: {

        bool remove = requestFromClient.removeData();
        QString date = requestFromClient.date();
        m_dbManager.updateSchedule(date, remove);
        break;
    }
    case Request::InitSchedule: {
        QList<QString> dbResult = m_dbManager.initScheduleData();
        QJsonArray array;
        for (auto measurement : dbResult) {
            QJsonObject obj;
            obj.insert("date" , measurement);
            array.append(obj);
        }

        responseJsonObject.insert("data", array);
        break;
    }
    }
    QJsonDocument doc(responseJsonObject);
    qDebug() << doc;
    emit responseReady(doc.toBinaryData());
}

void Server::onArduinoDataReady(QString temp)
{
    QStringList result = temp.split(',');
    QString command = result.first();
    QJsonObject responseJsonObject;

    qDebug() << "FROM ARDUINO" << temp;

    if (command == "1") {
        responseJsonObject.insert("command", 1);
    } else if (command == "2") {
        responseJsonObject.insert("command", 2);
    } else if (command == "3") {
        responseJsonObject.insert("command", 3);
        QString temp = result.at(1);
        QString hum = result.at(2);
        m_dbManager.saveHumAirTemperature(temp, hum);
        //responseJsonObject.insert("temperature", temp);
        //responseJsonObject.insert("humidity", hum);
    }

    QJsonDocument doc(responseJsonObject);
    emit responseReady(doc.toBinaryData());
}

void Server::incomingConnection(qintptr handle)
{
    qInfo("New connection...");
    Client* client = new Client;
    connect(client, &Client::clientDisconnected, this, &Server::onClientDisconnected);
    connect(client, &Client::newDataReady, this, &Server::onNewRequest);
    connect(this, &Server::responseReady, client, &Client::onResponeReady);

    m_clients.insert(handle, client);
    client->startClient(handle);
    qInfo("Client %lld connected from the server.", static_cast<long long int>(handle));
}

void Server::setEmailConfig()
{
    m_mailConfig.host = "smtp.gmail.com";
    m_mailConfig.port = 465;
    m_mailConfig.timeout = 10000;

    // setting up config values
    m_mailConfig.user = "team.project.arduino@gmail.com";
    m_mailConfig.password = "!@#123qweasdzxc";
}

Email::Message Server::createMessage()
{
    // creating message and sending
    Email::Message message;
    message.recipient = "team.project.arduino@gmail.com";
    message.subject = "Server has been started";
    message.body = "Server is now running";
    return message;
}


void Server::registerTypes()
{
    qRegisterMetaType<qintptr>("qintptr");
    qRegisterMetaType<QByteArray>("QByteArray");
}
