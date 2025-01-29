FROM debian:bullseye

# nginx is the webserver, handling incoming requests and using cgi
# it will forward php requests to wordpress / php-fpm as specified in the copied config

RUN apt update && apt upgrade && apt install -y nginx

COPY default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
