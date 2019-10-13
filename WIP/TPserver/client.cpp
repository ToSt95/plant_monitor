#include "client.h"
#include <QString>

Client::Client(QObject *parent)
    : QObject(parent)
{
}

QTcpSocket* Client::socket()
{
    return m_socket;
}

void Client::startClient(qintptr socketDescriptor)
{
    m_socket = new QTcpSocket(this);
    m_socket->setSocketDescriptor(socketDescriptor);
    m_readStream.setDevice(m_socket);
    m_descriptor = socketDescriptor;
    moveToThread(&m_clientThread);
    m_clientThread.start();
    connect(m_socket, &QTcpSocket::disconnected, [this](){
                emit clientDisconnected(m_descriptor);
    });
    connect(m_socket, &QTcpSocket::readyRead, [this](){
        emit newDataReady(m_socket->readAll());
    });
}

void Client::closeClient()
{
    m_clientThread.quit();
    m_clientThread.wait(3000);
}

void Client::onResponeReady(const QByteArray& data)
{
    m_socket->write(data);
}

