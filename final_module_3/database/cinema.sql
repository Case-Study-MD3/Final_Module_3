-- Tạo database và chọn sử dụng
CREATE DATABASE IF NOT EXISTS cinema;
USE cinema;

-- Bảng customers
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO customers VALUES
(1,'Nguyen Van A'),
(2,'Tran Thi B'),
(3,'Le Van C'),
(4,'Pham Thi D'),
(5,'Hoang Van E'),
(6,'Do Thi F'),
(7,'Nguyen Van G'),
(8,'Tran Van H'),
(9,'Le Thi I');

-- Bảng movies
DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
  movie_id INT NOT NULL AUTO_INCREMENT,
  movie_name VARCHAR(200) NOT NULL,
  movie_genre VARCHAR(50) NOT NULL,
  movie_duration INT NOT NULL,
  movie_date DATE NOT NULL,
  images VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (movie_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO movies VALUES
(1,'Avengers: Endgame','Action',180,'2025-08-01','images/avengersEndgamejpg.jpg'),
(2,'The Conjuring 3','Horror',112,'2025-08-05','images/conjuring.jpg'),
(3,'Fast & Furious 10','Action',145,'2025-08-10','images/gr9KBOV.jpg'),
(4,'Minions: The Rise of Gru','Animation',90,'2025-08-15','images/minions-.jpg'),
(5,'Oppenheimer','Drama',180,'2025-08-20','images/oppenheimer.jpg'),
(6,'Spider-Man: No Way Home','Action',150,'2025-08-22','images/spiderman.jpeg'),
(7,'Frozen II','Animation',103,'2025-08-25','images/frozenII.jpg'),
(8,'Inception','Sci-Fi',148,'2025-08-28','images/inception.jpg'),
(9,'Joker','Drama',122,'2025-08-30','images/joker.jpg');

-- Bảng phone
DROP TABLE IF EXISTS phone;
CREATE TABLE phone (
  phone_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT DEFAULT NULL,
  phone_num INT NOT NULL,
  PRIMARY KEY (phone_id),
  KEY customer_id (customer_id),
  CONSTRAINT phone_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO phone VALUES
(1,1,912345678),
(2,2,934567890),
(3,3,956789012),
(4,4,978901234),
(5,5,991234567),
(6,6,923456789),
(7,7,945678901),
(8,8,967890123),
(9,9,989012345);

-- Bảng showtimes
DROP TABLE IF EXISTS showtimes;
CREATE TABLE showtimes (
  showtime_id INT NOT NULL AUTO_INCREMENT,
  movie_id INT DEFAULT NULL,
  room_id INT DEFAULT NULL,
  showtime_start_time DATETIME NOT NULL,
  showtime_price DECIMAL(10,0) NOT NULL,
  total_seats INT NOT NULL DEFAULT 50,
  PRIMARY KEY (showtime_id),
  KEY movie_id (movie_id),
  CONSTRAINT showtimes_ibfk_1 FOREIGN KEY (movie_id) REFERENCES movies (movie_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO showtimes VALUES
(1,1,1,'2025-08-27 14:00:00',120000,70),
(2,2,2,'2025-08-27 18:30:00',100000,59),
(3,3,1,'2025-08-28 20:00:00',130000,70),
(4,4,2,'2025-08-28 16:00:00',90000,50),
(5,5,1,'2025-08-29 19:00:00',150000,90),
(6,6,2,'2025-08-30 21:00:00',140000,80),
(7,7,1,'2025-08-31 10:00:00',95000,50),
(8,8,2,'2025-09-01 17:00:00',125000,70),
(9,9,1,'2025-09-02 20:30:00',110000,60);

-- Bảng tickets
DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets (
  ticket_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT DEFAULT NULL,
  showtime_id INT DEFAULT NULL,
  ticket_seat VARCHAR(10) NOT NULL,
  ticket_booking_date DATETIME NOT NULL,
  PRIMARY KEY (ticket_id),
  UNIQUE KEY ticket_seat (ticket_seat),
  KEY customer_id (customer_id),
  KEY showtime_id (showtime_id),
  CONSTRAINT tickets_ibfk_1 FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  CONSTRAINT tickets_ibfk_2 FOREIGN KEY (showtime_id) REFERENCES showtimes (showtime_id)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO tickets VALUES
(1,1,1,'A1','2025-08-26 10:00:00'),
(2,2,2,'B2','2025-08-26 11:30:00'),
(3,3,3,'C3','2025-08-27 09:00:00'),
(4,4,4,'D4','2025-08-27 14:15:00'),
(5,5,5,'E5','2025-08-28 13:45:00'),
(6,6,6,'F6','2025-08-28 18:20:00'),
(7,7,7,'G7','2025-08-29 16:30:00'),
(8,8,8,'H8','2025-08-30 12:10:00'),
(9,9,9,'I9','2025-08-31 09:55:00'),
(10,1,2,'A2','2025-08-27 18:30:00'),
(11,1,2,'A3','2025-08-27 18:30:00'),
(12,1,2,'A4','2025-08-27 18:30:00'),
(13,1,2,'A5','2025-08-27 18:30:00'),
(14,1,2,'A6','2025-08-27 18:30:00'),
(15,1,2,'A7','2025-08-27 18:30:00'),
(16,1,2,'A8','2025-08-27 18:30:00'),
(17,1,2,'A9','2025-08-27 18:30:00');

 
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20)
   
);

INSERT INTO employees (name, email, phone_number) VALUES
('Nguyen Van A', 'vana@example.com', '0905123456'),
('Tran Thi B', 'thib@example.com', '0906789123'),
('Le Van C', 'vanc@example.com', '0912345678'),
('Pham Thi D', 'thid@example.com', '0934567891'),
('Hoang Van E', 'vane@example.com', '0987654321');

select * from employees;