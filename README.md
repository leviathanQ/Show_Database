# Show-Database

For this project, we design a website which takes in a user's input and store it onto a table called 'User's Table'. We provided a list of shows that the user must select from under 'Show Table'. The purpose of this project is to understand how database(s) connect to (talk to) the frontend, creating security against SQL injection, and displaying our tables onto our website. 

Website link (IMPORTANT - WILL NEED TO BE UNDER CSUS INTERNET SERVER): https://ecs-pw-proj-web.ecs.csus.edu/~stevenwho/show_database/home.php

## Home and functionality
For our website, our display is in the file home.php and it displays an input box with two tables. One table is for the User in which they can type in a show from the 'Show Table' list and insert it into their 'User Table'.

PATH: home.php

When going to our website, user can type in a show that they want to add onto their table base off the list of shows we have in our show table. User's input are prepared inside the insertData.php file where it makes sure that the entirety of the input is converted into a string and then will be executed through an sql command.

PATH: insertData.php

For our Clear Table button, we use a file called clearUserTable.php in which clears all the entries inside the user's table.

PATH: clearUserTable.php

## Database connection and creation
In order to connect our database to our frontend, we used PHP to do so. The connection file is named db_conn.php and it connects to Steven's ecs account and is using Steven's database account as well for storing our tables and data.

PATH: db_conn.php

For creating tables, triggers, and inserting data to the show_table initially, it is in the folder database and we use two separate files. One of the file is for the list of shows (where we create a table, some triggers, and insert our list of shows), and the other one for the User (in which we only create the tables and triggers).

PATH: database/show.sql   AND   database/userTable.sql
