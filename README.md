# Show-Database

Website link: https://ecs-pw-proj-web.ecs.csus.edu/~stevenwho/show_database/home.php


For creating tables, triggers, and inserting data to the show_table initially, it is in the folder database and we use two separate files: one for the list of shows (where we create a table, some triggers, and insert in our list of shows) and one for the user (in which we only create the tables and triggers).

PATH: database/show.sql   OR    database/userTable.sql


When going to our website, user can type in a show that they want to add onto their table base off the list of shows we have in our show table. User's input are prepared inside the insertData.php file where it makes sure that we conver the entirety of the input into a string and then execute the sql command.

PATH: insertData.php
