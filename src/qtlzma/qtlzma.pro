#-------------------------------------------------
#
# Project created by QtCreator 2019-04-11T10:00:41
#
#-------------------------------------------------

QT      -= gui
TEMPLATE = lib

DEFINES += QT_LZMA_LIB
TARGET = $$qtLibraryTarget(Qt5Lzma)

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    qtlzmaglobal.h

HEADERS += \
    qlzma2decoder.h \
    qlzma2decoder_p.h \
    qlzma2encoder.h \
    qlzma2encoder_p.h
SOURCES += \
    qlzma2decoder.cpp \
    qlzma2encoder.cpp

OTHER_FILES += \
    mkspecs/modules/qt_lib_lzma.pri \
    mkspecs/modules/qt_lib_lzma_private.pri

include(3rd/lzma1900.pri)

BUILDDIR = $$clean_path($$PWD/../../build)

win32 {
    QMAKE_CFLAGS_RELEASE   = $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO
    QMAKE_CXXFLAGS_RELEASE = $$QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO
    QMAKE_LFLAGS_RELEASE  += /DEBUG /OPT:REF

    CONFIG(debug, debug|release) {
        OUTDIR = $$OUT_PWD/debug
    } else {
        OUTDIR = $$OUT_PWD/release
    }

    # copy bin files

    QMAKE_POST_LINK += $$sprintf($$QMAKE_MKDIR_CMD, "$$system_path($$BUILDDIR/bin)") $$escape_expand(\n\t)
    QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$OUTDIR/$${TARGET}.dll)" "$$system_path($$BUILDDIR/bin/$${TARGET}.dll)" $$escape_expand(\n\t)
    QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$OUTDIR/$${TARGET}.pdb)" "$$system_path($$BUILDDIR/bin/$${TARGET}.pdb)" $$escape_expand(\n\t)

    # copy lib files

    QMAKE_POST_LINK += $$sprintf($$QMAKE_MKDIR_CMD, "$$system_path($$BUILDDIR/lib)") $$escape_expand(\n\t)
    QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$OUTDIR/$${TARGET}.lib)" "$$system_path($$BUILDDIR/lib/$${TARGET}.lib)" $$escape_expand(\n\t)

    # install bin files

    installbins.files = $$system_path($$BUILDDIR/bin/*)
    installbins.path = $$system_path($$[QT_INSTALL_BINS])
    INSTALLS += installbins

    # install lib files

    installlibs.files = $$system_path($$BUILDDIR/lib/*)
    installlibs.path = $$system_path($$[QT_INSTALL_LIBS])
    INSTALLS += installlibs
} else {
    # DESTDIR = $$BUILDDIR/lib
}

# copy headers
QMAKE_POST_LINK += $$sprintf($$QMAKE_MKDIR_CMD, "$$system_path($$BUILDDIR/include/QtLzma)") $$escape_expand(\n\t)

QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$PWD/qtlzmaglobal.h)" "$$system_path($$BUILDDIR/include/QtLzma/qtlzmaglobal.h)" $$escape_expand(\n\t)
QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$PWD/qlzma2decoder.h)" "$$system_path($$BUILDDIR/include/QtLzma/qlzma2decoder.h)" $$escape_expand(\n\t)
QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$PWD/qlzma2encoder.h)" "$$system_path($$BUILDDIR/include/QtLzma/qlzma2encoder.h)" $$escape_expand(\n\t)

QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$PWD/QLzma2Decoder)" "$$system_path($$BUILDDIR/include/QtLzma/QLzma2Decoder)" $$escape_expand(\n\t)
QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$PWD/QLzma2Encoder)" "$$system_path($$BUILDDIR/include/QtLzma/QLzma2Encoder)" $$escape_expand(\n\t)
QMAKE_POST_LINK += $$QMAKE_COPY_FILE "$$system_path($$PWD/QLzma2EncoderOptions)" "$$system_path($$BUILDDIR/include/QtLzma/QLzma2EncoderOptions)" $$escape_expand(\n\t)

# install headers

installheaders.files = $$system_path($$BUILDDIR/include/QtLzma/*)
installheaders.path = $$system_path($$[QT_INSTALL_HEADERS]/QtLzma)
INSTALLS += installheaders

# install modules

installmodules.files = $$system_path($$PWD/mkspecs/modules/*)
installmodules.path = $$system_path($$[QT_INSTALL_PREFIX]/mkspecs/modules)
INSTALLS += installmodules
