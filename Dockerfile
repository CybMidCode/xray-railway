FROM alpine:latest

RUN apk add --no-cache wget unzip ca-certificates

WORKDIR /xray

RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip Xray-linux-64.zip \
    && rm Xray-linux-64.zip

COPY config.json .

EXPOSE 18081

CMD ["./xray", "run", "-c", "config.json"]
