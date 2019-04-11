QT += testlib
QT -= gui

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

HEADERS += \
    qtlzma2test.h
SOURCES += \
    qtlzma2test.cpp

RESOURCES += \
    lzma2.qrc

BUILDDIR = $$clean_path($$PWD/../../../build)

DESTDIR = $$BUILDDIR/bin
INCLUDEPATH += $$BUILDDIR/include/QtLzma
LIBS += -L$$BUILDDIR/lib -l$$qtLibraryTarget(Qt5Lzma)
