TEMPLATE = app
TARGET = screenrecorder

target.path = /usr/sbin
INSTALLS += target

QMAKE_RPATHDIR += /usr/share/$${TARGET}/lib

QT += dbus concurrent platformsupport-private
CONFIG += wayland-scanner link_pkgconfig
PKGCONFIG += wayland-client
WAYLANDCLIENTSOURCES += protocol/lipstick-recorder.xml

SOURCES += \
    src/main.cpp \
    src/recorder.cpp \
    src/QAviWriter.cpp \
    src/gwavi.cpp \
    src/dbusadaptor.cpp


HEADERS += \
    src/recorder.h \
    src/QAviWriter.h \
    src/gwavi.h \
    src/dbusadaptor.h

dbusService.files = dbus/org.coderus.screenrecorder.service
dbusService.path = /usr/share/dbus-1/system-services/
INSTALLS += dbusService

dbusConf.files = dbus/org.coderus.screenrecorder.conf
dbusConf.path = /etc/dbus-1/system.d/
INSTALLS += dbusConf

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

EXTRA_CFLAGS=-W -Wall -Wextra -Wpedantic -Werror=return-type
QMAKE_CXXFLAGS += $$EXTRA_CFLAGS
QMAKE_CFLAGS += $$EXTRA_CFLAGS

isEmpty(PROJECT_PACKAGE_VERSION) {
    VERSION = 0.1.0
} else {
    VERSION = $$PROJECT_PACKAGE_VERSION
}
DEFINES += PROJECT_PACKAGE_VERSION=\\\"$$VERSION\\\"

INCLUDEPATH += /usr/include
