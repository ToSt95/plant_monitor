#ifndef REQUEST_H
#define REQUEST_H

#include <QByteArray>
#include <QJsonDocument>


class Request
{
public:
    Request(const QByteArray& data);
    enum Command { AirHumidity = 1, AirTemperature, LightIntensity, SoilMoisture, Login, Led, Air, InitAir, InitSchedule
                   , InitSoil, InitLight, ScheduleUpdate, SettingsUpdate, SettingsRead};
    QJsonDocument json();
    QByteArray binary();
    Request::Command command();
    QString email();
    QString password();
    bool leadState();
    QString date();
    bool removeData();
    QJsonObject dataFromClient();

private:
    QByteArray m_rawData;
    QJsonDocument m_jsonData;
};

#endif // REQUEST_H
