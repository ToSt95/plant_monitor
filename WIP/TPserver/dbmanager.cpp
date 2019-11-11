#include "dbmanager.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>
#include <QDateTime>
DbManager::DbManager(QObject *parent) : QObject(parent)
{

}

void DbManager::createConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName(m_config.addres);
    db.setDatabaseName(m_config.databaseName);
    db.setUserName(m_config.user);
    db.setPassword(m_config.password);

    if (db.open()) {
        qInfo("Connected with %s database with IP: %s"
              , static_cast<const char*>(m_config.databaseName)
              , static_cast<const char*>(m_config.addres));
    } else {
        qCritical("Cannot initcialize connection to database!");
    }
}

void DbManager::closeConnection()
{
    auto db = QSqlDatabase::database(m_config.databaseName);
    if(db.isOpen()) {
        db.close();
    }
}

QStringList DbManager::getAllMeasurements()
{
    QSqlQuery query;
    QStringList result{};
    query.prepare("SELECT air_humidity, date FROM measurements");
    query.exec();
    while(query.next()) {
        result.append(query.value(0).toString());
    }

    return  result;
}

QVector<QStringList> DbManager::getAirHumidity()
{
    QSqlQuery query;
    QVector<QStringList> result{};
    query.prepare("SELECT humidity, date FROM air_measurement");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        measurement.append(query.value(0).toString());
        measurement.append(query.value(1).toString());
        result.append(measurement);
    }
    return result;
}

QVector<QStringList> DbManager::getAirTemperature()
{
    QSqlQuery query;
    QVector<QStringList> result{};
    query.prepare("SELECT temperature, date FROM air_measurement");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        measurement.append(query.value(0).toString());
        measurement.append(query.value(1).toString());
        result.append(measurement);
    }
    return result;
}

QVector<QStringList> DbManager::getLightIntensity()
{
    QSqlQuery query;
    QVector<QStringList> result{};
    query.prepare("SELECT intensity, date FROM light_measurement");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        measurement.append(query.value(0).toString());
        measurement.append(query.value(1).toString());
        result.append(measurement);
    }
    return result;
}

QVector<QStringList> DbManager::getSoilMoisture()
{
    QSqlQuery query;
    QVector<QStringList> result{};
    query.prepare("SELECT moisture, date FROM soil_measurement");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        measurement.append(query.value(0).toString());
        measurement.append(query.value(1).toString());
        result.append(measurement);
    }
    return result;
}

QVector<QStringList> DbManager::getUserData(const QString& email, const QString& password)
{
    QSqlQuery query;
    QVector<QStringList> result{};
    query.prepare("SELECT * FROM user WHERE password='"+password+"' AND email='"+email+"'");

    query.exec();
    qDebug() << query.lastQuery();

    while(query.next()) {
       result.append({query.value(0).toString()});
    }
    return result;
}

void DbManager::saveHumAirTemperature(QString temperature, QString humidity)
{
    QSqlQuery query;
    // format 2019-02-03 12:00:00
    QString stringTime = QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss");
    query.prepare("INSERT INTO tp_database.air_measurement(humidity, temperature, date) VALUES ("
                  + temperature + "," + humidity + ",'" + stringTime + "');");
    query.exec();
}

QVector<QStringList> DbManager::getAirMesurment()
{
    QSqlQuery query;
    QVector<QStringList> result{};
    query.prepare("SELECT temperature, humidity, date FROM air_measurement order by date desc limit 1");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        // temperature
        measurement.append(query.value(0).toString());
        // humidity
        measurement.append(query.value(1).toString());
        // date time
        measurement.append(query.value(2).toString());
        result.append(measurement);
    }
    return result;
}

QVector<QStringList> DbManager::getSoilMesurment()
{
    QSqlQuery query;
    QVector<QStringList> result{};
    query.prepare("SELECT moisture, date FROM soil_measurement order by date desc limit 1");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        // moisture
        measurement.append(query.value(0).toString());
        // date time
        measurement.append(query.value(1).toString());
        result.append(measurement);
    }
    return result;
}

QVector<QStringList> DbManager::getLightMesurment()
{
    QSqlQuery query;
    QVector<QStringList> result{};
    query.prepare("SELECT intensity, datetime FROM light_measurement order by datetime desc limit 1");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        // intensity
        measurement.append(query.value(0).toString());
        // date time
        measurement.append(query.value(1).toString());
        result.append(measurement);
    }
    return result;
}

QList<QStringList> DbManager::initAirData()
{
    QSqlQuery query;
    QList<QStringList> result{};
    query.prepare("SELECT temperature, humidity, date FROM air_measurement order by date limit 500");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        // temperature
        measurement.append(query.value(0).toString());
        // humidity
        measurement.append(query.value(1).toString());
        // date time
        measurement.append(query.value(2).toString());
        result.append(measurement);
    }
    return result;
}

QList<QString> DbManager::initScheduleData()
{
    QSqlQuery query;
    QList<QString> result{};
    query.prepare("SELECT date FROM watering_schedule order by date");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        // date
        measurement.append(query.value(0).toString());
        result.append(measurement);
    }
    return result;
}

QList<QStringList> DbManager::initSoilData()
{
    QSqlQuery query;
    QList<QStringList> result{};
    query.prepare("SELECT moisture, date FROM soil_measurement order by date");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        // moisture
        measurement.append(query.value(0).toString());
        // date time
        measurement.append(query.value(1).toString());
        result.append(measurement);
    }
    return result;
}

QList<QStringList> DbManager::initLightData()
{
    QSqlQuery query;
    QList<QStringList> result{};
    query.prepare("SELECT intensity, datetime FROM light_measurement order by datetime");
    query.exec();
    while(query.next()) {
        QStringList measurement;
        // intensity
        measurement.append(query.value(0).toString());
        // date time
        measurement.append(query.value(1).toString());
        result.append(measurement);
    }
    return result;
}

void DbManager::updateSchedule(const QString &date, bool remove)
{
    QSqlQuery query;

    if (remove) {
        query.prepare("DELETE FROM tp_database.watering_schedule WHERE date='" + date + "';");
    } else {
        query.prepare("INSERT INTO tp_database.watering_schedule(date) VALUES ('" + date + "');");
    }
    query.exec();
    qDebug() << "QUERY:" << query.lastQuery();
}
