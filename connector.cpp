#include "connector.h"
#include <QTcpSocket>
#include <QTimer>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonDocument>
#include <QTimer>
#include <QJsonArray>

Connector::Connector(QObject* parent)
    :QObject(parent), m_socket(new QTcpSocket)
{
    connect(m_socket, &QAbstractSocket::stateChanged, this, &Connector::onConnectionStatusChanged);
    connect(m_socket, &QAbstractSocket::readyRead, this, &Connector::onReadyRead);

    m_timer = new QTimer;
    m_timer2 = new QTimer;
    m_timer3 = new QTimer;

    connect(m_timer, &QTimer::timeout, [this](){
       tempRequest();

       qDebug() << "REQUEST SEND";
    });

    connect(m_timer2, &QTimer::timeout, [this](){
        soilRequest();
       qDebug() << "REQUEST SEND";
    });
    connect(m_timer3, &QTimer::timeout, [this](){
        lightRequest();
    });


}

bool Connector::isConnected()
{
    return m_isConnected;
}

void Connector::connectToServer()
{
    if (!m_isConnected) {
        m_socket->connectToHost("192.168.0.136",9999);
    }
}

void Connector::onConnectionStatusChanged(QAbstractSocket::SocketState socketState)
{
    qInfo() << "Socket state:" << socketState;
    if (socketState != QAbstractSocket::ConnectedState) {
        m_isConnected = false;
        QTimer::singleShot(5000, this, &Connector::connectToServer);
    } else {
        m_isConnected = true;
        if (!modelLoaded) {
            initScheduleData();
            initAirData();
            initSoilData();
            initLightData();

            modelLoaded = true;
        }
    }
    emit connectionStatusChanged();
}

void Connector::onReadyRead()
{
    const QByteArray &data = m_socket->readAll();
    auto jason = QJsonDocument::fromBinaryData(data);
    auto object = jason.object();
    int command = object.value("command").toInt();
    qDebug() << "NEW RESPONSE" << command;
    if (command == 1) {
        emit ledON();
    } else if (command == 2) {
        emit ledOFF();
    } else if (command == 5) {
        bool loginSucceed = object.value("loginResult").toBool();
        emit loginResponse(loginSucceed);
    } else if (command == 7) {
        QString temp = object.value("temperature").toString();
        QString hum = object.value("humidity").toString();
        QString date = object.value("date").toString();
        QString time = object.value("time").toString();
        emit tempResponse(temp, hum, date, time);
    } else if (command == 4) {
        QString soil = object.value("moisture").toString();
        QString date = object.value("date").toString();
        QString time = object.value("time").toString();

        emit soilResponse(soil, date, time);
    } else if (command == 3) {
        QString light = object.value("intensity").toString();
        QString date = object.value("date").toString();
        QString time = object.value("time").toString();
        emit lightResponse(light, date, time);
    } else if (command == 8) {
        auto array = object.value("data").toArray();

        for (auto obj : array) {
            QString temp = obj.toObject().value("temperature").toString();
            QString hum = obj.toObject().value("humidity").toString();
            QString date = obj.toObject().value("date").toString();
            QString time = obj.toObject().value("time").toString();
            emit newAirData(temp, hum, date, time);
        }
    } else if (command == 10) {
        auto array = object.value("data").toArray();

        for (auto obj : array) {
            QString hum = obj.toObject().value("humidity").toString();
            QString date = obj.toObject().value("date").toString();
            QString time = obj.toObject().value("time").toString();
            emit newSoilData(hum, date, time);
        }
    } else if (command == 11) {
        auto array = object.value("data").toArray();

        for (auto obj : array) {
            QString light = obj.toObject().value("light").toString();
            QString date = obj.toObject().value("date").toString();
            QString time = obj.toObject().value("time").toString();
            emit newLightData(light, date, time);
        }
    }else if (command == 9) {
        auto array = object.value("data").toArray();

        for (auto obj : array) {
            QString date = obj.toObject().value("date").toString();
            emit newScheduleData(date);
        }
    }
}

void Connector::loginRequest(const QString& email, const QString& password)
{
    QJsonObject object;
    QJsonValue idRequest = 5;
    object.insert("command", idRequest);
    QJsonValue emailRequest = email;
    object.insert("email", emailRequest);
    QJsonValue passwordRequest = password;
    object.insert("password", passwordRequest);

    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::ledRequest(bool ledState)
{
    QJsonObject object;
    QJsonValue idRequest = 6;
    object.insert("command", idRequest);
    object.insert("state", ledState);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::tempRequest()
{
    QJsonObject object;
    QJsonValue idRequest = 7;
    object.insert("command", idRequest);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::soilRequest()
{
    QJsonObject object;
    QJsonValue idRequest = 4;
    object.insert("command", idRequest);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::lightRequest()
{
    QJsonObject object;
    QJsonValue idRequest = 3;
    object.insert("command", idRequest);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::initAirData()
{
    qDebug() << "REQUEST SENT";
    QJsonObject object;
    QJsonValue idRequest = 8;
    object.insert("command", idRequest);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::initSoilData()
{
    QJsonObject object;
    QJsonValue idRequest = 10;
    object.insert("command", idRequest);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::initLightData()
{
    QJsonObject object;
    QJsonValue idRequest = 11;
    object.insert("command", idRequest);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::initScheduleData()
{
    QJsonObject object;
    QJsonValue idRequest = 9;
    object.insert("command", idRequest);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void Connector::updateSchedule(const QString &date, bool remove) const
{
    QJsonObject object;
    QJsonValue idRequest = 12;
    object.insert("command", idRequest);
    object.insert("date", date);
    object.insert("remove", remove);
    auto doc = QJsonDocument(object);
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}
