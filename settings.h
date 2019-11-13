#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString minTemp READ getMinTemp WRITE setMinTemp NOTIFY minTempChanged)
    Q_PROPERTY(QString maxTemp READ getMaxTemp WRITE setMaxTemp NOTIFY maxTempChanged)
    Q_PROPERTY(QString minWA READ getMinWA WRITE setMinWA NOTIFY minWAChanged)
    Q_PROPERTY(QString maxWA READ getMaxWA WRITE setMaxWA NOTIFY maxWAChanged)
    Q_PROPERTY(QString minWS READ getMinWS WRITE setMinWS NOTIFY minWSChanged)
    Q_PROPERTY(QString maxWS READ getMaxWS WRITE setMaxWS NOTIFY maxWSChanged)
    Q_PROPERTY(QString minL READ getMinL WRITE setMinL NOTIFY minLChanged)
    Q_PROPERTY(QString maxL READ getMaxL WRITE setMaxL NOTIFY maxLChanged)
    Q_PROPERTY(QString email READ getEmail WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString hour READ getHour WRITE setHour NOTIFY hourChanged)

public:
    explicit Settings(QObject *parent = nullptr);

    QString getMinTemp() const;
    void setMinTemp(const QString &minTemp);

    QString getMaxTemp() const;
    void setMaxTemp(const QString &maxTemp);

    QString getMinWA() const;
    void setMinWA(const QString &minWA);

    QString getMaxWA() const;
    void setMaxWA(const QString &maxWA);

    QString getMinWS() const;
    void setMinWS(const QString &minWS);

    QString getMaxWS() const;
    void setMaxWS(const QString &maxWS);

    QString getMinL() const;
    void setMinL(const QString &minL);

    QString getMaxL() const;
    void setMaxL(const QString &maxL);

    QString getEmail() const;
    void setEmail(const QString &email);

    QString getHour() const;
    void setHour(const QString &hour);

signals:
    void minTempChanged();
    void maxTempChanged();
    void minWAChanged();
    void maxWAChanged();

    void minWSChanged();
    void maxWSChanged();

    void minLChanged();
    void maxLChanged();
    void emailChanged();
    void hourChanged();


private:
    QString m_minTemp;
    QString m_maxTemp;
    QString m_minWA;
    QString m_maxWA;
    QString m_minWS;
    QString m_maxWS;
    QString m_minL;
    QString m_maxL;
    QString m_email;
    QString m_hour;
};

#endif // SETTINGS_H
