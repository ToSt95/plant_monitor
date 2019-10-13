#include "client.h"

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
    m_descriptor = socketDescriptor;
    moveToThread(&m_clientThread);
    m_clientThread.start();
    connect(m_socket, &QTcpSocket::disconnected, [this](){
                emit clientDisconnected(m_descriptor);
    });
    connect(m_socket, &QTcpSocket::readyRead, [this](){
        QByteArray data = m_socket->readAll();
        m_socket->flush();
        qDebug() << "Data from user" << m_descriptor << ": " << data;
        emit newDataReady(data);
    });
}

void Client::closeClient()
{
    m_clientThread.quit();
    m_clientThread.wait(3000);
}

