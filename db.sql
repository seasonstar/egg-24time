# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: tftime
# Generation Time: 2017-04-20 02:43:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `tftime`;
CREATE DATABASE tftime;
USE tftime;


# Dump of table post_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_comments`;

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `num_likes` int(11) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `postCommentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  KEY `postCommentId` (`postCommentId`),
  KEY `post_comments_num_likes` (`num_likes`),
  CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `post_comments_ibfk_3` FOREIGN KEY (`postCommentId`) REFERENCES `post_comments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post_comments` WRITE;
/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */;

INSERT INTO `post_comments` (`id`, `content`, `num_likes`, `createdAt`, `updatedAt`, `userId`, `postId`, `postCommentId`)
VALUES
	(1,'测试评论0',0,'2017-03-30 03:19:07','2017-03-30 03:19:07',1,NULL,NULL),
	(2,'测试评论1',0,'2017-03-30 03:19:07','2017-03-30 03:19:07',1,NULL,NULL),
	(3,'测试评论2',0,'2017-03-30 03:19:07','2017-03-30 03:19:07',1,NULL,2),
	(4,'asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd',0,'2017-04-19 08:09:36','2017-04-19 08:09:36',2,2016,NULL),
	(5,'asd',0,'2017-04-19 09:13:48','2017-04-19 09:13:48',2,2019,NULL),
	(6,'asd',0,'2017-04-19 09:14:55','2017-04-19 09:14:55',2,2019,NULL),
	(7,'-12313',0,'2017-04-19 09:15:17','2017-04-19 09:15:17',2,2019,NULL);

/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_feedbacks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_feedbacks`;

CREATE TABLE `post_feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) DEFAULT NULL,
  `status` enum('PENDING','PROCESSED','REFUSED') DEFAULT 'PENDING',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  KEY `post_feedbacks_subject` (`subject`),
  KEY `post_feedbacks_status` (`status`),
  CONSTRAINT `post_feedbacks_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `post_feedbacks_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post_feedbacks` WRITE;
/*!40000 ALTER TABLE `post_feedbacks` DISABLE KEYS */;

INSERT INTO `post_feedbacks` (`id`, `subject`, `status`, `createdAt`, `updatedAt`, `userId`, `postId`)
VALUES
	(1,'不良信息举报','PENDING','2017-03-30 03:19:07','2017-03-30 03:19:07',1,NULL);

/*!40000 ALTER TABLE `post_feedbacks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_images`;

CREATE TABLE `post_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`),
  KEY `userId` (`userId`),
  CONSTRAINT `post_images_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `post_images_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post_images` WRITE;
/*!40000 ALTER TABLE `post_images` DISABLE KEYS */;

INSERT INTO `post_images` (`id`, `url`, `createdAt`, `updatedAt`, `postId`, `userId`)
VALUES
	(1,'http://tva3.sinaimg.cn/crop.0.0.180.180.180/9e0f6abcjw1e8qgp5bmzyj2050050aa8.jpg','2017-03-30 03:19:07','2017-03-30 03:19:07',NULL,NULL),
	(2,'http://24time-1253435917.file.myqcloud.com/posts/tmp_2078076976o6zAJswkPM-ZgTqyTXXDs_-jPZ84857c82a7adf04ff497d8d94abd0380cc.jpg','2017-04-16 11:07:17','2017-04-16 11:07:17',2014,2),
	(3,'http://24time-1253435917.file.myqcloud.com/posts/tmp_2078076976o6zAJswkPM-ZgTqyTXXDs_-jPZ845fd5c2e23ce101cd5f2404e3b681d9fe.jpg','2017-04-16 11:07:17','2017-04-16 11:07:17',2019,2),
	(4,'http://24time-1253435917.file.myqcloud.com/posts/tmp_2078076976o6zAJswkPM-ZgTqyTXXDs_-jPZ843511747398fa10ceeb00e18e8e3ee30b.jpg','2017-04-16 11:07:17','2017-04-16 11:07:17',2019,2),
	(5,'http://24time-1253435917.file.myqcloud.com/posts/tmp_2078076976o6zAJswkPM-ZgTqyTXXDs_-jPZ840560936c57353936341d4dd273595636.jpg','2017-04-17 07:45:27','2017-04-17 07:45:27',2012,2),
	(6,'http://24time-1253435917.file.myqcloud.com/posts/tmp_2078076976o6zAJswkPM-ZgTqyTXXDs_-jPZ84001613ba2a7eb06964cd41c05aebcfcc.jpeg','2017-04-17 07:45:47','2017-04-17 07:45:47',2013,2);

