#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QMap>
#include <QTcpServer>
#include "dbmanager.h"
#include "mailmanager.h"

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

protected:
    void incomingConnection(qintptr handle);

private:
    void setEmailConfig();
    Email::Message createMessage();

    QMap<qintptr, Client*> m_clients;
    DbManager m_dbManager;
    Email::EmailConfig m_mailConfig;
    Email::Sender* mailSender;
};

#endif // SERVER_H
