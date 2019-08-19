
# Organizational Procurement Management System 

## Quick Start

1. Use Netbeans IDE to setup the project
2. Setup a local PostgreSQL database with a root password of '1234' (you can otherwise decide to change the password and subsequently change its occurence in the source code too)
3. Import database file by the name 'opms' from the database directory to a local database by the same name 'opms' (while importing, select rolename to postgres).
4. Run project from Netbeans. Make sure to configure Tomcat to act as your server.

### NB:
In order for the system to function as intended, you need to setup a cron job on the postgres database by following these steps:
1. Install pgAgent using application stack builder of postgres
2. Create a job named 'tender_status', with the enabled toggle set to 'yes' and job class set to 'routine maintenance'.
3. In the steps tab, add a new step; under general tab name it 'status_open'; toggle the enabled to 'yes'; connection type to 'remote' and set the connection string to 'host=localhost port=5432 dbname=YOUR_DB user=postgres password=YOUR_PASSWORD'.
4. Under code tab, add the following sql code: 'update public.tenders set status='open' where now()::date >= tenders.opendate and now()::date <= tenders.closingdate'.
5. Repeat step 3 except change the name to 'status_closed'.
6. Under code tab for 'status_closed' add: 'update public.tenders set status='closed' where now()::date > tenders.closingdate'
7. Repeat step 3 except change the name to 'status_pending'.
8. Under code tab for 'status_pending' add: 'update public.tenders set status='pending' where now()::date < tenders.opendate'
9. Having done so, you are now through with the 'steps' tab of the job, switch to the 'schedules' tab.
10. Add a new schedule, under general tab name it 'execute_update'; set enabled toggle to 'yes'; set the start time and end time when you require the job to be executed (ideally from now to infinity).
11. Under repeat tab, set the task to run as you desire, e.g. set to every day at 12 midnight by selecting every day, all dates, all months and setting the time to 00:00

### More Tweaks:
In the source directory under ControllerServlet, you may require to edit some lines of code to suit your environment. This in particular will be to facilitate the access of documents, either to store or retrieve from the server. The following lines of code contain the full path to your file storage directory in which you should tweak to your own desired path:
1. line 267.
2. line 302.
3. line 335.
4. line 369.
5. line 402.
6. line 433.

Within the directory you have specified in the full path above, you may be required to create more directories as specified in the lines of code 42-45.
