FROM debian:bullseye

# php-fpm will handle php script execution as requested by the web server
# it will listen on the right port as specified in the copied over config file
# php-mysqli is a php extension that allows php to interact with mysql databases & curl is used to get WordPress install files

RUN apt update && apt upgrade -y && \
	apt install -y \
		php7.4-fpm php7.4-mysql \
		php7.4-gd php7.4-curl php7.4-xml \
		php7.4-mbstring php7.4-zip php7.4-intl \
		imagemagick php-imagick \
		curl && \
	mkdir -p /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY install-wp.sh /install-wp.sh
RUN chmod +x /install-wp.sh

ENTRYPOINT ["bash", "/install-wp.sh"]
