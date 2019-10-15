#include "server.h"
#include <QTcpServer>
#include "client.h"
#include "request.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>

Server::Server()
{

}

bool Server::start()
{
    if(!listen(QHostAddress::Any, 9999)) {
        qCritical("Server could not start");
        return false;
    }
    qInfo("Server started!");

    m_mailConfig.host = "smtp.gmail.com";
    m_mailConfig.port = 465;
    m_mailConfig.timeout = 10000;

    // setting up config values
    m_mailConfig.user = "team.project.arduino@gmail.com";
    m_mailConfig.password = "!@#123qweasdzxc";

    // creating sender object
    mailSender = new Email::Sender(&m_mailConfig,this);
    connect(mailSender, &Email::Sender::finished, [this](int value){
        qDebug() << "EMAIL RESPONSE CODE:" << mailSender->exitCodeDescription(value);
    });
    // creating message and sending
    Email::Message message;
    message.recipient = "team.project.arduino@gmail.com";
    message.subject = "Server has been started";
    message.body = "Server is now running";
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

    if(static_cast<int>(command) < 1 || static_cast<int>(command) > 4) {
        responseJsonObject.insert("error", "invalid command");
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
    case Request::LightIntensity: {
        QVector<QStringList> dbResult = m_dbManager.getAirHumidity();
        int counter = 1;
        for (auto measurement : dbResult) {
            responseJsonObject.insert(QString::number(counter) + ". Light intensity:", measurement.at(0));
            responseJsonObject.insert(QString::number(counter) + ". Date:", measurement.at(1));
            counter++;
        }

        break;
    }
    case Request::SoilMoisture: {
        QVector<QStringList> dbResult = m_dbManager.getAirHumidity();
        int counter = 1;
        for (auto measurement : dbResult) {
            responseJsonObject.insert(QString::number(counter) + ". Soil moisture:", measurement.at(0));
            responseJsonObject.insert(QString::number(counter) + ". Date:", measurement.at(1));
            counter++;
        }

        break;
    }
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


void Server::registerTypes()
{
    qRegisterMetaType<qintptr>("qintptr");
    qRegisterMetaType<QByteArray>("QByteArray");
}
