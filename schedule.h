#ifndef SCHEDULE_H
#define SCHEDULE_H

#include <QObject>
#include <QAbstractListModel>
#include <QDate>
#include "connector.h"

class ScheduleModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ScheduleRoles { Date = Qt::UserRole };
    QHash<int, QByteArray> roleNames() const override;
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    void onNewDataAvailable(QString date);

    ScheduleModel(const Connector& connector, QObject* parent = nullptr);
    Q_INVOKABLE void updateDate(const QString &date);
    Q_INVOKABLE bool containsDate(const QString &date);

    QList<QDate> m_dates;
    const Connector& m_connector;
};

#endif // SCHEDULE_H
