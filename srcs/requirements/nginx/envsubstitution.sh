#!/bin/bash

set -e # Immediately exit if any command has a non-zero exit status.

while [ ! -f /var/www/html/index.php ]; do
    echo "[nginx] waiting for WordPress to finish installing…" >&2
    sleep 2
done

envsubst '$DOMAIN_NAME' < /etc/nginx/sites-available/default > /etc/nginx/sites-available/default1
mv /etc/nginx/sites-available/default1 /etc/nginx/sites-available/default

exec nginx -g 'daemon off;'
