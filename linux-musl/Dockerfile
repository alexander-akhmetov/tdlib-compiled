FROM alpine:3.15

RUN apk add --no-cache alpine-sdk \
    openssl-dev \
    linux-headers \
    cmake \
    gperf \
    git \
    zlib-dev \
    php \
    php-ctype

ARG tdlib_tag
ARG tdlib_commit

RUN git clone https://github.com/tdlib/td.git /root/td
WORKDIR /root/td/
RUN git checkout $tdlib_commit

RUN mkdir /root/td/build
WORKDIR /root/td/build/

ENV CXXFLAGS ""
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
RUN cmake --build . --target install

RUN mkdir -p /out/
RUN cp /root/td/build/libtdjson.so /out/libtdjson.so
