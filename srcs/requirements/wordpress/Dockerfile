FROM debian:latest

# php-fpm will handle php script execution as requested by the web server
# it will listen on the right port as specified in the copied over config file

RUN apt update && apt upgrade && apt install -y php-fpm

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD ["php-fpm8.2", "-F"]
