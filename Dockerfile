FROM golang:buster

LABEL version="1.0"
LABEL maintainer="jaepyoung.kim@gmail.com"

RUN mkdir /go/src/app
RUN apt-get update && apt-get install  -y --no-install-recommends \
              make\
              git\
              nodejs\
              npm \ 
              curl \ 
              jq \
              python3 \
              gcc \
              python3-dev \
              python3-pip\
              libc-dev \
              unzip\
        && rm -rf /var/lib/apt/lists/*

RUN npm install -g serverless
RUN npm install --global yarn
RUN npm install --global gatsby-cli

RUN go get -u github.com/golang/dep/cmd/dep

# Install vault cli
RUN curl -sL https://releases.hashicorp.com/vault/1.3.0/vault_1.3.0_linux_amd64.zip  -o vault.zip \
  && unzip vault.zip \
  && chmod a+x vault \
  && mv vault /usr/local/bin/vault
RUN pip3 install --upgrade setuptools
RUN pip3 install awscli


WORKDIR /go/src/app 

