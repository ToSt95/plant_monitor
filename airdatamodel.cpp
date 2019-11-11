#include "airdatamodel.h"
#include <QDebug>
namespace
{
const QHash<int, QByteArray> ROLE_NAMES = {
    {AirDataModel::Temperature, QByteArrayLiteral("temperature")},
    {AirDataModel::Humidity, QByteArrayLiteral("humidity")},
    {AirDataModel::Date, QByteArrayLiteral("date")}
};
}

AirDataModel::AirDataModel(const Connector& connector, QObject* parent)
    :QAbstractListModel(parent)
{
    connect(&connector, &Connector::newAirData, this, &AirDataModel::onNewDataAvailable);
    connect(&connector, &Connector::tempResponse, this, &AirDataModel::addData);

}

int AirDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_items.count();
}

QVariant AirDataModel::data(const QModelIndex &index, int role) const
{
    const int idx = index.row();

    if (idx < 0 || idx >= rowCount()) {
        return QVariant();
    }

    switch (role)
    {
    case Temperature:
        return QVariant::fromValue(m_items.at(idx).temperature);

    case Humidity:
        return QVariant::fromValue(m_items.at(idx).humidity);

    case Date:
        return QVariant::fromValue(m_items.at(idx).date);
    }

    return QVariant();
}

QHash<int, QByteArray> AirDataModel::roleNames() const
{
    return ROLE_NAMES;
}

void AirDataModel::load(const QList<AirItem>& data)
{
    m_items.append(data);
}

void AirDataModel::addData(QString temp, QString hum, QString date, QString time)
{
    qDebug () << "new record" << rowCount() << ":" << temp << hum << date << time;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items.append({temp, hum, date, time});
    endInsertRows();
    emit newDataAvailable();
}

void AirDataModel::onNewDataAvailable(QString temp, QString hum, QString date, QString time)
{
    qDebug () << "record" << rowCount() << ":" << temp << hum << date << time;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items.append({temp, hum, date, time});
    endInsertRows();
    emit newDataAvailable();
}

QString AirDataModel::getNewestTemperature()
{
    if(!rowCount()) return "";
    return m_items.last().temperature;
}

QString AirDataModel::getNewestHumidity()
{
    if(!rowCount()) return "";
    return m_items.last().humidity;
}

QString AirDataModel::getNewestDate()
{
    if(!rowCount()) return "";
    return m_items.last().date;
}

QString AirDataModel::getNewestTime()
{
    if(!rowCount()) return "";
   return m_items.last().timed;
}
