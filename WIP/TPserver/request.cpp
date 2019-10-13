#include "request.h"
#include <QJsonDocument>
#include <QJsonObject>

#include <QVariant>
#include <QDebug>

// 1 byte - command
// 2-7 byte - value
// 8 byte - end of packet

Request::Request(const QByteArray& data)
    : m_rawData(data)
{
    m_jsonData = QJsonDocument::fromBinaryData(data);
}

QJsonDocument Request::json()
{
    return m_jsonData;
}

QByteArray Request::binary()
{
    return m_jsonData.toBinaryData();
}

Request::Command Request::command()
{
    auto object = m_jsonData.object();
    Command commnad = static_cast<Command>(object.value("command").toInt());
    return commnad;
}
