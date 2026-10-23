cmake_minimum_required(VERSION 3.30)
project(Capsule VERSION 1.0.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
find_package(Qt6 REQUIRED COMPONENTS Gui Quick QuickControls2)
add_executable(Capsule WIN32 main.cpp
    backend.cpp
    backend.h
)
set_target_properties(Capsule PROPERTIES OUTPUT_NAME "YKS Time Capsule")
target_link_libraries(Capsule PRIVATE
    Qt6::Gui
    Qt6::Quick
    Qt6::QuickControls2
)