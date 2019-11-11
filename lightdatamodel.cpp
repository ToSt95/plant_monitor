#include "lightdatamodel.h"

namespace
{
const QHash<int, QByteArray> ROLE_NAMES = {
    {LightDataModel::Lumens, QByteArrayLiteral("lumens")},
    {LightDataModel::Date, QByteArrayLiteral("date")}
};
}

LightDataModel::LightDataModel(const Connector& connector, QObject* parent)
    :QAbstractListModel(parent)
{
    connect(&connector, &Connector::newLightData, this, &LightDataModel::onNewDataAvailable);
    connect(&connector, &Connector::lightResponse, this, &LightDataModel::addData);
}

int LightDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_items.count();
}

QVariant LightDataModel::data(const QModelIndex &index, int role) const
{
    const int idx = index.row();

    if (idx < 0 || idx >= rowCount()) {
        return QVariant();
    }

    switch (role)
    {
    case Lumens:
        return QVariant::fromValue(m_items.at(idx).lumen);

    case Date:
        return QVariant::fromValue(m_items.at(idx).date);
    }

    return QVariant();
}

QHash<int, QByteArray> LightDataModel::roleNames() const
{
    return ROLE_NAMES;
}

void LightDataModel::load(const QList<LightItem> &data)
{
    m_items.append(data);
}

void LightDataModel::addData(QString lumens, QString date, QString time)
{
    qDebug () << "[light model] new record" << rowCount() << ":" << lumens << date << time;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items.append({lumens, date, time});
    endInsertRows();
    emit newDataAvailable();
}

void LightDataModel::onNewDataAvailable(QString lumens, QString date, QString time)
{
    qDebug () << "[light model] record" << rowCount() << ":" << lumens << date << time;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items.append({lumens, date, time});
    endInsertRows();
    emit newDataAvailable();
}

QString LightDataModel::getNewestLumens()
{
    if(!rowCount()) return "";
    return m_items.last().lumen;
}

QString LightDataModel::getNewestDate()
{
    if(!rowCount()) return "";
    return m_items.last().date;
}

QString LightDataModel::getNewestTime()
{
    if(!rowCount()) return "";
    return m_items.last().timed;
}