/*!40000 ALTER TABLE `post_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_likes`;

CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `postCommentId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postCommentId` (`postCommentId`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`postCommentId`) REFERENCES `post_comments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `post_likes_ibfk_3` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;

INSERT INTO `post_likes` (`id`, `createdAt`, `updatedAt`, `postCommentId`, `userId`, `postId`)
VALUES
	(1,'2017-03-30 03:19:07','2017-03-30 03:19:07',NULL,1,NULL),
	(2,'2017-04-16 07:49:58','2017-04-16 07:49:58',NULL,2,NULL),
	(3,'2017-04-16 07:50:02','2017-04-16 07:50:02',NULL,2,NULL),
	(5,'2017-04-19 09:06:39','2017-04-19 09:06:39',NULL,2,2016);

/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1',
  `num_likes` int(11) DEFAULT '0',
  `num_comments` int(11) DEFAULT '0',
  `num_views` int(11) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schoolId` (`schoolId`),
  KEY `userId` (`userId`),
  KEY `posts_is_valid` (`is_valid`),
  KEY `posts_is_anonymous` (`is_anonymous`),
  KEY `posts_created_at` (`createdAt`),
  KEY `posts_num_likes` (`num_likes`),
  KEY `posts_num_views` (`num_views`),
  KEY `posts_num_comments` (`num_comments`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`schoolId`) REFERENCES `schools` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `title`, `content`, `is_anonymous`, `is_valid`, `num_likes`, `num_comments`, `num_views`, `createdAt`, `updatedAt`, `schoolId`, `userId`)
VALUES
	(2011,NULL,'123123',0,1,0,0,0,'2017-04-17 07:44:55','2017-04-17 07:44:55',1,2),
	(2012,NULL,'123123',1,1,0,0,0,'2017-04-17 07:45:27','2017-04-17 07:45:27',2,2),
	(2013,NULL,'1233',0,1,0,0,0,'2017-04-17 07:45:47','2017-04-17 07:45:47',2,2),
	(2014,NULL,'sy',1,1,0,0,0,'2017-04-17 07:48:03','2017-04-17 07:48:03',1,2),
	(2015,NULL,'symy',0,1,0,0,0,'2017-04-17 07:48:26','2017-04-17 07:48:26',1,2),
	(2016,NULL,'ddd',0,1,1,1,0,'2017-04-17 07:50:27','2017-04-19 09:06:39',1,2),
	(2017,NULL,'123321',0,1,0,0,0,'2017-04-17 07:50:49','2017-04-17 07:50:49',2,2),
	(2018,NULL,'dssa',0,1,0,0,0,'2017-04-17 08:05:46','2017-04-17 08:05:46',2,2),
	(2019,NULL,'asdas\n',0,1,0,3,0,'2017-04-19 09:11:51','2017-04-19 09:15:17',1,2);

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table school_managers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `school_managers`;

CREATE TABLE `school_managers` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `schoolId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`schoolId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `school_managers_ibfk_1` FOREIGN KEY (`schoolId`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `school_managers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `school_managers` WRITE;
/*!40000 ALTER TABLE `school_managers` DISABLE KEYS */;

INSERT INTO `school_managers` (`createdAt`, `updatedAt`, `schoolId`, `userId`)
VALUES
	('2017-04-18 09:19:08','2017-04-18 09:19:08',1,2);

