FROM golang:1.10.3

RUN apt-get update && apt-get install -y --no-install-recommends \
		build-essential \
		ca-certificates \
		python2.7 \
		curl

# Nodejs
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends nodejs

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

