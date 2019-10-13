#include "dbmanager.h"
#include <QSqlDatabase>

DbManager::DbManager(QObject *parent) : QObject(parent)
{

}

void DbManager::createConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
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
