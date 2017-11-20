# docker-go-dev

Golang development environment

## Description

Go environment, Supervisor, AWS CLI and standard development tooling. [https://hub.docker.com/r/kowalatech/go](https://hub.docker.com/r/kowalatech/go).

## Usage

Include the image, and make sure to copy a local supervisord configuration file to the system directory if you need one:

```
FROM kowalatech/go

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
```
