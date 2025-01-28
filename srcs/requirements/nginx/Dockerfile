FROM alpine:latest

RUN apk update
RUN apk add --update nginx

CMD ["nginx", "-g", "daemon off;"] // runs in foreground for now
