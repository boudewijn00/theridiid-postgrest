This project is built around postgREST https://docs.postgrest.org/en/v13/index.html, making use of sqitch for database change management https://sqitch.org/.
 
The database is a Postgres 17 database, running in a Docker container.

To authenticate with postgREST, the Postgres roles 'anon' and 'non_anon' are used. The 'anon' role has read-only access to the database, while the 'non_anon' role has read and write access.

You should create a JWT token with the appropriate role to access the API. This token should be signed with the JWT secret.