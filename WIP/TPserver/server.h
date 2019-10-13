#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QMap>
#include <QTcpServer>
#include "dbmanager.h"

class Client;

class Server : public QTcpServer
{
    Q_OBJECT
public:
    explicit Server();
    bool start();
    bool stop();
    void initConnection();
    void registerTypes();

public slots:
    void onClientDisconnected(qintptr descriptor);

protected:
    void incomingConnection(qintptr handle);

private:
    QMap<qintptr, Client*> m_clients;
    DbManager m_dbManager;
};

#endif // SERVER_H
