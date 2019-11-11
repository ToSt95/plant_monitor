#ifndef MODELLOADER_H
#define MODELLOADER_H

#include <QObject>
#include "connector.h"
#include "schedule.h"
#include "airdatamodel.h"

class ModelLoader : public QObject
{
    Q_OBJECT
public:
    explicit ModelLoader(const Connector& connector, const AirDataModel& airModel,
                         const ScheduleModel& datesModel, QObject *parent = nullptr);


signals:

public slots:
    void onLoadAirModel();
    void onLoadDatesModel();
};

#endif // MODELLOADER_H
