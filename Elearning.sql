DROP DATABASE IF EXISTS ELEARNING;
CREATE DATABASE ELEARNING;
USE ELEARNING;
CREATE TABLE `Administrators` (
  `admin_id` varchar(10) PRIMARY KEY,
  `admin_username` varchar(100) UNIQUE NOT NULL,
  `admin_password` char(40) NOT NULL
);
CREATE TABLE `Students` (
  `student_id` varchar(10) PRIMARY KEY,
  `student_username` varchar(100) UNIQUE NOT NULL,
  `student_password` char(40) NOT NULL,
  `student_picture_link` varchar(255),
  `fname` nvarchar(20) NOT NULL,
  `lname` nvarchar(20) NOT NULL,
  `dob` date,
  `email` varchar(50),
  `phoneNo` char(15),
  `joining_date` datetime,
  `last_login` datetime,
  `num_of_enroll` int DEFAULT 0
);

CREATE TABLE  `Authors` (
  `author_id` varchar(10) PRIMARY KEY,
  `author_picture_link` varchar(255),
  `author_fname` nvarchar(20) NOT NULL,
  `author_lname` nvarchar(20) NOT NULL,
  `num_of_publish` int DEFAULT 0,
  `num_of_enrollment` int DEFAULT 0,
  `introduction` varchar(10000),
  `review_rating` decimal(1,1),
  `num_of_review` int DEFAULT 0
);

CREATE TABLE  `Subjects` (
  `subject_id` varchar(10) PRIMARY KEY,
  `subject_name` varchar(50) NOT NULL
);

CREATE TABLE  `Courses` (
  `course_id` varchar(10) PRIMARY KEY,
  `course_title` varchar(1000) NOT NULL,
  `course_youtube_link` varchar(255),
  `course_picture_link` varchar(255),
  `course_description` varchar(10000),
  `course_price` decimal(5,2)
);

CREATE TABLE  `Subject_Course` (
  `subject_id` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL
);

CREATE TABLE  `Author_Course` (
  `author_id` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL
);

CREATE TABLE `Chapters` (
  `chapter_id` varchar(10) PRIMARY KEY,
  `course_id` varchar(10),
  `chapter_title` varchar(1000)
);

CREATE TABLE  `Lessons` (
  `lesson_id` varchar(10) PRIMARY KEY,
  `course_id` varchar(10),
  `chapter_id` varchar(10),
  `lessons_youtube_link` varchar(255),
  `lessons_picture_link` varchar(255),
  `lesson_title` varchar(1000),
  `is_complete` int DEFAULT 0,
  `is_free` int DEFAULT 0
);
-- drop table `Enroll`
CREATE TABLE  `Enroll` (
  `enroll_id` varchar(10) PRIMARY KEY,
  `course_id` varchar(10),
  `student_id` varchar(10),
  `enroll_date` datetime,
  `paid_status` int(10),
  `completion_status` int DEFAULT 0
);
-- drop table  `Feedback`
CREATE TABLE  `Feedback` (
  `feedback_id` varchar(10) PRIMARY KEY,
  `course_id` varchar(10),
  `student_id` varchar(10),
  `rating_star` int,
  `feedback_description` nvarchar(10000),
  `feedback_date` datetime
);

CREATE TABLE  `Cart` (
  `cart_id` varchar(10) PRIMARY KEY,
  `student_id` varchar(10),
  `order_date` datetime,
  `quantity` int,
  `total_price` decimal(5,2),
  `pay_status` int
);

CREATE TABLE  `CartItems` (
  `cart_id` varchar(10),
  `course_id` varchar(10)
);

CREATE TABLE  `Discount` (
  `course_id` varchar(10),
  `saleoff` int
);
-- drop table `bill`
CREATE TABLE  `bill` (
  `id_bill` varchar(10) PRIMARY KEY,
  `cart_id` varchar(10),
  `pay_date` datetime,
  `pay_money` int
);

INSERT INTO Discount VALUES
    ('CS001','50'),
    ('CS002','25'),
    ('CS003','40'),
    ('CS004','75'),
    ('CS006','25'),
    ('CS007','50'),
    ('CS008','50'),
    ('CS009','40'),
    ('CS010','30'),
    ('CS011','5'),
    ('CS012','50'),
    ('CS013','0'),
    ('CS014','0'),
    ('CS015','0'),
    ('CS016','0'),
    ('CS017','0'),
    ('CS018','0'),
    ('CS019','0'),
    ('CS020','0'),
    ('CS021','0'),
    ('CS022','0'),
    ('CS023','0'),
    ('CS024','0'),
    ('CS025','0'),
    ('CS026','0'),
    ('CS027','0'),
    ('CS028','0'),
    ('CS029','0'),
    ('CS030','0');
    

-- ALTER TABLE `Courses` ADD FOREIGN KEY (`course_id`) REFERENCES `Subject_Course` (`course_id`);

-- ALTER TABLE `Authors` ADD FOREIGN KEY (`author_id`) REFERENCES `Author_Course` (`author_id`);

-- ALTER TABLE `Courses` ADD FOREIGN KEY (`course_id`) REFERENCES `Author_Course` (`course_id`);

-- ALTER TABLE `Chapters` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`);

-- ALTER TABLE `Lessons` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`);

-- ALTER TABLE `Lessons` ADD FOREIGN KEY (`chapter_id`) REFERENCES `Chapters` (`chapter_id`);

-- ALTER TABLE `Courses` ADD FOREIGN KEY (`course_id`) REFERENCES `Enroll` (`course_id`);

-- ALTER TABLE `Students` ADD FOREIGN KEY (`student_id`) REFERENCES `Enroll` (`student_id`);

-- ALTER TABLE `Feedback` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`);

-- ALTER TABLE `CartItems` ADD FOREIGN KEY (`cart_id`) REFERENCES `Cart` (`cart_id`);

-- ALTER TABLE `CartItems` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`);


