#!/bin/bash
set -e

cd /var/www/html

# Only download & configure to download & manage wordpress if WP isn’t already set up
if [ ! -f wp-config.php ]; then
	echo "[wp-setup] Fresh install: downloading core, generating config, installing..."
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar

	./wp-cli.phar core download --allow-root
	./wp-cli.phar config create \
		--dbname=${MARIA_DB_DATABASE_NAME} \
		--dbuser=${MARIA_DB_ROOT_USER} \
		--dbpass=${MARIA_DB_ROOT_PASSWORD} \
		--dbhost=mariadb \
		--allow-root

	./wp-cli.phar core install \
		--url=https://${DOMAIN_NAME} \
		--title=inception \
		--admin_user=${WORDPRESS_ADMIN_USER} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL} \
		--allow-root

	./wp-cli.phar user create "${WORDPRESS_TEST_USER}" "${WORDPRESS_TEST_USER_EMAIL}" \
		--role=author \
		--user_pass="${WORDPRESS_TEST_USER_PASSWORD}" \
		--allow-root
else
	echo "[wp-setup] Detected existing installation – skipping setup."
fi

chown -R www-data:www-data /var/www/html

# Finally, always start PHP-FPM
php-fpm7.4 -F