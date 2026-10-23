CREATE TABLE IF NOT EXISTS `office` (
	`office_id` int AUTO_INCREMENT NOT NULL,
	`office_name` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(40) NOT NULL,
	`building_no` int,
	PRIMARY KEY (`office_id`)
);
CREATE TABLE IF NOT EXISTS `employee` (
	`employee_id` int AUTO_INCREMENT NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`position` varchar(15) NOT NULL,
	`employment_date` date NOT NULL,
	`office_id` int,
	`manager_id` int,
	`rate` float NOT NULL,
	`bonus` float,
	PRIMARY KEY (`employee_id`)
);
CREATE TABLE IF NOT EXISTS `client` (
	`client_id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birth_date` date NOT NULL,
	`phone_number` varchar(13) NOT NULL,
	`email` varchar(50) NOT NULL,
	`discount` int,
	PRIMARY KEY (`client_id`)
);
CREATE TABLE IF NOT EXISTS `hotel` (
	`hotel_id` int AUTO_INCREMENT NOT NULL,
	`hotel_name` varchar(40) NOT NULL,
	`country` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	`stars` int NOT NULL,
	`price_per_night	` float NOT NULL,
	PRIMARY KEY (`hotel_id`)
);
CREATE TABLE IF NOT EXISTS `tour` (
	`tour_id` int AUTO_INCREMENT NOT NULL,
	`hotel_id` int NOT NULL,
	`tour_name` varchar(50) NOT NULL,
	`country` varchar(30) NOT NULL,
	`start_date` date NOT NULL,
	`end_date` date NOT NULL,
	`price` float NOT NULL,
	`seats_total` int NOT NULL,
	PRIMARY KEY (`tour_id`)
);
CREATE TABLE IF NOT EXISTS `booking` (
	`booking_id` int AUTO_INCREMENT NOT NULL,
	`employee_id` int NOT NULL,
	`client_id` int NOT NULL,
	`tour_id` int,
	`hotel_id` int,
	`booking_date` date NOT NULL,
	`check_in_date` date,
	`check_out_date` date,
	`guests_count` int NOT NULL,
	`payment_type` varchar(15) NOT NULL,
	`payment_status` varchar(15) NOT NULL,
	PRIMARY KEY (`booking_id`)
);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk6` FOREIGN KEY (`office_id`) REFERENCES `office`(`office_id`);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk7` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `tour` ADD CONSTRAINT `tour_fk1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel`(`hotel_id`);
ALTER TABLE `booking` ADD CONSTRAINT `booking_fk1` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `booking` ADD CONSTRAINT `booking_fk2` FOREIGN KEY (`client_id`) REFERENCES `client`(`client_id`);
ALTER TABLE `booking` ADD CONSTRAINT `booking_fk3` FOREIGN KEY (`tour_id`) REFERENCES `tour`(`tour_id`);
ALTER TABLE `booking` ADD CONSTRAINT `booking_fk4` FOREIGN KEY (`hotel_id`) REFERENCES `hotel`(`hotel_id`);