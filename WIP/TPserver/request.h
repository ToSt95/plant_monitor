#ifndef REQUEST_H
#define REQUEST_H

#include <QByteArray>
#include <QJsonDocument>


class Request
{
public:
    Request(const QByteArray& data);
    enum Command { AirHumidity = 1, AirTemperature, LightIntensity, SoilMoisture, Login};
    QJsonDocument json();
    QByteArray binary();
    Request::Command command();
    QString email();
    QString password();

private:
    QByteArray m_rawData;
    QJsonDocument m_jsonData;
};

#endif // REQUEST_H
