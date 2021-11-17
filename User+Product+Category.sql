/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.21-log : Database - osdb
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜品分类id',
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1正常 9删除',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`shop_id`,`name`,`status`,`create_at`,`update_at`) values (1,1,'Combo',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(2,1,'sandwish',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(3,1,'Snack',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(4,1,'Drink',1,'2020-07-25 10:20:30','2020-07-25 10:20:30');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `category_id` int(11) DEFAULT NULL COMMENT '菜品分类id',
  `cover_pic` varchar(50) DEFAULT NULL COMMENT '菜品图片',
  `name` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `price` double(6,2) DEFAULT NULL COMMENT '单价',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1:正常  2:停售  9:删除',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`shop_id`,`category_id`,`cover_pic`,`name`,`price`,`status`,`create_at`,`update_at`) values (1,1,1,'1536657620.5485704.jpg','Beef+drink',8.00,1,'2020-07-11 09:20:20','2021-11-11 18:54:07'),(2,1,1,'1536658352.9341557.jpg','Beef+Fried Egg',22.00,1,'2020-07-11 09:32:32','2020-07-25 10:20:30'),(3,1,1,'1536658415.6838002.jpg','Fish+Fried Egg',22.00,1,'2020-07-11 09:33:35','2020-07-25 10:20:30'),(4,1,1,'1536658574.2847373.jpg','Sausage+Fried Egg',22.00,1,'2020-07-11 09:36:14','2020-07-25 10:20:30'),(5,1,2,'1536658659.0446993.jpg','Sausage1',19.00,1,'2020-07-11 09:37:39','2020-07-25 10:20:30'),(6,1,2,'1536658824.3976505.jpg','Sausage2',16.00,1,'2020-07-11 09:40:24','2020-07-25 10:20:30'),(7,1,2,'1536658863.6732855.jpg','Sausage3',19.00,1,'2020-07-11 09:41:03','2020-07-25 10:20:30'),(8,1,2,'1536658960.3954134.jpg','Sausage4',18.00,1,'2020-07-11 09:42:40','2020-07-25 10:20:30'),(9,1,3,'1536659114.0440235.jpg','Snack1',12.00,1,'2020-07-11 09:44:25','2020-07-25 10:20:30'),(10,1,3,'1536659065.7972637.jpg','Snack2',4.00,1,'2020-07-11 09:45:14','2020-07-25 10:20:30'),(11,1,3,'1536659197.7231221.jpg','Snack3',4.00,1,'2020-07-11 09:46:37','2020-07-25 10:20:30'),(12,1,3,'1536659253.8842716.jpg','Snack4',15.00,1,'2020-07-11 09:47:33','2020-07-25 10:20:30'),(13,1,4,'1536659311.8699493.jpg','drink1',4.00,1,'2020-07-11 09:48:31','2020-07-25 10:20:30'),(14,1,4,'1536659364.7892513.jpg','drink1',6.00,1,'2020-07-11 09:49:24','2020-07-25 10:20:30'),(15,1,4,'1536659563.3897648.jpg','drink1',5.00,1,'2020-07-11 09:52:43','2020-07-25 10:20:30'),(16,1,4,'1536659605.5561771.jpg','drink1',3.00,1,'2020-07-11 09:53:25','2020-07-25 10:20:30'),(17,1,4,'1536659688.4856157.jpg','drink1',4.00,1,'2020-07-11 09:54:48','2020-07-25 10:20:30'),(18,2,1,'1636675626.221052.jpg','Beef+drink2',4.00,1,'2020-07-04 06:17:18','2021-11-11 19:07:06'),(19,3,1,'1536658666.8341557.jpg','test',0.00,9,'2020-07-06 08:46:28','2021-11-11 19:07:33'),(20,NULL,3,'1636673313.7286842.jpg','JJ00',23.00,9,'2021-11-11 18:28:33','2021-11-11 18:32:48');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工账号id',
  `username` varchar(50) DEFAULT NULL COMMENT '员工账号',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `password_hash` varchar(100) DEFAULT NULL COMMENT '密码',
  `password_salt` varchar(50) DEFAULT NULL COMMENT '密码干扰值',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态:1正常/2禁用/9删除',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`nickname`,`password_hash`,`password_salt`,`status`,`create_at`,`update_at`) values (1,'Jay01','Jay','1e191d851b3b49a248f4ea62f6b06410','123456',1,'2020-07-08 18:18:18','2021-09-28 14:59:39'),(2,'lisi','joy','1e191d851b3b49a248f4ea62f6b06410','123456',1,'2020-07-18 08:08:18','2021-09-27 20:19:59'),(3,'Dora','dora','c8a7ca8b274f29cf2c1147a8e0f685a4','639776',6,'2020-07-07 07:53:57','2020-07-08 20:18:18'),(4,'Liz','liz','cbb748964d243e38f032b78886db824c','437809',9,'2020-02-18 09:06:54','2020-01-14 03:36:25'),(5,'Judy','judy','27c744b428b997675c4383e7eae974c3','486570',2,'2020-02-18 09:07:40','2020-02-18 09:07:40'),(6,'Amy','amy','b5a7379148116549de083f5076233bef','810418',9,'2020-02-18 09:08:35','2021-09-23 15:55:25'),(7,'Bella','bella','7177bd35ad232f0830fe5c10dcc24b1c','350013',2,'2020-02-19 06:11:16','2020-02-19 12:33:19'),(8,'abc','Lily','571e3b40192686519a1c55250d4fe033','238250',6,'2021-09-27 12:43:42','2021-09-27 12:45:13'),(21,'King','king','de60d2df5b1344013496314fea1be87f','126925',1,'2021-10-15 19:46:02','2021-10-15 19:46:02'),(22,'JJ','jj','df2df5c3176d9b4808c43e6eecb09a79','684955',1,'2021-10-16 11:08:18','2021-10-16 11:08:18'),(23,'Nina','nina','ee86182abd1d79a6484dacbb2fb163af','445906',1,'2021-10-16 11:09:27','2021-10-16 11:09:27'),(24,'Bella','bella','075ed014ef8d79de8c1e9e865084215f','217449',1,'2021-10-17 14:12:44','2021-10-17 14:12:44'),(25,'dd','dd01','fa061f9f0785c4fe039c054c252e3ae0','648772',1,'2021-10-17 14:13:41','2021-10-17 14:13:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
