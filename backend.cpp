#include "backend.h"
#include <chrono>
#include <filesystem>
#include <format>
#include <fstream>
#include <iostream>

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
    auto global_time = std::chrono::system_clock::now();
    std::chrono::zoned_time local_time{std::chrono::current_zone(),
                                       global_time};
    std::string time = std::format("{:%d-%m-%Y %H:%M}", local_time);
    if (std::filesystem::exists("notes.txt")) {
        std::ofstream file("notes.txt", std::ofstream::app);
        if (line.toStdString() != "")
            file << "\n" + time + "\n" + line.toStdString() + "\n" +
                        "===||| END NOTE |||===";
        file.close();
    } else {
        std::ofstream file("notes.txt", std::ofstream::app);
        if (line.toStdString() != "")
            file << time + "\n" + line.toStdString() + "\n" +
                        "===||| END NOTE |||===";
        file.close();
    }
}