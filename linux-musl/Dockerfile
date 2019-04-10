FROM alpine:3.9

RUN apk add --no-cache alpine-sdk \
	openssl-dev \
	cmake \
	gperf \
	git \
	zlib-dev

RUN git clone https://github.com/tdlib/td.git /root/td
RUN mkdir /root/td/build

WORKDIR /root/td/build/

RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build .

RUN mkdir -p /out/
RUN cp /root/td/build/libtdjson.so /out/libtdjson.so
