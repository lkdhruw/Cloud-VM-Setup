
To refresh database after testing is done
# Drop all tables from PostgreSQL
psql -U db_user -d db_name -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

or
psql
# connect to db
\c db_name

# Drop All Tables
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
