#include "schedule.h"
#include <QDebug>
namespace
{
const QHash<int, QByteArray> ROLE_NAMES = {
    {ScheduleModel::Date, QByteArrayLiteral("dateValue")}
};
}

QHash<int, QByteArray> ScheduleModel::roleNames() const
{
    return ROLE_NAMES;
}

int ScheduleModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_dates.count();
}

QVariant ScheduleModel::data(const QModelIndex &index, int role) const
{
    const int idx = index.row();

    if (idx < 0 || idx >= rowCount()) {
        return QVariant();
    }

    switch (role)
    {
    case Date:
        return QVariant::fromValue(m_dates.at(idx));
    }
    return QVariant();
}

void ScheduleModel::onNewDataAvailable(QString date)
{
    qDebug() << "SCHEDULE DATE" << date;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_dates.append( QDate::fromString(date, "ddd MMM d yyyy"));
    endInsertRows();
}

ScheduleModel::ScheduleModel(const Connector& connector, QObject* parent)
    : QAbstractListModel(parent),  m_connector(connector)
{
    connect(&connector, &Connector::newScheduleData, this, &ScheduleModel::onNewDataAvailable);
}

void ScheduleModel::updateDate(const QString &date)
{
    // formatowanie daty
    QDate dateType = QDate::fromString(date, "ddd MMM d yyyy");
    // jeśli data istioeje w modelu - usuń
    if (m_dates.contains(dateType)) {
        // wyznaczanie indeksu danych w modelu
        int idx = m_dates.indexOf(dateType);
        beginRemoveRows(QModelIndex(), idx, idx);
        // usuwanie danych
        m_dates.removeAt(idx);
        endRemoveRows();
        // wyślij request z updatem danych
        m_connector.updateSchedule(date, true);
    } else {
        // jeśli data nie istioeje w modelu - dodaj
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_dates.append(dateType);
        endInsertRows();
        // wyślij request z updatem danych
        m_connector.updateSchedule(date, false);
    }
}

bool ScheduleModel::containsDate(const QString &date)
{
    QDate dateType = QDate::fromString(date, "ddd MMM d yyyy");

    if (m_dates.contains(dateType)) {
        return true;
    }

    return false;
}