INSERT INTO Lessons VALUES
    ('LS001','CS001','CT001','https://youtu.be/MAEg9cwi4aY','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 1 Preparation and Create Top Menu',NULL,NULL),
    ('LS002','CS001','CT001','https://youtu.be/9hxIAIc0Si0','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P 2 Create Main menu',NULL,NULL),
    ('LS003','CS001','CT001','https://youtu.be/xr7VPSV-gjg','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P 3 Create Slider Home Page',NULL,NULL),
    ('LS004','CS001','CT001','https://youtu.be/jNlb6q1hbmE','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 4 Create Store Introduction Box',NULL,NULL),
    ('LS005','CS001','CT001','https://youtu.be/9ccjyQnfEMc','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P-5 Create Product Storefront',NULL,NULL),
    ('LS006','CS001','CT001','https://youtu.be/GlGD99LBiHE','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P-6 Create Footer',NULL,NULL),
    ('LS007','CS001','CT001','https://youtu.be/sWQwnYvumGc','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 7 Create Shop.php',NULL,NULL),
    ('LS008','CS001','CT001','https://youtu.be/PrOdBVe1IvQ','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P-8 Create details Php',NULL,NULL),
    ('LS009','CS001','CT001','https://youtu.be/xVmkFl6sKyY','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P-9 Create Cart Php',NULL,NULL),
    ('LS010','CS001','CT002','https://youtu.be/eRKcXsGHUoU','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 10 Preparation and Create Top Menu',NULL,NULL),
    ('LS011','CS001','CT002','https://youtu.be/w_x5pFLNFKQ','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P 11 Create Main menu',NULL,NULL),
    ('LS012','CS001','CT002','https://youtu.be/5ENgkEkQlOA','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P 12 Create Slider Home Page',NULL,NULL),
    ('LS013','CS001','CT002','https://youtu.be/MAEg9cwi4aY','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 13 Create Store Introduction Box',NULL,NULL),
    ('LS014','CS001','CT002','https://youtu.be/9hxIAIc0Si0','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P-14 Create Product Storefront',NULL,NULL),
    ('LS015','CS001','CT002','https://youtu.be/xr7VPSV-gjg','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P-15 Create Footer',NULL,NULL),
    ('LS016','CS001','CT002','https://youtu.be/jNlb6q1hbmE','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 16 Create Shop.php',NULL,NULL),
    ('LS017','CS001','CT002','https://youtu.be/9ccjyQnfEMc','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P-17 Create details Php',NULL,NULL),
    ('LS018','CS001','CT002','https://youtu.be/GlGD99LBiHE','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P-18 Create Cart Php',NULL,NULL),
    ('LS019','CS001','CT002','https://youtu.be/sWQwnYvumGc','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 19 Preparation and Create Top Menu',NULL,NULL),
    ('LS020','CS001','CT003','https://youtu.be/PrOdBVe1IvQ','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P 20 Create Main menu',NULL,NULL),
    ('LS021','CS001','CT003','https://youtu.be/xVmkFl6sKyY','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P 21 Create Slider Home Page',NULL,NULL),
    ('LS022','CS001','CT003','https://youtu.be/eRKcXsGHUoU','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 22 Create Store Introduction Box',NULL,NULL),
    ('LS023','CS001','CT003','https://youtu.be/w_x5pFLNFKQ','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P-23 Create Product Storefront',NULL,NULL),
    ('LS024','CS001','CT003','https://youtu.be/5ENgkEkQlOA','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P-24 Create Footer',NULL,NULL),
    ('LS025','CS001','CT003','https://youtu.be/MAEg9cwi4aY','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 25 Create Shop.php',NULL,NULL),
    ('LS026','CS001','CT003','https://youtu.be/9hxIAIc0Si0','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P-26 Create details Php',NULL,NULL),
    ('LS027','CS001','CT003','https://youtu.be/xr7VPSV-gjg','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P-27 Create Cart Php',NULL,NULL),
    ('LS028','CS001','CT003','https://youtu.be/jNlb6q1hbmE','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 28 Preparation and Create Top Menu',NULL,NULL),
    ('LS029','CS001','CT003','https://youtu.be/9ccjyQnfEMc','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P 29 Create Main menu',NULL,NULL),
    ('LS030','CS001','CT004','https://youtu.be/GlGD99LBiHE','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P 30 Create Slider Home Page',NULL,NULL),
    ('LS031','CS001','CT004','https://youtu.be/sWQwnYvumGc','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 31 Create Store Introduction Box',NULL,NULL),
    ('LS032','CS001','CT004','https://youtu.be/PrOdBVe1IvQ','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P-32 Create Product Storefront',NULL,NULL),
    ('LS033','CS001','CT004','https://youtu.be/xVmkFl6sKyY','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P-33 Create Footer',NULL,NULL),
    ('LS034','CS001','CT004','https://youtu.be/eRKcXsGHUoU','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 34 Create Shop.php',NULL,NULL),
    ('LS035','CS001','CT004','https://youtu.be/w_x5pFLNFKQ','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P-35 Create details Php',NULL,NULL),
    ('LS036','CS001','CT004','https://youtu.be/5ENgkEkQlOA','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P-36 Create Cart Php',NULL,NULL),
    ('LS037','CS001','CT004','https://youtu.be/MAEg9cwi4aY','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 37 Preparation and Create Top Menu',NULL,NULL),
    ('LS038','CS001','CT004','https://youtu.be/9hxIAIc0Si0','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P 38 Create Main menu',NULL,NULL),
    ('LS039','CS001','CT004','https://youtu.be/xr7VPSV-gjg','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P 39 Create Slider Home Page',NULL,NULL),
    ('LS040','CS001','CT005','https://youtu.be/jNlb6q1hbmE','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 40 Create Store Introduction Box',NULL,NULL),
    ('LS041','CS001','CT005','https://youtu.be/9ccjyQnfEMc','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P-41 Create Product Storefront',NULL,NULL),
    ('LS042','CS001','CT005','https://youtu.be/GlGD99LBiHE','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P-42 Create Footer',NULL,NULL),
    ('LS043','CS001','CT005','https://youtu.be/sWQwnYvumGc','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 43 Create Shop.php',NULL,NULL),
    ('LS044','CS001','CT005','https://youtu.be/PrOdBVe1IvQ','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P-44 Create details Php',NULL,NULL),
    ('LS045','CS001','CT005','https://youtu.be/xVmkFl6sKyY','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P-45 Create Cart Php',NULL,NULL),
    ('LS046','CS001','CT005','https://youtu.be/eRKcXsGHUoU','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 46 Preparation and Create Top Menu',NULL,NULL),
    ('LS047','CS001','CT005','https://youtu.be/w_x5pFLNFKQ','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P 47 Create Main menu',NULL,NULL),
    ('LS048','CS001','CT005','https://youtu.be/5ENgkEkQlOA','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P 48 Create Slider Home Page',NULL,NULL),
    ('LS049','CS001','CT005','https://youtu.be/MAEg9cwi4aY','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 49 Create Store Introduction Box',NULL,NULL),
    ('LS050','CS001','CT006','https://youtu.be/9hxIAIc0Si0','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P-50 Create Product Storefront',NULL,NULL),
    ('LS051','CS001','CT006','https://youtu.be/xr7VPSV-gjg','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P-51 Create Footer',NULL,NULL),
    ('LS052','CS001','CT006','https://youtu.be/jNlb6q1hbmE','https://i.ytimg.com/vi/9ccjyQnfEMc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBdIjXoFs4S7EjGyPhJAA5yLAWRXQ','Create Ecommerce Website Tutorial : P 52 Create Shop.php',NULL,NULL),
    ('LS053','CS001','CT006','https://youtu.be/9ccjyQnfEMc','https://i.ytimg.com/vi/sWQwnYvumGc/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBrTN-p7XnOSWGMeaKHho1prOfIyA','Create Ecommerce Website Tutorial : P-53 Create details Php',NULL,NULL),
    ('LS054','CS001','CT006','https://youtu.be/GlGD99LBiHE','https://i.ytimg.com/vi/Tk3FmvVsTo0/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAQKzulHnIuRAmZyRxnIR11kbLfbg','Create Ecommerce Website Tutorial : P-54 Create Cart Php',NULL,NULL),
    ('LS055','CS001','CT006','https://youtu.be/sWQwnYvumGc','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClVkxYvpgGBCKnfNfKEcLE-AmkOA','Create Ecommerce Website Tutorial : P 55 Preparation and Create Top Menu',NULL,NULL),
    ('LS056','CS001','CT006','https://youtu.be/PrOdBVe1IvQ','https://i.ytimg.com/vi/xr7VPSV-gjg/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDsW6bFVHrxZAoc4IaefkmVUSAYLA','Create Ecommerce Website Tutorial : P 56 Create Main menu',NULL,NULL),
    ('LS057','CS001','CT006','https://youtu.be/xVmkFl6sKyY','https://i.ytimg.com/vi/jNlb6q1hbmE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCWS9d4ndZSEkt7OgkBww8Ii3hS2Q','Create Ecommerce Website Tutorial : P 57 Create Slider Home Page',NULL,NULL),
    ('LS058','CS002','CT007','https://youtu.be/W_rkamfgRiM','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 1: Hello World!!',NULL,NULL),
    ('LS059','CS002','CT007','https://youtu.be/bXD_eKQOhiI','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 2: Anatomy of a C++ Program',NULL,NULL),
    ('LS060','CS002','CT007','https://youtu.be/xblVpyLdPH8','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 3: Variables and Constants',NULL,NULL),
    ('LS061','CS002','CT007','https://youtu.be/8qM8KrK_Nfc','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 4: Expressions and Statements',NULL,NULL),
    ('LS062','CS002','CT007','https://youtu.be/Aol0tKVt8qM','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 5: Functions',NULL,NULL),
    ('LS063','CS002','CT007','https://youtu.be/yYJq0eZQK4w','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 6: Object Oriented Programming',NULL,NULL),
    ('LS064','CS002','CT007','https://youtu.be/yYJq0eZQK4w','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 7: Loops',NULL,NULL),
    ('LS065','CS002','CT007','https://youtu.be/birAwBmeJho','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 8: Hello World!!',NULL,NULL),
    ('LS066','CS002','CT007','https://youtu.be/W_rkamfgRiM','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 9: Anatomy of a C++ Program',NULL,NULL),
    ('LS067','CS002','CT007','https://youtu.be/bXD_eKQOhiI','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 10: Variables and Constants',NULL,NULL),
    ('LS068','CS002','CT007','https://youtu.be/xblVpyLdPH8','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 11: Expressions and Statements',NULL,NULL),
    ('LS069','CS002','CT008','https://youtu.be/8qM8KrK_Nfc','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 12: Functions',NULL,NULL),
    ('LS070','CS002','CT008','https://youtu.be/Aol0tKVt8qM','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 13: Object Oriented Programming',NULL,NULL),
    ('LS071','CS002','CT008','https://youtu.be/yYJq0eZQK4w','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 14: Loops',NULL,NULL),
    ('LS072','CS002','CT008','https://youtu.be/yYJq0eZQK4w','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 15: Hello World!!',NULL,NULL),
    ('LS073','CS002','CT008','https://youtu.be/birAwBmeJho','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 16: Anatomy of a C++ Program',NULL,NULL),
    ('LS074','CS002','CT008','https://youtu.be/W_rkamfgRiM','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 17: Variables and Constants',NULL,NULL),
    ('LS075','CS002','CT009','https://youtu.be/bXD_eKQOhiI','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 18: Expressions and Statements',NULL,NULL),
    ('LS076','CS002','CT009','https://youtu.be/xblVpyLdPH8','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 19: Functions',NULL,NULL),
    ('LS077','CS002','CT009','https://youtu.be/8qM8KrK_Nfc','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 20: Object Oriented Programming',NULL,NULL),
    ('LS078','CS002','CT009','https://youtu.be/Aol0tKVt8qM','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 21: Loops',NULL,NULL),
    ('LS079','CS002','CT009','https://youtu.be/yYJq0eZQK4w','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYpUewbxMzo56IlBkHjEfCpjJjNQ','Learn C++ in 21 Days!! Day 22: Loops',NULL,NULL),
    ('LS080','CS022','CT010','https://youtu.be/AzES-nhQFzk','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 1 - Learn English with Jennifer - Greetings',NULL,NULL),
    ('LS081','CS022','CT011','https://youtu.be/uqgKvNxhCvQ','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 2 - Learn English with Jennifer - More Greetings',NULL,NULL),
    ('LS082','CS022','CT012','https://youtu.be/bOD6iXEq0qc','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 3 - Greetings Throughout the Day - Learn English with Jennifer',NULL,NULL),
    ('LS083','CS022','CT013','https://youtu.be/O76v9UjAYMg','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 4 - Useful Expressions - Learn English with Jennifer',NULL,NULL),
    ('LS084','CS022','CT014','https://youtu.be/zlbETGgHZTk','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 5 - More Useful Expressions - Learn English with Jennifer',NULL,NULL),
    ('LS085','CS022','CT015','https://youtu.be/zBNQQ0ZFZbg','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 6 - Introducing Yourself - Learn English with Jennifer',NULL,NULL),
    ('LS086','CS022','CT016','https://youtu.be/WhE8Qi0y9gY','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 7 - The Alphabet - Learn English with Jennifer',NULL,NULL),
    ('LS087','CS022','CT017','https://youtu.be/iim3mnzcO50','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 8 - Writing the Alphabet - Learn English with Jennifer',NULL,NULL),
    ('LS088','CS022','CT018','https://youtu.be/LJnQiOBLrEE','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 9 - Spelling - Learn English with Jennifer',NULL,NULL),
    ('LS089','CS022','CT019','https://youtu.be/5ED6GZNlFo0','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 10 - Let''s and Don''t - Learn English with Jennifer',NULL,NULL),
    ('LS090','CS022','CT020','https://youtu.be/uC4Zlz5pV70','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 11 - Do and Don''t - Learn English with Jennifer',NULL,NULL),
    ('LS091','CS022','CT021','https://youtu.be/YKYX0mTyeRI','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 12 - Counting from 0 to 10 - Learn English with Jennifer',NULL,NULL),
    ('LS092','CS022','CT022','https://youtu.be/l-xs-0qSHjs','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 13 - How many? - Learn English with Jennifer',NULL,NULL),
    ('LS093','CS022','CT023','https://youtu.be/MLtc_631cmE','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 14 - Counting from 10 to 20 - Learn English with Jennifer',NULL,NULL),
    ('LS094','CS022','CT024','https://youtu.be/c1nvw91gTog','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 15 - Counting from 10 to 100 - Learn English with Jennifer',NULL,NULL),
    ('LS095','CS022','CT025','https://youtu.be/gbepJU1RpnQ','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 16 - Hundred, Thousand and Million - Learn English with Jennifer',NULL,NULL),
    ('LS096','CS022','CT026','https://youtu.be/QXbxESM5wQI','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 17 - Present forms of BE (am, is, are) - Learn English with Jennifer',NULL,NULL),
    ('LS097','CS022','CT027','https://youtu.be/49fFtDu_I0o','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 18 - Subject Pronouns (I, you, he, she, it, we, they) - Learn English with Jennifer',NULL,NULL),
    ('LS098','CS022','CT028','https://youtu.be/1a_7I1VfTM8','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 19 - Forming Sentences with BE - Learn English with Jennifer',NULL,NULL),
    ('LS099','CS022','CT029','https://youtu.be/03SMFWgOKUY','https://i.ytimg.com/vi/-8GrP6csOPo/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCjk_XQbN4sG2J_DQf17LWkkE9jnw','Lesson 20 - Negative Forms of BE and Questions - Learn English with Jennifer',NULL,NULL),
    ('LS100','CS026','CT030','https://youtu.be/bIBSjVw0j_I','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 1 | Phonetic, Spelling and Sound in English',NULL,NULL),
    ('LS101','CS026','CT031','https://youtu.be/Cr4x7Cz7TB8','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 2 | /i?/ vs /?/ | English Marathon',NULL,NULL),
    ('LS102','CS026','CT032','https://youtu.be/LzC2mam6_ws','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 3 | /u?/ vs /?/ | English Marathon',NULL,NULL),
    ('LS103','CS026','CT033','https://youtu.be/O_m_ZdcBTAQ','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 4 | /??/ vs /?/ | English Marathon',NULL,NULL),
    ('LS104','CS026','CT034','https://youtu.be/kHkbcHpwv6g','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 5 | /??/ | English Marathon',NULL,NULL),
    ('LS105','CS026','CT035','https://youtu.be/IgWygZ9sPrc','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 6 | æ vs e | English Marathon',NULL,NULL),
    ('LS106','CS026','CT036','https://youtu.be/5WGrSeXlj6Y','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 7 | ?? vs e? | English Marathon',NULL,NULL),
    ('LS107','CS026','CT037','https://youtu.be/vMt69vB-pJM','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 8 | ?? vs a? | English Marathon',NULL,NULL),
    ('LS108','CS026','CT038','https://youtu.be/SDcECV0vbmI','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 11 | /t/ vs /d/ | English Marathon',NULL,NULL),
    ('LS109','CS026','CT039','https://youtu.be/lhL-29ICDpQ','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 12 | /p/ vs /b/ | English Marathon',NULL,NULL),
    ('LS110','CS026','CT040','https://youtu.be/UAJBwrhaVWE','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 13 | /k/ vs /g/ | English Marathon',NULL,NULL),
    ('LS111','CS026','CT041','https://youtu.be/IDEaxdQ_akg','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 14 | v vs f | English Marathon',NULL,NULL),
    ('LS112','CS026','CT042','https://youtu.be/AawcdPWZ9jM','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 15 | /s/ vs /z/ | English Marathon',NULL,NULL),
    ('LS113','CS026','CT043','https://youtu.be/GQtw2MD2TE0','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 16 | /?/ vs /ð/ | English Marathon',NULL,NULL),
    ('LS114','CS026','CT044','https://youtu.be/2lVHS4JuAR8','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 17 | /?/ vs /?/ | English Marathon',NULL,NULL),
    ('LS115','CS026','CT045','https://youtu.be/LVCBXpiTTZU','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 18 | /m/, /n/ vs /?/ | English Marathon',NULL,NULL),
    ('LS116','CS026','CT046','https://youtu.be/7UonY_PCLm0','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 19 | /l/ | English Marathon',NULL,NULL),
    ('LS117','CS026','CT047','https://youtu.be/95M1myBWDwA','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation Lesson 9 e? a? vs o? English Marathon',NULL,NULL),
    ('LS118','CS026','CT048','https://youtu.be/R_DBNXWz30w','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation | Lesson 20 | /r / | English Marathon',NULL,NULL),
    ('LS119','CS026','CT049','https://youtu.be/KTI0PBZ4GCY','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','Learning English Pronunciation Lesson 21 w vs j English Marathon',NULL,NULL);
    

  INSERT INTO Courses VALUES
    ('CS001','Create Ecommerce Website Tutorial','https://www.youtube.com/playlist?list=PLHdjLtO7x0fVCRKlIsQVM0aec2kzwn5RC&pbjreload=10','https://i.ytimg.com/vi/MAEg9cwi4aY/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBckl0VXoWsqCJTUiRKOYle5fXmuQ',' Create Ecommerce Website Tutorial. Make / Create a modern E-Commerce Store website In php, mysqli and bootstrap with complete functionalities in a single course.=ore video tutorial from the knowledge I have for free.<br>The source code link at the very bottom ??<br>What Will You Learn?<br>-You will learn how to make an Elegant Ecommerce Website<br>-You Will learn hot to create Content Management System ( CMS )<br>-You will learn how to make price,products and types filters.<br>-You will learn making the coupon code for products and bundles.<br>-You will learn how to make bundles for products',50),
    ('CS002','Learn C++ in 21 days!','https://www.youtube.com/playlist?list=PLB7ZlVMcmjIDyDqor_CacW8azkVwO04eG','https://i.ytimg.com/vi/W_rkamfgRiM/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCePSAU3omY-MMusvnUbsNbmTcOvg','DO you NOT BELIEVE YOU CAN LEARN C++?? WELL I THINK YOU DEFINITELY CAN. TODAY WE ARE GOING TO COVER HELLO WORLD. YOU DEFINITELY CAN LEARN C++ IN 21 DAYS AND I BELIEVE IN YOU. I KNOW YOU CAN DO IT!!!',60),
    ('CS003','How to program in C#','https://www.youtube.com/playlist?list=PLPV2KyIb3jR6ZkG8gZwJYSjnXxmfPAl51','https://i.ytimg.com/vi/pSiIHe2uZ2w/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCsssSur6g_GIf7wADpUpR7k0My8Q','Want to make powerful games, Windows and Mac software or mobile applications? Then this course is a great place to start. Learn how to read, write and understand C# code completely from scratch as we lay a great foundation for creating various types of software.',30),
    ('CS004','Python Tutorial for Beginers','https://www.youtube.com/playlist?list=PLsyeobzWxl7poL9JTVyndKe62ieoN-MZ3','https://i.ytimg.com/vi/QXeEoD0pB3E/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDFfxTTv31qjpdalu6WVYgDswHgcg','Python Tutorial, Easy Python tutorial for beginner, learn Python Programming, learn python programming with example and syntax. Download python, install python, using python IDE, IDLE, Pycharm IDE, notepad,  getting started with python, variables, functions, object, list in python, set in python, help in python, data types, operators, math function, run, debug python code, conditional statement, array, matrix in python, python by navin reddy',20),
    ('CS005','ASP.NET tutorial for beginners','https://www.youtube.com/playlist?list=PL6n9fhu94yhXQS_p1i-HLIftB9Y7Vnxlo','https://i.ytimg.com/vi/3AYoipyqOkQ/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBuXuOBJcEhzsRxD97itVI9nLCo6A','Free ASP.NET video tutorial that help build dynamic data driven web applications.',10),
    ('CS006','JavaScript Tutorial for Beginners','https://www.youtube.com/playlist?list=PLsyeobzWxl7qtP8Lo9TReqUMkiOp446cV','https://i.ytimg.com/vi/uDwSnnhl1Ng/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLA4v7xGVgRskaLhaxwiw8qNNPkBeQ',NULL,15),
    ('CS007','HTML Tutorial for Beginners','https://www.youtube.com/playlist?list=PLr6-GrHUlVf_ZNmuQSXdS197Oyr1L9sPB','https://i.ytimg.com/vi/dD2EISBDjWM/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBos0qeQmET7pWfNQqxRB1gUu1hog',NULL,17),
    ('CS008','Bootstrap 4 Tutorial Series','https://www.youtube.com/playlist?list=PLRtjMdoYXLf47brThg9-nTj8HSq8cQ0ND','https://i.ytimg.com/vi/a4dy_xMmTrQ/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAZ_HC6EqAnlEtniXgRLV3mNrlyUQ',NULL,23),
    ('CS009','Node JS Tutorial for Beginners','https://www.youtube.com/playlist?list=PL4cUxeGkcC9gcy9lrvMJ75z9maRw4byYp','https://i.ytimg.com/vi/w-7RQ46RgxU/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB5gRmx7HePeS9235lqbx2uoJq5bA','Yo ninjas, in this Node JS tutorial series for beginners, we''ll be walking step by step through what Node JS is, and how it all works. We''ll also be creating a Node JS application from scratch using express, and hook it up to MongoDB - a noSQL database perfect for using with Node.',25),
    ('CS010','React Native Tutorial for Beginners','https://www.youtube.com/playlist?list=PL4cUxeGkcC9ixPU-QkScoRBVxtPPzVjrQ','https://i.ytimg.com/vi/ur6I5m2nTvk/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLADct4SKlpW5t4x2QnpeCI7NhrWWQ',NULL,21),
    ('CS011','AJAX Tutorials Playlist','https://www.youtube.com/playlist?list=PL6gx4Cwl9DGDiJSXfsJTASx9eMq_HlenQ','https://i.ytimg.com/vi/tp3Gw-oWs2k/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCp56CBMDk-MpL9ffOeZxFViB5B4g','Official Playlist for thenewboston AJAX tutorials!',17),
    ('CS012','AE tutorials','https://www.youtube.com/playlist?list=PLYfCBK8IplO77FDDLnS06qEMoVLD7Qyib','https://s.dowload.vn/data/image/2019/01/15/Adobe-After-Effects-CC-2.png','Welcome to the complete Beginners Guide To Adobe After Effects.If you are a designer and looking to apply effects and transitions to your video, or create animated logos, illustrations or infographics After Effects is the program to edit in. The tools in After Effects make it very easy to build video compositions, add video effects and motion graphics to bring your presentation to life.Now a lot of videos you see on youtube and TV with animated sequences have been created using After Effects. This is the industry standard software for simple video animation and I create all my videos in After Effects.Now This course has been carefully created to bring ',56),
    ('CS013','PR tutorials','https://www.youtube.com/playlist?list=PLBrRXoTJAkZBl3XDQEPjVj4okFAHQrVex','https://hoacon.com/wp-content/uploads/2018/07/hc-824.jpg','Adobe Premiere Pro is a timeline-based video editing app developed by Adobe Systems and published as part of the Adobe Creative Cloud licensing program. ... It is geared towards professional video editing, while its sibling, Adobe Premiere Elements, targets the consumer market',23),
    ('CS014','AI tutorials for beginer','https://www.youtube.com/playlist?list=PLYfCBK8IplO4X-jM1Rp43wAIdpP2XNGwP','https://3sthuthuat.com/wp-content/uploads/2018/10/Adobe-Illustrator-CC-2018.jpg','On this course I will be introducing you to the program and covering some essential practise exercises. Then I will be demonstrating how to create a small project in Adobe Illustrator from start to finish. To help break down the process I have structured the course in 3 main sections:SECTION 1 - INTRODUCTIONSECTION 2 - ESSENTIAL PRACTISE SECTION 3 - TEST PROJECTCHAPTER 1 - SETUP & LIVE TRACECHAPTER 2 - DRAWINGCHAPTER 3 - COLOURING & ADDING TYPECHAPTER 4 - FINISHING & EXPORTING FOR PRINTAlong the way we will be covering many topics, such as how to set up your document, understand how the program works, use text in Illustrator, prepare and import images into Illustrator and finally export your document ready for print. ',42),
    ('CS015','Canon EOS C300 Mark II Tutorial Series','https://www.youtube.com/watch?v=VRUu21Q2Q4o&list=PLp-znpQge8HyhJ-tOtLgBEaMpMUSP4sTS','https://vn.canon/media/migration/shared/live/products/EN/eos-c300-markii-b1.png','Canon EOS C300 Mark II Tutorial Series',14),
    ('CS016','Unreal Engine tutorials','https://www.youtube.com/watch?v=abmzWUWxy1U&list=PLZlv_N0_O1gYqSlbGQVKsRg6fpxWndZqZ','https://upload.wikimedia.org/wikipedia/en/thumb/0/0a/Unreal_Engine_4_screenshot.png/300px-Unreal_Engine_4_screenshot.png','In this video we take a look at the finished project and step through each of the features that will be covered in this series. We show our functional Main Menu and its options, a lobby where players can chat with one another and select their characters for the game, some server options such as changing the map or match time as well as the ability to kick players from the lobby, all of this working with Steam integration. So if you are wondering how to build a networked game through Blueprints with Steam, this is the series for you!',52),
    ('CS017','Tutorials for Arduino','https://www.youtube.com/watch?v=fCxzA9_kg6s&list=PLA567CE235D39FA84','https://product.hstatic.net/1000069225/product/arduino_mega2560_r3.jpg','This tutorial series is sponsored by element14.  Check out their arduino group!',51),
    ('CS018','Zoho Creator Tutorial Series','https://www.youtube.com/watch?v=p9Qal4Jxc-o&list=PLlC7sQNISSUQb2ikBRmlMRWNtbRpvNKX3','https://tranhait.com/wp-content/uploads/2019/08/Zoho-mail-la-gi.jpg','Taylor and Dylan introduce the application they''ll be teaching you to build throughout the Zoho Creator tutorial series. Learn how the finished product works here, and then watch the rest to learn how we built it.',87),
    ('CS019','Java Tutorial Series','https://www.youtube.com/watch?v=r59xYe3Vyks&list=PLS1QulWo1RIbfTjQvTdj8Y6yyq4R7g-Al','https://vnreview.vn/image/14/91/03/1491033.jpg',NULL,78),
    ('CS020','Diagramming Tutorials','https://www.youtube.com/watch?v=UI6lqHOVHic&list=PLUoebdZqEHTwbYD8oo6Wr81Xb7uCAh_oz','https://cdn.visual-paradigm.com/guide/uml/what-is-class-diagram/what-is-class-diagram.png',NULL,96),
    ('CS021','Database Normalization - 1NF, 2NF, 3NF, BCNF, 4NF and 5NF','https://www.youtube.com/playlist?list=PLLGlmW7jT-nTr1ory9o2MgsOmmx2w8FB3','https://hackr.io/blog/dbms-normalization/thumbnail/large',NULL,62),
    ('CS022','Learn English with Jennifer','https://www.youtube.com/watch?v=AzES-nhQFzk&list=PL0A0C8CFFE9712B76','https://i.ytimg.com/vi/oYI3dzny8n8/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCInsG6q5cau_Sd9ExMwtgviyn8eQ','We recommend watching this series in order, but you can also get something out of it by watching only the videos that interest you.',62),
    ('CS023','Intermediate English with Mark','https://www.youtube.com/watch?v=oYI3dzny8n8&list=PLN3kZ8bfmMJMxqGdgwpxKyjhmuhvU1HkV','https://i.ytimg.com/vi/oYI3dzny8n8/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCInsG6q5cau_Sd9ExMwtgviyn8eQ','M?c tiêu c?a khóa h?c này là cung c?p cho b?n ki?n ??th?c làm vi?c v? các ?ng d?ng Java. Chúng ta s? b?t ??u v?i nh?ng ?i?u c? b?n, b?t ??u t? vi?c cài ??t Java trên các H? ?i?u hành khác nhau nh? Window, Mac và Linux trên nhi?u lo?i IDE, ví d?: Eclipse, IntelliJ Idea, Netbeans vv Sau ?ó chúng ta s? tìm hi?u t?t c? các khái ni?m c? b?n trong l?p trình Java nh? các bi?n, ki?u d? li?u và toán t?, các câu l?nh ?i?u khi?n, l?p, ??i t??ng, hàm t?o, kh?i kh?i t?o, ki?u bi?n, ph??ng th?c và b? s?u t?p rác, ??i t??ng ??nh h??ng l?p trình khái ni?m: Encapsulation, Inheritance, Ploymorphism và Abstraction, Access specifier, String, StringBuilder và Wrapper l?p h?c, ngo?i l?, Enumeration. H??ng d?n này s? bao g?m các ví d? java cho ng??i m?i b?t ??u. java ng??i m?i b?t ??u h??ng d?n. mit java programmieren. java tr?c tuy?n h??ng d?n. trình biên d?ch java. H??ng d?n l?p trình Java (Beginner). Java cho ng??i m?i b?t ??u. H??ng d?n Java . Chào m?ng - Tìm hi?u Java - H??ng d?n Java t??ng tác',62),
    ('CS024','English Course - Beginner 1','https://www.youtube.com/watch?v=CbPy_CjJR90&list=PL2IkMHFHWdEqi0jiLXTEakULNDXGc-q_B','https://i.ytimg.com/vi/agMpwm7VnvM/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDhOx8UVcFhct9dkSTovzjmiXbIzw','Tìm hi?u cách t?o các l?p, thu?c tính và ph??ng th?c trong h??ng d?n S? ?? ',62),
    ('CS025','The Sound of English','https://www.youtube.com/watch?v=fdRmGvmeY1U&list=PLD6B222E02447DC07','https://i.ytimg.com/vi/TNFKG0yvDx4/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLAJ7s_OZv663tzEQuODRn0nHBWsIg','This video covers the basics of database normalization. This is a very good video for beginners, to understand what database normalization means, what is the problem without normalization and how normalization solves the problem.',62),
    ('CS026','English pronunciation course','https://www.youtube.com/watch?v=bIBSjVw0j_I&list=PLPtv7iQCOy9qmCWyWUUA0cuIjyKUMR5wR','https://i.ytimg.com/vi/bIBSjVw0j_I/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB26EYdBLKSpz-74Wkao98WaeTahg','These are REAL lessons. No actors. No scripts. A real learning experience',62),
    ('CS027','English Grammar Lessons','https://www.youtube.com/watch?v=jul2urONzOQ&list=PLD6t6ckHsruY_i7_rZhKcRBmXDdawiqUM','https://i.ytimg.com/vi/jul2urONzOQ/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCI---XL9pvMdpKsaKGj7Up49q_Cg','Watch this course live for free on YouTube every Tuesday and Friday at 17 00 GMT',62),
    ('CS028','IELTS Full Course 2019','https://www.youtube.com/watch?v=iC11QuIT5BE&list=PLfSUFKdFlttn1MWrG5Q0-a9Cbm9y3uulX','https://i.ytimg.com/vi/iC11QuIT5BE/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCj-0TvElBB8utiiBM0M_Ny-JZ_2w','First video in a 25 English video series about English grammar. Esther will teach the basics of English grammar for you to improve your English speaking.',62),
    ('CS029','TOEIC TEST PREPARATION COURSE','https://www.youtube.com/watch?v=aYvJOH59rpg&list=PL_aY0Yz41pU_H1wK3KpvniFufbr0EOt0n','https://i.ytimg.com/vi/aYvJOH59rpg/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDVqRXxqZWrQefB9NfXyE-gXYC7Rg','A complete series of videos and activities to help you improve your pronunciation.',62),
    ('CS030','B2 First (FCE) Exam Preparation Lessons','https://www.youtube.com/watch?v=ihIQ8_-49Fo&list=PLD6t6ckHsruZxTxZvNJIrR_TSsvCfPGFg','https://i.ytimg.com/vi/ihIQ8_-49Fo/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAz9gsWsF4cox1bQkYZCpCyZCEkQQ','English Marathon, where you can find free quality Videos for improving your English. ',62);
    

    INSERT INTO Chapters VALUES
    ('CT001','CS001','Chapter 1'),
    ('CT002','CS001','Chapter 2'),
    ('CT003','CS001','Chapter 3'),
    ('CT004','CS001','Chapter 4'),
    ('CT005','CS001','Chapter 5'),
    ('CT006','CS001','Chapter 6'),
    ('CT007 ','CS002','Chapter 1'),
    ('CT008','CS002','Chapter 2'),
    ('CT009','CS002','Chapter 3');
    
    
   INSERT INTO Feedback VALUES
    ('FB001','CS001','ST001',3,'eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam','2019-08-02 10:00:00'),
    ('FB002','CS002','ST002',2,'faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum.','2021-05-07 20:22:00'),
    ('FB003','CS003','ST003',4,'egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere','2020-01-02 03:02:00'),
    ('FB004','CS004','ST004',2,'Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum','2021-04-02 21:08:00'),
    ('FB005','CS005','ST005',0,'placerat, augue. Sed molestie. Sed id risus quis diam luctus','2021-04-19 13:16:00'),
    ('FB006','CS006','ST006',0,'sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo','2019-11-24 13:20:00'),
    ('FB007','CS007','ST007',3,'a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris','2021-01-03 17:50:00'),
    ('FB008','CS008','ST008',4,'feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam','2019-10-12 18:54:00'),
    ('FB009','CS009','ST009',2,'Donec non justo. Proin non massa non ante bibendum ullamcorper.','2021-02-16 10:21:00'),
    ('FB010','CS010','ST010',3,'est, vitae sodales nisi magna sed dui. Fusce aliquam, enim','2019-09-29 10:54:00'),
    ('FB011','CS011','ST011',0,'vitae sodales nisi magna sed dui. Fusce aliquam, enim nec','2021-04-07 06:15:00'),
    ('FB012','CS012','ST001',0,'consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia','2021-05-13 07:51:00'),
    ('FB013','CS013','ST002',4,'Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus','2020-06-14 11:13:00'),
    ('FB014','CS014','ST003',3,'mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam','2019-08-11 16:22:00'),
    ('FB015','CS014','ST004',1,'fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat','2020-11-21 13:11:00'),
    ('FB016','CS016','ST005',4,'amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat','2021-05-20 20:53:00'),
    ('FB017','CS017','ST006',1,'velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat,','2020-05-30 11:36:00'),
    ('FB018','CS018','ST007',2,'dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet','2021-04-22 11:31:00'),
    ('FB019','CS019','ST008',0,'Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis','2020-10-24 02:44:00'),
    ('FB020','CS020','ST009',3,'eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat','2020-07-24 20:06:00'),
    ('FB021','CS021','ST010',2,'Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris.','2021-04-02 17:39:00'),
    ('FB022','CS022','ST011',3,'Nulla semper tellus id nunc interdum feugiat. Sed nec metus','2019-12-05 01:11:00'),
    ('FB023','CS023','ST001',2,'nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula.','2019-11-19 16:54:00'),
    ('FB024','CS024','ST002',2,'augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum.','2019-11-06 17:44:00'),
    ('FB025','CS025','ST003',2,'tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh','2020-09-27 01:01:00'),
    ('FB026','CS026','ST004',1,'mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,','2020-04-20 05:37:00'),
    ('FB027','CS027','ST005',0,'malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit.','2019-08-29 06:40:00'),
    ('FB028','CS028','ST006',3,'Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum','2019-06-09 15:05:00'),
    ('FB029','CS029','ST007',4,'sodales elit erat vitae risus. Duis a mi fringilla mi','2021-04-11 13:36:00'),
    ('FB030','CS030','ST008',1,'magna. Nam ligula elit, pretium et, rutrum non, hendrerit id,','2020-12-10 23:00:00'),
    ('FB031','CS001','ST009',1,'urna justo faucibus lectus, a sollicitudin orci sem eget massa.','2020-07-30 07:51:00'),
    ('FB032','CS002','ST010',3,'mauris id sapien. Cras dolor dolor, tempus non, lacinia at,','2020-11-03 23:33:00'),
    ('FB033','CS003','ST011',4,'pede, ultrices a, auctor non, feugiat nec, diam. Duis mi','2020-02-08 02:24:00'),
    ('FB034','CS004','ST001',1,'eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus','2020-06-13 09:24:00'),
    ('FB035','CS005','ST002',1,'tellus sem mollis dui, in sodales elit erat vitae risus.','2020-10-14 10:03:00'),
    ('FB036','CS006','ST003',4,'sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis','2019-06-13 10:45:00'),
    ('FB037','CS007','ST004',2,'gravida sit amet, dapibus id, blandit at, nisi. Cum sociis','2020-10-30 11:41:00'),
    ('FB038','CS008','ST005',3,'lorem, sit amet ultricies sem magna nec quam. Curabitur vel','2019-12-07 09:40:00'),
    ('FB039','CS009','ST006',2,'taciti sociosqu ad litora torquent per conubia nostra, per inceptos','2020-09-26 17:14:00'),
    ('FB040','CS010','ST007',3,'eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis','2019-07-31 13:50:00'),
    ('FB041','CS011','ST008',4,'quis, pede. Praesent eu dui. Cum sociis natoque penatibus et','2020-04-09 19:17:00'),
    ('FB042','CS012','ST009',4,'quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar','2020-06-28 19:24:00'),
    ('FB043','CS013','ST010',1,'Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut','2021-04-03 00:56:00'),
    ('FB044','CS014','ST011',2,'quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis.','2021-04-29 10:48:00'),
    ('FB045','CS014','ST001',3,'justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate,','2019-06-24 19:48:00'),
    ('FB046','CS016','ST002',0,'blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae','2020-08-13 10:17:00'),
    ('FB047','CS017','ST003',1,'adipiscing lobortis risus. In mi pede, nonummy ut, molestie in,','2020-09-20 09:33:00'),
    ('FB048','CS018','ST004',0,'justo. Proin non massa non ante bibendum ullamcorper. Duis cursus,','2020-04-18 13:22:00'),
    ('FB049','CS019','ST005',0,'metus vitae velit egestas lacinia. Sed congue, elit sed consequat','2020-01-24 10:20:00'),
    ('FB050','CS020','ST006',1,'in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum','2020-06-25 12:26:00'),
    ('FB051','CS021','ST007',0,'ut erat. Sed nunc est, mollis non, cursus non, egestas','2021-01-19 19:21:00'),
    ('FB052','CS022','ST008',3,'cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula','2020-05-09 19:25:00'),
    ('FB053','CS023','ST009',0,'euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut,','2021-01-30 14:25:00'),
    ('FB054','CS024','ST010',0,'tellus non magna. Nam ligula elit, pretium et, rutrum non,','2021-05-16 03:50:00'),
    ('FB055','CS025','ST011',4,'dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et','2019-10-19 07:56:00'),
    ('FB056','CS026','ST001',3,'euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget','2020-04-13 21:36:00'),
    ('FB057','CS027','ST002',0,'magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac','2020-05-10 03:47:00'),
    ('FB058','CS028','ST003',1,'sagittis felis. Donec tempor, est ac mattis semper, dui lectus','2020-01-29 00:39:00'),
    ('FB059','CS029','ST004',0,'risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed','2019-10-02 23:24:00'),
    ('FB060','CS030','ST005',1,'lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod','2019-12-05 05:38:00'),
    ('FB061','CS001','ST006',2,'suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in','2020-06-13 06:14:00'),
    ('FB062','CS002','ST007',0,'tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a','2020-04-23 23:23:00'),
    ('FB063','CS003','ST008',3,'Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non,','2021-02-03 05:51:00'),
    ('FB064','CS004','ST009',4,'dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet','2019-07-25 20:41:00'),
    ('FB065','CS005','ST010',2,'eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis,','2019-10-20 12:47:00'),
    ('FB066','CS006','ST011',2,'sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum','2020-09-05 05:18:00'),
    ('FB067','CS007','ST001',4,'varius et, euismod et, commodo at, libero. Morbi accumsan laoreet','2019-07-23 16:45:00'),
    ('FB068','CS008','ST002',3,'ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam','2019-09-26 14:33:00'),
    ('FB069','CS009','ST003',0,'ornare lectus justo eu arcu. Morbi sit amet massa. Quisque','2021-01-29 14:24:00'),
    ('FB070','CS010','ST004',1,'urna justo faucibus lectus, a sollicitudin orci sem eget massa.','2020-10-25 17:28:00'),
    ('FB071','CS011','ST005',1,'vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend','2019-07-06 08:56:00'),
    ('FB072','CS012','ST006',4,'metus. Aenean sed pede nec ante blandit viverra. Donec tempus,','2020-07-06 09:35:00'),
    ('FB073','CS013','ST007',4,'Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien','2021-05-19 02:29:00'),
    ('FB074','CS014','ST008',1,'Praesent eu dui. Cum sociis natoque penatibus et magnis dis','2021-02-14 00:45:00'),
    ('FB075','CS014','ST009',3,'id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim','2019-09-06 16:31:00'),
    ('FB076','CS016','ST010',2,'nunc sed libero. Proin sed turpis nec mauris blandit mattis.','2021-03-19 14:50:00'),
    ('FB077','CS017','ST011',2,'Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit','2019-11-17 22:48:00'),
    ('FB078','CS018','ST001',2,'primis in faucibus orci luctus et ultrices posuere cubilia Curae;','2020-01-19 18:48:00'),
    ('FB079','CS019','ST002',0,'erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor.','2020-04-06 14:31:00'),
    ('FB080','CS020','ST003',3,'vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante.','2019-11-30 07:26:00'),
    ('FB081','CS021','ST004',4,'mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie','2019-08-02 11:30:00'),
    ('FB082','CS022','ST005',2,'nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed','2020-05-05 12:56:00'),
    ('FB083','CS023','ST006',2,'elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec','2020-09-23 10:08:00'),
    ('FB084','CS024','ST007',2,'auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi','2021-04-21 06:34:00'),
    ('FB085','CS025','ST008',4,'et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat','2019-06-16 17:12:00'),
    ('FB086','CS026','ST009',4,'accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate,','2021-04-03 12:22:00'),
    ('FB087','CS027','ST010',1,'non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh.','2019-06-16 08:46:00'),
    ('FB088','CS028','ST011',2,'facilisis, magna tellus faucibus leo, in lobortis tellus justo sit','2020-12-17 07:14:00'),
    ('FB089','CS029','ST001',4,'at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam','2019-09-07 22:04:00'),
    ('FB090','CS030','ST002',4,'mus. Donec dignissim magna a tortor. Nunc commodo auctor velit.','2020-04-08 02:03:00'),
    ('FB091','CS001','ST003',1,'ut odio vel est tempor bibendum. Donec felis orci, adipiscing','2020-02-21 13:58:00'),
    ('FB092','CS002','ST004',1,'In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas.','2020-10-14 12:41:00'),
    ('FB093','CS003','ST005',2,'felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem,','2020-02-01 20:02:00'),
    ('FB094','CS004','ST006',4,'magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim','2019-09-26 04:36:00'),
    ('FB095','CS005','ST007',3,'turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut,','2020-08-31 00:41:00'),
    ('FB096','CS006','ST008',2,'convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc','2020-08-16 05:22:00'),
    ('FB097','CS007','ST009',0,'blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae','2020-11-28 19:26:00'),
    ('FB098','CS008','ST010',4,'feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc,','2020-01-25 09:04:00'),
    ('FB099','CS009','ST011',1,'malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas,','2020-04-09 19:24:00'),
    ('FB100','CS010','ST011',3,'metus sit amet ante. Vivamus non lorem vitae odio sagittis','2020-08-16 00:58:00');    
    
    INSERT INTO Authors VALUES
    ('AT001','https://cdn.moveek.com/media/cache/large/5c00c40365e20325087566.jpg','Cameo','Stan Lee',10,0,'Stan Lee (born Stanley Martin Lieber December 28, 1922  November 12, 2018) was an American comic book writer, editor, publisher, and producer. He rose through the ranks of a family-run business to become Marvel Comics'' primary creative leader for two decades, leading its expansion from a small division of a publishing house to a multimedia corporation that dominated the comics industry.',0,0),
    ('AT002','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p302167/cp/cpc/images/masterrepository/performer%20images/p302167/chrisevans-2019.jpg','Koch','Mariam',1,0,'urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula',0,0),
    ('AT003','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p19966/cp/cpc/images/masterrepository/performer%20images/p19966/robert162574544.jpg','Powell','Dillon',15,0,'mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.',0,0),
    ('AT004','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p562566/cp/cpc/images/masterrepository/performer%20images/p562566/jenniferlawrence-2019.jpg','Walls','Joel',15,0,'et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem',0,0),
    ('AT005','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p419915/cp/cpc/images/masterrepository/performer%20images/p419915/channing162613136.jpg','Bird','Xerxes',2,0,'dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum',0,0),
    ('AT006','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p13722/cp/cpc/images/masterrepository/performer%20images/p13722/clooneyperfp.jpg','Farrell','Nadine',17,0,'tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,',0,0),
    ('AT007','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p18682/cp/cpc/images/masterrepository/performer%20images/p18682/johnnydepp-2017.jpg','Puckett','Nola',0,0,'erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida',0,0),
    ('AT008','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p646044/cp/cpc/images/masterrepository/performer%20images/p646044/margot-robbie.jpg','Sosa','Eaton',12,0,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque',0,0),
    ('AT009','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p200349/cp/cpc/images/masterrepository/performer%20images/p200349/leto.jpg','Kennedy','Summer',19,0,'Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa.',0,0),
    ('AT010','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p232927/cp/cpc/images/masterrepository/performer%20images/p232927/reynolds138508120.jpg','Riggs','Denise',5,0,'rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean',0,0),
    ('AT011','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p279096/cp/cpc/images/masterrepository/performer%20images/p279096/ryan159099905.jpg','Mills','Brent',20,0,'urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',0,0),
    ('AT012','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p200222/cp/cpc/images/masterrepository/performer%20images/p200222/scarlett159652076.jpg','Powers','Evan',11,0,'magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,',0,0),
    ('AT013','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p56988/cp/cpc/images/masterrepository/performer%20images/p56988/bradpitt-2016.jpg','Sharp','Caldwell',6,0,'dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis',0,0),
    ('AT014','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p16762/cp/cpc/images/masterrepository/performer%20images/p16762/mattdamon169188561.jpg','Keller','Nigel',29,0,'Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.',0,0),
    ('AT015','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p66596/cp/cpc/images/masterrepository/performer%20images/p66596/willsmith169638915.jpg','Potts','Alyssa',21,0,'ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla',0,0),
    ('AT016','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p225541/cp/cpc/images/masterrepository/performer%20images/p225541/paulrudd-2019.jpg','Barron','Justina',21,0,'risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit.',0,0),
    ('AT017','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p426/cp/cpc/images/masterrepository/performer%20images/p426/73004753_8.jpg','Marshall','Igor',11,0,'aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu',0,0),
    ('AT018','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p301932/cp/cpc/images/masterrepository/performer%20images/p301932/tomhardy-2018.jpg','Valdez','Erich',9,0,'orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus',0,0),
    ('AT019','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p301932/cp/cpc/images/masterrepository/performer%20images/p301932/tomhardy-2018.jpg','Barlow','Caleb',8,0,'consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec,',0,0),
    ('AT020','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p547090/cp/cpc/images/masterrepository/performer%20images/p547090/chrishemsworth-2019.jpg','Bennett','Dakota',11,0,'iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus',0,0),
    ('AT021','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p476559/cp/cpc/images/masterrepository/performer%20images/p476559/dwayne143317712.jpg','Lara','Zachery',20,0,'arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce',0,0),
    ('AT022','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p559750/cp/cpc/images/masterrepository/performer%20images/p559750/tom166649380.jpg','Kerr','Mara',14,0,'tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',0,0),
    ('AT023','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p24604/cp/cpc/images/masterrepository/performer%20images/p24604/jamiefoxx171509407.jpg','Savage','Nolan',1,0,'eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget',0,0),
    ('AT024','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p491706/cp/cpc/images/masterrepository/performer%20images/p491706/emma_stone_2018_aw.jpg','Castaneda','Malik',13,0,'sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus',0,0),
    ('AT025','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p10155/cp/cpc/images/masterrepository/performer%20images/p10155/rage-nicholas%20cage-483664749.jpg','Wilder','Rogan',24,0,'rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula',0,0),
    ('AT026','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p86295/cp/cpc/images/masterrepository/performer%20images/p86295/tom158337153.jpg','Buchanan','Rogan',10,0,'Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt',0,0),
    ('AT027','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p341391/cp/cpc/images/masterrepository/performer%20images/p341391/chrispratt-2020.jpg','Mathews','Janna',24,0,'eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo',0,0),
    ('AT028','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p34866/cp/cpc/images/masterrepository/performer%20images/p34866/samuelljackson-2019.jpg','Brennan','Idona',26,0,'eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque',0,0),
    ('AT029','https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p18926/cp/cpc/images/masterrepository/performer%20images/p18926/leonardo159466890.jpg','Mcintosh','Addison',17,0,'arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed',0,0);
    
    
    INSERT INTO Author_Course VALUES
    ('AT001','CS001'),
    ('AT002','CS002'),
    ('AT003','CS003'),
    ('AT004','CS004'),
    ('AT005','CS005'),
    ('AT006','CS006'),
    ('AT007','CS007'),
    ('AT008','CS008'),
    ('AT009','CS009'),
    ('AT010','CS010'),
    ('AT011','CS011'),
    ('AT012','CS012'),
    ('AT013','CS013'),
    ('AT014','CS014'),
    ('AT015','CS014'),
    ('AT016','CS016'),
    ('AT017','CS017'),
    ('AT018','CS018'),
    ('AT019','CS019'),
    ('AT020','CS020'),
    ('AT021','CS021'),
    ('AT022','CS022'),
    ('AT023','CS023'),
    ('AT024','CS024'),
    ('AT025','CS025'),
    ('AT026','CS026'),
    ('AT027','CS027'),
    ('AT028','CS028'),
    ('AT029','CS029'),
    ('AT029','CS030');


INSERT INTO Subjects VALUES
    ('SB001','IT'),
    ('SB002','Language'),
    ('SB003','Science'),
    ('SB004','Health'),
    ('SB005','Humanities'),
    ('SB006','Business'),
    ('SB007','Math'),
    ('SB008','Marketing'),
    ('SB009','Lifestyle'),
    ('SB010','Software Development'),
    ('SB011','Software Engineering'),
    ('SB012','Life Science'),
    ('SB013','Health Care'),
    ('SB014','Operations'),
    ('SB015','Finance'),
    ('SB016','Skilled Trades');
    
    
    INSERT INTO Subject_Course VALUES
    ('SB001','CS001'),
    ('SB001','CS002'),
    ('SB001','CS003'),
    ('SB001','CS004'),
    ('SB001','CS005'),
    ('SB001','CS006'),
    ('SB001','CS007'),
    ('SB001','CS008'),
    ('SB001','CS009'),
    ('SB001','CS010'),
    ('SB001','CS011'),
    ('SB001','CS012'),
    ('SB001','CS013'),
    ('SB001','CS014'),
    ('SB001','CS014'),
    ('SB001','CS016'),
    ('SB001','CS017'),
    ('SB001','CS018'),
    ('SB001','CS019'),
    ('SB001','CS020'),
    ('SB001','CS021'),
    ('SB002','CS022'),
    ('SB002','CS023'),
    ('SB002','CS024'),
    ('SB002','CS025'),
    ('SB002','CS026'),
    ('SB002','CS027'),
    ('SB002','CS028'),
    ('SB002','CS029'),
    ('SB002','CS030');
    -- delete from cart where 1=1
    INSERT INTO Cart VALUES
    ('CA001','ST003','2020-01-27 00:00:00',0,12,1),
    ('CA002','ST004','2020-02-27 00:00:00',0,23,1),
    ('CA003','ST005','2020-03-27 00:00:00',0,13,1),
    ('CA004','ST006','2020-04-27 00:00:00',0,12,1),
    ('CA005','ST007','2020-05-27 00:00:00',0,10,1),
    ('CA006','ST008','2020-06-27 00:00:00',0,11,1),
    ('CA007','ST009','2020-07-27 00:00:00',0,56,1),
    ('CA008','ST010','2020-08-27 00:00:00',0,34,1),
    ('CA009','ST011','2020-09-27 00:00:00',0,12,1),
    ('CA010','ST004','2020-10-27 00:00:00',0,18,1),
    ('CA011','ST003','2020-11-27 00:00:00',0,80,1),
    ('CA012','ST003','2020-12-27 00:00:00',0,34,1),
    ('CA013','ST003','2020-11-27 00:00:00',0,34,0);

	INSERT INTO bill VALUES 
    ('BI001','CA001','2020-01-27 00:00:00',12),
    ('BI002','CA002','2020-02-27 00:00:00',23),
    ('BI003','CA003','2020-03-27 00:00:00',13),
    ('BI004','CA004','2020-04-27 00:00:00',12),
    ('BI005','CA005','2020-05-27 00:00:00',10),
    ('BI006','CA006','2020-06-27 00:00:00',11),
    ('BI007','CA007','2020-07-27 00:00:00',56),
    ('BI008','CA008','2020-08-27 00:00:00',34),
    ('BI009','CA009','2020-09-27 00:00:00',12),
    ('BI010','CA010','2020-10-27 00:00:00',18),
    ('BI011','CA011','2020-11-27 00:00:00',80),
	('BI012','CA012','2020-12-27 00:00:00',34); 

INSERT INTO CartItems VALUES
    ('CA001','CS001'),
    ('CA001','CS002'),
    ('CA001','CS003'),
    ('CA001','CS004'),
    ('CA001','CS005');

INSERT INTO Enroll VALUES
    ('ER001','CS001','ST001','2020-08-02 10:00:00',1,0),
    ('ER002','CS002','ST002','2020-07-02 20:22:00',1,1),
    ('ER003','CS003','ST003','2020-06-02 03:02:00',1,1),
    ('ER004','CS004','ST004','2020-05-02 21:08:00',1,1),
    ('ER005','CS005','ST005','2020-04-02 13:16:00',1,0),
    ('ER006','CS006','ST006','2020-06-02 13:20:00',1,1),
    ('ER007','CS007','ST007','2020-03-02 17:50:00',0,0),
    ('ER008','CS008','ST008','2020-02-02 18:54:00',1,1),
    ('ER009','CS009','ST009','2020-01-02 10:21:00',1,0),
    ('ER010','CS010','ST010','2020-08-02 10:54:00',1,1),
    ('ER011','CS011','ST011','2020-09-02 06:15:00',0,0),
    ('ER012','CS012','ST001','2020-10-02 10:00:00',1,1),
    ('ER013','CS013','ST002','2020-11-02 20:22:00',1,0),
    ('ER014','CS014','ST003','2020-12-02 03:02:00',1,1),
    ('ER015','CS014','ST004','2020-09-02 21:08:00',1,0),
    ('ER016','CS016','ST005','2020-02-02 13:16:00',1,1),
    ('ER017','CS017','ST006','2020-08-02 13:20:00',0,0),
    ('ER018','CS018','ST007','2020-08-02 17:50:00',1,1),
    ('ER019','CS019','ST008','2020-10-02 18:54:00',1,0),
    ('ER020','CS020','ST009','2020-08-02 10:21:00',1,1),
    ('ER021','CS021','ST010','2020-08-02 10:54:00',1,1),
    ('ER022','CS022','ST011','2020-08-02 06:15:00',1,0),
    ('ER023','CS023','ST001','2020-01-02 10:00:00',1,1),
    ('ER024','CS024','ST002','2020-08-02 20:22:00',1,1),
    ('ER025','CS025','ST003','2020-08-02 03:02:00',1,1),
    ('ER026','CS026','ST004','2020-08-02 21:08:00',1,0),
    ('ER027','CS027','ST005','2020-08-02 13:16:00',1,1),
    ('ER028','CS028','ST006','2020-08-02 13:20:00',1,1),
    ('ER029','CS029','ST007','2020-08-02 17:50:00',0,1),
    ('ER030','CS030','ST008','2020-06-02 18:54:00',1,1),
    ('ER031','CS030','ST009','2020-08-02 10:21:00',0,1),
    ('ER032','CS030','ST010','2020-06-02 10:54:00',1,1),
    ('ER033','CS030','ST011','2020-06-02 06:15:00',1,1);


INSERT INTO Administrators VALUES
	('AD001','admin1',1234),
    ('AD002','admin2',1234);
    
-- delete from students where 1=1
    INSERT INTO Students VALUES
    ('AD001','admin1',1234,NULL,'Admin','Admin',NULL,NULL,NULL,NULL,NULL,0),
    ('ST002','student2',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p302167/cp/cpc/images/masterrepository/performer%20images/p302167/chrisevans-2019.jpg','Potts','Keller',NULL,'jw@gmail.com',123456789,'2021-05-07 20:22:00','2021-05-07 20:22:00',0),
    ('ST003','student3',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p19966/cp/cpc/images/masterrepository/performer%20images/p19966/robert162574544.jpg','Barron','Marshall',NULL,'jw@gmail.com',123456789,'2020-01-02 03:02:00','2020-01-02 03:02:00',0),
    ('ST004','student4',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p562566/cp/cpc/images/masterrepository/performer%20images/p562566/jenniferlawrence-2019.jpg','Marshall','Barron',NULL,'jw@gmail.com',123456789,'2021-04-02 21:08:00','2021-04-02 21:08:00',0),
    ('ST005','student5',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p419915/cp/cpc/images/masterrepository/performer%20images/p419915/channing162613136.jpg','Valdez','Barlow',NULL,'jw@gmail.com',123456789,'2021-04-19 13:16:00','2021-04-19 13:16:00',0),
    ('ST006','student6',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p13722/cp/cpc/images/masterrepository/performer%20images/p13722/clooneyperfp.jpg','Barlow','Valdez',NULL,'jw@gmail.com',123456789,'2019-11-24 13:20:00','2019-11-24 13:20:00',0),
    ('ST007','student7',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p18682/cp/cpc/images/masterrepository/performer%20images/p18682/johnnydepp-2017.jpg','Bennett','Bennett',NULL,'jw@gmail.com',123456789,'2021-01-03 17:50:00','2021-01-03 17:50:00',0),
    ('ST008','student8',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p646044/cp/cpc/images/masterrepository/performer%20images/p646044/margot-robbie.jpg','Lara','Lara',NULL,'jw@gmail.com',123456789,'2019-10-12 18:54:00','2019-10-12 18:54:00',0),
    ('ST009','student9',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p200349/cp/cpc/images/masterrepository/performer%20images/p200349/leto.jpg','Kerr','Kerr',NULL,'jw@gmail.com',123456789,'2021-02-16 10:21:00','2021-02-16 10:21:00',0),
    ('ST010','student10',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p232927/cp/cpc/images/masterrepository/performer%20images/p232927/reynolds138508120.jpg','Savage','Savage',NULL,'jw@gmail.com',123456789,'2019-09-29 10:54:00','2019-09-29 10:54:00',0),
    ('ST011','student11',1234,'https://images.fandango.com/r1.0.874/ImageRenderer/120/180/redesign/static/img/noxportrait.jpg/p279096/cp/cpc/images/masterrepository/performer%20images/p279096/ryan159099905.jpg','Savage','Kerr',NULL,'jw@gmail.com',123456789,'2021-04-07 06:15:00','2021-04-07 06:15:00',0);
    