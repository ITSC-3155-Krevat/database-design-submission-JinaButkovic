DROP DATABASE IF EXISTS songs;
CREATE DATABASE IF NOT EXISTS songs;
USE songs;

CREATE TABLE IF NOT EXISTS song (
song_id INT 	auto_increment,
title VARCHAR(255) NOT NULL,
artist_id INT, 
duration INT NOT NULL, 
genre VARCHAR(255) NOT NULL, 
explicit BOOL 	NULL DEFAULT FALSE,
song_link VARCHAR(255) NOT NULL,
PRIMARY KEY(song_id),
FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE IF NOT EXISTS artist (
artist_id INT 	auto_increment,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
date_birth DATE 	NOT NULL, 
PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS favorites(
song_id INT 	auto_increment,
PRIMARY KEY (song_id)
);

CREATE TABLE IF NOT EXISTS genre(
genre_id INT 	auto_increment,
genre_name VARCHAR(255) NOT NULL,
PRIMARY KEY (genre_id)
);

CREATE TABLE IF NOT EXISTS song_genre(
song_id INT,
genre_id INT, 
PRIMARY KEY(song_id, genre_id),
FOREIGN KEY (song_id) REFERENCES song(song_id),
FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE IF NOT EXISTS playlist(
playlist_id INT, 
song_rank INT	 NOT NULL,
PRIMARY KEY(playlist_id)
);

CREATE TABLE IF NOT EXISTS song_playlist(
song_id INT,
playlist_id INT, 
PRIMARY KEY(song_id, playlist_id),
FOREIGN KEY (song_id) REFERENCES song(song_id),
FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id)
);
