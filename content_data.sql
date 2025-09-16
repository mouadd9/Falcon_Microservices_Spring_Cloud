-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: mydatabase
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `estimated_time` int NOT NULL,
  `total_challenges` int NOT NULL,
  `total_joined_users` int NOT NULL,
  `total_running_instances` int NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ami_id` varchar(255) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `complexity` enum('EASY','HARD','MEDIUM') DEFAULT NULL,
  `description` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (2,4,2,0,1,'ami-06ce9edd5f1f010d6','![](https://i.imgur.com/vjfcwid.png)','Part 1: Juice Shop - Intro to Web Hacking & Reconnaissance','EASY','\nWelcome to the first room in our [OWASP\'s TOP 10 vulnerabilities](https://owasp.org/www-project-top-ten/) web hacking series! In this first part, we\'ll introduce you to the fundamentals of web application reconnaissance and get hands-on with one of the most notorious vulnerabilities using Juice Shop, a deliberately vulnerable web application. You\'ll learn techniques applicable to real-world web applications.\n\n**Prerequisites:**\n Complete these **FREE** Burp Suite rooms first:\n* [Burpsuite Basics](https://tryhackme.com/room/burpsuitebasics)\n* [Burpsuite Repeater](https://tryhackme.com/room/burpsuiterepeater)\n\n**Topics Covered:**\n* [Injection](https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A1-Injection) (specifically SQL Injection)\n* [Broken Authentication](https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A2-Broken_Authentication) (as we aim to bypass login mechanisms)\n\n> **Getting Started:**\n> * If you\'ve never launched a VM before, follow the guide below to download and use the OpenVPN config file to connect to the machine\n> * Launch your virtual machine and access it via the provided IP address\n> * The vulnerable app is running on port 3000\n\n**Note:**\nBefore we get into the actual hacking part, it\'s good to have a look around. In Burp, set the Intercept mode to off and then browse around the site. This allows Burp to log different requests from the server that may be helpful later. This is called ***walking through*** the application, which is also a form of ***reconnaissance***!\n','2025-05-27 14:30:25.123456'),(3,4,2,0,2,'ami-06ce9edd5f1f010d6','![](https://i.imgur.com/vjfcwid.png)','Part 2: Juice Shop - Broken Authentication & Sensitive Data Exposure','MEDIUM','\nWelcome back to Part 2 of our [OWASP\'s TOP 10 vulnerabilities](https://owasp.org/www-project-top-ten/) web hacking series! Now that you\'ve completed your reconnaissance of Juice Shop, it\'s time to put your skills to the test. In this room, we\'ll dive deeper into **Broken Authentication** and **Sensitive Data Exposure** vulnerabilities, exploiting real weaknesses to gain unauthorized access.\n\n**Prerequisites :**\n* <a routerLink=\"/rooms/1\" href=\"/rooms/1\"> Complete Part 1: Juice Shop - Intro to Web Hacking & Reconnaissance first </a>\n\n**Topics Covered :**\n* [Broken Authentication](https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A2-Broken_Authentication) - Password bruteforce attacks\n* [Sensitive Data Exposure](https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A3-Sensitive_Data_Exposure) - Information disclosure vulnerabilities\n* Directory traversal and file access techniques\n\n> **Getting Started :**\n> * Launch your virtual machine from Part 1 (or start a new instance)\n> * Access Juice Shop via the provided IP address on port 3000\n> * Keep Burp Suite running to capture and analyze requests\n\n> **What You\'ll Accomplish :**<br/> \n> In this room, you\'ll complete 4 challenging tasks that demonstrate real-world attack scenarios: bruteforcing administrator credentials, exploiting information disclosure to reset user passwords, accessing confidential documents, and downloading sensitive backup files. Each task builds upon the reconnaissance knowledge from Part 1!\n','2025-05-28 14:30:25.123456'),(3,3,2,0,3,'ami-06ce9edd5f1f010d6','![](https://i.imgur.com/vjfcwid.png)','Part 3: Juice Shop - Exploiting Broken Access Control','HARD','\nWelcome to Part 3 of our [OWASP\'s TOP 10 vulnerabilities](https://owasp.org/www-project-top-ten/) web hacking series! Having mastered reconnaissance, injection attacks, authentication bypasses, and sensitive data exposure, you\'re now ready to tackle **Broken Access Control** vulnerabilities. This room focuses on bypassing authorization mechanisms to access restricted functionality and data.\n\n**Prerequisites :**\n* <a routerLink=\"/rooms/1\" href=\"/rooms/1\">Complete Part 1: Juice Shop - Intro to Web Hacking & Reconnaissance</a>\n* <a routerLink=\"/rooms/2\" href=\"/rooms/2\">Complete Part 2: Broken Authentication and Sensitive Data Exposure</a>\n\n**Topics Covered :**\n* [Broken Access Control](https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A5-Broken_Access_Control) - Authorization bypass techniques\n* Client-side security control circumvention\n* Privilege escalation attacks\n* Administrative function access\n\n> **Getting Started :**\n> * Launch your virtual machine (or continue from previous parts)\n> * Access Juice Shop via the provided IP address on port 3000\n> * Have your browser developer tools ready for client-side analysis\n> * Ensure you have admin credentials from previous parts\n\n> **What You\'ll Accomplish :** <br/>\n> In this room, you\'ll complete 3 tasks demonstrating how broken access controls can lead to unauthorized access: gaining administrative privileges, viewing other users\' private data, and performing administrative actions. Each task showcases different methods attackers use to bypass authorization checks!\n','2025-05-29 14:30:25.123456'),(4,3,0,0,4,'ami-06ce9edd5f1f010d6','![](https://i.imgur.com/vjfcwid.png)','Part 4: Juice Shop - Unmasking Cross-Site Scripting (XSS)','HARD','\nWelcome to Part 4 of our [OWASP\'s TOP 10 vulnerabilities](https://owasp.org/www-project-top-ten/) web hacking series! You\'ve now mastered reconnaissance, injection attacks, authentication bypasses, sensitive data exposure, and broken access controls. It\'s time to explore one of the most prevalent and dangerous web vulnerabilities: **Cross-Site Scripting (XSS)**. In this final room, you\'ll learn to exploit XSS vulnerabilities to execute malicious JavaScript in victims\' browsers.\n\n**Prerequisites:**\n* <a routerLink=\"/rooms/1\" href=\"/rooms/1\"> Complete Part 1: Juice Shop - Intro to Web Hacking & Reconnaissance </a>\n* <a routerLink=\"/rooms/2\" href=\"/rooms/2\"> Complete Part 2: Broken Authentication and Sensitive Data Exposure</a>\n* <a routerLink=\"/rooms/3\" href=\"/rooms/3\"> Complete Part 3: Broken Access Control</a>\n\n**Topics Covered:**\n* [Cross-Site Scripting (XSS)](https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A7-Cross-Site_Scripting_%28XSS%29) - Client-side code injection\n* DOM-based XSS exploitation\n* Persistent (Stored) XSS attacks\n* Reflected XSS vulnerabilities\n\n> **Getting Started:**\n> * Launch your virtual machine (or continue from previous parts)\n> * Access Juice Shop via the provided IP address on port 3000\n> * Have your admin credentials ready from previous parts\n> * Prepare to test various input fields for XSS vulnerabilities\n\n> **What You\'ll Accomplish:** <br/>\n> In this final room, you\'ll complete 3 XSS challenges that demonstrate the three main types of Cross-Site Scripting attacks. You\'ll learn to inject malicious JavaScript through DOM manipulation, store persistent payloads, and exploit reflected XSS vulnerabilities. Master these techniques to understand how attackers can hijack user sessions and steal sensitive data!\n','2025-05-30 14:30:25.123456');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge`
