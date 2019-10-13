#ifndef CLIENT_H
#define CLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QThread>
#include <QDataStream>

class Client : public QObject
{
    Q_OBJECT
public:
    explicit Client(QObject *parent = nullptr);
    QTcpSocket* socket();
    void startClient(qintptr socketDescriptor);
    void closeClient();
    void onResponeReady(const QByteArray& data);

signals:
    void clientDisconnected(qintptr descriptor);
    void newDataReady(QByteArray data);

private:
    QThread m_clientThread;
    QTcpSocket* m_socket;
    qintptr m_descriptor{-1};
    QDataStream m_readStream;
};

#endif // CLIENT_H
