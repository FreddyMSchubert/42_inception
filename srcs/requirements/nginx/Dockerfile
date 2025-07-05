FROM debian:bullseye

# nginx is the webserver, handling incoming requests and using cgi
# it will forward php requests to wordpress / php-fpm as specified in the copied config
# openssl is used to generate the ssl certificate

RUN apt update && apt upgrade -y && apt install -y nginx openssl gettext-base

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=GB/ST=England/L=London/O=Inception/OU=IT Department/CN=${DOMAIN_NAME}" \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt

COPY default /etc/nginx/sites-available/default
COPY envsubstitution.sh /envsubstitution.sh
RUN chmod +x /envsubstitution.sh

ENTRYPOINT ["bash", "/envsubstitution.sh"]
