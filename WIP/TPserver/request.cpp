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

QString Request::email()
{
    auto object = m_jsonData.object();
    QString email = object.value("email").toString();
    return email;
}

QString Request::password()
{
    auto object = m_jsonData.object();
    QString password = object.value("password").toString();
    return password;
}

bool Request::leadState()
{
    auto object = m_jsonData.object();
    bool leadState = object.value("state").toBool();
    return leadState;
}

QString Request::date()
{
    auto object = m_jsonData.object();
    QString date = object.value("date").toString();
    return date;
}

bool Request::removeData()
{
    auto object = m_jsonData.object();
    bool remove = object.value("remove").toBool();
    return remove;
}

QJsonObject Request::dataFromClient()
{
    return m_jsonData.object();
}
