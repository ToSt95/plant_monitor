#include "server.h"
#include <QTcpServer>
#include "client.h"

Server::Server()
{
}

bool Server::start()
{
    if(!listen(QHostAddress::Any, 9999)) {
        qCritical("Server could not start");
        return false;
    }
    qInfo("Server started!");
    return true;
}

bool Server::stop()
{
    close();
}

void Server::initConnection()
{
    m_dbManager.createConnection();
}

void Server::onClientDisconnected(qintptr descriptor)
{
    auto client = m_clients.take(descriptor);
    client->closeClient();
    client->deleteLater();
    qInfo("Client %lld disconnected from the server.", static_cast<long long int>(descriptor));
}

void Server::incomingConnection(qintptr handle)
{
    qInfo("New connection...");
    Client* client = new Client;
    connect(client, &Client::clientDisconnected, this, &Server::onClientDisconnected);
    m_clients.insert(handle, client);
    client->startClient(handle);
    qInfo("Client %lld connected from the server.", static_cast<long long int>(handle));
}


void Server::registerTypes()
{
    qRegisterMetaType<qintptr>("qintptr");
}
