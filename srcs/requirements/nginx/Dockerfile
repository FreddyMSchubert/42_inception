FROM alpine:3.20

RUN apk update
RUN apk add --update openssl nginx

RUN mkdir -p /etc/nginx/certificates

COPY ./assets/www/ /var/www/html/
COPY ./assets/www.conf /etc/nginx/conf.d/default.conf
COPY ./assets/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

