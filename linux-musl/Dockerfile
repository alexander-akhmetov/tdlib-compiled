FROM alpine:3.9

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

RUN git clone --branch=$tdlib_tag https://github.com/tdlib/td.git /root/td
RUN mkdir /root/td/build

WORKDIR /root/td/build/

ENV CXXFLAGS ""
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
RUN cmake --build . --target install

RUN mkdir -p /out/
RUN cp /root/td/build/libtdjson.so /out/libtdjson.so
