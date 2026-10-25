#include "backend.h"
#include <filesystem>
#include <fstream>
#include <iostream>
#include <ctime> // chrono isnt properly supported on
// many compilers like llvm so i switched to ctime

QStringList Backend::read_current_progress() {
    QStringList messages;
    if (std::filesystem::exists("notes.txt")) {
        std::ifstream file("notes.txt");
        if (!file.is_open()) {
            return messages;
        }
        std::string notesLine;
        std::string notes;
        while (std::getline(file, notesLine)) {
            if (notesLine != "===||| END NOTE |||===")
                notes += notesLine + "\n";
            else {
                messages.append(QString::fromStdString(notes));
                notes = "";
            }
        }

#ifndef NDEBUG
        for (QString message : messages) {
            std::cout << message.toStdString() + "\n\n\n";
        }
#endif

        file.close();
        return messages;
    } else {
        return messages;
    }
}

void Backend::write_new_notes(QString line) {
    time_t now = time(nullptr);
    struct tm *local_time = localtime(&now);

    int year = (*local_time).tm_year + 1900;
    int month = (*local_time).tm_mon + 1;
    int day = (*local_time).tm_mday;

    int hour = (*local_time).tm_hour;
    int minute = (*local_time).tm_min;

    if (std::filesystem::exists("notes.txt")) {
        std::ofstream file("notes.txt", std::ofstream::app);
        if (line.toStdString() != "")
            file << "\n" << day << "-" << month << "-" << year << " " << hour << ":" << minute << "\n" + line.toStdString() + "\n" +
                        "===||| END NOTE |||===";
        file.close();
    } else {
        std::ofstream file("notes.txt", std::ofstream::app);
        if (line.toStdString() != "")
            file << day << "-" << month << "-" << year << " " << hour << ":" << minute << "\n" + line.toStdString() + "\n" +
                        "===||| END NOTE |||===";
        file.close();
    }
}