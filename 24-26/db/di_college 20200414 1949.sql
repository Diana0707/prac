﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.2.23.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 14.04.2020 19:49:54
-- Server version: 5.5.5-10.3.13-MariaDB-log
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE di_college;

--
-- Drop table `di__graduate_time`
--
DROP TABLE IF EXISTS di__graduate_time;

--
-- Drop table `di_classroom`
--
DROP TABLE IF EXISTS di_classroom;

--
-- Drop table `di_day`
--
DROP TABLE IF EXISTS di_day;

--
-- Drop table `di_lesson_num`
--
DROP TABLE IF EXISTS di_lesson_num;

--
-- Drop table `di_graduate`
--
DROP TABLE IF EXISTS di_graduate;

--
-- Drop table `di_course`
--
DROP TABLE IF EXISTS di_course;

--
-- Drop table `di__student`
--
DROP TABLE IF EXISTS di__student;

--
-- Drop table `di_gruppa`
--
DROP TABLE IF EXISTS di_gruppa;

--
-- Drop table `di_special`
--
DROP TABLE IF EXISTS di_special;

--
-- Drop table `di_teacher`
--
DROP TABLE IF EXISTS di_teacher;

--
-- Drop table `di_otdel`
--
DROP TABLE IF EXISTS di_otdel;

--
-- Drop table `di_user`
--
DROP TABLE IF EXISTS di_user;

--
-- Drop table `di_gender`
--
DROP TABLE IF EXISTS di_gender;

--
-- Set default database
--
USE di_college;

