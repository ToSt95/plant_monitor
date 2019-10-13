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
    QByteArray password{"milodev1024"};
    QByteArray port;
};

#endif // CONFIG_H
