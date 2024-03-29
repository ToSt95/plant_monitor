#include "settings.h"

Settings::Settings(const Connector& connector, QObject *parent) : QObject(parent)
{
    connect(&connector, &Connector::settingsValueChanged, [this](const QString& minTemp, const QString& maxTemp, const QString& minWA, const QString& maxWA,
            const QString& minWS,const QString& maxWS, const QString& minL, const QString& maxL,
            const QString& email, const QString& hour, const QString& time) {
        setMinTemp(minTemp);
        setMaxTemp(maxTemp);
        setMinWA(minWA);
        setMaxWA(maxWA);
        setMinWS(minWS);
        setMaxWS(maxWS);
        setMaxL(maxL);
        setMinL(minL);
        setEmail(email);
        setHour(hour);
        setWateringTime(time);

    });

}

QString Settings::getMinTemp() const
{
    return m_minTemp;
}

void Settings::setMinTemp(const QString &minTemp)
{
    m_minTemp = minTemp;
    emit minTempChanged();
}

QString Settings::getMaxTemp() const
{
    return m_maxTemp;
}

void Settings::setMaxTemp(const QString &maxTemp)
{
    m_maxTemp = maxTemp;
    emit maxTempChanged();
}

QString Settings::getMinWA() const
{
    return m_minWA;
}

void Settings::setMinWA(const QString &minWA)
{
    m_minWA = minWA;
    emit minWAChanged();
}

QString Settings::getMaxWA() const
{
    return m_maxWA;
}

void Settings::setMaxWA(const QString &maxWA)
{
    m_maxWA = maxWA;
    emit maxWAChanged();
}

QString Settings::getMinWS() const
{
    return m_minWS;
}

void Settings::setMinWS(const QString &minWS)
{
    m_minWS = minWS;
    emit minWSChanged();
}

QString Settings::getMaxWS() const
{
    return m_maxWS;
}

void Settings::setMaxWS(const QString &maxWS)
{
    m_maxWS = maxWS;
    emit maxWSChanged();
}

QString Settings::getMinL() const
{
    return m_minL;
}

void Settings::setMinL(const QString &minL)
{
    m_minL = minL;
    emit minLChanged();
}

QString Settings::getMaxL() const
{
    return m_maxL;
}

void Settings::setMaxL(const QString &maxL)
{
    m_maxL = maxL;
    emit maxLChanged();
}

QString Settings::getEmail() const
{
    return m_email;
}

void Settings::setEmail(const QString &email)
{
    m_email = email;
    emit emailChanged();
}

QString Settings::getHour() const
{
    return m_hour;
}

void Settings::setHour(const QString &hour)
{
    m_hour = hour;
    emit hourChanged();
}

QString Settings::getWateringTime() const
{
    return m_wateringTime;
}

void Settings::setWateringTime(const QString &wateringTime)
{
    m_wateringTime = wateringTime;
    emit timeChanged();
}
