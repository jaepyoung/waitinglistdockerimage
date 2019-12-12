FROM golang:alpine

LABEL version="1.0"
LABEL maintainer="jaepyoung.kim@gmail.com"

RUN mkdir /go/src/app
RUN apk add --update make git nodejs npm curl jq python3

RUN npm install -g serverless
RUN npm install --global yarn

RUN go get -u github.com/golang/dep/cmd/dep

# Install vault cli
RUN curl -sL https://releases.hashicorp.com/vault/1.3.0/vault_1.3.0_linux_amd64.zip  -o vault.zip \
  && unzip vault.zip \
  && chmod a+x vault \
  && mv vault /usr/local/bin/vault

RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*
RUN pip3 install --upgrade setuptools

WORKDIR /go/src/app 

