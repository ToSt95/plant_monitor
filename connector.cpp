#include "connector.h"
#include <QTcpSocket>

Connector::Connector(QObject* parent)
    :QObject(parent), m_socket(new QTcpSocket)
{
connect(m_socket, &QAbstractSocket::stateChanged, this, &Connector::onConnectionStatusChanged);
}

bool Connector::isConnected()
{
    return m_isConnected;
}

void Connector::connectToServer()
{
    m_socket->connectToHost("192.168.0.136",9999);
}

void Connector::onConnectionStatusChanged(QAbstractSocket::SocketState socketState)
{
    qDebug() << "@@@@@@@@@@@@@@@@@@@@@@@@@@@" << socketState;

    if (socketState == QAbstractSocket::ConnectingState) {
        m_isConnected = true;
        qDebug() << "!!!!!!!!!!!!!!!!!!!!!CONNECTED TO THE SERVER";
    } else {
        m_isConnected = false;

    }

    emit connectionStatusChanged();

}
