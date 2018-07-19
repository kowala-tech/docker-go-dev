FROM golang:1.9.7-alpine3.7

RUN apk update && apk add --update alpine-sdk git make gcc build-base musl-dev linux-headers ca-certificates nodejs-current-npm python2 curl protobuf

RUN npx npm@5.6 i -g npm@6.2.0

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

# Protoc
RUN go get -u github.com/golang/protobuf/protoc-gen-go \
    && go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway \
    && go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger \
    && go get -u google.golang.org/grpc \
    && go get -u github.com/golang/protobuf/proto