/*!40000 ALTER TABLE `school_managers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schools`;

CREATE TABLE `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `schools_name_unique` (`name`),
  KEY `schools_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;

INSERT INTO `schools` (`id`, `name`, `description`, `avatar`, `createdAt`, `updatedAt`)
VALUES
	(1,'中大时区','测试多几下\\n测试多几下','http://tva3.sinaimg.cn/crop.0.0.180.180.180/9e0f6abcjw1e8qgp5bmzyj2050050aa8.jpg','2017-03-30 03:13:59','2017-03-30 03:13:59'),
	(2,'华农时区','测试测试\\n测试测试','http://tva1.sinaimg.cn/crop.0.0.180.180.180/8506a276jw1e8qgp5bmzyj2050050aa8.jpg','2017-04-11 00:00:00','2017-04-11 00:00:00');

/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table social_oauths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_oauths`;

CREATE TABLE `social_oauths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(32) DEFAULT 'WEAPP',
  `site_uid` varchar(255) DEFAULT NULL,
  `unionid` varchar(255) DEFAULT NULL,
  `site_uname` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `social_oauths_site_uid` (`site_uid`),
  KEY `social_oauths_unionid` (`unionid`),
  CONSTRAINT `social_oauths_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `social_oauths` WRITE;
/*!40000 ALTER TABLE `social_oauths` DISABLE KEYS */;

INSERT INTO `social_oauths` (`id`, `site`, `site_uid`, `unionid`, `site_uname`, `access_token`, `refresh_token`, `expire_date`, `createdAt`, `updatedAt`, `userId`)
VALUES
	(1,'WEAPP',NULL,NULL,NULL,NULL,NULL,NULL,'2017-03-30 03:19:07','2017-03-30 03:19:07',1),
	(2,'WEAPP','oMrD70ETDcvj6bIdx9ky6fgTp1Ug',NULL,'Shawn',NULL,NULL,NULL,'2017-04-12 05:37:16','2017-04-12 05:37:16',2);

/*!40000 ALTER TABLE `social_oauths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userprofiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userprofiles`;

CREATE TABLE `userprofiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` int(11) DEFAULT '0',
  `city` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `about_me` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `userprofiles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `userprofiles` WRITE;
/*!40000 ALTER TABLE `userprofiles` DISABLE KEYS */;

INSERT INTO `userprofiles` (`id`, `sex`, `city`, `province`, `country`, `about_me`, `createdAt`, `updatedAt`, `userId`)
VALUES
	(1,0,NULL,NULL,NULL,NULL,'2017-03-30 03:19:07','2017-03-30 03:19:07',1),
	(2,1,'Shenzhen','Guangdong','CN',NULL,'2017-04-12 05:37:16','2017-04-12 05:37:16',2);

/*!40000 ALTER TABLE `userprofiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_name` (`name`),
  KEY `users_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `is_active`, `createdAt`, `updatedAt`)
VALUES
	(1,'seasonstar','seasonstar@126.com','$2a$10$rDyURQ4pgcnVE4p3Ba8EWeHeKDOGKfJcCs4VIBb78WYGmNxnaiBzi','http://tva3.sinaimg.cn/crop.0.0.180.180.180/9e0f6abcjw1e8qgp5bmzyj2050050aa8.jpg',1,'2017-03-30 03:13:58','2017-03-30 03:13:58'),
	(2,'Shawn',NULL,'$2a$10$UqRtZzctxQW9DjWLzNjAh.gI5AwVMSDWPBRhBSukubpV1F/98iBOe','http://wx.qlogo.cn/mmopen/vi_32/SHTqNNVB9mbibgEYialHROjsty1G9fYCPYK5fYBDB1TibrHVZKgJQn0Hbo93bOwiaD1TMFK1Vo4x4WynPcfAmc12fg/0',1,'2017-04-12 05:37:16','2017-04-12 05:37:16');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
