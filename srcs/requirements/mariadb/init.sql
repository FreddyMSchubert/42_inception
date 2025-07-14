CREATE DATABASE IF NOT EXISTS ${MARIA_DB_DATABASE_NAME};
CREATE USER '${MARIA_DB_ROOT_USER}'@'%' IDENTIFIED BY '${MARIA_DB_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIA_DB_DATABASE_NAME}.* TO '${MARIA_DB_ROOT_USER}'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('${MARIA_DB_ROOT_PASSWORD}');
FLUSH PRIVILEGES;

-- % is used as a wildcard so ${MARIA_DB_ROOT_USER} can connect from any host
-- wordpress.* means all tables in the wordpress database
-- ALTER USER locks built-in root@localhost with root password
-- FLUSH PRIVILEGES reloads the grant tables in memory to apply the changes
