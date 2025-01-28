#!/bin/bash

set -e # Immediately exit if any command has a non-zero exit status.

envsubst < /etc/mysql/init.sql > /tmp/init.sql

exec mysqld_safe
