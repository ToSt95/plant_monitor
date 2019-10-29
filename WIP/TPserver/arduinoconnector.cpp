#include "arduinoconnector.h"
#include <QTcpSocket>
#include <QString>

ArduinoConnector::ArduinoConnector(QObject *parent)
    : QObject(parent), m_socket(new QTcpSocket)
{
    connect(m_socket, &QAbstractSocket::readyRead, this, &ArduinoConnector::onResponseReady);
}

void ArduinoConnector::sendMessage(const QByteArray &message)
{
    if(m_socket->state() != QAbstractSocket::ConnectedState) {
        m_socket->connectToHost("192.168.0.45",80);
    }

      if (m_socket->waitForConnected(1000)) {
          qDebug() << "Writing message:" << message;
          m_socket->write(message);
          m_socket->flush();
      } else {
          qDebug() << "Cannot connect to device!";
      }
}

void ArduinoConnector::onResponseReady()
{
    auto data =  m_socket->readAll();
    QString s_data = QString::fromStdString(data.toStdString());
    emit arduinoDataReady(s_data);
}
