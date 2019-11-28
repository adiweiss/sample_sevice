FROM golang:alpine AS build_base

ENV GO111MODULE=on GOFLAGS='-mod=vendor'

WORKDIR /app

ADD . .

RUN go build main.go

FROM golang:alpine

COPY --from=build_base /app/main /app/main

ENTRYPOINT /app/main
