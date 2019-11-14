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


    void initAirData();
    void initSoilData();
    void initLightData();
    void initScheduleData();
    void updateSchedule(const QString& date, bool remove = false) const;
    Q_INVOKABLE void saveSettingsValues(const QString& minTemp, const QString& maxTemp, const QString& minWA, const QString& maxWA,
                    const QString& minWS,const QString& maxWS, const QString& minL, const QString& maxL,
                    const QString& email, const QString& hour, const QString& time);
    Q_INVOKABLE void initSettingsValues();

signals:
    void connectionStatusChanged();

    void loginResponse(int response);
    void tempResponse(QString temp, QString hum, QString date, QString time);
    void soilResponse(QString soil, QString date, QString time);
    void lightResponse(QString light, QString date, QString time);
    void ledON();
    void ledOFF();

    void newAirData(QString temp, QString hum, QString date, QString time);
    void newSoilData(QString hum, QString date, QString time);
    void newLightData(QString hum, QString date, QString time);
    void newScheduleData(QString date);
    void settingsValueChanged(const QString& minTemp, const QString& maxTemp, const QString& minWA, const QString& maxWA,
                              const QString& minWS,const QString& maxWS, const QString& minL, const QString& maxL,
                              const QString& email, const QString& hour, const QString& time);

private:
    QTcpSocket *m_socket;
    bool m_isConnected{false};
    bool modelLoaded{false};
};

#endif // CONNECTOR_H
