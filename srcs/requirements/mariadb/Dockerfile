FROM debian:bullseye

# mariadb is the sql database implementation, used by wordpress for storage
# we need to create /run/mysqld directory for mariadb to run there
# gettext-base is used by start_mariadb.sh for env var substitution

RUN apt update && apt upgrade -y && \
	apt install -y mariadb-server \
	gettext-base

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /etc/mysql/init.sql

COPY start_mariadb.sh /start_mariadb.sh
RUN chmod +x /start_mariadb.sh

RUN mkdir /run/mysqld

CMD ["/start_mariadb.sh"]