--

DROP TABLE IF EXISTS `challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_id` bigint DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `instructions` longtext,
  PRIMARY KEY (`id`),
  KEY `FK74j9mbaj1xb152i2h9elyf2w5` (`room_id`),
  CONSTRAINT `FK74j9mbaj1xb152i2h9elyf2w5` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge`
--

LOCK TABLES `challenge` WRITE;
/*!40000 ALTER TABLE `challenge` DISABLE KEYS */;
INSERT INTO `challenge` VALUES (1,1,'admin@juice-sh.op','Reconaissance','What\'s the Administrator\'s email address?',NULL,'hint : The reviews show each user\'s email address. Which, by clicking on the Apple Juice product, shows us the Admin email!'),(2,1,'q','Reconaissance','What parameter is used for searching? ',NULL,'hint : pay attention to the URL which will now update with the text we just entered.'),(3,1,'32a5e0f21372bcc1000a6088b93b458e41f0e02a','Injection','Log into the administrator account!',NULL,'hint : use  burpsuite and put this ÔÇÿ or 1=1 --  in the email field.'),(4,1,'fb364762a3c102b2db932069c0e6b78e738d4066','Injection','Log into the Bender account! ',NULL,'hint : use this bender@juice-sh.op\'-- in the email field in burpsuite'),(5,2,'c2110d06dc6f81c67cd8099ff0ba601241f1ac0e','Broken Authentication','Bruteforce the Administrator account\'s password!',NULL,'hint : use the best1050.txt from Seclists. (Which can be installed via: apt-get install seclists)'),(6,2,'094fbc9b48e525150ba97d05b942bbf114987257','Sensitive Data Exposure','Reset Jim\'s password!',NULL,'hint : Google \"Jim Star TrekÔÇØ'),(7,2,'edf9281222395a1c5fee9b89e32175f1ccf50c5b','Sensitive Data Exposure','Access the Confidential Document!',NULL,'hint : navigate to  http://MACHINE_IP/ftp'),(8,2,'bfc1e6b4a16579e85e06fee4c36ff8c02fb13795','Sensitive Data Exposure','Download the Backup file! ',NULL,'hint : search for Poison Null Byte'),(9,3,'946a799363226a24822008503f5d1324536629a0','Broken Access Control','Access the administration page!',NULL,'hint :  navigate  in the Web Developers menu and search for main-es2015.js.'),(10,3,'41b997a36cc33fbe4f0ba018474e19ae5ce52121','Broken Access Control','View another user\'s shopping basket!',NULL,'hint : Login to the Admin account and click on \'Your Basket\'.'),(11,3,'50c97bcce0b895e446d61c83a21df371ac2266ef','Broken Access Control','Remove all 5-star reviews!',NULL,'hint : Navigate to the  http://MACHINE_IP/#/administration page again and click the bin icon next to the review with 5 stars!'),(12,4,'9aaf4bbea5c30d00a1f5bbcfce4db6d4b0efe0bf','cross-site scripting','Perform a DOM XSS!',NULL,'hint : We will be using the iframe element with a javascript alert tag:  <iframe src=\"javascript:alert(`xss`)\">  Inputting this into the search bar will trigger the alert.'),(13,4,'149aa8ce13d7a4a8a931472308e269c94dc5f156','cross-site scripting','Perform a persistent XSS!',NULL,NULL),(14,4,'23cefee1527bde039295b2616eeb29e1edc660a0','cross-site scripting','Perform a reflected XSS!',NULL,'hint : Login into the admin account and navigate to the \'Order History\' page.');
/*!40000 ALTER TABLE `challenge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-16  6:41:25
