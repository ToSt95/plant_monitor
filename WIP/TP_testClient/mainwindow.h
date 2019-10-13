#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "../TPserver/request.h"

class QTcpSocket;

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

    void onConnectClicked();
    void onDisconnected();
    void onWriteRequest();
    void onResponseReady();

private:
    Ui::MainWindow *ui;
    QTcpSocket* m_socket;
    int m_connectionState{0};

};

#endif // MAINWINDOW_H
