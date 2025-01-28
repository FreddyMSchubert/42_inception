CREATE DATABASE IF NOT EXISTS ${MARIA_DB_DATABASE_NAME};
CREATE USER '${MARIA_DB_ROOT_USER}'@'%' IDENTIFIED BY '${MARIA_DB_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIA_DB_DATABASE_NAME}.* TO '${MARIA_DB_ROOT_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- % is used as a wildcard so ${MARIA_DB_ROOT_USER} can connect from any host
-- wordpress.* means all tables in the wordpress database
-- FLUSH PRIVILEGES reloads the grant tables in memory to apply the changes
