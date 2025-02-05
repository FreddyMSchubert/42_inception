#!/bin/bash

set -e # Immediately exit if any command has a non-zero exit status.

envsubst < /etc/nginx/sites-available/default > /etc/nginx/sites-available/default1
mv /etc/nginx/sites-available/default1 /etc/nginx/sites-available/default

exec nginx -g 'daemon off;'
