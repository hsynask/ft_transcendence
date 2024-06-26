#!/bin/bash

service postgresql start

sleep 2

psql -U postgres -c "CREATE DATABASE $DB_NAME"
psql -U postgres -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD'"
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER"

exec "$@"