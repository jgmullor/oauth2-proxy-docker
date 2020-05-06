FROM alpine:3.7
RUN adduser -D myuser
USER myuser

RUN apk update
    && apk add ca-certificates
    && update-ca-certificates
RUN wget https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v5.1.0/oauth2_proxy-v5.1.0.linux-amd64.go1.14.tar.gz
    && tar xvfz oauth2_proxy-v5.1.0.linux-amd64.go1.14.tar.gz
CMD oauth2_proxy-v5.1.0.linux-amd64.go1.14/oauth2_proxy -http-address=0.0.0.0:$PORT
