FROM debian:latest

# php-fpm will handle php script execution as requested by the web server

RUN apt update && apt upgrade && apt install -y php-fpm

CMD ["php-fpm8.2", "-F"]
