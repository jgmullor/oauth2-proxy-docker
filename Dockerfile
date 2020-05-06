FROM alpine:3.7
LABEL maintainer="gilber@gmail.com"

RUN adduser -D o2p && \
    apk update && \
    apk add ca-certificates && \
    update-ca-certificates

WORKDIR /home/o2p
USER o2p

RUN wget -O oauth2-proxy.tar.gz https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v5.1.0/oauth2_proxy-v5.1.0.linux-amd64.go1.14.tar.gz && \
    tar xvfz oauth2-proxy.tar.gz
CMD oauth2_proxy-v5.1.0.linux-amd64.go1.14/oauth2_proxy -http-address=0.0.0.0:$PORT
