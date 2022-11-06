SHOW TABLES;
SHOW TRIGGERS;

DROP TABLE user_table;
DROP TABLE user_input;
DROP PROCEDURE get_shows;
DROP TRIGGER after_insert_into_user_input;
DROP TRIGGER on_delete_from_user_table;
DROP TRIGGER before_update_user_table;


CREATE TABLE user_input(
    show_id INT NOT NULL,
    PRIMARY KEY (show_id),
    FOREIGN KEY (show_id) REFERENCES show_table(show_id)
);

CREATE TABLE user_table
(
    show_id         INT          NOT NULL,
    name            VARCHAR(255) NOT NULL,
    show_Type       ENUM ('anime','cartoon'),
    anime_Season    ENUM('Spring', 'Summer', 'Fall', 'Winter'),
    anime_Year      INT,
    cartoon_Network VARCHAR(255),
    cartoon_Release INT,
    FOREIGN KEY (show_id)
        REFERENCES user_input(show_id)
);

DELIMITER $$
CREATE TRIGGER after_insert_into_user_input
    AFTER INSERT ON user_input
    FOR EACH ROW
    BEGIN
        INSERT INTO user_table SELECT * FROM show_table WHERE show_id = new.show_id;
    END $$

CREATE TRIGGER on_delete_from_user_table
    AFTER DELETE on user_table
    FOR EACH ROW
    BEGIN
        DELETE FROM user_input WHERE show_id = old.show_id;
    end $$

CREATE TRIGGER before_update_user_table
    BEFORE UPDATE ON user_table
    FOR EACH ROW
    BEGIN
        IF new.show_id IN (SELECT show_id FROM user_table WHERE show_id = new.show_id)
            THEN SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot Update to Existing Show ID';
        END IF;
    END $$

CREATE PROCEDURE get_shows(typeShow enum('Anime', 'Cartoon'))
    BEGIN
        IF typeShow = 'Anime'
            THEN
                SELECT name, show_Type, anime_Season, anime_Year FROM user_table WHERE show_Type = 'Anime';
        END IF;
        IF typeShow = 'Cartoon'
            THEN
                SELECT name, show_Type, cartoon_Network, cartoon_Release FROM user_table WHERE show_Type = 'Cartoon';
        END IF;
    END $$
DELIMITER ;

SELECT*FROM user_input;
SELECT*FROM user_table;
SELECT*FROM show_table;

TRUNCATE user_table;
TRUNCATE user_input;


INSERT INTO user_input VALUES (1);
INSERT INTO user_input VALUES (2);
INSERT INTO user_input VALUES (4);


CALL get_shows('Anime');
CALL get_shows('Cartoon');


DELETE FROM user_input WHERE show_id = 2;
DELETE FROM user_table WHERE show_id = 4;

UPDATE user_table SET show_id = 2 WHERE show_id = 1;