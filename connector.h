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
    void onReadyRead();

    Q_INVOKABLE void loginRequest(const QString& email, const QString& password);
    Q_INVOKABLE void ledRequest(bool ledState);

signals:
    void connectionStatusChanged();

    void loginResponse(int response);
    void tempResponse(QString temp, QString hum);
    void ledON();
    void ledOFF();

private:
    QTcpSocket *m_socket;
    bool m_isConnected{false};
};

#endif // CONNECTOR_H
