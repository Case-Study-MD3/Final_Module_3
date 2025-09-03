create database cinema;
use cinema;

create table movies(
movie_id int auto_increment,
movie_name varchar(200) not null,
movie_genre varchar(50) not null,
movie_duration int not null,
movie_date date not null,
primary key(movie_id)
);

ALTER TABLE showtimes ADD total_seats INT NOT NULL DEFAULT 50;
create table showtimes(
showtime_id int auto_increment,
movie_id int,
room_id int,
showtime_start_time datetime not null,
showtime_price decimal not null,
primary key(showtime_id),
foreign key(movie_id) references movies(movie_id)
);

create table customers(
customer_id int auto_increment,
customer_name varchar(100) not null,
primary key(customer_id)
);

create table phone(
phone_id int auto_increment,
customer_id int,
phone_num int not null,
primary key(phone_id),
foreign key(customer_id) references customers(customer_id)
);

alter table tickets modify ticket_seat varchar(10) not null unique;
create table tickets(
ticket_id int auto_increment,
customer_id int,
showtime_id int,
ticket_seat varchar(10) not null,
ticket_booking_date datetime not null,
primary key(ticket_id),
foreign key(customer_id) references customers(customer_id),
foreign key(showtime_id) references showtimes(showtime_id)
);

INSERT INTO movies (movie_name, movie_genre, movie_duration, movie_date)
VALUES
('Avengers: Endgame', 'Action', 180, '2025-08-01'),
('The Conjuring 3', 'Horror', 112, '2025-08-05'),
('Fast & Furious 10', 'Action', 145, '2025-08-10'),
('Minions: The Rise of Gru', 'Animation', 90, '2025-08-15'),
('Oppenheimer', 'Drama', 180, '2025-08-20'),
('Spider-Man: No Way Home', 'Action', 150, '2025-08-22'),
('Frozen II', 'Animation', 103, '2025-08-25'),
('Inception', 'Sci-Fi', 148, '2025-08-28'),
('Joker', 'Drama', 122, '2025-08-30');

INSERT INTO showtimes (movie_id, room_id, showtime_start_time, showtime_price)
VALUES
(1, 1, '2025-08-27 14:00:00', 120000),
(2, 2, '2025-08-27 18:30:00', 100000),
(3, 1, '2025-08-28 20:00:00', 130000),
(4, 2, '2025-08-28 16:00:00', 90000),
(5, 1, '2025-08-29 19:00:00', 150000),
(6, 2, '2025-08-30 21:00:00', 140000),
(7, 1, '2025-08-31 10:00:00', 95000),
(8, 2, '2025-09-01 17:00:00', 125000),
(9, 1, '2025-09-02 20:30:00', 110000);

INSERT INTO customers (customer_name)
VALUES
('Nguyen Van A'),
('Tran Thi B'),
('Le Van C'),
('Pham Thi D'),
('Hoang Van E'),
('Do Thi F'),
('Nguyen Van G'),
('Tran Van H'),
('Le Thi I');

INSERT INTO phone (customer_id, phone_num)
VALUES
(1, 912345678),
(2, 934567890),
(3, 956789012),
(4, 978901234),
(5, 991234567),
(6, 923456789),
(7, 945678901),
(8, 967890123),
(9, 989012345);

INSERT INTO tickets (customer_id, showtime_id, ticket_seat, ticket_booking_date)
VALUES
(1, 1, 'A1', '2025-08-26 10:00:00'),
(2, 2, 'B2', '2025-08-26 11:30:00'),
(3, 3, 'C3', '2025-08-27 09:00:00'),
(4, 4, 'D4', '2025-08-27 14:15:00'),
(5, 5, 'E5', '2025-08-28 13:45:00'),
(6, 6, 'F6', '2025-08-28 18:20:00'),
(7, 7, 'G7', '2025-08-29 16:30:00'),
(8, 8, 'H8', '2025-08-30 12:10:00'),
(9, 9, 'I9', '2025-08-31 09:55:00');

UPDATE showtimes SET total_seats = 80 WHERE showtime_id = 1; -- Avengers
UPDATE showtimes SET total_seats = 70 WHERE showtime_id = 2; -- Conjuring
UPDATE showtimes SET total_seats = 75 WHERE showtime_id = 3; -- Fast & Furious
UPDATE showtimes SET total_seats = 50 WHERE showtime_id = 4; -- Minions
UPDATE showtimes SET total_seats = 90 WHERE showtime_id = 5; -- Oppenheimer
UPDATE showtimes SET total_seats = 85 WHERE showtime_id = 6; -- Spider-Man
UPDATE showtimes SET total_seats = 50 WHERE showtime_id = 7; -- Frozen II
UPDATE showtimes SET total_seats = 70 WHERE showtime_id = 8; -- Inception
UPDATE showtimes SET total_seats = 65 WHERE showtime_id = 9; -- Joker

select * from showtimes;
select * from tickets;

alter table movies add column images varchar(200);
update movies set images = "images/avengersEndgamejpg.jpg" where movie_name = 'Avengers: Endgame';
update movies set images = "images/conjuring.jpg" where movie_name = 'The Conjuring 3';
update movies set images = "images/gr9KBOV.jpg" where movie_name = 'Fast & Furious 10';
update movies set images = "images/minions-.jpg" where movie_name = 'Minions: The Rise of Gru';
update movies set images = "images/oppenheimer.jpg" where movie_name = 'Oppenheimer';
update movies set images = "images/spiderman.jpeg" where movie_name = 'Spider-Man: No Way Home';
update movies set images = "images/frozenII.jpg" where movie_name = 'Frozen II';
update movies set images = "images/inception.jpg" where movie_name = 'Inception';
update movies set images = "images/joker.jpg" where movie_name = 'Joker';

select * from movies;