--
-- Create table `di_gender`
--
CREATE TABLE di_gender (
  gender_id tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (gender_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create table `di_user`
--
CREATE TABLE di_user (
  user_id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  lastname varchar(255) NOT NULL,
  firstname varchar(255) NOT NULL,
  patronomic varchar(255) NOT NULL,
  login varchar(255) NOT NULL,
  pass varchar(255) NOT NULL,
  gender_id tinyint(4) UNSIGNED NOT NULL,
  birthday date NOT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE di_user
ADD CONSTRAINT FK_di_user_di_gender_gender_id FOREIGN KEY (gender_id)
REFERENCES di_gender (gender_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `di_otdel`
--
CREATE TABLE di_otdel (
  otdel_id smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (otdel_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create table `di_teacher`
--
CREATE TABLE di_teacher (
  user_id bigint(20) UNSIGNED NOT NULL,
  otdel_id smallint(6) UNSIGNED NOT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE di_teacher
ADD CONSTRAINT FK_di_teacher_di_otdel_otdel_id FOREIGN KEY (otdel_id)
REFERENCES di_otdel (otdel_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE di_teacher
ADD CONSTRAINT FK_di_teacher_di_user_user_id FOREIGN KEY (user_id)
REFERENCES di_user (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `di_special`
--
CREATE TABLE di_special (
  special_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  otdel_id smallint(6) UNSIGNED NOT NULL,
  PRIMARY KEY (special_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE di_special
ADD CONSTRAINT FK_di_special_di_otdel_otdel_id FOREIGN KEY (otdel_id)
REFERENCES di_otdel (otdel_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `di_gruppa`
--
CREATE TABLE di_gruppa (
  gruppa_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  special_id int(11) UNSIGNED NOT NULL,
  date_begin date NOT NULL,
  date_end date NOT NULL,
  PRIMARY KEY (gruppa_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE di_gruppa
ADD CONSTRAINT FK_di_gruppa_di_special_special_id FOREIGN KEY (special_id)
REFERENCES di_special (special_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `di__student`
--
CREATE TABLE di__student (
  user_id bigint(20) UNSIGNED NOT NULL,
  gruppa_id int(11) UNSIGNED NOT NULL,
  num_zach varchar(255) NOT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE di__student
ADD CONSTRAINT FK_di__student_di_gruppa_gruppa_id FOREIGN KEY (gruppa_id)
REFERENCES di_gruppa (gruppa_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE di__student
ADD CONSTRAINT FK_di__student_di_user_user_id FOREIGN KEY (user_id)
REFERENCES di_user (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `di_course`
--
CREATE TABLE di_course (
  course_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  special_id int(11) UNSIGNED NOT NULL,
  hours smallint(6) UNSIGNED NOT NULL,
  PRIMARY KEY (course_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE di_course
ADD CONSTRAINT FK_di_course_di_special_special_id FOREIGN KEY (special_id)
REFERENCES di_special (special_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `di_graduate`
--
CREATE TABLE di_graduate (
  graduate_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  gruppa_id int(11) UNSIGNED NOT NULL,
  course_id int(11) UNSIGNED NOT NULL,
  user_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (graduate_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE di_graduate
ADD CONSTRAINT FK_di_graduate_di_course_course_id FOREIGN KEY (course_id)
REFERENCES di_course (course_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE di_graduate
ADD CONSTRAINT FK_di_graduate_di_gruppa_gruppa_id FOREIGN KEY (gruppa_id)
REFERENCES di_gruppa (gruppa_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE di_graduate
ADD CONSTRAINT FK_di_graduate_di_teacher_user_id FOREIGN KEY (user_id)
REFERENCES di_teacher (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create table `di_lesson_num`
--
CREATE TABLE di_lesson_num (
  lesson_num_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  time_lesson time NOT NULL,
  year_lesson year(4) NOT NULL,
  PRIMARY KEY (lesson_num_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create table `di_day`
--
CREATE TABLE di_day (
  day_id tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (day_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create table `di_classroom`
--
CREATE TABLE di_classroom (
  classroom_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (classroom_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create table `di__graduate_time`
--
CREATE TABLE di__graduate_time (
  graduate_time_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  graduate_id int(11) UNSIGNED NOT NULL,
  day_id tinyint(4) UNSIGNED NOT NULL,
  lesson_num_id int(11) UNSIGNED NOT NULL,
  classroom_id int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (graduate_time_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE di__graduate_time
ADD CONSTRAINT FK_di__graduate_time_di_classroom_classroom_id FOREIGN KEY (classroom_id)
REFERENCES di_classroom (classroom_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE di__graduate_time
ADD CONSTRAINT FK_di__graduate_time_di_day_day_id FOREIGN KEY (day_id)
REFERENCES di_day (day_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE di__graduate_time
ADD CONSTRAINT FK_di__graduate_time_di_graduate_graduate_id FOREIGN KEY (graduate_id)
REFERENCES di_graduate (graduate_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE di__graduate_time
ADD CONSTRAINT FK_di__graduate_time_di_lesson_num_lesson_num_id FOREIGN KEY (lesson_num_id)
REFERENCES di_lesson_num (lesson_num_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Dumping data for table di_gender
--
INSERT INTO di_gender VALUES
(1, 'муж'),
(2, 'жен');

-- 
-- Dumping data for table di_user
--
INSERT INTO di_user VALUES
(1, 'Иванов', 'Иван', 'Иванович', 'ivan', '111', 1, '1975-05-25'),
(2, 'Петров', 'Петр', 'Петрович', 'petr', '222', 1, '1980-08-06'),
(3, 'Козлов', 'Иван', 'Иван', 'kozl', '333', 1, '1985-04-15'),
(4, 'Чурюмова', 'Кристина', 'Федоровна', 'kristi', '444', 2, '1990-05-20'),
(5, 'Васильев', 'Феофан', 'Александрович', 'feo', '555', 1, '1991-01-13'),
(6, 'Федорова', 'Милана', 'Андреевна', 'mila', '666', 2, '1998-04-15'),
(7, 'Нуржанов', 'Нуржан', 'Нуржанович', 'nyr', '777', 1, '1999-09-18'),
(8, 'Канатов', 'Канат', 'Канатович', 'kanat', '888', 1, '1999-07-07'),
(9, 'Золотая', 'Ирина', 'Кайратовна', 'irina', '999', 2, '2000-09-14'),
(10, 'Серая', 'Арина', 'Радионовна', 'ari', '101010', 2, '2001-10-29'),
(11, 'Петухов', 'Виталий', 'Фадеевич', 'vitya', '111111', 1, '2000-02-20'),
(12, 'Котова', 'Аурелия', 'Ароновна', 'kot', '121212', 2, '2002-12-19');

-- 
-- Dumping data for table di_otdel
--
INSERT INTO di_otdel VALUES
(1, 'Информационные системы'),
(2, 'Технические специальности'),
(3, 'Автоматизация и управление');

-- 
-- Dumping data for table di_special
--
INSERT INTO di_special VALUES
(1, 'Информационные системы', 1),
(2, 'Нефтегазовое дело', 2),
(3, 'Автоматизация и управление', 3),
(4, 'Электроснабжение', 3),
(5, 'Программное обеспечение ВТ и', 1),
(6, 'Строительство и эксплуатация', 2);

-- 
-- Dumping data for table di_teacher
--
INSERT INTO di_teacher VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);

-- 
-- Dumping data for table di_course
--
INSERT INTO di_course VALUES
(1, 'Основы алгоритмизации', 1, 90),
(2, 'Электротехника', 3, 106),
(3, 'Основы алгоритмизации', 5, 52),
(4, 'Мультимедиа технологии', 1, 36),
(5, 'Техническая механика', 6, 96),
(6, 'Промышленная электротехника', 4, 108),
(7, 'Автоматизированные информационные', 1, 86);

-- 
-- Dumping data for table di_gruppa
--
INSERT INTO di_gruppa VALUES
(1, '101 ИС', 1, '2016-09-01', '2020-07-01'),
(2, '102 АС', 3, '2016-09-01', '2020-07-01'),
(3, '302 ИС', 1, '2014-09-01', '2018-07-01'),
(4, '302 АС', 3, '2014-09-01', '2018-07-01'),
(5, '202 С', 5, '2015-09-01', '2019-07-01'),
(6, '404 П', 6, '2014-09-01', '2017-07-01'),
(7, '303 ЭЛ', 4, '2014-09-01', '2018-07-01');

-- 
-- Dumping data for table di_lesson_num
--
-- Table di_college.di_lesson_num does not contain any data (it is empty)

-- 
-- Dumping data for table di_graduate
--
-- Table di_college.di_graduate does not contain any data (it is empty)

-- 
-- Dumping data for table di_day
--
INSERT INTO di_day VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота'),
(7, 'Воскресенье');

-- 
-- Dumping data for table di_classroom
--
-- Table di_college.di_classroom does not contain any data (it is empty)

-- 
-- Dumping data for table di__student
--
INSERT INTO di__student VALUES
(6, 1, 'K1020'),
(7, 2, 'А5292'),
(8, 2, 'В8578'),
(9, 5, 'Р5285'),
(10, 4, 'Ф5285'),
(11, 1, 'К7485'),
(12, 3, 'А2585');

-- 
-- Dumping data for table di__graduate_time
--
-- Table di_college.di__graduate_time does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;