#ifndef SOILDATAMODEL_H
#define SOILDATAMODEL_H

#include <QObject>
#include <QDate>
#include <QAbstractListModel>
#include "connector.h"

struct SoilItem;

class SoilDataModel : public QAbstractListModel
{
    Q_OBJECT
public:
    SoilDataModel(const Connector& connector, QObject* parent = nullptr);
    enum SoilRoles { Humidity = Qt::UserRole, Date};
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    void load(const QList<SoilItem>& data);
    void addData(QString hum, QString date, QString time);

    void onNewDataAvailable(QString hum, QString date, QString time);

    Q_INVOKABLE QString getNewestHumidity();
    Q_INVOKABLE QString getNewestDate();
    Q_INVOKABLE QString getNewestTime();
signals:
    void newDataAvailable();

private:
    QList<SoilItem> m_items;
};

struct SoilItem {
    SoilItem(QString hum, QString dates, QString time)
    {
        humidity = hum;
        date = dates;
        timed = time;
    }
    QString humidity;
    QString date;
    QString timed;
};

#endif // SOILDATAMODEL_H
