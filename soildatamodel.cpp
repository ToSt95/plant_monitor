#include "soildatamodel.h"

namespace
{
const QHash<int, QByteArray> ROLE_NAMES = {
    {SoilDataModel::Humidity, QByteArrayLiteral("humidity")},
    {SoilDataModel::Date, QByteArrayLiteral("date")}
};
}

SoilDataModel::SoilDataModel(const Connector& connector, QObject* parent)
    :QAbstractListModel(parent)
{
    connect(&connector, &Connector::newSoilData, this, &SoilDataModel::onNewDataAvailable);
    connect(&connector, &Connector::soilResponse, this, &SoilDataModel::addData);
}

int SoilDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_items.count();
}

QVariant SoilDataModel::data(const QModelIndex &index, int role) const
{
    const int idx = index.row();

    if (idx < 0 || idx >= rowCount()) {
        return QVariant();
    }

    switch (role)
    {
    case Humidity:
        return QVariant::fromValue(m_items.at(idx).humidity);

    case Date:
        return QVariant::fromValue(m_items.at(idx).date);
    }

    return QVariant();
}

QHash<int, QByteArray> SoilDataModel::roleNames() const
{
    return ROLE_NAMES;
}

void SoilDataModel::load(const QList<SoilItem> &data)
{
    m_items.append(data);
}

void SoilDataModel::addData(QString hum, QString date, QString time)
{
    qDebug () << "[soil model] new record" << rowCount() << ":" << hum << date << time;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items.append({hum, date, time});
    endInsertRows();
    emit newDataAvailable();
}

void SoilDataModel::onNewDataAvailable(QString hum, QString date, QString time)
{
    qDebug () << "[soil model] record" << rowCount() << ":" << hum << date << time;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items.append({hum, date, time});
    endInsertRows();
    emit newDataAvailable();
}

QString SoilDataModel::getNewestHumidity()
{
    if(!rowCount()) return "";
    return m_items.last().humidity;
}

QString SoilDataModel::getNewestDate()
{
    if(!rowCount()) return "";
    return m_items.last().date;
}

QString SoilDataModel::getNewestTime()
{
    if(!rowCount()) return "";
    return m_items.last().timed;
}
