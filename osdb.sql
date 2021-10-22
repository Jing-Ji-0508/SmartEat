/*
SQLyog Community v13.1.1 (32 bit)
MySQL - 5.7.26 : Database - osdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`osdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `osdb`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Meal_Category id',
  `shop_id` int(11) DEFAULT NULL COMMENT 'shop_id',
  `name` varchar(50) DEFAULT NULL COMMENT 'Category Name',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Status：1Valid 9Deleted',
  `create_at` datetime DEFAULT NULL COMMENT 'Create_Time',
  `update_at` datetime DEFAULT NULL COMMENT 'Update_Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Memberid',
  `nickname` varchar(50) DEFAULT NULL COMMENT 'nickname',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'avatar',
  `mobile` varchar(50) DEFAULT NULL COMMENT 'phone',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Status:1Valid/2Disabled/9Deleted',
  `create_at` datetime DEFAULT NULL COMMENT 'CreateTime',
  `update_at` datetime DEFAULT NULL COMMENT 'UpdateTime',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'OrderDetailid',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'Orderid',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Mealid',
  `product_name` varchar(50) DEFAULT NULL COMMENT 'Mealname',
  `price` double(6,2) unsigned DEFAULT NULL COMMENT 'Price',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Quantity',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Status:1Valid/9Deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Order details information sheet';

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Orderid',
  `shop_id` int(10) unsigned DEFAULT NULL COMMENT 'shopid',
  `member_id` int(10) unsigned DEFAULT NULL COMMENT 'member_id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Operator_id',
  `money` double(8,2) DEFAULT NULL COMMENT 'Money',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT 'Order_Status:1On process/2Invalid/3Accomplished',
  `payment_status` tinyint(3) unsigned DEFAULT NULL COMMENT 'Status of payment :1Unpaid/2Paid/3refunded',
  `create_at` datetime DEFAULT NULL COMMENT 'CreateTime',
  `update_at` datetime DEFAULT NULL COMMENT 'UpdateTime',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'paymentid',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'Orderid',
  `member_id` int(10) unsigned DEFAULT NULL COMMENT 'Memberid',
  `money` double(8,2) unsigned DEFAULT NULL COMMENT 'Money',
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT 'Payment method: 1 member payment /2 cashier collection',
  `bank` tinyint(3) unsigned DEFAULT NULL COMMENT 'Receiving bank channels :1 debit /2 balance /3 cash /4 applepay',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT 'Payment status :1 unpaid /2 paid /3 refunded',
  `create_at` datetime DEFAULT NULL COMMENT 'CreateTime',
  `update_at` datetime DEFAULT NULL COMMENT 'UpdateTime',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Meal_id',
  `shop_id` int(11) DEFAULT NULL COMMENT 'shopid',
  `category_id` int(11) DEFAULT NULL COMMENT 'Meal_Categoryid',
  `cover_pic` varchar(50) DEFAULT NULL COMMENT 'picture',
  `name` varchar(50) DEFAULT NULL COMMENT 'MealName',
  `price` double(6,2) DEFAULT NULL COMMENT 'Price',
  `status` tinyint(4) DEFAULT NULL COMMENT 'Status: 1: normal 2: Stopped 9: Deleted',
  `create_at` datetime DEFAULT NULL COMMENT 'CreateTime',
  `update_at` datetime DEFAULT NULL COMMENT 'UpdateTime',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'shopid',
  `name` varchar(255) NOT NULL COMMENT 'shopname',
  `cover_pic` varchar(255) DEFAULT NULL COMMENT 'picture',
  `banner_pic` varchar(255) DEFAULT NULL COMMENT 'Logo',
  `address` varchar(255) DEFAULT NULL COMMENT 'address',
  `phone` varchar(255) DEFAULT NULL COMMENT 'phone',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Status: 1: normal 2: Stopped 9: Deleted',
  `create_at` datetime DEFAULT NULL COMMENT 'CreateTime',
  `update_at` datetime DEFAULT NULL COMMENT 'UpdateTime',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'employee_id',
  `username` varchar(50) DEFAULT NULL COMMENT 'employee_account',
  `nickname` varchar(50) DEFAULT NULL COMMENT 'nickname',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'password',
  `password_salt` varchar(50) DEFAULT NULL COMMENT 'password_interference',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Status: 1: normal 2: Stopped 9: Deleted',
  `create_at` datetime DEFAULT NULL COMMENT 'CreateTime',
  `update_at` datetime DEFAULT NULL COMMENT 'UpdateTime',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;


insert  into `user`(`id`,`username`,`nickname`,`password_hash`,`password_salt`,`status`,`create_at`,`update_at`) values (1,'Licy','licy','1e191d851b3b49a248f4ea62f6b06410','123456',6,'2020-07-28 18:18:18','2020-07-29 08:06:55');
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
