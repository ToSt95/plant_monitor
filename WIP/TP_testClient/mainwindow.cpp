#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QTcpSocket>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonDocument>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
  , m_socket(new QTcpSocket(this))
{
    ui->setupUi(this);
    connect(ui->pushButton, &QPushButton::clicked, this, &MainWindow::onConnectClicked);
    connect(ui->pushButton_2, &QPushButton::clicked, this, &MainWindow::onWriteRequest);
    connect(m_socket, &QTcpSocket::readyRead, this, &MainWindow::onResponseReady);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::onConnectClicked()
{
    if (m_connectionState == 0) {
        ui->pushButton->setText("Disconnect");
        m_socket->connectToHost(ui->lineEdit->text(), 9999);

        if (!m_socket->waitForConnected(3000)) {
            ui->label->setText(m_socket->errorString());
            return;
        }
        m_connectionState = 1;
    } else {
        ui->pushButton->setText("Connect");
        if (!m_socket->waitForDisconnected(1000)) {
            m_socket->disconnectFromHost();
        }
        m_connectionState = 0;
    }

}

void MainWindow::onDisconnected()
{

}

void MainWindow::onWriteRequest()
{
    ui->label->clear();

    if (!m_connectionState) {
        ui->label->setText("You have to be connected to write message.");
        return;
    }

    QJsonObject object;
    QJsonValue idRequest = ui->lineEdit_2->text().toInt();
    object.insert("command", idRequest);
    auto doc = QJsonDocument(object);
    qDebug() << doc.toBinaryData();
    m_socket->write(doc.toBinaryData());
    m_socket->flush();
}

void MainWindow::onResponseReady()
{
    QJsonDocument doc = QJsonDocument::fromBinaryData(m_socket->readAll());
    auto obj = doc.object();
    QString displayText;
    for(auto key : obj.keys()) {
       displayText += key + ":" + obj.value(key).toString() + "\n";
    }

    ui->label->setText(displayText);
}
