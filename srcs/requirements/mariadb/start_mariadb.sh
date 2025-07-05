#!/bin/bash

set -e # Immediately exit if any command has a non-zero exit status.

envsubst < /etc/mysql/init.sql > /tmp/init_substituted.sql
mv /tmp/init_substituted.sql /etc/mysql/init.sql

chown -R mysql:mysql /var/lib/mysql

# Initialize mysql tables if missing
if [ ! -d /var/lib/mysql/mysql ]; then
  echo "[entrypoint] initializing MariaDB datadir…"
  mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

exec mariadbd --user=mysql --console
