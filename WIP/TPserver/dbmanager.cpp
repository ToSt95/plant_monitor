#include "dbmanager.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

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
    qDebug() << "RESULT" << result;
    return result;
}
