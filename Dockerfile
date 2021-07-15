# Minimal Docker image for samhead v1.0.0 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install dependencies
RUN apk update && \
    apk add bash g++ && \
    wget -qO- "https://github.com/niemasd/samhead/archive/refs/tags/1.0.0.tar.gz" | tar -zx && \
    cd samhead-* && \
    g++ -Wall -pedantic -O3 -std=c++11 -o /usr/local/bin/samhead samhead.cpp && \
    cd .. && \
    rm -rf samhead-*
