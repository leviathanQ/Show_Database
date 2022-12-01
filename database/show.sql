/*
 * Connecting/setting DB to ecs server in DataGrip:
 * 1) Create a new Data Source (Mysql)
 * 2) Go to the ssh tab and check the box and then click on the three dots to edit properties
 * 3) For ssh host put in: ecs-pd-proj-db.ecs.csus.edu and for user and password, it will be your school user and pass
 * 4) Now run test and see if it works and if it did click apply
 * 5) Now head over to general and then fill in the user and pass with the given database user and pass provided by
 * the professor from CSC 174
 */
SHOW DATABASES;
USE CSC174023;
SHOW TABLES;
SHOW TRIGGERS;

DROP TABLE show_table;

CREATE TABLE show_table(
    show_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    show_Type ENUM('Anime', 'Cartoon') NOT NULL,
    anime_Season ENUM('Spring', 'Summer', 'Fall', 'Winter'),
    anime_Year INT,
    carton_Network VARCHAR(255),
    cartoon_Release INT,
    PRIMARY KEY (show_id)
);

DROP PROCEDURE anime_Insert;
DROP PROCEDURE cartoon_Insert;
DROP TRIGGER on_Update;
DROP TRIGGER on_Insert;

DELIMITER $$

    /*
     * Creating anime_Insert and cartoon_Insert PROCEDURE to easily insert data into the table.
     */
     CREATE PROCEDURE anime_Insert(show_Name VARCHAR(255), ani_Season ENUM('Spring', 'Summer', 'Fall', 'Winter'), ani_Year INT)
     BEGIN
        INSERT INTO show_table (name, show_Type, anime_Season, anime_Year) 
        VALUES (show_Name, 'Anime', ani_Season, ani_Year);
     END $$
     
     CREATE PROCEDURE cartoon_Insert(show_Name VARCHAR(255), cart_Network VARCHAR(255), cart_Release INT)
     BEGIN
        INSERT INTO show_table (name, show_Type, carton_Network, cartoon_Release) 
        VALUES (show_Name, 'Cartoon', cart_Network, cart_Release);
     END $$
     /*
     * Trigger that make sure that no shows have the same name
     */
     CREATE TRIGGER on_Update
     BEFORE UPDATE ON show_table
     FOR EACH ROW
     BEGIN
        IF new.name IN (SELECT name FROM show_table WHERE name = new.name AND show_Type = 'Anime')
            THEN SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'That name is already in the table and it\'s classified as an anime type';
        END IF;
        IF new.name IN (SELECT name FROM show_table WHERE name = new.name AND show_Type = 'Cartoon')
            THEN SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'That name is already in the table and it\'s classified as an cartoon type';
        END IF;
    END $$
    
    /*
    * A trigger that make sure that before inserting into the table that the name is not already taken
    */
    CREATE TRIGGER on_Insert
    BEFORE INSERT ON show_table
    FOR EACH ROW
    BEGIN
        IF new.name IN (SELECT name FROM show_table WHERE name = new.name)
            THEN SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'That name is already taken';
        END IF;
    END $$

DELIMITER ;

/* Inserting data into our show table */
CALL anime_Insert('Bleach', 'Fall', 2004);
CALL anime_Insert('Demon Slayer', 'Spring', 2019);
CALL anime_Insert('Detective Conan', 'Winter', 1994);
CALL anime_Insert('Dragon Ball', 'Winter', 1986);
CALL anime_Insert('Gj-Bu', 'Winter', 2013);
CALL anime_Insert('Initial D', 'Spring', 1998);
CALL anime_Insert('Komi Can\'t Communicate', 'Fall', 2021);
CALL anime_Insert('KonoSuba', 'Winter', 2016);
CALL anime_Insert('My Hero Academia', 'Spring', 2016);
CALL anime_Insert('Naruto', 'Fall', 1999);
CALL anime_Insert('One Piece', 'Fall', 1999);
CALL anime_Insert('One Punch Man', 'Winter', 2015);
CALL anime_Insert('Spice and Wolf', 'Winter', 2008);
CALL anime_Insert('Tanaka-kun is Always Listless', 'Spring', 2016);

CALL cartoon_Insert('Adventure Time', 'Cartoon network', 2010);
CALL cartoon_Insert('Avatar: The Last Airbender', 'Nickelodeon', 2005);
CALL cartoon_Insert('Batman: The Animated Series', 'Fox Kids', 1992);
CALL cartoon_Insert('Chowder','Cartoon Network',2007);
CALL cartoon_Insert('Family Guy', 'Fox',1999);
CALL cartoon_Insert('Justice League', 'Cartoon Network',2001);
CALL cartoon_Insert('Mickey Mouse Clubhouse', 'Disney Channel', 2016);
CALL cartoon_Insert('Popeye the Sailor','Syndication', 1960);
CALL cartoon_Insert('Rick and Morty','Adult Swim',2013);
CALL cartoon_Insert('SpongeBob SquarePants','Nickelodeon',    1999);
CALL cartoon_Insert('Teen Titans','Cartoon Network',2003);
CALL cartoon_Insert('The Boondocks', 'Adult Swim',2005);
CALL cartoon_Insert('The Charlie Brown and Snoopy Show','CBS',1983);
CALL cartoon_Insert('The Simpsons','Fox',1989);
CALL cartoon_Insert('Tom and Jerry','CBS',1994);
CALL cartoon_Insert('Ultimate Spider-Man','Disney XD',2012);

SELECT * 
FROM show_table;
