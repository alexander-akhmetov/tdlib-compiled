#!/bin/bash

TDLIB_VERSION=v1.5.0

set -x


function check_arg() {
    if [[ ! "$1" =~ ^(linux|linux-musl)$ ]]; then
        echo "Chosen invalid library type: $1"
        exit 1
    fi
}


function copy_compiled_lib() {
    mkdir -p compiled
    id=$(docker create build/tdlib-$1:latest)
    docker cp $id:/out/libtdjson.so - > compiled/libtdjson.so
    docker rm $id
}


function build() {
    cd $1  #  go to linux or linux-musl

    docker build --build-arg tdlib_tag=${TDLIB_VERSION} -t build/tdlib-$1 .
    copy_compiled_lib $1

    cd ..
}


check_arg $1
build $1
