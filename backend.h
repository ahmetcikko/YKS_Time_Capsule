#pragma once

#include <QObject>
#include <QString>
#include <QStringList>

class Backend : public QObject {
    Q_OBJECT

  public:
    Q_INVOKABLE QStringList read_current_progress();
    Q_INVOKABLE void write_new_notes(QString line);
};