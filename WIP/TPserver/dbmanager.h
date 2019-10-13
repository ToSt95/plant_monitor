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
    QStringList getAllMeasurements();

signals:

public slots:

private:
    Config m_config;
};

#endif // DBMANAGER_H
