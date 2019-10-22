#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QString>
#include <QObject>
#include <QAbstractSocket>

class QTcpSocket;

class Connector : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool isConnected READ isConnected NOTIFY connectionStatusChanged)

public:
    Connector(QObject* parent = nullptr);

    bool isConnected();
    void connectToServer();
    void onConnectionStatusChanged(QAbstractSocket::SocketState socketState);

signals:
    Q_INVOKABLE void connectionStatusChanged();

private:
    QTcpSocket *m_socket;
    bool m_isConnected{false};
};

#endif // CONNECTOR_H
