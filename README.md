# Template Repository for COMP SCI 2207/7207 Web & Database Computing (2023 Semester 1)

Contains environment files for WDC 2023. Copy this template for a general sandbox.

Auto commit/push/sync to Github is disabled by default in this template repository.  
Enable the GitDoc extension to use this fucntionality (either in your VSCode settings, or in the Dev Container settings) 



HungerVault is a nonprofit organisation aimed to protect and shelter the homeless and those in need.

This is a relatively new organisation that has recently had its webpage designed. Some features of the webpage include;
- A well-put-together home page, which takes into account principles such as 'kinematic load', drawing in more visitors
- An about page, describing the values, mission and overall purpose of the nonprofit, including donation options for the less fortunate.
- An events page, detailing upcoming events.
- A Contact Us section that directly links users to relevant Outlook email sources.
- A profile page, where members can view and add upcoming events, and admins additionally can manage members, post event updates and create events.

Required express packages:
- MySQL  (for database)
- Moment (for date conversions)

General steps to open / run webpage:
(WINDOWS)

1. Open VS code and clone the git repository ( https://github.com/UAdelaide/24S1_WDC_UG_Group_64 ) **OR** download a ZIP file of the repository and extract it onto your PC
   
2. Open VS code terminal and run mysql
   Type 'service mysql start'
        'mysql < hungervault.sql' <-- this adds the database onto mysql
        'mysql'
  
3. Open CMD terminal and run express **do not type 'express', will change 'index.js' file**
   Type 'npm start'
   If you are prompted with errors, type 'npm install *error name*', followed by 'npm start'

4. Webpage should be up and running on port 3000.
   Open 'http://localhost:3000/' on an empty browser.

5. To run additional SQL files to get specific data from the 'hungervault' database
   Follow step 2, then;
   Type 'SHOW DATABASES' <-- lists a range of available databases
   Type 'USE hungervault' <-- use the 'hungervault' database
   Type 'SHOW TABLES' <-- lists a range of tables within the 'hungervault' database as described in the database schema
   Type 'source ___.sql' <-- run the SQL code

(MAC)?
