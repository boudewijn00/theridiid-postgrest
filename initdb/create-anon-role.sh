#!/bin/bash

psql -U ${POSTGRES_USER} <<-END
    create role ${POSTGRES_USER} noinherit login password '${POSTGRES_PASSWORD}';
    
    create role ${DB_ANON_ROLE} nologin;
    grant ${DB_ANON_ROLE} to ${POSTGRES_USER};

    grant usage on schema ${DB_SCHEMA} to ${DB_ANON_ROLE};
    alter default privileges in schema ${DB_SCHEMA} grant select on tables to ${DB_ANON_ROLE};
    grant select on all sequences in schema ${DB_SCHEMA} to ${DB_ANON_ROLE};
    grant select on all tables in schema ${DB_SCHEMA} to ${DB_ANON_ROLE};
   
    create role ${DB_NON_ANON_ROLE} nologin;
    grant ${DB_NON_ANON_ROLE} to ${POSTGRES_USER};

    grant usage on schema ${DB_SCHEMA} to ${DB_NON_ANON_ROLE};
    alter default privileges in schema ${DB_SCHEMA} grant all on tables to ${DB_NON_ANON_ROLE};
    grant all privileges on all tables in schema ${DB_SCHEMA} to ${DB_NON_ANON_ROLE};
END