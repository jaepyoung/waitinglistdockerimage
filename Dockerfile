FROM golang:alpine 

LABEL version="1.0"
LABEL maintainer="jaepyoung.kim@gmail.com"

RUN mkdir /go/src/app
RUN apk add --update make git nodejs npm

RUN npm install -g serverless
RUN go get -u github.com/golang/dep/cmd/dep


WORKDIR /go/src/app 

