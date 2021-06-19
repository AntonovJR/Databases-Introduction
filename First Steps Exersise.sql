USE `minions`;
CREATE TABLE `minions`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`age` INT 
);
CREATE TABLE `towns`(
`town_id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL
);

ALTER TABLE `minions` 
ADD COLUMN `town_id` INT,
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY `minions`(`town_id`)
REFERENCES `towns`(`id`);

INSERT INTO `towns`
VALUES
(1,'Sofia'),
(2,'Plovidv'),
(3,'Varna');

INSERT INTO `minions`
VALUES 
(1,'Kevin',22,1),
(2,'Bob',15,3),
(3,'Steward',NULL,2);

-- 4
TRUNCATE `minions`;


-- 5 
DROP TABLE `minions`;
DROP TABLE `towns`;

-- 6
CREATE TABLE  `people`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`picture` BLOB,
`height` FLOAT(4,2), 
`weight` FLOAT(4,2),
`gender` CHAR(1) NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT 

);
-- 7 
CREATE TABLE  `users`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
`username` VARCHAR(30) NOT NULL,
`password` VARCHAR(26) NOT NULL,
`picture` BLOB,
`last_login_time` DATE,
`is_deleted` BOOLEAN
);
INSERT INTO `users` (`username`, `password`) 
VALUES
 ('kevinKelevra', '1234567'),
 ('lsjrg', '1234567'),
 ('kjszdsn', '1234567'),
 ('jbn', '1234567'),
 ('edefg', '1234567');
 
-- 8
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY (`id`,`username`);

-- 9
ALTER TABLE `minions`.`users` 
CHANGE COLUMN `last_login_time` `last_login_time`
 DATETIME NULL DEFAULT CURRENT_TIMESTAMP ;
 
 -- 10
 ALTER TABLE `users` 
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE;
 
 -- 11
 
CREATE SCHEMA `movies` ;
CREATE TABLE  `directors`(
`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`director_name` VARCHAR(30) NOT NULL,
`notes` TEXT
);
CREATE TABLE  `genres`(
`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`genre_name` VARCHAR(30) NOT NULL,
`notes` TEXT
);
CREATE TABLE  `categories`(
`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
`category_name` VARCHAR(30) NOT NULL,
`notes` TEXT
);
CREATE TABLE  `movies`(
`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`title` VARCHAR(50) NOT NULL,
`director_id` INT UNSIGNED,
`copyright_year` YEAR,
`length` TIME,
`genre_id` INT UNSIGNED,
`category_id` INT UNSIGNED,
`rating` DOUBLE,
`notes` TEXT
);

INSERT INTO `categories` (`category_name`) VALUES 
('category1'),
('category2'),
('category3'),
('category4'),
('category5');
INSERT INTO `directors` (`director_name`) VALUES 
('director1'),
('director2'),
('director3'),
('director4'),
('director5');
INSERT INTO `genres` (`genre_name`) VALUES 
('genre1'),
('genre2'),
('genre3'),
('genre4'),
('genre5');
INSERT INTO `movies` (`title`, `director_id`, `genre_id`, `category_id`) 
VALUES 
('Movie1', '1', '1', '1'),
('Movie2', '2', '2', '2'),
('Movie3', '3', '3', '3'),
('Movie4', '4', '4', '4'),
('Movie5', '5', '5', '5');


-- 12
CREATE SCHEMA `car_rental`;
CREATE TABLE  `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`category` VARCHAR(30),
`daily_rate` VARCHAR(30),
`weekly_rate` VARCHAR(30),
`monthly_rate` VARCHAR(30),
`weekend_rate` VARCHAR(30)
);
CREATE TABLE  `cars`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`plate_number` VARCHAR(30),
`make` VARCHAR(30),
`model` VARCHAR(30),
`car_year` YEAR,
`category_id` INT,
`doors` INT,
`picture` BLOB,
`car_condition` TEXT,
`available` BOOLEAN
);
CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`first_name` VARCHAR(30),
`last_name` VARCHAR(30),
`title` VARCHAR(30),
`notes` TEXT
);
CREATE TABLE `customers`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`driver_licence_number` VARCHAR(30),
`full_name` VARCHAR(50),
`address` TEXT,
`city` VARCHAR(30),
`zip_code` VARCHAR(30),
`notes` TEXT
);
CREATE TABLE `rental_orders`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`employee_id` INT,
`customer_id` INT,
`car_id` INT,
`car_condition` TEXT,
`tank_level` INT,
`kilometrage_start` INT,
`kilometrage_end` INT,
`start_date` DATE,
`end_date` DATE,
`total_days` INT,
`rate_applied` INT,
`tax_rate` INT,
`order_status` VARCHAR(30),
`notes` TEXT
);
INSERT INTO `categories` (`category`) VALUES 
('category1'),
('category2'),
('category3');
INSERT INTO `cars` (`make`) VALUES 
('make1'),
('make2'),
('make3');

INSERT INTO `employees` (`first_name`) VALUES 
('employee1'),
('employee2'),
('employee3');
INSERT INTO `customers` (`full_name`) 
VALUES 
('Name1'),
('Name2'),
('Name3');
INSERT INTO `rental_orders` (`employee_id`) 
VALUES 
(1),
(2),
(3);

-- 13

CREATE SCHEMA `soft_uni`;
CREATE TABLE  `towns`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`name` VARCHAR(30)
);
CREATE TABLE  `addresses`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`address_text` TEXT,
`townd_id` INT
);
CREATE TABLE  `departments`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`name` VARCHAR(30)
);
CREATE TABLE  `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE  NOT NULL,
`first_name` VARCHAR(30),
`middle_name` VARCHAR(30),
`last_name` VARCHAR(30),
`job_title` VARCHAR(30),
`department_id` INT,
`hire_date` DATE,
`salary` DOUBLE,
`address_id` INT
);
INSERT INTO `towns` (`name`) 
VALUES 
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');
INSERT INTO `departments` (`name`) 
VALUES 
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO `employees` (`first_name`,`middle_name`,`last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer',4, '2013-02-01', 3500),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer',1,'2004-03-02', 4000),
('Maria', 'Petrova', 'Ivanova','Intern',5,'2016-08-028', 525.25),
('Georgi', 'Terziev', 'Ivanov','CEO',2,'2007-12-09', 3000),
('Peter', 'Pan', 'Pan','Intern',3, '2016-08-028', 599.88);



SELECT `name`   FROM `towns`
ORDER BY `name`;
SELECT `name`  FROM `departments`
ORDER BY `name`;
SELECT `first_name`,`last_name`, `job_title`,`salary`   FROM `employees`
ORDER BY `salary` DESC;

update `employees`
set `salary` = `salary`*1.1;
select `salary`from `employees`;

DELETE FROM `employees`;


