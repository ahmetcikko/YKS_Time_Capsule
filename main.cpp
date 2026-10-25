#include "backend.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>
#include <QQuickStyle>

int main(int argc, char *argv[]) {
    QQuickStyle::setStyle("Fusion");
    QGuiApplication app(argc, argv);
    Backend backend;
    QQmlApplicationEngine engine;

    (*engine.rootContext()).setContextProperty("backend", &backend);
    engine.load(QUrl("qrc:/gui/main.qml"));

    return app.exec();
}