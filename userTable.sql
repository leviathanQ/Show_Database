CREATE TABLE User_Table (
    show_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    show_Type ENUM ('anime','cartoon'),
    anime_Season VARCHAR(255),
    year INT,
    cartoon_Network VARCHAR(255),
    release_Year INT
);