/*
 * Connecting to DB:
 * 1) Create a new Data Source (Mysql)
 * 2) Go to the ssh tab and check the box and then click on the three dots to edit properties
 * 3) For ssh host put in: ecs-pd-proj-db.ecs.csus.edu and for user and password, it will be your school user and pass
 * 4) Now run test and see if it works and if it did click apply
 * 5) Now head over to general and then fill in the user and pass with the given database user and pass provided by
 * the professor from CSC 174
 */

DROP TABLE show_table;
CREATE TABLE show_table(
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    show_type ENUM('Anime', 'Cartoon'),
    anime_Season ENUM('Spring', 'Summer', 'Fall', 'Winter'),
    anime_year INT,
    carton_network VARCHAR(255),
    cartoon_release INT
);

INSERT INTO show_table VALUES (1, 'test', 'Anime', 'Spring', 2022, NULL, NULL);


SELECT * FROM show_table;
