cmake_minimum_required(VERSION 3.16)

project(videoplayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Quick Multimedia REQUIRED)

add_executable(videoplayer WIN32 MACOSX_BUNDLE
    main.cpp
    Main.qml
)

target_link_libraries(videoplayer PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::Multimedia
)

set_target_properties(videoplayer PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER "my.example.com"
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

install(TARGETS videoplayer
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
