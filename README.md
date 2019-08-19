
# Organizational Procurement Management System 

## Quick Start

1. Use Netbeans IDE to setup the project
2. Setup a local PostgreSQL database with a root password of '1234' (you can otherwise decide to change the password and subsequently change its occurence in the source code too)
3. Import database file by the name 'opms' from the database directory to a local database by the same name 'opms' (while importing, select rolename to postgres).
4. Run project from Netbeans. Make sure to configure Tomcat to act as your server.

### NB:
In order for the system to function as intended, you need to setup a cron job on the postgres database by following these steps:
1. Install pgAgent using application stack builder of postgres
2. Create a job that will execute at least once per day to set the status (open, closed or pending) of the tender appropriately.

### More Tweaks:
In the source directory under ControllerServlet, you may require to edit some lines of code to suit your environment. This in particular will be to facilitate the access of documents, either to store or retrieve from the server. The following lines of code contain the full path to your file storage directory in which you should tweak to your own desired path:
-line 267
-line 302
-line 335
-line 369
-line 402
-line 433

Within the directory you have specified in the full path above, you may be required to create more directories as specified in the lines of code 42-45.
