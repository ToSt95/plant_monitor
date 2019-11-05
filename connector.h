#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QString>
#include <QObject>
#include <QAbstractSocket>

class QTcpSocket;
class QTimer;

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
    QTimer* m_timer;
    QTimer* m_timer2;
    QTimer* m_timer3;

    Q_INVOKABLE void loginRequest(const QString& email, const QString& password);
    Q_INVOKABLE void ledRequest(bool ledState);
    Q_INVOKABLE void tempRequest();
    Q_INVOKABLE void soilRequest();
    Q_INVOKABLE void lightRequest();

signals:
    void connectionStatusChanged();

    void loginResponse(int response);
    void tempResponse(QString temp, QString hum, QString date, QString time);
    void soilResponse(QString soil, QString date, QString time);
    void lightResponse(QString light, QString date, QString time);
    void ledON();
    void ledOFF();

private:
    QTcpSocket *m_socket;
    bool m_isConnected{false};
};

#endif // CONNECTOR_H
