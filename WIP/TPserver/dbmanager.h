#ifndef DBMANAGER_H
#define DBMANAGER_H

#include <QObject>
#include "config.h"

class Config;

class DbManager : public QObject
{
    Q_OBJECT
public:
    explicit DbManager(QObject *parent = nullptr);
    void createConnection();
    void closeConnection();
    QStringList getAllMeasurements();

    QVector<QStringList> getAirHumidity();
    QVector<QStringList> getAirTemperature();
    QVector<QStringList> getLightIntensity();
    QVector<QStringList> getSoilMoisture();
    QVector<QStringList> getUserData(const QString& email, const QString& password);

private:
    Config m_config;
};

#endif // DBMANAGER_H
