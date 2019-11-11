#ifndef LIGHTDATAMODEL_H
#define LIGHTDATAMODEL_H

#include <QObject>
#include <QDate>
#include <QAbstractListModel>
#include "connector.h"

struct LightItem;

class LightDataModel : public QAbstractListModel
{
    Q_OBJECT
public:
    LightDataModel(const Connector& connector, QObject* parent = nullptr);
    enum LightRoles { Lumens = Qt::UserRole, Date};
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;
    void load(const QList<LightItem>& data);
    void addData(QString lumens, QString date, QString time);

    void onNewDataAvailable(QString lumens, QString date, QString time);

    Q_INVOKABLE QString getNewestLumens();
    Q_INVOKABLE QString getNewestDate();
    Q_INVOKABLE QString getNewestTime();
signals:
    void newDataAvailable();

private:
    QList<LightItem> m_items;
};

struct LightItem {
    LightItem(QString lumens, QString dates, QString time)
    {
        lumen = lumens;
        date = dates;
        timed = time;
    }
    QString lumen;
    QString date;
    QString timed;
};

#endif // LIGHTDATAMODEL_H
