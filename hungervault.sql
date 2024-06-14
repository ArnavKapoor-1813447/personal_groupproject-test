    DROP DATABASE IF EXISTS `hungervault`;

    CREATE DATABASE `hungervault`;

    USE `hungervault`;

    DROP TABLE IF EXISTS `Users`;

    CREATE TABLE `Users` (
        `user_id` int AUTO_INCREMENT,
        `username` varchar(20),
        `password` varchar(20),
        `name` VARCHAR(30),
        `surname` VARCHAR(30),
        `phone` VARCHAR(30),
        `dob` VARCHAR(30),
        `social_media_id` varchar(50),
        `role` varchar(20),
        `email_addr` varchar(255),
        PRIMARY KEY (`user_id`)
    );

    INSERT INTO `Users` (username, password, name, surname, phone, dob, social_media_id, role, email_addr)
    VALUES ('schnit', 'password', 'Schnit', 'Schnitz', '0000000000', '00/00/0000', '1', 'admin', 'mnaplayers19@gmail.com');

    -- Drop and create the UpdatesPub table
    DROP TABLE IF EXISTS `UpdatesPub`;
    CREATE TABLE `UpdatesPub` (
        `update_id` INT AUTO_INCREMENT,
        `content` MEDIUMTEXT,
        PRIMARY KEY (`update_id`)
    );

    -- Drop and create the UpdatesPriv table
    DROP TABLE IF EXISTS `UpdatesPriv`;
    CREATE TABLE `UpdatesPriv` (
        `update_id` INT AUTO_INCREMENT,
        `content` MEDIUMTEXT,
        `user_id` INT,
        PRIMARY KEY (`update_id`),
        FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
    );

    DROP TABLE IF EXISTS `User_config`;

    CREATE TABLE `User_config` (
        `conf_id` int AUTO_INCREMENT,
        `rsvp_emails` boolean,
        `announcement_emails` boolean,
        `user_id` int,
        PRIMARY KEY (`conf_id`),
        FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
    );

    DROP TABLE IF EXISTS `Organisations`;

    CREATE TABLE `Organisations` (
        `org_id` int AUTO_INCREMENT,
        `name` varchar(50),
        `description` varchar(1000),
        `admin_id` int,
        PRIMARY KEY (`org_id`),
        FOREIGN KEY (`admin_id`) REFERENCES `Users` (`user_id`)
    );

    INSERT INTO `Organisations` (name, description, admin_id) VALUES ('hungervault', 'A vault for hunger', '1');

    DROP TABLE IF EXISTS `Branches`;

    CREATE TABLE `Branches` (
        `branch_id` int AUTO_INCREMENT,
        `name` varchar(100),
        `location` varchar(50),
        `is_active` boolean,
        `organisation_id` int,
        `manager_id` int,
        PRIMARY KEY (`branch_id`),
        FOREIGN KEY (`organisation_id`) REFERENCES `Organisations` (`org_id`),
        FOREIGN KEY (`manager_id`) REFERENCES `Users` (`user_id`)
    );

    INSERT INTO `Branches` (name, location, is_active, organisation_id, manager_id) VALUES('South Australia', 'SA', True, '1', '1');

    -- get event info

    -- select e.title, e.description
    -- from Events e
    -- join RSVP r on r.event_id = e.event_id
    -- where r.user_id = `user_id_val`

    DROP TABLE IF EXISTS `Events`;

    CREATE TABLE `Events` (
        `event_id` int AUTO_INCREMENT,
        `title` varchar(200),
        `description` varchar(1000),
        `location` varchar(100),
        `start_datetime` DATETIME, -- YYYY-MM-DD hh:mm:ss
        `end_datetime` DATETIME,
        `branch_id`  int,
        `display_image_path` varchar(255),
        PRIMARY KEY (`event_id`),
        FOREIGN KEY (`branch_id`) REFERENCES `Branches` (`branch_id`)
    );

    INSERT INTO `Events` (title, description, location, start_datetime, end_datetime, branch_id, display_image_path)
    VALUES('Barbecue', 'Smokin dogs and shit',
    'Adelaide', '2024-06-14 09:00:00', '2024-06-14 12:00:00', '1', '/images/barbecue.png');

    INSERT INTO `Events`  (title, description, location, start_datetime, end_datetime, branch_id, display_image_path)
    VALUES('Dodgeball', 'Smackin balls and crap','Adelaide', '2024-06-20 14:00:00', '2024-06-20 18:00:00', '1', '/images/logo.png');

    INSERT INTO `Events`  (title, description, location, start_datetime, end_datetime, branch_id, display_image_path)
    VALUES('Game Night', 'Playin monopoly and stuff', 'Adelaide', '2024-06-19 14:00:00', '2024-06-19 18:00:00', '1', '/images/gamenight.png');

    DROP TABLE IF EXISTS `Email`;

    CREATE TABLE `Email` (
        `email_id` int AUTO_INCREMENT,
        `dest_addr` varchar(100),
        `subject` varchar(50),
        `contents` varchar(1000),
        `user_id` int,
        PRIMARY KEY (`email_id`),
        FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
    );

    DROP TABLE IF EXISTS `RSVP`;

    CREATE TABLE `RSVP`(
        `rsvp_id` int AUTO_INCREMENT,
        `response` varchar(100),
        `event_id` int,
        `user_id` int,
        PRIMARY KEY (`rsvp_id`),
        UNIQUE KEY `unique_event_user` (`event_id`, `user_id`),
        FOREIGN KEY (`event_id`) REFERENCES `Events` (`event_id`),
        FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
    );

    INSERT INTO `RSVP` (response, event_id, user_id) VALUES('Yes', '1', '1');


    DROP TABLE IF EXISTS `Notification`;

    CREATE TABLE `Notification`(
        `noti_id` int AUTO_INCREMENT,
        `event_type` varchar(50),
        `is_active` boolean,
        `user_id` int,
        `email_id` int,
        PRIMARY KEY (`noti_id`),
        FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
        FOREIGN KEY (`email_id`) REFERENCES `Email` (`email_id`)
    );



