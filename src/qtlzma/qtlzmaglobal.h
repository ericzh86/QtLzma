#ifndef QTLZMAGLOBAL_H
#define QTLZMAGLOBAL_H

#include <QtCore/QtGlobal>

#if defined(QT_LZMA_LIB)
#  define Q_LZMA_EXPORT Q_DECL_EXPORT
#else
#  define Q_LZMA_EXPORT Q_DECL_IMPORT
#endif

#endif // QTLZMAGLOBAL_H
