/*
 * Connecting to DB:
 * 1) Create a new Data Source (Mysql)
 * 2) Go to the ssh tab and check the box and then click on the three dots to edit properties
 * 3) For ssh host put in: ecs-pd-proj-db.ecs.csus.edu and for user and password, it will be your school user and pass
 * 4) Now run test and see if it works and if it did click apply
 * 5) Now head over to general and then fill in the user and pass with the given database user and pass provided by
 * the professor from CSC 174
 */
SHOW TABLES;


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
    CREATE PROCEDURE anime_Insert(show_Name VARCHAR(255), ani_Season ENUM
        ('Spring', 'Summer', 'Fall', 'Winter'), ani_Year INT)
    BEGIN
        INSERT INTO show_table (name, show_Type, anime_Season, anime_Year) VALUES
        (show_Name, 'Anime', ani_Season, ani_Year);
    end $$

    CREATE PROCEDURE cartoon_Insert(show_Name VARCHAR(255), cart_Network
        VARCHAR(255), cart_Release INT)
    BEGIN
        INSERT INTO show_table (name, show_Type, carton_Network,
        cartoon_Release) VALUES (show_Name, 'Cartoon', cart_Network,
                                 cart_Release);
    end $$

CREATE TRIGGER on_Update
    BEFORE UPDATE ON show_table
    FOR EACH ROW
    BEGIN
        IF new.name IN (SELECT name FROM show_table WHERE name = new.name
                                                    AND show_Type = 'Anime')
            THEN SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'That name is already in the table and it\'s
classified as an anime type';
        END IF;
        IF new.name IN (SELECT name FROM show_table WHERE name = new.name
                                                    AND show_Type = 'Cartoon')
            THEN SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'That name is already in the table and it\'s
classified as an cartoon type';
        END IF;
    END $$

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

CALL anime_Insert('test2', 'Spring', 2000);
CALL cartoon_Insert('test1', 'CN', 2000);

TRUNCATE show_table;
SELECT * FROM show_table;

UPDATE show_table SET name = 'test2' WHERE show_id = 1;