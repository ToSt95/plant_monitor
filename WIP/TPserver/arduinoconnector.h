#ifndef ARDUINOCONNECTOR_H
#define ARDUINOCONNECTOR_H

#include <QObject>

class QTcpSocket;

class ArduinoConnector : public QObject
{
    Q_OBJECT
public:
    explicit ArduinoConnector(QObject *parent = nullptr);
    void sendMessage(const QByteArray& message);
    void onResponseReady();

signals:
    void arduinoDataReady(QString result);

public slots:

private:
    QTcpSocket* m_socket;
};

#endif // ARDUINOCONNECTOR_H
