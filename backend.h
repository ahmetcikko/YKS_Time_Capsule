#pragma once

#include <QObject>
#include <fstream>

class Backend : public QObject {
    Q_OBJECT

public:
    Q_INVOKABLE void read_current_progress(std::string& container);
    void write_new_notes(std::ofstream file);
};