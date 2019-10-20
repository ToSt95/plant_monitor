#ifndef CONFIG_H
#define CONFIG_H
#include <QString>

class Config
{
public:
    Config();
    QByteArray databaseName{"tp_database"};
    QByteArray addres{"localhost"};
    QByteArray user{"root"};
    QByteArray password{"root"};
    QByteArray port;

    QString emailAddress;
    QString emailPassword;
};

#endif // CONFIG_H
