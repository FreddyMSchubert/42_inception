FROM debian:latest

# php-fpm will handle php script execution as requested by the web server
# it will listen on the right port as specified in the copied over config file
# php-mysqli is a php extension that allows php to interact with mysql databases & curl is used to get WordPress install files

RUN apt update && apt upgrade && apt install -y php8.2-fpm php-mysqli curl

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY install-wp.sh /install-wp.sh
RUN chmod +x /install-wp.sh

CMD ["/install-wp.sh"]
