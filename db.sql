/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.13-log : Database - leanode
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`leanode` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `leanode`;

/*Table structure for table `avatar` */

DROP TABLE IF EXISTS `avatar`;

CREATE TABLE `avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `mimetype` varchar(30) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `avatar` */

insert  into `avatar`(`id`,`filename`,`mimetype`,`size`,`user_id`,`createAt`,`updateAt`) values (1,'d034086054a174c01241c559ca168933','image/jpeg',145590,1,'2021-09-02 19:43:08','2021-09-02 19:43:45');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `moment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `moment_id` (`moment_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`content`,`moment_id`,`user_id`,`comment_id`,`createAt`,`updateAt`) values (1,'JavaScript语言是世界上最好的语言',24,1,NULL,'2021-08-29 17:05:50','2021-08-29 23:51:18'),(18,'C++是世界上最好的语言',24,1,1,'2021-08-29 19:41:52','2021-08-29 19:41:52'),(21,'PHP是世界上最好的语言',24,2,NULL,'2021-08-30 00:23:00','2021-08-30 00:23:00');

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `mimetype` varchar(30) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `moment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `user_id` (`user_id`),
  KEY `moment_id` (`moment_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `file` */

insert  into `file`(`id`,`filename`,`mimetype`,`size`,`moment_id`,`user_id`,`createAt`,`updateAt`) values (14,'f7e4f3933817fb346f98a3c6f4c11aed','image/jpeg',43555,5,1,'2021-09-03 19:28:01','2021-09-03 19:28:01'),(15,'5251360dad1cc9fadc42eb1bd9d3ad3f','image/png',404829,5,1,'2021-09-03 19:28:02','2021-09-03 19:28:02'),(16,'cd9f9416b9a85f06c98ad1836d46ee26','image/png',509663,5,1,'2021-09-03 19:28:02','2021-09-03 19:28:02');

/*Table structure for table `label` */

DROP TABLE IF EXISTS `label`;

CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `label` */

insert  into `label`(`id`,`name`,`createAt`,`updateAt`) values (1,'FrontEnd','2021-09-01 12:39:19','2021-09-01 12:39:19'),(2,'Good','2021-09-01 12:44:20','2021-09-01 14:35:41'),(6,'Fresh','2021-09-01 14:35:28','2021-09-01 14:35:28'),(7,'hhh','2021-09-01 14:35:49','2021-09-01 14:35:49'),(14,'ooo','2021-09-01 18:26:22','2021-09-01 18:26:22'),(16,'c++','2021-09-01 18:32:34','2021-09-01 18:32:34'),(17,'编程','2021-09-01 18:45:00','2021-09-01 18:45:00'),(18,'开发语言','2021-09-01 18:45:00','2021-09-01 18:45:00'),(19,'JS','2021-09-01 18:45:00','2021-09-01 18:45:00'),(20,'Node','2021-09-01 18:58:36','2021-09-01 18:58:36'),(21,'英语','2021-09-01 19:00:44','2021-09-01 19:00:44'),(22,'名言','2021-09-01 19:00:44','2021-09-01 19:00:44');

/*Table structure for table `moment` */

DROP TABLE IF EXISTS `moment`;

CREATE TABLE `moment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `moment` */

insert  into `moment`(`id`,`content`,`user_id`,`createAt`,`updateAt`) values (4,'不要告诉我你不需要保护，不要告诉我你不寂寞，知微，我只希望你，在走过黑夜的那个时辰，不要倔强的选择一个人。',3,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(5,'If you shed tears when you miss the sun, you also miss the stars.如果你因失去了太阳而流泪，那么你也将失去群星了。',1,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(6,'在世间万物中我都发现了你，渺小时，你是阳光下一粒种子，伟大时，你隐身在高山海洋里。',2,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(8,'限定目的，能使人生变得简洁。',2,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(9,'翅膀长在你的肩上，太在乎别人对于飞行姿势的批评，所以你飞不起来',4,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(10,'一个人至少拥有一个梦想，有一个理由去坚强。心若没有栖息的地方，到哪里都是在流浪。',2,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(11,'不乱于心，不困于情。不畏将来，不念过往。如此，安好。',3,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(12,'如果你给我的，和你给别人的是一样的，那我就不要了。',3,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(13,'故事的开头总是这样，适逢其会，猝不及防。故事的结局总是这样，花开两朵，天各一方。',2,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(14,'你不愿意种花，你说，我不愿看见它一点点凋落。是的，为了避免结束，你避免了一切开始。',2,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(15,'你如果认识从前的我，也许你会原谅现在的我。',4,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(16,'每一个不曾起舞的日子，都是对生命的辜负。',2,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(17,'向来缘浅，奈何情深。',2,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(18,'心之所向 素履以往 生如逆旅 一苇以航',3,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(19,'生如夏花之绚烂，死如秋叶之静美。',3,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(20,'答案很长，我准备用一生的时间来回答，你准备要听了吗？',4,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(21,'因为爱过，所以慈悲；因为懂得，所以宽容。',4,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(22,'我们听过无数的道理，却仍旧过不好这一生。',1,'2020-11-23 22:21:19','2020-11-23 22:21:19'),(23,'我来不及认真的年轻，呃呃呃~',2,'2020-11-23 22:21:19','2021-08-29 23:45:24'),(24,'JavaScript是世界上最好的语言~',1,'2021-08-29 14:09:02','2021-08-29 14:09:02'),(25,'C++是世界上最好的语言~',2,'2021-08-29 23:45:55','2021-08-29 23:45:55'),(26,'PHP是世界上最好的语言~',3,'2021-08-29 23:46:11','2021-08-29 23:46:11'),(27,'PHP是世界上最好的语言~',1,'2021-08-31 09:50:34','2021-08-31 09:50:34'),(28,'PHP是世界上最好的语言~',1,'2021-10-23 12:56:22','2021-10-23 12:56:22');

/*Table structure for table `moment_label` */

DROP TABLE IF EXISTS `moment_label`;

CREATE TABLE `moment_label` (
  `moment_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`moment_id`,`label_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `moment_label_ibfk_1` FOREIGN KEY (`moment_id`) REFERENCES `moment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `moment_label` */

insert  into `moment_label`(`moment_id`,`label_id`,`createAt`,`updateAt`) values (5,20,'2021-09-01 22:43:06','2021-09-01 22:43:06'),(5,21,'2021-09-01 19:00:44','2021-09-01 19:00:44'),(5,22,'2021-09-01 19:00:44','2021-09-01 19:00:44'),(24,17,'2021-09-01 18:57:36','2021-09-01 18:57:36'),(24,18,'2021-09-01 18:57:36','2021-09-01 18:57:36'),(24,19,'2021-09-01 18:57:36','2021-09-01 18:57:36'),(24,20,'2021-09-01 18:58:36','2021-09-01 18:58:36');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`password`,`createAt`,`updateAt`,`avatar_url`) values (1,'xxx','202cb962ac59075b964b07152d234b70','2021-08-23 13:57:57','2021-09-02 19:43:08','http://localhost:8000/users/1/avatar'),(2,'yyy','250cf8b51c773f3f8dc8b4be867a9a02','2021-08-23 13:58:03','2021-08-23 13:58:38',NULL),(3,'zzz','68053af2923e00204c3ca7c6a3150cf7','2021-08-23 13:58:10','2021-08-23 13:58:58',NULL),(4,'www','42a0e188f5033bc65bf8d78622277c4e','2021-08-28 20:46:37','2021-08-28 20:46:37',NULL),(6,'abcdefg','123456789','2021-11-28 18:59:05','2021-11-28 19:08:47',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
