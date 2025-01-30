#!/bin/bash

set -e # Immediately exit if any command has a non-zero exit status.

envsubst < /etc/mysql/init.sql > /tmp/init_substituted.sql
mv /tmp/init_substituted.sql /etc/mysql/init.sql

exec mysqld_safe
