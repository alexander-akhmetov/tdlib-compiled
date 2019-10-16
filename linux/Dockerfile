FROM ubuntu:18.04

RUN apt-get update && \
	apt-get install --yes build-essential \
                          libssl-dev \
	                      cmake \
	                      gperf \
	                      git \
                          zlib1g-dev

ARG tdlib_tag

RUN git clone --branch=$tdlib_tag https://github.com/tdlib/td.git /root/td
RUN mkdir /root/td/build

WORKDIR /root/td/build/

RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build .

RUN mkdir -p /out/
RUN cp /root/td/build/libtdjson.so /out/libtdjson.so
