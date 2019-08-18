
# Organizational Procurement Management System 

## Quick Start

1. Use Netbeans IDE to setup the project
2. Setup a local PostgreSQL database with a root password of '1234' (you can otherwise decide to change the password and subsequently change its occurence in the source code too)
3. Import database file by the name 'opms' from the database directory to a local database by the same name 'opms' (while importing, select rolename to postgres).
4. Run project from Netbeans. Make sure to configure Tomcat to act as your server.

## NB:
In order for the system to function as intended, you need to setup a cron job on the postgres database by following these steps:
1. install pgAgent using application stack builder of postgres
2. 
