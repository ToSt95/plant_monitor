#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QMap>
#include <QTcpServer>
#include "dbmanager.h"
#include "mailmanager.h"
#include "arduinoconnector.h"
#include <QTimer>

class Client;

class Server : public QTcpServer
{
    Q_OBJECT
public:
    Server();
    bool start();
    void stop();
    void initConnection();
    void registerTypes();
signals:
    void responseReady(const QByteArray& response);

public slots:
    void onClientDisconnected(qintptr descriptor);
    void onNewRequest(const QByteArray& data);
    void onArduinoDataReady(QString temp);

protected:
    void incomingConnection(qintptr handle);

private:
    void setEmailConfig();
    void checkIfWateringPlaned();
    Email::Message createMessage(QByteArray message);

    QMap<qintptr, Client*> m_clients;
    DbManager m_dbManager;
    Email::EmailConfig m_mailConfig;
    Email::Sender* mailSender;
    ArduinoConnector m_arduino;
    QTimer* m_timer;
    QTimer* m_mainTimer;

    // jedna godzina przeliczona na sekundy
    const int hourInSec{3600};
    QString m_wateringTime; // should not be here
};

#endif // SERVER_H
