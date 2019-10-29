#include "connector.h"
#include <QTcpSocket>
#include <QTimer>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonDocument>

Connector::Connector(QObject* parent)
    :QObject(parent), m_socket(new QTcpSocket)
{
    connect(m_socket, &QAbstractSocket::stateChanged, this, &Connector::onConnectionStatusChanged);
    connect(m_socket, &QAbstractSocket::readyRead, this, &Connector::onReadyRead);
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
    }
    emit connectionStatusChanged();
}

void Connector::onReadyRead()
{
    const QByteArray &data = m_socket->readAll();
    auto jason = QJsonDocument::fromBinaryData(data);
    auto object = jason.object();
    int command = object.value("command").toInt();

    if (command == 1) {
        emit ledON();
    } else if (command == 2) {
        emit ledOFF();
    } else if (command == 3) {
        QString temp = object.value("temperature").toString();
        QString hum = object.value("humidity").toString();
        emit tempResponse(temp, hum);
    } else if (command == 5) {
        bool loginSucceed = object.value("loginResult").toBool();
        emit loginResponse(loginSucceed);
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
