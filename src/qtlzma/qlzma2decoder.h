#ifndef QLZMA2DECODER_H
#define QLZMA2DECODER_H

#include <QIODevice>
#include <QSharedDataPointer>
#include "qtlzmaglobal.h"

class QLzma2DecoderPrivate;
class Q_LZMA_EXPORT QLzma2Decoder : public QObject
{
    Q_OBJECT
    Q_DECLARE_PRIVATE(QLzma2Decoder)

public:
    explicit QLzma2Decoder(QObject *parent = nullptr);
    virtual ~QLzma2Decoder();
protected:
    QScopedPointer<QLzma2DecoderPrivate> d_ptr;

public:
    static bool decode(QIODevice *in, QIODevice *out, uchar prop);
    static bool decode(const QByteArray &in, QByteArray &out, uchar prop);
    static QByteArray decode(const QByteArray &in, uchar prop);
    static bool decode2(QByteArray &io, uchar prop);
public:
    static bool decode(QIODevice *in, QIODevice *out, uchar prop, qint64 uncompressedSize);
    static bool decode(const QByteArray &in, QByteArray &out, uchar prop, qint64 uncompressedSize);
    static QByteArray decode(const QByteArray &in, uchar prop, qint64 uncompressedSize);
    static bool decode2(QByteArray &io, uchar prop, qint64 uncompressedSize);
};

#endif // QLZMA2DECODER_H
