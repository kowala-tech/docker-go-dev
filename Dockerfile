FROM golang:1.10.3-alpine3.7

RUN apk update && apk add --update git make gcc build-base musl-dev linux-headers ca-certificates nodejs python2 curl

# Godog
RUN go get github.com/DATA-DOG/godog/cmd/godog

# Dep
RUN go get github.com/golang/dep/cmd/dep

# solc
RUN curl -L https://github.com/ethereum/solidity/releases/download/v0.4.24/solc-static-linux -o /bin/solc && chmod +x /bin/solc

# Docker client
ENV DOCKER_VERSION "17.12.0-ce"
RUN curl -L -o /tmp/docker-$DOCKER_VERSION.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz \
    && tar -xz -C /tmp -f /tmp/docker-$DOCKER_VERSION.tgz \
    && mv /tmp/docker/docker /usr/bin \
    && rm -rf /tmp/docker-$DOCKER_VERSION /tmp/docker

