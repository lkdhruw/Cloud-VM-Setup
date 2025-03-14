#!/bin/bash

# Create a New PostgreSQL Database
sudo -i -u postgres psql
CREATE DATABASE mydb;
\q

# Restore the Backup
psql -U postgres -d mydb -f /path/to/destination/backup.sql
# If Authentication required
PGPASSWORD='your_password' psql -U postgres -d mydb -f /path/to/destination/backup.sql

# Verify the restore
sudo -i -u postgres psql
\c mydb
\dt

# Grant permissions
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;
# Or
sudo -i -u postgres psql
CREATE ROLE myuser WITH LOGIN PASSWORD 'mypassword';
ALTER ROLE myuser WITH SUPERUSER;
\q

# To Set a Password for the User
sudo -i -u postgres psql
ALTER USER postgres WITH PASSWORD 'your_password';
ALTER USER myuser WITH PASSWORD 'your_password';
\q

# Restore Using pg_restore (If Peer Authentication error)
sudo -i -u postgres pg_restore -U postgres -d mydb /path/to/destination/backup.sql

# Grant Ownership of the Database
sudo -i -u postgres psql
ALTER DATABASE mydb OWNER TO myuser;
\q

