# Show-Database

For this project, we design a website which takes in a user's input and store it onto a table called 'User's Table'. We provided a list of shows that the user must select from under 'Show Table'. The purpose of this project is to understand how database connect (talk to) the frontend, creating security against SQL injection, and displaying our tables onto our website. 

Website link: https://ecs-pw-proj-web.ecs.csus.edu/~stevenwho/show_database/home.php

## Home and functionality
For our website, our display is in the file home.php and it displays an input box with two tables. One table is for the user in which they can type in a show from the show table list and insert it into their user table.

PATH: home.php

When going to our website, user can type in a show that they want to add onto their table base off the list of shows we have in our show table. User's input are prepared inside the insertData.php file where it makes sure that we conver the entirety of the input into a string and then execute the sql command.

PATH: insertData.php

For our clear table button, we use a file called clearUserTable.php in which clears all the entries inside the user's table.

PATH: clearUserTable.php

## Database connection and creation
Connecting our database to our frontend, we used php to do so. The connection file is named db_conn.php and it connects to Steven's ecs account and is using Steven's database account as well for storing our tables and data.

PATH: db_conn.php

For creating tables, triggers, and inserting data to the show_table initially, it is in the folder database and we use two separate files: one for the list of shows (where we create a table, some triggers, and insert in our list of shows) and one for the user (in which we only create the tables and triggers).

PATH: database/show.sql   OR    database/userTable.sql
