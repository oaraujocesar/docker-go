FROM golang:1.19.1-alpine as build

WORKDIR /app

RUN go mod init github.com/oaraujocesar/docker-go

COPY go.mod ./

COPY *.go ./

RUN go build -o /my-app


## Deploy
FROM scratch

WORKDIR /

COPY --from=build /my-app /my-app

EXPOSE 8080

ENTRYPOINT [ "/my-app" ]