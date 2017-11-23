FROM phusion/baseimage:0.9.19

# System setup
RUN apt-get update && apt-get install -y \
		ca-certificates curl gcc libc6-dev make \
		bzr git mercurial \
		g++ \
		curl \
		zip unzip \
		python2.7 python-pip \
		wget \  
		--no-install-recommends

# Golang
ENV GOLANG_VERSION 1.9.2
RUN wget -O go.tgz https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go.tgz
ENV GOPATH /kowala/workspace
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Supervisor
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisord

# AWS CLI
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install awsebcli --upgrade --user
ENV PATH /root/.local/bin:/usr/local/go/bin:$PATH
