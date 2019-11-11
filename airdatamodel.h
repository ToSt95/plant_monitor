#ifndef AIRDATAMODEL_H
#define AIRDATAMODEL_H

#include <QObject>
#include <QDate>
#include <QAbstractListModel>
#include "connector.h"

struct AirItem;

class AirDataModel : public QAbstractListModel
{
    Q_OBJECT
public:
    AirDataModel(const Connector& connector, QObject* parent = nullptr);

    enum AirRoles { Temperature = Qt::UserRole,  Humidity, Date};
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    void load(const QList<AirItem>& data);
    void addData(QString temp, QString hum, QString date, QString time);

    void onNewDataAvailable(QString temp, QString hum, QString date, QString time);

    Q_INVOKABLE QString getNewestTemperature();
    Q_INVOKABLE QString getNewestHumidity();
    Q_INVOKABLE QString getNewestDate();
    Q_INVOKABLE QString getNewestTime();


signals:
    void newDataAvailable();

private:
    QList<AirItem> m_items;
};

struct AirItem {
    AirItem(QString temp, QString hum, QString dates, QString time)
    {
        temperature = temp;
        humidity = hum;
        date = dates;
        timed = time;
    }
    QString temperature;
    QString humidity;
    QString date;
    QString timed;
};

#endif // AIRDATAMODEL_H
