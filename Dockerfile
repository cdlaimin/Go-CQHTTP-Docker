FROM alpine:latest

ENV TZ Asia/Shanghai
ARG BIN_LINK=https://github.com/Mrs4s/go-cqhttp/releases/latest/download/go-cqhttp_linux_amd64.tar.gz
WORKDIR /app

RUN apk --no-cache add curl tar yasm ffmpeg &&\
    curl -LJo /app/bin.tar.gz ${BIN_LINK} &&\
    tar -zxvf bin.tar.gz &&\
    chmod +x go-cqhttp

WORKDIR /data

ENTRYPOINT exec /app/go-cqhttp faststart
