CREATE TABLE show(
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    show_Type ENUM('Anime', 'Cartoon'),
    anime_Season VARCHAR(255),
    year INT,
    carton_Network VARCHAR(255),
    release_Year INT
);
