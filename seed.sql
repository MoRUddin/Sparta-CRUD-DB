DROP TABLE IF EXISTS users;

create table users (
  id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50)
);
INSERT INTO users (first_name, last_name, email) VALUES ('Marianna', 'Mallaby', 'mmallaby0@reference.com');
INSERT INTO users (first_name, last_name, email) VALUES ('Gayel', 'Chazerand', 'gchazerand1@oaic.gov.au');
INSERT INTO users (first_name, last_name, email) VALUES ('Neddy', 'McAuslene', 'nmcauslene2@foxnews.com');
INSERT INTO users (first_name, last_name, email) VALUES ('Lizabeth', 'Quincey', 'lquincey3@odnoklassniki.ru');
INSERT INTO users (first_name, last_name, email) VALUES ('Matti', 'Christy', 'mchristy4@answers.com');
INSERT INTO users (first_name, last_name, email) VALUES ('Carolee', 'Lawley', 'clawley5@slate.com');
INSERT INTO users (first_name, last_name, email) VALUES ('Gregory', 'Leving', 'gleving6@mlb.com');
INSERT INTO users (first_name, last_name, email) VALUES ('Vanny', 'Rubartelli', 'vrubartelli7@jigsy.com');
INSERT INTO users (first_name, last_name, email) VALUES ('Roman', 'Rome', 'rrome8@typepad.com');
INSERT INTO users (first_name, last_name, email) VALUES ('Demetris', 'Lakin', 'dlakin9@army.mil');

DROP TABLE IF EXISTS colors;

create table colors (
  id SERIAL PRIMARY KEY,
  favourite_colour VARCHAR(20)
);
INSERT INTO colors (favourite_colour) VALUES ('red');
INSERT INTO colors (favourite_colour) VALUES ('blue');
INSERT INTO colors (favourite_colour) VALUES ('green');
INSERT INTO colors (favourite_colour) VALUES ('white');
INSERT INTO colors (favourite_colour) VALUES ('black');
INSERT INTO colors (favourite_colour) VALUES ('brown');
INSERT INTO colors (favourite_colour) VALUES ('red');
INSERT INTO colors (favourite_colour) VALUES ('blue');
INSERT INTO colors (favourite_colour) VALUES ('green');
INSERT INTO colors (favourite_colour) VALUES ('blue');
