#ifndef QLZMA2ENCODER_H
#define QLZMA2ENCODER_H

#include <QIODevice>
#include <QSharedDataPointer>
#include "qtlzmaglobal.h"

// class QLzma2EncoderOptions

class QLzma2EncoderOptionsPrivate;
class Q_LZMA_EXPORT QLzma2EncoderOptions
{
public:
    QLzma2EncoderOptions(); // QLzma2EncoderOptions
    QLzma2EncoderOptions(const QLzma2EncoderOptions &other);
    QLzma2EncoderOptions &operator=(const QLzma2EncoderOptions &rhs);
    ~QLzma2EncoderOptions(); // QLzma2EncoderOptions

public:
    void setCompressionLevel(int level);
    int compressionLevel() const;

private:
    QSharedDataPointer<QLzma2EncoderOptionsPrivate> d_ptr;

    friend class QLzma2Encoder;
};

// class QLzma2Encoder

class QLzma2EncoderPrivate;
class Q_LZMA_EXPORT QLzma2Encoder : public QObject
{
    Q_OBJECT
    Q_DECLARE_PRIVATE(QLzma2Encoder)

public:
    explicit QLzma2Encoder(QObject *parent = nullptr);
    virtual ~QLzma2Encoder();
protected:
    QScopedPointer<QLzma2EncoderPrivate> d_ptr;

public:
    static bool encode(QIODevice *in, QIODevice *out, uchar &prop);
    static bool encode(const QByteArray &in, QByteArray &out, uchar &prop);
    static QByteArray encode(const QByteArray &in, uchar &prop);
    static bool encode2(QByteArray &io, uchar &prop);
public:
    static bool encode(QIODevice *in, QIODevice *out, uchar &prop, const QLzma2EncoderOptions &options);
    static bool encode(const QByteArray &in, QByteArray &out, uchar &prop, const QLzma2EncoderOptions &options);
    static QByteArray encode(const QByteArray &in, uchar &prop, const QLzma2EncoderOptions &options);
    static bool encode2(QByteArray &io, uchar &prop, const QLzma2EncoderOptions &options);
};

#endif // QLZMA2ENCODER_H
