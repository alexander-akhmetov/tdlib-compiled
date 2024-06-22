#!/bin/bash

TDLIB_VERSION=v1.8.31
TDLIB_COMMIT=8f19c751dc296cedb9a921badb7a02a8c0cb1aeb

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
    docker cp $id:/out/libtdjson.so - > compiled/libtdjson.tar
    docker rm $id
    tar xvf compiled/libtdjson.tar -C compiled
    rm compiled/libtdjson.tar
}


function build() {
    cd $1  #  go to linux or linux-musl

    docker build --build-arg tdlib_tag=${TDLIB_VERSION} --build-arg tdlib_commit=${TDLIB_COMMIT} -t build/tdlib-$1 .
    copy_compiled_lib $1

    cd ..
}


check_arg $1
build $1
