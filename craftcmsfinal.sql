-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 26, 2021 at 03:04 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craftcmsfinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
CREATE TABLE IF NOT EXISTS `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(66, 1, 1, 1, 'slike.jpg', 'image', 960, 600, 415303, NULL, 0, 0, '2021-01-16 21:18:31', '2021-01-16 21:18:31', '2021-01-16 21:18:31', '2853a172-fbc8-487e-b2c8-f8f090ad9e2c'),
(106, 1, 1, 1, 'slike.jpg', 'image', 960, 600, 414826, NULL, 0, 0, '2021-01-19 11:06:13', '2021-01-19 11:06:13', '2021-01-19 11:06:13', 'c49dd2e0-213f-4044-ac36-d0d6e7178723'),
(270, 1, 1, 1, 'ispitni-rješenje.jpg', 'image', 976, 733, 54884, NULL, NULL, NULL, '2021-01-24 09:34:50', '2021-01-24 09:34:50', '2021-01-24 09:34:50', '61cf33bf-53e9-4405-a6c7-72c276f17a38'),
(275, 1, 1, 1, 'ispitni-rješenje_2021-01-24-124425.jpg', 'image', 976, 733, 54884, NULL, NULL, NULL, '2021-01-24 12:44:25', '2021-01-24 12:44:26', '2021-01-24 12:44:26', '9052231b-a34e-4f11-b60b-3d4d57436293');

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
CREATE TABLE IF NOT EXISTS `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
CREATE TABLE IF NOT EXISTS `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransforms_name_idx` (`name`),
  KEY `assettransforms_handle_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assettransforms`
--

INSERT INTO `assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `width`, `height`, `format`, `quality`, `interlace`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ImageTransform', 'imagetransform', 'fit', 'center-center', 700, 700, NULL, NULL, 'none', '2021-01-16 21:26:49', '2021-01-16 21:26:49', '2021-01-16 21:26:49', 'c20bf755-3d14-44df-9305-47b9c0f8ff3d');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
CREATE TABLE IF NOT EXISTS `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
CREATE TABLE IF NOT EXISTS `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
CREATE TABLE IF NOT EXISTS `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(11, 1, 'enabled', '2021-01-14 18:50:36', 0, 1),
(171, 1, 'slug', '2021-01-20 20:03:14', 0, 1),
(171, 1, 'title', '2021-01-20 19:57:09', 0, 1),
(171, 1, 'uri', '2021-01-20 20:22:27', 0, 1),
(235, 1, 'title', '2021-01-24 20:25:52', 0, 1),
(288, 1, 'title', '2021-01-24 20:47:23', 0, 1),
(303, 1, 'title', '2021-01-25 14:10:11', 0, 1),
(322, 1, 'title', '2021-01-24 21:01:58', 0, 1),
(332, 1, 'title', '2021-01-24 21:01:40', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
CREATE TABLE IF NOT EXISTS `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(18, 1, 4, '2021-01-24 20:23:42', 0, 1),
(122, 1, 4, '2021-01-19 13:22:14', 0, 1),
(125, 1, 4, '2021-01-19 13:21:27', 0, 1),
(235, 1, 4, '2021-01-24 20:25:52', 0, 1),
(235, 1, 19, '2021-01-23 15:16:50', 0, 1),
(238, 1, 4, '2021-01-23 14:11:29', 0, 1),
(288, 1, 4, '2021-01-24 20:47:23', 0, 1),
(288, 1, 24, '2021-01-26 13:54:11', 0, 1),
(303, 1, 4, '2021-01-24 20:54:27', 0, 1),
(303, 1, 24, '2021-01-26 13:55:59', 0, 1),
(322, 1, 4, '2021-01-24 20:58:31', 0, 1),
(332, 1, 4, '2021-01-24 21:00:33', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_description` varchar(1200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_description`) VALUES
(1, 1, 1, NULL, '2021-01-11 20:06:57', '2021-01-11 20:06:57', 'e96207d3-2bba-412a-af89-adeed2b0047e', NULL),
(2, 2, 1, 'Hompage', '2021-01-13 14:11:50', '2021-01-13 19:47:30', 'daecfb5c-e5b6-4087-869f-fb5811a22270', NULL),
(3, 3, 1, 'Hompage', '2021-01-13 14:11:50', '2021-01-13 14:11:50', '553a0ac4-b51e-46b9-a760-d8d66f7722db', NULL),
(4, 4, 1, 'Hompage', '2021-01-13 14:14:13', '2021-01-13 14:14:13', 'bccce4d5-4f61-4aa0-87a7-394450530b4c', NULL),
(5, 5, 1, 'My first Blog', '2021-01-13 19:39:31', '2021-01-13 19:39:47', 'f5ad0642-a4ca-45c6-8a66-8bd26ff2c8b1', NULL),
(7, 7, 1, 'My first blog', '2021-01-13 19:42:06', '2021-01-13 19:47:22', '37bad98a-7c7a-4b53-806d-caefaff7ce3f', NULL),
(8, 8, 1, 'My first blog', '2021-01-13 19:42:06', '2021-01-13 19:42:06', '3cbda576-cc5f-4f03-8027-eb1161c50288', NULL),
(9, 9, 1, 'My first blog', '2021-01-13 19:42:48', '2021-01-13 19:42:48', '1bca4491-2d1c-4948-96b7-8b57a218dad2', NULL),
(11, 11, 1, 'About', '2021-01-13 19:47:09', '2021-01-14 18:50:36', '31692487-80ca-4661-91a3-5679a812877e', NULL),
(12, 12, 1, 'About', '2021-01-13 19:47:09', '2021-01-13 19:47:09', '0d2b3dca-0081-4b65-a3b9-7c1e851e91e7', NULL),
(13, 13, 1, 'My first blog', '2021-01-13 19:47:22', '2021-01-13 19:47:22', '960c05fc-b971-42df-9a3c-0a6e9f2079c5', NULL),
(14, 14, 1, 'Hompage', '2021-01-13 19:47:30', '2021-01-13 19:47:30', 'ea5e155a-3536-4802-92d1-d6b033656578', NULL),
(15, 15, 1, 'About', '2021-01-14 18:50:10', '2021-01-14 18:50:10', 'ba5f1aa4-5cf3-453d-a090-02eacdcc5915', NULL),
(16, 16, 1, 'About', '2021-01-14 18:50:24', '2021-01-14 18:50:24', '76d24c94-9a74-4833-b71a-fc5ab220e3fc', NULL),
(17, 17, 1, 'About', '2021-01-14 18:50:36', '2021-01-14 18:50:36', 'fca79f21-07f2-4e78-92a3-6fe75172eb65', NULL),
(18, 18, 1, 'Home', '2021-01-14 18:53:18', '2021-01-24 20:23:42', '2195759c-d947-4a2f-87af-b996884dac2b', NULL),
(19, 19, 1, 'Home', '2021-01-14 18:53:18', '2021-01-14 18:53:18', '4ea894a9-209c-4e9c-a153-49512f393da8', NULL),
(20, 20, 1, 'Home', '2021-01-16 11:39:46', '2021-01-16 11:39:46', 'd130c7df-6d72-427f-aae7-630d903625ef', NULL),
(21, 25, 1, 'Home', '2021-01-16 11:43:27', '2021-01-16 11:43:27', 'e6a99110-4cae-4ca7-965f-b0226b52e091', NULL),
(22, 30, 1, 'Home', '2021-01-16 11:45:26', '2021-01-16 11:45:26', '772b85e8-71f7-4554-812e-aa33d443ed6e', NULL),
(23, 36, 1, 'Home', '2021-01-16 11:47:56', '2021-01-16 11:47:56', '750492e3-54ed-435f-b566-ecacf46612df', NULL),
(24, 42, 1, 'Home', '2021-01-16 20:30:10', '2021-01-16 20:30:10', 'f7936f2e-5a96-44ea-94c5-7f1f906950e9', NULL),
(25, 48, 1, 'Home', '2021-01-16 20:44:58', '2021-01-16 20:44:58', '4285bbd1-2ead-4e4d-a218-dfcf0e787b5f', NULL),
(26, 54, 1, 'Home', '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'bbd21a17-6e33-46c2-9d1a-a8232e2504e0', NULL),
(27, 60, 1, 'Home', '2021-01-16 21:13:22', '2021-01-16 21:13:22', '2fc5cd73-c4dd-4c56-9193-b14b52ea3e0c', NULL),
(28, 66, 1, 'Slike', '2021-01-16 21:18:30', '2021-01-16 21:18:30', 'b571223d-a44e-4c55-b488-d91569306670', NULL),
(29, 68, 1, 'Home', '2021-01-16 21:18:34', '2021-01-16 21:18:34', 'cb972176-b63c-4f9a-b038-cf0cc798152f', NULL),
(30, 75, 1, 'Home', '2021-01-16 21:23:48', '2021-01-16 21:23:48', '7488b442-993f-4865-9273-2b26176f473d', NULL),
(31, 82, 1, 'Home', '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'cd958f1d-698d-43a5-bdc3-651767e99e9b', NULL),
(32, 89, 1, 'Home', '2021-01-19 09:45:39', '2021-01-19 09:45:39', 'f58e060e-d371-4cd8-b1b5-5ba53fef2118', NULL),
(34, 102, 1, 'Vijesti', '2021-01-19 09:47:13', '2021-01-19 09:47:13', '94800206-e5a6-407f-8e28-eb4fbbffd386', NULL),
(35, 104, 1, 'Vijesti', '2021-01-19 09:47:13', '2021-01-19 09:47:13', '2d86cdd5-ba20-4219-a655-b4e342aead81', NULL),
(36, 106, 1, 'Slike', '2021-01-19 11:06:13', '2021-01-19 11:06:13', '29b7d597-d5e2-483e-a7bb-dfbf97296705', NULL),
(37, 107, 1, 'Home', '2021-01-19 11:35:53', '2021-01-19 11:35:53', 'c8def379-9833-4127-869e-bf9517299f4d', NULL),
(38, 108, 1, 'Home', '2021-01-19 11:38:46', '2021-01-19 11:38:46', 'b80009d7-06db-4e63-b1a8-51659dc5ce96', NULL),
(39, 110, 1, 'Home', '2021-01-19 11:46:58', '2021-01-19 11:46:58', 'acc684d1-369d-4dca-b1d1-61b0ebb1869b', NULL),
(40, 112, 1, 'Home', '2021-01-19 12:08:38', '2021-01-19 12:08:38', '4c07c7a9-2721-4f74-b541-7b7b6f66f34a', NULL),
(41, 114, 1, 'Home', '2021-01-19 12:18:09', '2021-01-19 12:18:09', '7a2ee9a9-2e68-46a0-b2df-bcb329bfdc38', NULL),
(42, 116, 1, 'Home', '2021-01-19 12:19:21', '2021-01-19 12:19:21', '65259daa-0312-48b8-8883-2af4860cd80c', NULL),
(43, 119, 1, 'Home', '2021-01-19 12:53:44', '2021-01-19 12:53:44', '2d8d3c9e-2817-49d4-8457-c717ee0b099c', NULL),
(44, 122, 1, 'About Us', '2021-01-19 13:16:11', '2021-01-19 13:22:14', '4b983308-6ef5-452e-bfa5-8b055de05f00', NULL),
(45, 123, 1, 'About Us', '2021-01-19 13:16:11', '2021-01-19 13:16:11', '439367a7-5264-451b-b53c-ca412e068bdb', NULL),
(46, 124, 1, 'About Us', '2021-01-19 13:16:19', '2021-01-19 13:16:19', '4f8814b3-a025-4460-81db-d80693d5bbb7', NULL),
(47, 125, 1, 'Contact', '2021-01-19 13:16:46', '2021-01-19 14:04:44', 'b5b7fc55-8ae3-4035-b441-5e01314039c2', NULL),
(48, 126, 1, 'Contact', '2021-01-19 13:16:46', '2021-01-19 13:16:46', '4bf81943-045c-41c1-b86e-24ba7a74ee8b', NULL),
(49, 127, 1, 'Contact', '2021-01-19 13:16:51', '2021-01-19 13:16:51', 'c82753b5-60ce-4225-a727-6363c6401c53', NULL),
(50, 128, 1, 'About Us', '2021-01-19 13:17:35', '2021-01-19 13:17:35', 'a3ea968f-9cd4-4514-a903-1b72a0145c4a', NULL),
(51, 129, 1, 'Contact', '2021-01-19 13:17:42', '2021-01-19 13:17:42', '9c09b0da-90d2-4ff6-a494-86db58eef58a', NULL),
(52, 130, 1, 'About Us', '2021-01-19 13:19:38', '2021-01-19 13:19:38', '5d1e967c-3474-41c1-8022-d2eeb08cc2eb', NULL),
(53, 132, 1, 'About Us', '2021-01-19 13:20:06', '2021-01-19 13:20:06', 'dc270fcb-6846-4130-bdb6-d808b8f04624', NULL),
(54, 134, 1, 'Contact', '2021-01-19 13:21:10', '2021-01-19 13:21:10', 'f6c0abb7-ea75-4db2-90b8-f6d661947620', NULL),
(55, 136, 1, 'Contact', '2021-01-19 13:21:27', '2021-01-19 13:21:27', 'b8f9b2ee-094c-4727-938c-fb5b66a8c5a9', NULL),
(56, 138, 1, 'About Us', '2021-01-19 13:21:54', '2021-01-19 13:21:54', 'c12c629b-1bd0-4f6f-932c-304752ad0f69', NULL),
(57, 141, 1, 'About Us', '2021-01-19 13:22:14', '2021-01-19 13:22:14', '3d2ad8ac-ee35-4875-8fc7-9b4b9a47e328', NULL),
(58, 144, 1, NULL, '2021-01-19 13:25:49', '2021-01-23 14:21:47', '7b073728-f4fc-4f5f-855e-eabfe6cb4bb1', NULL),
(59, 147, 1, 'Contact', '2021-01-19 14:04:25', '2021-01-19 14:04:25', '99f3369c-6112-4e6e-8cae-1768352ce742', NULL),
(60, 149, 1, 'Contact', '2021-01-19 14:04:44', '2021-01-19 14:04:44', '888cd265-8a2e-4692-b44d-ea96709598ca', NULL),
(62, 171, 1, 'Vijesti', '2021-01-20 19:56:06', '2021-01-21 08:48:58', 'bebab780-ebcb-4484-83c6-21d1b581aca9', NULL),
(63, 175, 1, 'Senzacionalno', '2021-01-20 19:56:06', '2021-01-20 19:56:06', 'a8dd67ec-3a3e-407a-9d48-cd1b9b0548ef', NULL),
(64, 179, 1, 'Vijesti', '2021-01-20 19:57:09', '2021-01-20 19:57:09', 'bfd44f21-feac-4fdf-8102-5d34cb9050e7', NULL),
(65, 183, 1, 'Vijesti', '2021-01-20 20:03:03', '2021-01-20 20:03:03', 'fd0439e9-0da0-4520-82d8-fa8c1c886fa9', NULL),
(66, 187, 1, 'Vijesti', '2021-01-20 20:03:14', '2021-01-20 20:03:14', '2f926e1e-e7a2-46b0-b5d9-5ed0bb72976c', NULL),
(67, 191, 1, 'Vijesti', '2021-01-20 20:06:09', '2021-01-20 20:06:09', '3908f7e5-4e9f-4336-89c4-b1408fcc39b7', NULL),
(68, 195, 1, 'Vijesti', '2021-01-20 20:06:17', '2021-01-20 20:06:17', 'b1812d39-3c25-40fc-a98d-b8a51323ebe5', NULL),
(69, 199, 1, 'Vijesti', '2021-01-20 20:17:47', '2021-01-20 20:17:47', 'b42a01b4-ba85-4caf-a18c-b3780b721696', NULL),
(70, 203, 1, 'Vijesti', '2021-01-20 20:18:51', '2021-01-20 20:18:51', '02157fd8-b83b-47d6-9906-dc66a6e09fa0', NULL),
(71, 207, 1, 'Vijesti', '2021-01-20 20:19:01', '2021-01-20 20:19:01', '51c1f0dc-712e-4ba9-90c4-e64d9071f7c6', NULL),
(72, 211, 1, 'Vijesti', '2021-01-20 20:22:04', '2021-01-20 20:22:04', '4d0f662e-b09e-4106-ad56-01bcacc2cf17', NULL),
(73, 215, 1, 'Vijesti', '2021-01-20 20:22:05', '2021-01-20 20:22:05', 'ec56a4ff-8c1f-4a80-a43f-674644026525', NULL),
(74, 219, 1, 'Vijesti', '2021-01-20 20:22:08', '2021-01-20 20:22:08', 'b0a7bdcd-c151-4b3f-a327-d9a52bbe5c1d', NULL),
(75, 223, 1, 'Vijesti', '2021-01-20 20:22:27', '2021-01-20 20:22:27', 'e999e82a-b03e-414f-b60e-332adf937a87', NULL),
(76, 227, 1, 'Vijesti', '2021-01-20 20:22:27', '2021-01-20 20:22:27', '9d34b858-1ab1-4beb-88ee-9d0d99235da8', NULL),
(77, 231, 1, 'Vijesti', '2021-01-21 08:48:58', '2021-01-21 08:48:58', 'fc82b605-133d-4143-88ac-f3d81b837816', NULL),
(78, 235, 1, 'Prvi smo ušli na impresivno gradilište Silicijske doline u Zagrebu', '2021-01-23 13:36:57', '2021-01-24 20:45:09', 'a18fbedc-787b-4583-9b0b-683f411ff5ee', NULL),
(79, 236, 1, 'Vijesti', '2021-01-23 13:36:57', '2021-01-23 13:36:57', 'fffbba91-936d-4c13-9b42-dbab86868d7c', NULL),
(80, 237, 1, 'Vijesti', '2021-01-23 13:39:32', '2021-01-23 13:39:32', '0b8cb95d-128c-4831-806d-3dd91b28647c', NULL),
(81, 238, 1, 'Video', '2021-01-23 13:39:55', '2021-01-23 14:11:29', 'a6d0400c-a995-4bdc-8060-0988b9efb644', NULL),
(82, 239, 1, 'Video', '2021-01-23 13:39:55', '2021-01-23 13:39:55', 'f958b5e1-93fc-46aa-ac7c-d8a288b6b345', NULL),
(83, 240, 1, 'Video', '2021-01-23 13:40:01', '2021-01-23 13:40:01', 'e3fd99c2-8616-4005-975b-a7b850e568a7', NULL),
(84, 241, 1, 'Vijesti', '2021-01-23 14:09:36', '2021-01-23 14:09:36', '3bbcc470-308e-4992-8446-e35090ea0b7e', NULL),
(85, 242, 1, 'Video', '2021-01-23 14:09:53', '2021-01-23 14:09:53', '8279f14d-6477-4c9b-9555-fda9e9a8fb97', NULL),
(86, 243, 1, 'Video', '2021-01-23 14:10:34', '2021-01-23 14:10:34', 'edc1918b-ca21-4160-88b6-a43dda1def58', NULL),
(87, 244, 1, 'Vijesti', '2021-01-23 14:10:48', '2021-01-23 14:10:48', '0ff49e28-0426-4c03-81c1-2194e7f02791', NULL),
(88, 246, 1, 'Vijesti', '2021-01-23 14:11:17', '2021-01-23 14:11:17', '5f0506bf-a23c-4f42-b75e-b61b7e634412', NULL),
(89, 249, 1, 'Video', '2021-01-23 14:11:29', '2021-01-23 14:11:29', '29ab65fe-1ada-42da-978a-5f49961491fc', NULL),
(90, 251, 1, NULL, '2021-01-23 14:22:25', '2021-01-24 21:12:02', 'd78ad59b-6ac2-4422-8cae-41181485f691', NULL),
(91, 254, 1, 'Vijesti', '2021-01-23 15:16:36', '2021-01-23 15:16:36', 'cc0aabf5-d60a-4185-940e-eaa5cf67eafd', NULL),
(92, 256, 1, 'Vijesti', '2021-01-23 15:16:50', '2021-01-23 15:16:50', '60d36b8b-a1a4-4586-91f8-7ebafb12aeeb', NULL),
(93, 258, 1, 'Vijesti', '2021-01-23 15:31:03', '2021-01-23 15:31:03', 'fa58714a-fef2-43cd-8330-63525d4907f4', NULL),
(94, 260, 1, 'Vijesti', '2021-01-23 15:31:17', '2021-01-23 15:31:17', '5c876a83-a083-4741-b080-8ba8a2a43221', NULL),
(95, 268, 1, 'Vijesti', '2021-01-23 16:29:53', '2021-01-23 16:29:53', '0f96f4df-f588-4236-9535-f519f2511226', NULL),
(96, 270, 1, 'Ispitni rješenje', '2021-01-24 09:34:50', '2021-01-24 09:34:50', 'c3d64d9e-b027-4a12-9e33-3fe85bb13a41', NULL),
(97, 272, 1, 'Vijesti', '2021-01-24 09:34:58', '2021-01-24 09:34:58', '97144758-1783-4bd5-b653-fd8f5f53b888', NULL),
(98, 275, 1, 'Ispitni rješenje', '2021-01-24 12:44:25', '2021-01-24 12:44:25', 'f169e139-0846-4c36-b8db-eed42fc1b2bf', NULL),
(99, 276, 1, 'Vijesti', '2021-01-24 12:44:49', '2021-01-24 12:44:49', 'dfc6c08a-7274-4ecb-aec1-810087a55807', NULL),
(100, 279, 1, 'Vijesti', '2021-01-24 18:41:37', '2021-01-24 18:41:37', 'e73d72cf-088d-45d3-94f9-b87e21b2588a', NULL),
(101, 281, 1, 'Home', '2021-01-24 20:23:42', '2021-01-24 20:23:42', 'c45470c0-a03d-4ac6-8088-8c0a6a558bd9', NULL),
(102, 285, 1, 'Prvi smo ušli na impresivno gradilište Silicijske doline u Zagrebu', '2021-01-24 20:25:52', '2021-01-24 20:25:52', '98e12a44-f3dc-4ff9-a69f-054782cd9849', NULL),
(103, 288, 1, 'BARCELONA POBJEĐUJE I BEZ LIONELA MESSIJA, MLADI TALENT ZABIO PRVIJENAC ZA KATALONCE', '2021-01-24 20:44:30', '2021-01-26 13:54:11', 'd9e97ae5-edb9-4d75-bdca-823beeb5d9a8', 'Nogometaši Barcelone slavili su u 20. kolu Primere u gostima kod Elchea s 2-0, a pobjedom su se popeli na treće mjesto.'),
(104, 289, 1, 'Sport', '2021-01-24 20:44:30', '2021-01-24 20:44:30', '4d0f21b1-6b8a-4885-ba69-3cfd2bb3e562', NULL),
(105, 290, 1, 'Prvi smo ušli na impresivno gradilište Silicijske doline u Zagrebu', '2021-01-24 20:44:35', '2021-01-24 20:44:35', '11ec9992-e51f-4e61-af88-a5b34285af49', NULL),
(106, 293, 1, 'Sport', '2021-01-24 20:45:01', '2021-01-24 20:45:01', '564d26a6-bd27-43bd-bda4-79474e42e055', NULL),
(107, 294, 1, 'Prvi smo ušli na impresivno gradilište Silicijske doline u Zagrebu', '2021-01-24 20:45:09', '2021-01-24 20:45:09', 'b1567152-fcf2-4f4d-9473-9987bc431653', NULL),
(108, 297, 1, 'Sport', '2021-01-24 20:45:15', '2021-01-24 20:45:15', '8aa52da1-444a-4a82-bb31-4cbe3536990c', NULL),
(109, 300, 1, 'BARCELONA POBJEĐUJE I BEZ LIONELA MESSIJA, MLADI TALENT ZABIO PRVIJENAC ZA KATALONCE', '2021-01-24 20:47:23', '2021-01-24 20:47:23', '5ec6baec-7242-46ce-9987-f72643f26dd2', NULL),
(110, 303, 1, 'U pet godina izgubili 4,5 milijardi dolara: \"Razmišljamo o izlasku s tržišta pametnih telefona', '2021-01-24 20:52:44', '2021-01-26 13:56:02', 'de560738-7380-4af6-b445-d7997f050432', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu \n izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald.'),
(111, 304, 1, 'Novac', '2021-01-24 20:52:45', '2021-01-24 20:52:45', 'c78d761f-3bdd-42f5-be8c-183f1077a7bb', NULL),
(112, 305, 1, 'Novac', '2021-01-24 20:52:45', '2021-01-24 20:52:45', '3dc24897-d4c0-48c2-89fc-f1078ff6439c', NULL),
(113, 306, 1, 'Novac', '2021-01-24 20:53:04', '2021-01-24 20:53:04', '850e3638-f017-472a-a0e0-69b77e21429f', NULL),
(114, 310, 1, 'Novac', '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'e5a58ed5-435e-47f8-9e35-d14fc0d1e52b', NULL),
(115, 314, 1, 'Novac', '2021-01-24 20:55:21', '2021-01-24 20:55:21', '33cd4e34-5aeb-4afb-b143-c452bfc4528d', NULL),
(116, 318, 1, 'Novac', '2021-01-24 20:55:23', '2021-01-24 20:55:23', 'b400024c-1eb2-4c5c-8c2a-b82843fecae3', NULL),
(117, 322, 1, 'Donedavno miljenik svijeta glazbe, sada o njegovom novom albumu ne piše gotovo nitko', '2021-01-24 20:56:34', '2021-01-24 21:01:57', 'ab3bb3cf-4bae-4df0-a99a-22da71c354a0', NULL),
(118, 323, 1, 'Kultura', '2021-01-24 20:56:34', '2021-01-24 20:56:34', 'e49f4068-1f96-492f-b95c-fb875df7a2fd', NULL),
(119, 324, 1, 'Kultura', '2021-01-24 20:56:42', '2021-01-24 20:56:42', 'e002b39f-ba66-4810-9ede-a348e7234626', NULL),
(120, 328, 1, 'Kultura', '2021-01-24 20:58:31', '2021-01-24 20:58:31', 'a566f7cf-c8df-4f66-b843-f7429a04a956', NULL),
(121, 332, 1, 'Ornela Vištica drastično promijenila imidž: ‘Uspoređuju me s Melanijom Trump!‘', '2021-01-24 20:58:54', '2021-01-24 21:01:40', '71ec1904-8f12-464c-97d3-26ea944a265c', NULL),
(122, 333, 1, 'Scena', '2021-01-24 20:58:54', '2021-01-24 20:58:54', '1c5b21e4-88b7-40d3-9342-8a7a9190193b', NULL),
(123, 334, 1, 'Scena', '2021-01-24 20:59:06', '2021-01-24 20:59:06', 'bfbf11ba-fe25-4b4f-aeeb-8b4cc7e4f88c', NULL),
(124, 338, 1, 'Scena', '2021-01-24 21:00:33', '2021-01-24 21:00:33', '7f228030-12d1-4416-b0e1-92bcf0db3a77', NULL),
(125, 342, 1, 'Kultura', '2021-01-24 21:01:03', '2021-01-24 21:01:03', '9f6c8bf2-d47a-458b-a264-9c8a66088305', NULL),
(126, 346, 1, 'Kultura', '2021-01-24 21:01:16', '2021-01-24 21:01:16', '0443f4a7-0c33-4931-af99-e8f9bff840ae', NULL),
(127, 350, 1, 'Scena', '2021-01-24 21:01:21', '2021-01-24 21:01:21', '1b0b9c29-7bb6-48ec-a215-c608745450a9', NULL),
(128, 354, 1, 'Ornela Vištica drastično promijenila imidž: ‘Uspoređuju me s Melanijom Trump!‘', '2021-01-24 21:01:40', '2021-01-24 21:01:40', '2116c60e-f92b-48b7-a924-7b616391e37a', NULL),
(129, 358, 1, 'Donedavno miljenik svijeta glazbe, sada o njegovom novom albumu ne piše gotovo nitko', '2021-01-24 21:01:57', '2021-01-24 21:01:57', '36c7239d-302c-4b77-a49e-53fd6a22ec25', NULL),
(130, 362, 1, 'Novac', '2021-01-25 14:09:46', '2021-01-25 14:09:46', '63ca3130-599d-4bee-a307-7911ec9af81b', NULL),
(131, 366, 1, 'U pet godina izgubili 4,5 milijardi dolara: \"Razmišljamo o izlasku s tržišta pametnih telefona', '2021-01-25 14:10:11', '2021-01-25 14:10:11', 'c6e0a24c-0bc6-40a8-bcef-771a44b95037', NULL),
(132, 370, 1, 'U pet godina izgubili 4,5 milijardi dolara: \"Razmišljamo o izlasku s tržišta pametnih telefona', '2021-01-26 12:00:21', '2021-01-26 12:00:21', 'e849dc57-89f4-4b82-8f79-a4d1b52dfb50', NULL),
(133, 374, 1, 'BARCELONA POBJEĐUJE I BEZ LIONELA MESSIJA, MLADI TALENT ZABIO PRVIJENAC ZA KATALONCE', '2021-01-26 13:51:07', '2021-01-26 13:51:07', '8c234e81-6410-4155-bbc2-ef1166a4fc4b', NULL),
(134, 377, 1, 'BARCELONA POBJEĐUJE I BEZ LIONELA MESSIJA, MLADI TALENT ZABIO PRVIJENAC ZA KATALONCE', '2021-01-26 13:52:44', '2021-01-26 13:52:44', 'b7aacd48-fda8-463f-8576-042aa14ab038', 'sdkjfaskfnhksadjfn'),
(135, 380, 1, 'BARCELONA POBJEĐUJE I BEZ LIONELA MESSIJA, MLADI TALENT ZABIO PRVIJENAC ZA KATALONCE', '2021-01-26 13:54:11', '2021-01-26 13:54:11', '986343c6-f85a-4893-88bc-da87da6570d9', 'Nogometaši Barcelone slavili su u 20. kolu Primere u gostima kod Elchea s 2-0, a pobjedom su se popeli na treće mjesto.'),
(136, 383, 1, 'U pet godina izgubili 4,5 milijardi dolara: \"Razmišljamo o izlasku s tržišta pametnih telefona', '2021-01-26 13:55:19', '2021-01-26 13:55:19', '5504b1db-e787-4bf4-8a0b-32da4df5100e', NULL),
(137, 387, 1, 'U pet godina izgubili 4,5 milijardi dolara: \"Razmišljamo o izlasku s tržišta pametnih telefona', '2021-01-26 13:55:59', '2021-01-26 13:55:59', 'a6e10282-6b7a-4063-aec8-a9d2596850b4', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu \n izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald.'),
(138, 391, 1, 'U pet godina izgubili 4,5 milijardi dolara: \"Razmišljamo o izlasku s tržišta pametnih telefona', '2021-01-26 13:56:02', '2021-01-26 13:56:02', 'b70970b1-15aa-4645-a1d0-d671425e7e01', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu \n izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald.');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
CREATE TABLE IF NOT EXISTS `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
CREATE TABLE IF NOT EXISTS `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deprecationerrors`
--

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(34, 'ElementQuery::getIterator()', 'C:\\wamp64\\www\\craftcmsfinal\\templates\\home.twig:64', '2021-01-26 13:42:50', 'C:\\wamp64\\www\\craftcmsfinal\\templates\\home.twig', 64, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":569,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\storage\\\\runtime\\\\compiled_templates\\\\d0\\\\d0aafad0f4c74ed37408dfaf2c55f56bc556532a3ea8608e0a0d1bb5d5251a44.php\",\"line\":219,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\storage\\\\runtime\\\\compiled_templates\\\\79\\\\79dd7bcfacd8623fc575773c7a98bc7d71d0be2ddc992d8006fd4b27f3082eb4.php\",\"line\":99,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\storage\\\\runtime\\\\compiled_templates\\\\d0\\\\d0aafad0f4c74ed37408dfaf2c55f56bc556532a3ea8608e0a0d1bb5d5251a44.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-01-26 13:42:50', '2021-01-26 13:42:50', '9834259e-0aa4-4216-8ad7-0833a64983c8'),
(39, 'ElementQuery::getIterator()', 'C:\\wamp64\\www\\craftcmsfinal\\templates\\home.twig:77', '2021-01-26 13:56:17', 'C:\\wamp64\\www\\craftcmsfinal\\templates\\home.twig', 77, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":569,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\storage\\\\runtime\\\\compiled_templates\\\\d0\\\\d0aafad0f4c74ed37408dfaf2c55f56bc556532a3ea8608e0a0d1bb5d5251a44.php\",\"line\":223,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\storage\\\\runtime\\\\compiled_templates\\\\79\\\\79dd7bcfacd8623fc575773c7a98bc7d71d0be2ddc992d8006fd4b27f3082eb4.php\",\"line\":99,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_59efcb274ad8d9d38b977934ec02de70877bf08577eb08a23fdd6a07b19e4374\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\storage\\\\runtime\\\\compiled_templates\\\\d0\\\\d0aafad0f4c74ed37408dfaf2c55f56bc556532a3ea8608e0a0d1bb5d5251a44.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_bda9d09c5c2dad12e846ae3b6f5a66cd903517143c647135205729e57ae214be\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\wamp64\\\\www\\\\craftcmsfinal\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-01-26 13:56:17', '2021-01-26 13:56:17', '8c50bf96-66d9-4c27-9b6e-7351199e5cd2');

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
CREATE TABLE IF NOT EXISTS `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `name`, `notes`, `trackChanges`, `dateLastMerged`) VALUES
(1, NULL, 1, 'First draft', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
CREATE TABLE IF NOT EXISTS `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
CREATE TABLE IF NOT EXISTS `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-01-11 20:06:57', '2021-01-11 20:06:57', NULL, '7888e83d-5271-4bc5-81d9-240e3bfb3239'),
(2, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-01-13 14:11:50', '2021-01-13 19:47:30', '2021-01-14 18:53:00', '9c73e3e4-6fa2-4cab-8027-3484c374edff'),
(3, NULL, 1, 2, 'craft\\elements\\Entry', 1, 0, '2021-01-13 14:11:50', '2021-01-13 14:11:50', '2021-01-14 18:53:00', 'eac7589f-a339-41a2-85d2-fb2e3d8dccf7'),
(4, NULL, 2, 2, 'craft\\elements\\Entry', 1, 0, '2021-01-13 14:14:13', '2021-01-13 14:14:13', '2021-01-14 18:53:00', 'c4a7cb0a-90e6-4c39-ae9f-13702de49cf9'),
(5, 1, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-01-13 19:39:31', '2021-01-13 19:39:47', NULL, '8d8560a3-e6f6-4059-a15d-572a780f2d62'),
(7, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-01-13 19:42:06', '2021-01-13 19:47:22', '2021-01-14 18:53:03', '98541375-5a32-453a-9795-b73be9365734'),
(8, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2021-01-13 19:42:06', '2021-01-13 19:42:06', '2021-01-14 18:53:03', '1e6d5968-3cda-45a9-8361-72bc4096dbbd'),
(9, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2021-01-13 19:42:47', '2021-01-13 19:42:47', '2021-01-14 18:53:03', 'b57d4f29-4c36-469b-b03f-ccce7e73a25f'),
(11, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2021-01-13 19:47:09', '2021-01-14 18:50:36', '2021-01-14 18:53:05', '0bf401b9-e9fc-4074-8346-0a2c36e9341a'),
(12, NULL, 5, 3, 'craft\\elements\\Entry', 1, 0, '2021-01-13 19:47:09', '2021-01-13 19:47:09', '2021-01-14 18:53:05', 'bd38b977-200b-4af8-88e5-e7c3dcafee3f'),
(13, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2021-01-13 19:47:22', '2021-01-13 19:47:22', '2021-01-14 18:53:03', '2316ce54-f40a-4854-a4ab-81e5496ee4bc'),
(14, NULL, 7, 2, 'craft\\elements\\Entry', 1, 0, '2021-01-13 19:47:30', '2021-01-13 19:47:30', '2021-01-14 18:53:00', 'e076267a-4caf-49e9-8c71-3f2cd2036d9b'),
(15, NULL, 8, 3, 'craft\\elements\\Entry', 0, 0, '2021-01-14 18:50:10', '2021-01-14 18:50:10', '2021-01-14 18:53:05', '2a0ec97a-8e74-464f-8533-13a6e23267df'),
(16, NULL, 9, 3, 'craft\\elements\\Entry', 0, 0, '2021-01-14 18:50:24', '2021-01-14 18:50:24', '2021-01-14 18:53:05', 'a885548b-ac3a-4e37-acfb-c06c0c36e546'),
(17, NULL, 10, 3, 'craft\\elements\\Entry', 1, 0, '2021-01-14 18:50:36', '2021-01-14 18:50:36', '2021-01-14 18:53:05', '635fa0ad-7ee7-4ff4-8883-cc44ca7f8d15'),
(18, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-14 18:53:18', '2021-01-24 20:23:42', NULL, '50896755-290c-4875-ae2d-00688cf761a2'),
(19, NULL, 11, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-14 18:53:18', '2021-01-14 18:53:18', NULL, '862f8f69-8c5d-491c-9cb3-455abe6aef57'),
(20, NULL, 12, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 11:39:46', '2021-01-16 11:39:46', NULL, '18b45a7e-ad00-4c6b-abca-811b345d3214'),
(21, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:43:27', '2021-01-16 21:18:34', '2021-01-19 11:35:53', '35a8d7c6-d6f1-48c6-90ea-bf16deea4643'),
(22, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:43:27', '2021-01-16 21:18:34', '2021-01-19 11:34:55', '021a8686-8ea8-4a4f-b996-bfc1ddec87ab'),
(23, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:43:27', '2021-01-16 21:18:34', '2021-01-19 11:35:53', '25aa3f7c-dde7-40ae-a360-7393a05c7bdd'),
(24, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '2021-01-16 11:45:26', '0963e806-deac-4d3b-808c-3892014d141f'),
(25, NULL, 13, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 11:43:27', '2021-01-16 11:43:27', NULL, '0b9e252c-c565-4eed-8421-7b8cc6fb7c00'),
(26, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:43:27', '2021-01-16 11:43:27', NULL, '788d14f8-1098-4892-9a1f-f7b353871c30'),
(27, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:43:27', '2021-01-16 11:43:27', NULL, '7a08fa04-4ea8-47c9-ae26-b86de0ee506a'),
(28, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:43:27', '2021-01-16 11:43:27', NULL, 'd8209abd-9b6b-4592-8ba5-8362b9df5941'),
(29, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:43:27', '2021-01-16 11:43:27', NULL, '2b4ff230-9b72-4c2a-ad3e-092afbe5121a'),
(30, NULL, 14, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 11:45:26', '2021-01-16 11:45:26', NULL, '4b5a4b93-ad45-4f8a-a34f-48a4b722bb03'),
(31, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:45:26', '2021-01-16 11:45:26', NULL, 'dabdd77b-fc52-4378-98a5-1f14932584e7'),
(32, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:45:26', '2021-01-16 11:45:26', NULL, 'd03754b3-68d8-4ca7-afce-a9f3866bcdcf'),
(33, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:45:26', '2021-01-16 11:45:26', NULL, '55f46838-90e2-40ee-80bd-b15b87f7fa2d'),
(34, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '2021-01-16 20:30:10', '759f5551-e9f3-4d61-b007-8b9bb0e0714f'),
(35, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:47:56', '2021-01-16 21:18:34', '2021-01-19 11:35:53', 'e0804aed-7ca0-453f-9879-2740c0cbc5da'),
(36, NULL, 15, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 11:47:56', '2021-01-16 11:47:56', NULL, '1252a6df-b1d9-4b2b-955c-ecf7c54ced09'),
(37, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:47:56', '2021-01-16 11:47:56', NULL, '353ea039-c264-4a2e-9b6a-30e0bea0e9e3'),
(38, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:47:56', '2021-01-16 11:47:56', NULL, '9bcb866d-8c58-4c3a-a033-404b67302c7d'),
(39, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:47:56', '2021-01-16 11:47:56', NULL, '7a2370bd-1035-4192-9a36-0d9e87c45b34'),
(40, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:47:56', '2021-01-16 11:47:56', NULL, '98ea3b15-06e2-426f-826f-c7c6bec34a89'),
(41, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 11:47:56', '2021-01-16 11:47:56', NULL, '654adeb1-fa13-48c9-8466-d70dd57c2a8d'),
(42, NULL, 16, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 20:30:10', '2021-01-16 20:30:10', NULL, 'e7cbdb5d-ece0-4eb7-8519-7f7eab049328'),
(43, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:30:10', '2021-01-16 20:30:10', NULL, 'cdc7d14f-1266-4854-b27f-66f0bb0be1f7'),
(44, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:30:10', '2021-01-16 20:30:10', NULL, '84578244-2b27-41bf-a4e2-ad45aa40916a'),
(45, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:30:10', '2021-01-16 20:30:10', NULL, '0e443043-01c7-4acd-aeb6-0784c8e383c0'),
(46, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:30:10', '2021-01-16 20:30:10', NULL, '99b55749-8fed-4fc2-b7ef-d1990fa98dd3'),
(47, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:44:58', '2021-01-16 21:18:34', '2021-01-19 11:34:56', '93040822-2422-4327-abd3-f31507dcea88'),
(48, NULL, 17, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 20:44:58', '2021-01-16 20:44:58', NULL, 'ffad5cfe-7c3b-4c62-b183-909d933abb14'),
(49, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:44:58', '2021-01-16 20:44:58', NULL, '66eb06f1-b0bd-43b0-b976-1c6f67ff8b29'),
(50, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:44:58', '2021-01-16 20:44:58', NULL, '3f750af8-d940-4abd-81c5-dfaf32b6ce59'),
(51, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:44:58', '2021-01-16 20:44:58', NULL, 'e49ca012-aa8e-4814-8167-f6d580565396'),
(52, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:44:58', '2021-01-16 20:44:58', NULL, '422003e8-b3d3-4340-970e-24de30f4e2be'),
(53, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 20:44:58', '2021-01-16 20:44:58', NULL, '972f7f61-7182-43b2-aae7-8dc8ad746a46'),
(54, NULL, 18, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 21:12:23', '2021-01-16 21:12:23', NULL, 'dbc7b19d-9e7c-46e7-ae9b-abaa90a0d35b'),
(55, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:12:23', '2021-01-16 20:44:58', NULL, '26defdaa-13ad-42eb-a86f-487d7c0a62e4'),
(56, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:12:23', '2021-01-16 20:44:58', NULL, 'e8ce20ed-80b1-40d5-bdb6-ce621c4446e4'),
(57, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:12:23', '2021-01-16 20:44:58', NULL, 'd836eba6-2b05-4161-a27b-eadad1a776cc'),
(58, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:12:23', '2021-01-16 20:44:58', NULL, '51d24860-ee18-49a6-ba08-982e2a7e30b3'),
(59, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:12:23', '2021-01-16 20:44:58', NULL, '1dce54e3-afb3-4b65-9d7d-6d8862c25f99'),
(60, NULL, 19, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 21:13:22', '2021-01-16 21:13:22', NULL, '8f12cf03-550d-4d31-a338-68361ac9083e'),
(61, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:13:22', '2021-01-16 20:44:58', NULL, 'cde0c1ff-44bb-40e9-b583-d876b6f09428'),
(62, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:13:22', '2021-01-16 20:44:58', NULL, '3494f4ac-7df8-4645-993c-d1f56183529f'),
(63, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:13:22', '2021-01-16 20:44:58', NULL, 'cc81e32b-0aa6-4c27-8fcb-9219cc206396'),
(64, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:13:22', '2021-01-16 20:44:58', NULL, 'e7ffb2e5-318a-44da-a310-350ae77f6346'),
(65, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:13:22', '2021-01-16 20:44:58', NULL, 'e6483e4c-d64d-4420-a431-330fcc58eaa5'),
(66, NULL, NULL, 9, 'craft\\elements\\Asset', 1, 0, '2021-01-16 21:18:30', '2021-01-16 21:18:30', '2021-01-19 11:05:41', '3917387a-b0cd-4661-af76-37c019309e59'),
(67, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '2021-01-19 11:34:56', '85fe1765-1633-4679-b6c5-4e29d7ed7f70'),
(68, NULL, 20, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 21:18:34', '2021-01-16 21:18:34', NULL, 'e1cf4afd-49c5-431a-b003-995992d9c140'),
(69, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:18:34', '2021-01-16 21:18:34', NULL, 'efc518c3-367f-40f4-87c5-12d05fb6d3db'),
(70, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:18:34', '2021-01-16 21:18:34', NULL, 'e1739cf6-af84-4955-86f0-3faae0ffc1c6'),
(71, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:18:34', '2021-01-16 21:18:34', NULL, '4db694a1-68d9-4304-98e5-f133ae70dc6c'),
(72, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:18:34', '2021-01-16 21:18:34', NULL, '2404b80e-52a3-448b-b318-74f227bbe6af'),
(73, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:18:34', '2021-01-16 21:18:34', NULL, '0b08d39e-6b63-48f4-b595-49b4892786e2'),
(74, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:18:34', '2021-01-16 21:18:34', NULL, '092ade26-354a-4463-af62-7aa8bdbd145b'),
(75, NULL, 21, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 21:23:48', '2021-01-16 21:23:48', NULL, 'ec0fb57f-722e-4132-8737-1a5e9b375375'),
(76, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:23:48', '2021-01-16 21:18:34', NULL, 'ffacca84-7a30-4336-8ffd-15bb53efb9f0'),
(77, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:23:48', '2021-01-16 21:18:34', NULL, '4dc86f52-19cc-4c11-b13b-8a4ca9738f61'),
(78, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:23:48', '2021-01-16 21:18:34', NULL, 'a517b5ce-931b-4391-ac47-c9f4f8287682'),
(79, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:23:48', '2021-01-16 21:18:34', NULL, 'dae3eac0-8410-4287-af98-52629d36bffb'),
(80, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:23:48', '2021-01-16 21:18:34', NULL, '84f7ef51-723f-4a9a-aa11-219e8c9e667d'),
(81, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:23:48', '2021-01-16 21:18:34', NULL, '2ba37312-55c3-497d-b063-bc8b8a2cf449'),
(82, NULL, 22, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-16 21:27:47', '2021-01-16 21:27:47', NULL, '08748cf9-1c58-47d7-a670-8b11123b28ee'),
(83, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:27:47', '2021-01-16 21:18:34', NULL, '5b8beb4b-a475-4619-a070-384ab60ae745'),
(84, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:27:47', '2021-01-16 21:18:34', NULL, '1733fa0c-0d31-45fc-8496-003540c94329'),
(85, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:27:47', '2021-01-16 21:18:34', NULL, '125db754-d1c3-4309-80dd-631332e29926'),
(86, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:27:47', '2021-01-16 21:18:34', NULL, 'f79ab4d6-d078-4c37-8ba0-4ca6a0233195'),
(87, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:27:47', '2021-01-16 21:18:34', NULL, '6c558203-0d8d-4dfe-b29c-7f5b8ba2af04'),
(88, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-16 21:27:47', '2021-01-16 21:18:34', NULL, '6a37a118-3068-48ae-930f-7e2f31fd217f'),
(89, NULL, 23, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-19 09:45:39', '2021-01-19 09:45:39', NULL, '95f281d8-f633-43b3-a5b9-13ec7612eafa'),
(90, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:45:39', '2021-01-16 21:18:34', NULL, '4327b920-00f0-4303-a219-e2ebcd4c746a'),
(91, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:45:39', '2021-01-16 21:18:34', NULL, 'd5923055-3c15-441a-a57f-87b55bd836f0'),
(92, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:45:39', '2021-01-16 21:18:34', NULL, 'ea3b1d1c-07ae-46b3-9e1c-fdceb072c7c4'),
(93, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:45:39', '2021-01-16 21:18:34', NULL, '422a9039-5e2c-425d-bac3-d09c20017e8c'),
(94, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:45:39', '2021-01-16 21:18:34', NULL, '7be805fe-2e83-465e-8afb-cb15680bd6b4'),
(95, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:45:39', '2021-01-16 21:18:34', NULL, 'bbf9f66c-0407-4b18-b78a-88c06c178c7b'),
(97, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:46:46', '2021-01-19 09:46:46', '2021-01-19 09:46:56', '13630a98-6002-404f-bbbd-32320c81c707'),
(98, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:46:56', '2021-01-19 09:46:56', '2021-01-19 09:46:58', 'a9349108-1362-4a8e-9914-1afb01488464'),
(99, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:46:58', '2021-01-19 09:46:58', '2021-01-19 09:47:10', 'c7103ea0-61a9-41c6-bf5b-973ca74bd88b'),
(100, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:46:58', '2021-01-19 09:46:58', '2021-01-19 09:47:10', 'e9704001-e8d4-4bd5-9c0f-562c348f3e0e'),
(102, NULL, NULL, 10, 'craft\\elements\\Entry', 1, 0, '2021-01-19 09:47:13', '2021-01-19 09:47:13', '2021-01-19 11:34:31', 'd96bb1f9-fcb3-4104-a6a6-c6c09debeef1'),
(103, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:47:13', '2021-01-19 09:47:10', '2021-01-19 11:34:31', '9c24e632-a43f-4b92-b959-b1c9e55e1766'),
(104, NULL, 24, 10, 'craft\\elements\\Entry', 1, 0, '2021-01-19 09:47:13', '2021-01-19 09:47:13', '2021-01-19 11:34:31', '49f14f7f-601a-4077-9cc8-c5e322cbdc63'),
(105, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 09:47:13', '2021-01-19 09:47:10', NULL, 'a5f43c35-9636-4d5a-aa21-a321bdd7ca59'),
(106, NULL, NULL, 9, 'craft\\elements\\Asset', 1, 0, '2021-01-19 11:06:13', '2021-01-19 11:06:13', '2021-01-19 11:13:31', 'f1ed8b43-1b3a-4a30-9809-dcef0d5e855e'),
(107, NULL, 25, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-19 11:35:53', '2021-01-19 11:35:53', NULL, '0080f064-c12f-46bc-ae67-81ad82925023'),
(108, NULL, 26, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-19 11:38:46', '2021-01-19 11:38:46', NULL, 'e88b2eef-cff7-4463-a59e-be57fb60c493'),
(109, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 11:46:58', '2021-01-24 20:23:42', NULL, '9285a836-4002-422f-a44a-a7902b17fb90'),
(110, NULL, 27, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-19 11:46:58', '2021-01-19 11:46:58', NULL, 'f0a3d4ba-a181-4a73-b435-c81681ebb33c'),
(111, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 11:46:58', '2021-01-19 11:46:58', NULL, '74269f37-76f3-494f-8d7d-4c12d9d56af8'),
(112, NULL, 28, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-19 12:08:38', '2021-01-19 12:08:38', NULL, 'e325f67b-fc47-4a25-960a-f52c30cd002b'),
(113, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 12:08:38', '2021-01-19 11:46:58', NULL, '8ecfd23f-5d36-40c9-a0ef-7677e27f14eb'),
(114, NULL, 29, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-19 12:18:09', '2021-01-19 12:18:09', NULL, '861ea42a-92ea-4230-b053-96a99580c6eb'),
(115, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 12:18:09', '2021-01-19 11:46:58', NULL, 'd9bdc3c5-f788-4682-b924-471ea6340472'),
(116, NULL, 30, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-19 12:19:21', '2021-01-19 12:19:21', NULL, '0b1aef24-31f8-44f5-a5a5-a3d894f5c33f'),
(117, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 12:19:21', '2021-01-19 11:46:58', NULL, '503db3b6-3763-42ad-8e19-a8404f792ae1'),
(118, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 12:53:44', '2021-01-24 20:23:42', NULL, 'aed3da84-ad9a-4639-bb28-668b5335a4d3'),
(119, NULL, 31, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-19 12:53:44', '2021-01-19 12:53:44', NULL, '32bf1329-74a5-4fbc-ad4f-cdb8122449c6'),
(120, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 12:53:44', '2021-01-19 12:53:44', NULL, 'ad213f06-ee79-453f-88d3-ad023a0e45e6'),
(121, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 12:53:44', '2021-01-19 12:53:44', NULL, '0e779ab1-01fb-4f71-aa1a-1cc6089a7a32'),
(122, NULL, NULL, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:16:11', '2021-01-19 13:22:14', '2021-01-23 13:36:04', 'df3d767e-5309-4c4b-90cd-34a6a419bc60'),
(123, NULL, 32, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:16:11', '2021-01-19 13:16:11', '2021-01-23 13:36:04', '5c0eda09-5e31-487a-8dd4-0c1bd3a0afbd'),
(124, NULL, 33, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:16:19', '2021-01-19 13:16:19', '2021-01-23 13:36:04', '3d09a008-46c2-4c2e-b87d-c87b7d969746'),
(125, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:16:46', '2021-01-19 14:04:44', '2021-01-23 13:36:06', '02d99d22-2a7d-4a7f-8940-f0a2a4fed5ca'),
(126, NULL, 34, 13, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:16:46', '2021-01-19 13:16:46', '2021-01-23 13:36:06', 'f6c04c7c-d6ee-4ab8-9ff0-54bf2c605bf1'),
(127, NULL, 35, 13, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:16:51', '2021-01-19 13:16:51', '2021-01-23 13:36:06', '3b9c77fc-1f84-4856-959c-931d30f7b227'),
(128, NULL, 36, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:17:35', '2021-01-19 13:17:35', '2021-01-23 13:36:04', '7e6f8c23-fd3a-48df-9dc6-950af6788db7'),
(129, NULL, 37, 13, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:17:42', '2021-01-19 13:17:42', '2021-01-23 13:36:06', 'a3249bf6-efff-404c-a332-5551532613ca'),
(130, NULL, 38, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:19:38', '2021-01-19 13:19:38', '2021-01-23 13:36:04', 'b072f14f-6c77-47d4-b734-d9ffd8b5d826'),
(131, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:20:06', '2021-01-19 13:22:14', '2021-01-23 13:36:04', 'e42856db-1145-4fa4-a145-72f4e87c70e8'),
(132, NULL, 39, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:20:06', '2021-01-19 13:20:06', '2021-01-23 13:36:04', 'ddd88a20-6a5e-448b-93a2-fc77c1fcdd62'),
(133, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:20:06', '2021-01-19 13:20:06', NULL, 'de25864c-9447-40df-83a0-b0edf585f8c7'),
(134, NULL, 40, 13, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:21:10', '2021-01-19 13:21:10', '2021-01-23 13:36:06', 'e9b1e485-efa2-4a90-af40-3556e3df3a05'),
(135, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:21:27', '2021-01-19 13:21:27', '2021-01-23 13:36:06', 'c7bad800-968e-424d-802c-f73d998a882b'),
(136, NULL, 41, 13, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:21:26', '2021-01-19 13:21:26', '2021-01-23 13:36:06', 'b9a93503-149c-49a0-9a40-9678f48a035b'),
(137, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:21:27', '2021-01-19 13:21:27', NULL, '753212bc-bb2f-40ee-a058-f20b04f03be3'),
(138, NULL, 42, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:21:54', '2021-01-19 13:21:54', '2021-01-23 13:36:04', '55419b94-369d-40ac-bd1c-c5daef594eb9'),
(139, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:21:54', '2021-01-19 13:20:06', NULL, '7ad2e318-cf67-42f2-b158-751ba8bd5d6e'),
(140, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:22:14', '2021-01-19 13:22:14', '2021-01-23 13:36:04', '0daade18-de03-4a79-a851-9778061750af'),
(141, NULL, 43, 12, 'craft\\elements\\Entry', 1, 0, '2021-01-19 13:22:14', '2021-01-19 13:22:14', '2021-01-23 13:36:04', '94a56942-27c6-4ecc-909b-181080826a00'),
(142, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:22:14', '2021-01-19 13:22:14', NULL, '018df6d0-9797-4ebd-b2f3-c6ffe69ff8e1'),
(143, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:22:14', '2021-01-19 13:22:14', NULL, '9f50f338-3984-4b97-8e9b-3cf3d16f94c4'),
(144, NULL, NULL, 15, 'craft\\elements\\GlobalSet', 1, 0, '2021-01-19 13:25:49', '2021-01-23 14:21:47', '2021-01-23 14:22:03', '35017395-0617-445f-8b89-1d1ac95dd950'),
(145, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 0, 0, '2021-01-19 13:33:30', '2021-01-19 14:39:54', NULL, 'd74d663c-8103-4eee-994b-0429a4047c07'),
(146, NULL, NULL, 14, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 13:33:30', '2021-01-19 14:39:54', '2021-01-23 14:20:07', '08221212-73e1-4ed3-b43e-1637f5a32cf1'),
(147, NULL, 44, 13, 'craft\\elements\\Entry', 1, 0, '2021-01-19 14:04:25', '2021-01-19 14:04:25', '2021-01-23 13:36:06', '07b1bbb3-98fd-48e6-8937-10d8f75df124'),
(148, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 14:04:25', '2021-01-19 13:21:27', NULL, '6af12e7c-ce54-4825-a262-fb0a9639dae1'),
(149, NULL, 45, 13, 'craft\\elements\\Entry', 1, 0, '2021-01-19 14:04:44', '2021-01-19 14:04:44', '2021-01-23 13:36:06', '39864151-e3b9-4efe-a942-f6814c920483'),
(150, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-19 14:04:44', '2021-01-19 13:21:27', NULL, '92b47edf-df75-481b-a09d-73eeb4340205'),
(152, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:54:54', '2021-01-20 19:54:54', '2021-01-20 19:55:03', 'e47622b4-9626-4269-ab31-8d91dfcc738b'),
(153, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:03', '2021-01-20 19:55:03', '2021-01-20 19:55:06', 'ccbccbf2-93f1-471b-8172-71e621cd1954'),
(154, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:06', '2021-01-20 19:55:06', '2021-01-20 19:55:08', '3be2b46a-a144-4323-952d-342edb387ed7'),
(155, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:08', '2021-01-20 19:55:08', '2021-01-20 19:55:12', '92fb5016-439b-4be7-bf37-353253cea07b'),
(156, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:12', '2021-01-20 19:55:12', '2021-01-20 19:55:14', '26d30dcc-47a0-4be5-9175-83caca0e7bda'),
(157, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:14', '2021-01-20 19:55:14', '2021-01-20 19:55:21', 'e308494c-0afe-41a5-8d1a-f441f672c472'),
(158, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:14', '2021-01-20 19:55:14', '2021-01-20 19:55:21', 'f1187ed6-20a2-4701-a981-6e2734aabbe1'),
(159, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:20', '2021-01-20 19:55:20', '2021-01-20 19:55:24', 'd542b887-1d21-4020-a267-cd8dd41573cf'),
(160, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:21', '2021-01-20 19:55:21', '2021-01-20 19:55:24', 'e3b09126-809d-4c97-ace5-90e31336335d'),
(161, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:24', '2021-01-20 19:55:24', '2021-01-20 19:55:27', '34cde8fc-ff36-49fc-8107-a2ff2541de0c'),
(162, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:24', '2021-01-20 19:55:24', '2021-01-20 19:55:27', 'b01a29ab-049a-45d8-a3be-251745720ee6'),
(163, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:27', '2021-01-20 19:55:27', '2021-01-20 19:55:28', 'a426a9e8-014d-4ba9-a988-2fac1d90c1bb'),
(164, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:27', '2021-01-20 19:55:27', '2021-01-20 19:55:28', 'f79ee8f2-09f0-4d6d-82a3-827422ff3dd8'),
(165, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:28', '2021-01-20 19:55:28', '2021-01-20 19:55:51', '2fde440e-2233-457a-8e5c-cb6d1f187ca3'),
(166, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:28', '2021-01-20 19:55:28', '2021-01-20 19:55:51', '58383c5a-2b5f-4e21-ab03-6c9f869face3'),
(167, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:55:28', '2021-01-20 19:55:28', '2021-01-20 19:55:51', 'e89ee835-952e-4304-a20c-787a4f2cd935'),
(171, NULL, NULL, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 19:56:06', '2021-01-21 08:48:58', '2021-01-23 13:36:08', '218656b8-ff3a-4625-91e3-63ff573db1ba'),
(172, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:56:06', '2021-01-20 20:22:27', '2021-01-23 13:36:08', '1dd9e6b9-5094-416b-bb22-7546fba56ca5'),
(173, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:56:06', '2021-01-20 20:22:27', '2021-01-23 13:36:08', 'c5bc2ced-d508-4161-b56d-b8f161781287'),
(174, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:56:06', '2021-01-20 20:22:27', '2021-01-23 13:36:08', '16533800-d395-4b07-88db-d0218413f2c8'),
(175, NULL, 46, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 19:56:06', '2021-01-20 19:56:06', '2021-01-23 13:36:08', 'fb5ee50f-41e4-440b-8e73-2b8f15e4b3f6'),
(176, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:56:06', '2021-01-20 19:55:51', NULL, 'ec123954-d2e3-40dd-a561-c2574b911cc0'),
(177, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:56:06', '2021-01-20 19:55:51', NULL, '4ddb8a75-2e9e-4dea-aeb9-46051c0665bd'),
(178, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:56:06', '2021-01-20 19:55:51', NULL, 'aa86da2a-8d5f-425a-afa2-2f2331eaa6f5'),
(179, NULL, 47, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 19:57:09', '2021-01-20 19:57:09', '2021-01-23 13:36:08', '7fea0988-2f75-4481-95b8-b81ef37c72dc'),
(180, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:57:09', '2021-01-20 19:55:51', NULL, '83d7b731-b29b-4f31-b57a-a3e7335154ae'),
(181, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:57:09', '2021-01-20 19:55:51', NULL, '1258e7e1-a24c-4b99-ad39-ca124c52f26e'),
(182, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 19:57:09', '2021-01-20 19:55:51', NULL, 'fe07f8db-e2ce-4dce-ae44-951d73088c76'),
(183, NULL, 48, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:03:03', '2021-01-20 20:03:03', '2021-01-23 13:36:08', 'accb992e-4adb-4ff7-9973-f2f1d011832a'),
(184, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:03:03', '2021-01-20 19:55:51', NULL, '854e1832-e896-4c7d-bbb2-3b182f52d2d0'),
(185, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:03:03', '2021-01-20 19:55:51', NULL, 'f0c46031-1514-4bb9-a1bf-3fb834ee2f4e'),
(186, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:03:03', '2021-01-20 19:55:51', NULL, '4b4e6995-ad31-46b3-8750-98338415ad2e'),
(187, NULL, 49, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:03:14', '2021-01-20 20:03:14', '2021-01-23 13:36:08', 'dbaa95cc-2a11-43c8-a4cf-45f02ff23304'),
(188, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:03:14', '2021-01-20 19:55:51', NULL, 'e2a27e42-9bc2-48de-aeb1-965cb2efa833'),
(189, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:03:14', '2021-01-20 19:55:51', NULL, '6fd0f000-513d-472c-be54-cfd217f5227e'),
(190, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:03:14', '2021-01-20 19:55:51', NULL, '429152b7-9bb4-4771-b7c1-c8c8726059fc'),
(191, NULL, 50, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:06:09', '2021-01-20 20:06:09', '2021-01-23 13:36:08', 'a8cddd25-1d96-44ed-8243-ee14cc910b71'),
(192, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:06:09', '2021-01-20 19:55:51', NULL, '9d56ea8d-bf10-4532-8609-22cdb9554efd'),
(193, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:06:09', '2021-01-20 19:55:51', NULL, '88b625e1-ddd6-4080-96ee-99214dc18ecc'),
(194, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:06:09', '2021-01-20 19:55:51', NULL, '1eb9b31e-9d10-449a-9fae-37ca7837384d'),
(195, NULL, 51, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:06:17', '2021-01-20 20:06:17', '2021-01-23 13:36:08', '50fdadb1-db00-4a45-a078-3c4fb26857a7'),
(196, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:06:17', '2021-01-20 20:06:10', NULL, '72844bda-1166-4623-ad6d-4009b75f6dd9'),
(197, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:06:17', '2021-01-20 20:06:10', NULL, '15edebdf-3c71-42cc-84d3-4cd523d8f79d'),
(198, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:06:17', '2021-01-20 20:06:10', NULL, '32691da8-133e-452d-8da3-2b3bfb091746'),
(199, NULL, 52, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:17:47', '2021-01-20 20:17:47', '2021-01-23 13:36:08', '420d66e9-8890-4b5f-9f8b-63e8fa9be596'),
(200, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:17:47', '2021-01-20 20:06:10', NULL, '82d79e9c-6b2b-480f-b633-1011b6cc1378'),
(201, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:17:47', '2021-01-20 20:06:10', NULL, 'ee3760ad-9267-4a60-b427-d98936537d5c'),
(202, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:17:47', '2021-01-20 20:06:10', NULL, 'f2792bf9-0de0-4ab5-b85c-17d0d53fc816'),
(203, NULL, 53, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:18:51', '2021-01-20 20:18:51', '2021-01-23 13:36:08', 'fe5e1cb8-1531-4fbf-9b9a-bd1cabefdedf'),
(204, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:18:51', '2021-01-20 20:06:10', NULL, 'e3ec8312-ea17-41cb-9efe-5053491e0081'),
(205, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:18:51', '2021-01-20 20:06:10', NULL, '56729565-3d08-4d0f-ab0f-d24ea266e7a1'),
(206, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:18:51', '2021-01-20 20:06:10', NULL, 'f3bcf7f8-fe83-4e02-8ae4-a14ad843801d'),
(207, NULL, 54, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:19:01', '2021-01-20 20:19:01', '2021-01-23 13:36:08', 'd853334b-badd-4d6c-8fc8-2873a27f19f8'),
(208, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:19:01', '2021-01-20 20:18:51', NULL, 'd9e8e91d-d1e9-4041-b23d-1b109e00d297'),
(209, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:19:01', '2021-01-20 20:18:51', NULL, '94a50ffa-c8be-43ca-b5ee-1e7dee36c294'),
(210, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:19:01', '2021-01-20 20:18:52', NULL, '8bed11e1-8c6a-48f5-afcd-a61be232e990'),
(211, NULL, 55, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:22:04', '2021-01-20 20:22:04', '2021-01-23 13:36:08', '98b31417-e436-4f6a-8ac5-e930ba723a52'),
(212, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:04', '2021-01-20 20:18:51', NULL, 'acd96500-e7a5-45fe-8537-efc967768a02'),
(213, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:04', '2021-01-20 20:18:51', NULL, '92673b2e-176f-48e5-a868-5dbb3b5fe618'),
(214, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:04', '2021-01-20 20:18:52', NULL, 'cf34e3de-ac45-41e5-9770-8461893f9e28'),
(215, NULL, 56, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:22:05', '2021-01-20 20:22:05', '2021-01-23 13:36:08', '9df51b1f-087d-469d-8d8a-fc8d02b866a3'),
(216, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:05', '2021-01-20 20:18:51', NULL, 'b23c83a5-8525-496b-841f-7096975dc260'),
(217, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:05', '2021-01-20 20:18:51', NULL, '7ecdf023-ce64-4970-9bd9-55f0d6b16c90'),
(218, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:05', '2021-01-20 20:18:52', NULL, '154fd33f-52c5-41c5-883f-8d65c2a793ae'),
(219, NULL, 57, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:22:08', '2021-01-20 20:22:08', '2021-01-23 13:36:08', '627d8991-7e30-4f97-a436-418d17d478fb'),
(220, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:08', '2021-01-20 20:22:05', NULL, '92bb98c3-ca07-4a3b-b1f8-8e8e14f24490'),
(221, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:08', '2021-01-20 20:22:05', NULL, '308f5617-5795-4d5e-bd59-27b937e6041c'),
(222, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:08', '2021-01-20 20:22:05', NULL, 'b3e431f8-04e6-44cd-adbc-e3cfaf86b676'),
(223, NULL, 58, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:22:26', '2021-01-20 20:22:26', '2021-01-23 13:36:08', '28b408bc-eebf-465f-b35d-9e500d2bce19'),
(224, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:27', '2021-01-20 20:22:05', NULL, '48e8b03f-72af-49a4-875d-ddb0d4bd35b1'),
(225, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:27', '2021-01-20 20:22:05', NULL, '12769ded-f8d0-46de-953f-61a85d7cb9ae'),
(226, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:27', '2021-01-20 20:22:05', NULL, 'ef214f03-50a5-43de-8527-f5b45d840b26'),
(227, NULL, 59, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-20 20:22:27', '2021-01-20 20:22:27', '2021-01-23 13:36:08', '22e022dd-dd21-4fb5-b51b-7aaf2b696bea'),
(228, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:27', '2021-01-20 20:22:05', NULL, '886883fe-804f-4bdf-ade2-636d3e17cefb'),
(229, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:27', '2021-01-20 20:22:05', NULL, 'f4b33071-1b15-46b8-8d4d-4c1c52b7a3dd'),
(230, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-20 20:22:27', '2021-01-20 20:22:05', NULL, 'f6fece0f-a6e5-49a6-8ee2-21809994e802'),
(231, NULL, 60, 19, 'craft\\elements\\Entry', 1, 0, '2021-01-21 08:48:58', '2021-01-21 08:48:58', '2021-01-23 13:36:08', '5924c5cb-26cc-4cdb-b364-700f3a48c577'),
(232, NULL, NULL, 16, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-21 08:48:58', '2021-01-20 20:22:27', NULL, '6578d448-7507-46a8-803f-715ba0dc9b8e'),
(233, NULL, NULL, 17, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-21 08:48:58', '2021-01-20 20:22:27', NULL, '2a0b1819-7470-4826-b2f7-b4cb47985466'),
(234, NULL, NULL, 18, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-21 08:48:58', '2021-01-20 20:22:27', NULL, '09ba7b15-0607-412d-b4f6-16a81a4a2cdb'),
(235, NULL, NULL, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 13:36:57', '2021-01-24 20:45:09', NULL, 'b63fe714-7107-4ce8-abe4-f3620e438f29'),
(236, NULL, 61, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 13:36:57', '2021-01-23 13:36:57', NULL, 'fc73cef1-7cc3-404e-85e3-a5b8e74dfd77'),
(237, NULL, 62, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 13:39:32', '2021-01-23 13:39:32', NULL, 'ebac4d9a-aba3-4dda-a197-aba8fc1bdb16'),
(238, NULL, NULL, 22, 'craft\\elements\\Entry', 1, 0, '2021-01-23 13:39:55', '2021-01-23 14:11:29', NULL, '16ad5060-84c2-4a2f-940e-888c2530726f'),
(239, NULL, 63, 22, 'craft\\elements\\Entry', 1, 0, '2021-01-23 13:39:55', '2021-01-23 13:39:55', NULL, '98414989-e3d3-43dd-ab3d-a500509f1296'),
(240, NULL, 64, 22, 'craft\\elements\\Entry', 1, 0, '2021-01-23 13:40:01', '2021-01-23 13:40:01', NULL, 'c6b57f16-3975-4e53-a1aa-b79d6874e2e0'),
(241, NULL, 65, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 14:09:36', '2021-01-23 14:09:36', NULL, '8a9207ea-f377-4f58-8817-21a3664ae865'),
(242, NULL, 66, 22, 'craft\\elements\\Entry', 1, 0, '2021-01-23 14:09:53', '2021-01-23 14:09:53', NULL, 'a2dd2147-0228-4125-9d53-dca4d0e9d965'),
(243, NULL, 67, 22, 'craft\\elements\\Entry', 1, 0, '2021-01-23 14:10:34', '2021-01-23 14:10:34', NULL, '25479d92-b98d-4766-926b-609faaff3633'),
(244, NULL, 68, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 14:10:48', '2021-01-23 14:10:48', NULL, 'd16301a8-69e8-418d-84d1-c7342cc2815c'),
(245, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 14:11:16', '2021-01-24 20:25:52', NULL, '2bd605f8-3644-45d9-8c5b-7e00abd01d44'),
(246, NULL, 69, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 14:11:16', '2021-01-23 14:11:16', NULL, 'a684729c-72ff-4b5f-9c84-9ad347575b44'),
(247, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 14:11:17', '2021-01-23 14:11:16', NULL, '7bd60b5d-984f-4134-8671-ada58514a219'),
(248, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 14:11:29', '2021-01-23 14:11:29', NULL, 'd284a4d5-b816-43e7-bfaa-f207daa26606'),
(249, NULL, 70, 22, 'craft\\elements\\Entry', 1, 0, '2021-01-23 14:11:29', '2021-01-23 14:11:29', NULL, '5f03ce4f-e1df-4ffb-a870-868425810d20'),
(250, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 14:11:29', '2021-01-23 14:11:29', NULL, '52d36cc3-e1f1-4da1-8440-f38c06d8cfdd'),
(251, NULL, NULL, 25, 'craft\\elements\\GlobalSet', 1, 0, '2021-01-23 14:22:25', '2021-01-24 21:12:02', NULL, '8e0f1edb-a680-448c-a619-c02956810275'),
(252, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 14:27:19', '2021-01-24 21:12:02', NULL, 'ae50028d-1595-44eb-9550-4977f1912275'),
(253, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 14:27:19', '2021-01-24 21:12:02', NULL, '5f676cf0-7368-4182-ba66-14cef6ab0906'),
(254, NULL, 71, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 15:16:36', '2021-01-23 15:16:36', NULL, '69877fa4-19d3-4ac2-857f-33e4331a5959'),
(255, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:16:50', '2021-01-23 15:16:50', NULL, '674e1335-476c-4699-bbb3-c8f070b38d11'),
(256, NULL, 72, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 15:16:50', '2021-01-23 15:16:50', NULL, '7881e706-26c2-446f-a979-c34e0c005711'),
(257, NULL, NULL, 23, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:16:50', '2021-01-23 15:16:50', NULL, 'bff494c7-a340-4fad-891c-7093b87f2a7a'),
(258, NULL, 73, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 15:31:03', '2021-01-23 15:31:03', NULL, '836fcc0d-775a-4cee-b6ea-d4fe16f52df3'),
(259, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:31:03', '2021-01-23 14:11:16', NULL, '42f454dd-f7f6-4988-b960-bc23ad5fe7d1'),
(260, NULL, 74, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 15:31:17', '2021-01-23 15:31:17', NULL, '0798e28d-75ab-4fdb-a310-bd7949f2e2d7'),
(261, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:31:17', '2021-01-23 14:11:16', NULL, '2360c39f-271c-4d6a-949c-78161d0fa602'),
(262, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:36:01', '2021-01-23 15:45:20', '2021-01-24 20:40:40', '2c51d000-25d7-49b4-99c3-943d85a0d9ad'),
(263, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:36:01', '2021-01-24 21:12:02', NULL, '9dbc5ecd-114e-4780-be0f-5a2a6615ab0a'),
(264, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:36:01', '2021-01-24 21:12:02', NULL, 'b635e19a-4608-4114-ba05-b05b2673e903'),
(265, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:36:01', '2021-01-24 21:12:02', NULL, '6c6a4651-2832-4da4-bcf0-98944af0d39f'),
(266, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:36:01', '2021-01-23 15:45:21', '2021-01-24 20:40:40', '0ffdee44-9718-43fd-b091-bd18fb1f3f12'),
(267, NULL, NULL, 24, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 15:37:01', '2021-01-23 15:45:21', '2021-01-24 20:40:40', '1f536a33-c287-462e-b2d5-d4c4e0c32266'),
(268, NULL, 75, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-23 16:29:53', '2021-01-23 16:29:53', NULL, '590ee3c0-9401-4a4a-82d0-a1184b1b01ac'),
(269, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-23 16:29:53', '2021-01-23 16:29:53', NULL, '56ca877b-d3c3-4e99-a0e8-da016473412a'),
(270, NULL, NULL, 9, 'craft\\elements\\Asset', 1, 0, '2021-01-24 09:34:50', '2021-01-24 09:34:50', NULL, 'db179595-6f74-4765-bb67-1b6a92434541'),
(271, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 09:34:58', '2021-01-24 09:34:58', '2021-01-24 18:41:37', 'e69a85f7-88e0-4283-8ce6-73b761dddd64'),
(272, NULL, 76, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-24 09:34:58', '2021-01-24 09:34:58', NULL, '50bca443-9d08-445e-bdc0-a6a9d4b0e1bb'),
(273, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 09:34:58', '2021-01-24 09:34:58', NULL, '760864dd-3b1d-4e20-a35e-f91b799ee49c'),
(274, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 09:34:58', '2021-01-24 09:34:58', NULL, 'a8fb2048-6913-4551-8e90-c1da50ee647c'),
(275, NULL, NULL, 9, 'craft\\elements\\Asset', 1, 0, '2021-01-24 12:44:25', '2021-01-24 12:44:25', NULL, '7b240f5b-f6b6-4c42-a15e-cd553d12f74b'),
(276, NULL, 77, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-24 12:44:49', '2021-01-24 12:44:49', NULL, '1e57d3a1-85a0-424a-839f-79ef9ea3bab0'),
(277, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 12:44:49', '2021-01-24 09:34:58', NULL, '45d7fbed-d097-4a2c-a3b7-34f1f963b494'),
(278, NULL, NULL, 26, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 12:44:49', '2021-01-24 09:34:58', NULL, '70ea7bdd-fb5e-4d7e-b00a-6a13bc17f2c6'),
(279, NULL, 78, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-24 18:41:37', '2021-01-24 18:41:37', NULL, '952574ee-069d-4ea9-8220-ef26a27d3d95'),
(280, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 18:41:37', '2021-01-24 18:41:37', NULL, '787dd351-5170-4320-846b-6319519064eb'),
(281, NULL, 79, 4, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:23:42', '2021-01-24 20:23:42', NULL, 'c6f95075-f3e6-4bf8-9ccc-f6e72cfe725b'),
(282, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:23:42', '2021-01-24 20:23:42', NULL, '11bd7df3-fc1b-449a-a025-f508cdbf5648'),
(283, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:23:42', '2021-01-24 20:23:42', NULL, 'df128d40-2fe4-4695-a150-92a872898c37'),
(284, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:25:52', '2021-01-24 20:25:52', NULL, '1386494f-b1fd-428e-b9a1-420cef9663dd'),
(285, NULL, 80, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:25:52', '2021-01-24 20:25:52', NULL, 'c92bb156-d822-403a-8393-a82c1aeff1d7'),
(286, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:25:52', '2021-01-24 20:25:52', NULL, '0c1893c6-405f-4836-beb3-c86bb68b8ff4'),
(287, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:25:52', '2021-01-24 20:25:52', NULL, '8e7e6c59-07d0-4535-8e51-3a8c421607ce'),
(288, NULL, NULL, 27, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:44:30', '2021-01-26 13:54:11', NULL, 'df30b6b3-d985-4cd2-bb06-86e77b91e25d'),
(289, NULL, 81, 27, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:44:30', '2021-01-24 20:44:30', NULL, 'cf5de11d-018f-4030-bde1-7545a12bdb4d'),
(290, NULL, 82, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:44:35', '2021-01-24 20:44:35', NULL, '182f701d-4b61-4781-b7ef-c1c101284a85'),
(291, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:44:35', '2021-01-24 20:25:52', NULL, '1a9285f5-9a17-408d-8cac-2548290365bf'),
(292, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:44:35', '2021-01-24 20:25:52', NULL, 'fac599de-46ad-49fc-aefe-2aeea5817328'),
(293, NULL, 83, 27, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:45:01', '2021-01-24 20:45:01', NULL, '37393b08-78e4-4108-993f-2290960c0aac'),
(294, NULL, 84, 21, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:45:09', '2021-01-24 20:45:09', NULL, '284d9fc1-5688-455c-8247-3c08255f2cb5'),
(295, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:45:09', '2021-01-24 20:25:52', NULL, '01f02d2c-092f-42d5-b592-7551b096d6a3'),
(296, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:45:09', '2021-01-24 20:25:52', NULL, '1d59969e-488f-456e-9382-2cbfe1cf9a75'),
(297, NULL, 85, 27, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:45:15', '2021-01-24 20:45:15', NULL, 'ec413d3b-1ac4-439b-b293-af5f2d7f0e4c'),
(298, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:47:23', '2021-01-24 20:47:23', NULL, 'd7b9444b-fadf-44e8-bb64-63cb8b4f18dc'),
(299, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:47:23', '2021-01-24 20:47:23', NULL, '21d0fe13-d81b-4822-a204-45d0a551417c'),
(300, NULL, 86, 27, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:47:23', '2021-01-24 20:47:23', NULL, '91c98b47-d753-4979-aeb4-dc93bb31b372'),
(301, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:47:23', '2021-01-24 20:47:23', NULL, '616df0ef-5e25-4032-8928-3b8f67fb3fc7'),
(302, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:47:23', '2021-01-24 20:47:23', NULL, 'd1fe2473-e81d-4356-af79-f547ce796911'),
(303, NULL, NULL, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:52:44', '2021-01-26 13:56:02', NULL, '233b0a76-cbcb-4001-8c44-e3fd186fd7f1'),
(304, NULL, 87, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:52:44', '2021-01-24 20:52:44', NULL, 'e2e3a014-038c-4d99-859d-f1eb03edde57'),
(305, NULL, 88, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:52:45', '2021-01-24 20:52:45', NULL, 'a191303d-c04f-4912-9e51-58bb40a3df43'),
(306, NULL, 89, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:53:04', '2021-01-24 20:53:04', NULL, 'a78f9cf6-22d5-41e2-b545-2635f239dc36'),
(307, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:54:27', '2021-01-24 20:54:27', NULL, '715bea46-68b7-47b1-9fd0-b8cb1b621294'),
(308, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:54:27', '2021-01-24 20:54:27', NULL, '861f3753-d5a7-45b7-8cd2-70476e908329'),
(309, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:54:27', '2021-01-24 20:54:27', NULL, 'e61898a4-e6b2-4274-8b89-91fa0ec66cd7'),
(310, NULL, 90, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:54:27', '2021-01-24 20:54:27', NULL, '1164fb1a-f579-4d4c-bb88-1ee45a732a30'),
(311, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:54:27', '2021-01-24 20:54:27', NULL, 'eb35e965-16d3-4cd0-80dc-ceb0a464c3c6'),
(312, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:54:27', '2021-01-24 20:54:27', NULL, '00d0a86a-c08a-4d8b-97d6-bf43bfb59369'),
(313, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:54:27', '2021-01-24 20:54:27', NULL, 'b900e5c9-52c9-432e-b4f5-35da4897f424'),
(314, NULL, 91, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:55:21', '2021-01-24 20:55:21', NULL, '976baa91-c93b-485c-a59e-26d062203c31'),
(315, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:55:21', '2021-01-24 20:54:27', NULL, '61541d38-ae04-4a91-871f-f4f91fb70f8a'),
(316, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:55:21', '2021-01-24 20:54:27', NULL, '7d2527c4-9a52-4279-8f7d-8292058973d5'),
(317, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:55:21', '2021-01-24 20:54:27', NULL, '289a2780-8a59-4ee6-9a1d-b6d63c8e668f'),
(318, NULL, 92, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:55:23', '2021-01-24 20:55:23', NULL, '4325b8cb-59b9-48ba-950a-043f70fd8d08'),
(319, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:55:23', '2021-01-24 20:54:27', NULL, '30247e7a-a3e6-4afa-b9bb-8afe454b2987'),
(320, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:55:23', '2021-01-24 20:54:27', NULL, '35606b31-d10f-4e3c-b8d1-17306da4753a'),
(321, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:55:23', '2021-01-24 20:54:27', NULL, '8de484fd-4ac3-496d-b3a1-5a325b4463f1'),
(322, NULL, NULL, 29, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:56:34', '2021-01-24 21:01:57', NULL, 'eb63d742-89a0-4040-b04a-0ef54cd9ca43'),
(323, NULL, 93, 29, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:56:34', '2021-01-24 20:56:34', NULL, '0eddfd94-1ca2-4af2-a2fa-ad2c9b3cbb83'),
(324, NULL, 94, 29, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:56:42', '2021-01-24 20:56:42', NULL, '8e3df087-bb28-430d-b2e7-527dce893617'),
(325, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:58:31', '2021-01-24 20:58:31', NULL, 'a961d5f9-ec79-44f8-9490-bc2a4f1b1547'),
(326, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:58:31', '2021-01-24 20:58:31', NULL, 'f59fc4a2-c42a-446c-9453-0da8fde67f69'),
(327, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:58:31', '2021-01-24 20:58:31', NULL, 'e7d32b0d-3d40-4054-bcbd-c260e66fe507'),
(328, NULL, 95, 29, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:58:31', '2021-01-24 20:58:31', NULL, 'cace3def-d9dc-4be8-8348-8062d52986ad'),
(329, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:58:31', '2021-01-24 20:58:31', NULL, '0500eed4-6be6-461a-9e76-7c594bc5644a'),
(330, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:58:31', '2021-01-24 20:58:31', NULL, '503f46dd-ba5a-4d35-a78f-f4c791f1867a'),
(331, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 20:58:31', '2021-01-24 20:58:31', NULL, 'b5e9bd5c-a6fb-4961-86d0-8e913217020c'),
(332, NULL, NULL, 30, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:58:54', '2021-01-24 21:01:40', NULL, 'c3339fcd-bb2c-43ce-b7dd-3c779a043737'),
(333, NULL, 96, 30, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:58:54', '2021-01-24 20:58:54', NULL, '4408053b-d3a2-4341-bb5d-a3e3c16d9a58'),
(334, NULL, 97, 30, 'craft\\elements\\Entry', 1, 0, '2021-01-24 20:59:06', '2021-01-24 20:59:06', NULL, '3ba24117-987c-4870-86ab-6da77e27f9e9'),
(335, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:00:33', '2021-01-24 21:00:33', NULL, '7184f568-1fd7-4cb0-81c3-061d045c8bfc');
INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(336, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:00:33', '2021-01-24 21:00:33', NULL, '7f6a62b5-d589-496d-a36d-56a766d29a0f'),
(337, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:00:33', '2021-01-24 21:00:33', NULL, '9483c995-82af-4534-9681-595c871a98a1'),
(338, NULL, 98, 30, 'craft\\elements\\Entry', 1, 0, '2021-01-24 21:00:33', '2021-01-24 21:00:33', NULL, '0b4171d6-715e-49eb-a299-7fa40d13e59e'),
(339, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:00:33', '2021-01-24 21:00:33', NULL, '47d236c4-2f6c-4d44-bf6b-4add847af927'),
(340, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:00:33', '2021-01-24 21:00:33', NULL, '80e495f6-9049-4ddd-a70b-87bd795e69d5'),
(341, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:00:33', '2021-01-24 21:00:33', NULL, 'ef1cc07c-15fe-4e8c-87ea-a076912ccc60'),
(342, NULL, 99, 29, 'craft\\elements\\Entry', 1, 0, '2021-01-24 21:01:02', '2021-01-24 21:01:02', NULL, '6b2cb5e7-0400-42fe-8705-ca4204a31a32'),
(343, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:03', '2021-01-24 20:58:31', NULL, '2fb4ce0d-64c5-45ce-82fb-478ae8670637'),
(344, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:03', '2021-01-24 20:58:31', NULL, '4aad87e3-ee1c-4633-b57e-0cd0f8d586d2'),
(345, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:03', '2021-01-24 20:58:31', NULL, 'ae716adb-fc72-4049-9ff3-07c6b3cc9d68'),
(346, NULL, 100, 29, 'craft\\elements\\Entry', 1, 0, '2021-01-24 21:01:16', '2021-01-24 21:01:16', NULL, '8568c521-3910-48e2-883a-625a0505a696'),
(347, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:16', '2021-01-24 20:58:31', NULL, '8d4baaee-2973-4072-92b0-1c25b3bdd38c'),
(348, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:16', '2021-01-24 20:58:31', NULL, '3b2386c6-4f4f-490a-9aa9-b919b68dcec5'),
(349, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:16', '2021-01-24 20:58:31', NULL, 'a6a67279-d27a-4eaf-9d3a-56dc7bd104aa'),
(350, NULL, 101, 30, 'craft\\elements\\Entry', 1, 0, '2021-01-24 21:01:21', '2021-01-24 21:01:21', NULL, '1ccde706-8664-46a9-9088-5625182ae59f'),
(351, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:21', '2021-01-24 21:00:33', NULL, '69ed7c5b-0039-42a6-b8be-6938727c9f8f'),
(352, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:21', '2021-01-24 21:00:33', NULL, 'b20bd5a2-d46f-4b49-adaf-42f51f07c67d'),
(353, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:21', '2021-01-24 21:00:33', NULL, '36338377-4e82-4938-b87b-131918c10df3'),
(354, NULL, 102, 30, 'craft\\elements\\Entry', 1, 0, '2021-01-24 21:01:40', '2021-01-24 21:01:40', NULL, '1e171eeb-a897-45e0-a62a-2b882439d9a9'),
(355, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:40', '2021-01-24 21:00:33', NULL, '7b798d09-f19d-4a99-9dfa-dc9eac29a251'),
(356, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:40', '2021-01-24 21:00:33', NULL, '1f224f82-f152-418c-98ad-444df6dceea9'),
(357, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:40', '2021-01-24 21:00:33', NULL, 'bb11db7f-09ca-47c0-bb5d-ccb9e59c008a'),
(358, NULL, 103, 29, 'craft\\elements\\Entry', 1, 0, '2021-01-24 21:01:57', '2021-01-24 21:01:57', NULL, '4c622363-bada-4b29-b801-4c215ad9ab1c'),
(359, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:57', '2021-01-24 20:58:31', NULL, 'cedeb6b3-4824-4430-bafc-ab29b355b2cc'),
(360, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:58', '2021-01-24 20:58:31', NULL, '7906eb9c-cb9e-4b37-a8a8-65ac6a761c7e'),
(361, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-24 21:01:58', '2021-01-24 20:58:31', NULL, '9d30b11b-95a0-4589-bcaa-ea97bd21f23e'),
(362, NULL, 104, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-25 14:09:46', '2021-01-25 14:09:46', NULL, '7aac5465-18b6-4433-8d3f-b034c33be29c'),
(363, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-25 14:09:46', '2021-01-24 20:54:27', NULL, 'c91fcaae-4fe4-4f46-bd9d-ecfad28a5445'),
(364, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-25 14:09:46', '2021-01-24 20:54:27', NULL, '499b6302-46aa-4b39-a35e-9a3af4da572e'),
(365, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-25 14:09:46', '2021-01-24 20:54:27', NULL, 'e5ccfd1f-d460-4998-a15f-dc7fb97302f9'),
(366, NULL, 105, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-25 14:10:11', '2021-01-25 14:10:11', NULL, '3047e9ab-df94-4d88-b01f-d89eaf1da1bc'),
(367, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-25 14:10:11', '2021-01-24 20:54:27', NULL, '1105b6aa-946c-4af6-b590-3935f80bedb5'),
(368, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-25 14:10:11', '2021-01-24 20:54:27', NULL, '57d1567c-8877-4171-ac5d-7b05cd5e999d'),
(369, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-25 14:10:11', '2021-01-24 20:54:27', NULL, '6d9f8ed9-422b-44b7-b91d-5d8dbeb63afa'),
(370, NULL, 106, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-26 12:00:21', '2021-01-26 12:00:21', NULL, '7cd54c6a-d1df-401d-9ca8-7a1dfb2a3e8d'),
(371, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 12:00:21', '2021-01-24 20:54:27', NULL, 'ae38dbb7-c622-4427-8a77-6be9a3fc2e12'),
(372, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 12:00:21', '2021-01-24 20:54:27', NULL, 'f4c00184-d91e-4c9c-985a-9aad23cd5cb1'),
(373, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 12:00:21', '2021-01-24 20:54:27', NULL, 'f606039d-9b17-4675-96b6-708068f4e1e6'),
(374, NULL, 107, 27, 'craft\\elements\\Entry', 1, 0, '2021-01-26 13:51:07', '2021-01-26 13:51:07', NULL, '4d365146-9413-44dc-ad01-c8215641078f'),
(375, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:51:08', '2021-01-24 20:47:23', NULL, 'cbcfcddf-774e-46de-8420-fe8ddf8029d3'),
(376, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:51:08', '2021-01-24 20:47:23', NULL, '1843dd4c-837b-4987-835a-699628644cd5'),
(377, NULL, 108, 27, 'craft\\elements\\Entry', 1, 0, '2021-01-26 13:52:44', '2021-01-26 13:52:44', NULL, '9e0f260b-37f0-41c1-9404-511ac73c3a67'),
(378, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:52:44', '2021-01-24 20:47:23', NULL, '3dc4fe86-952a-4611-b6a9-4ecedc0025ff'),
(379, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:52:44', '2021-01-24 20:47:23', NULL, '60fb7bab-f2da-4f83-8c8b-8b65a5f6aa51'),
(380, NULL, 109, 27, 'craft\\elements\\Entry', 1, 0, '2021-01-26 13:54:11', '2021-01-26 13:54:11', NULL, 'ff19217b-421d-43b3-bd15-ad2da9e99f81'),
(381, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:54:11', '2021-01-24 20:47:23', NULL, '9d89ad59-2abd-4379-ba67-ca386fb8f173'),
(382, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:54:11', '2021-01-24 20:47:23', NULL, 'd1af7589-1846-464e-ab41-a090843a653c'),
(383, NULL, 110, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-26 13:55:19', '2021-01-26 13:55:19', NULL, '2a1fb29e-4cfa-4e72-bf0c-121d97bcfd52'),
(384, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:55:19', '2021-01-24 20:54:27', NULL, '9f6064f3-656a-4e3b-ad63-6fedc624d4d5'),
(385, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:55:19', '2021-01-24 20:54:27', NULL, '265221e4-bd54-409a-9667-813fd4523d67'),
(386, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:55:19', '2021-01-24 20:54:27', NULL, '7fa1b37d-880a-4251-8e3a-34338442cd81'),
(387, NULL, 111, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-26 13:55:59', '2021-01-26 13:55:59', NULL, '879a70bd-19cf-47a9-a887-c3f6f458a638'),
(388, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:55:59', '2021-01-24 20:54:27', NULL, '221da7fe-6ce1-456c-bed0-c6fdb9bd3d76'),
(389, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:55:59', '2021-01-24 20:54:27', NULL, '6daa0c89-212a-41d6-8afa-3cee7a90b3f4'),
(390, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:55:59', '2021-01-24 20:54:27', NULL, 'a016c6f1-cdf8-46ec-aa2f-ef9eef79fd81'),
(391, NULL, 112, 28, 'craft\\elements\\Entry', 1, 0, '2021-01-26 13:56:02', '2021-01-26 13:56:02', NULL, '1948fc6b-48b6-477e-80e8-beea0427a0c7'),
(392, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:56:02', '2021-01-24 20:54:27', NULL, '6ff0fcaa-c2c2-4f23-9a8d-b1ead323d0fe'),
(393, NULL, NULL, 11, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:56:02', '2021-01-24 20:54:27', NULL, 'f01c08e6-59e5-483e-b003-0b6ea7b14c03'),
(394, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-01-26 13:56:02', '2021-01-24 20:54:27', NULL, '739c963f-d9ab-43cf-a811-798207e96bf8');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
CREATE TABLE IF NOT EXISTS `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-01-11 20:06:57', '2021-01-11 20:06:57', '74d2af9d-808c-4334-bfea-b9f15b67ceb4'),
(2, 2, 1, 'hompage', '__home__', 1, '2021-01-13 14:11:50', '2021-01-13 14:11:50', 'a83b5763-281b-4ad0-b9ac-79ccf26200f2'),
(3, 3, 1, 'hompage', '__home__', 1, '2021-01-13 14:11:50', '2021-01-13 14:11:50', '969be5d6-0ed7-4764-bf48-8a35414a9e01'),
(4, 4, 1, 'hompage', '__home__', 1, '2021-01-13 14:14:13', '2021-01-13 14:14:13', '7fe187f4-1556-4bef-a0fc-290fa587abe4'),
(5, 5, 1, 'my-first-blog', 'my-first-blog', 1, '2021-01-13 19:39:31', '2021-01-13 19:39:47', '79d0d43c-7d02-4560-b753-d9edeca8da26'),
(7, 7, 1, 'my-first-blog', 'my-first-blog', 1, '2021-01-13 19:42:06', '2021-01-13 19:42:06', 'fbe6943f-e354-4508-8edf-8845668a3b5f'),
(8, 8, 1, 'my-first-blog', 'my-first-blog', 1, '2021-01-13 19:42:06', '2021-01-13 19:42:06', '2d0cc6ae-c99b-4bfd-bd31-3396d5945b09'),
(9, 9, 1, 'my-first-blog', 'my-first-blog', 1, '2021-01-13 19:42:48', '2021-01-13 19:42:48', '223ccd02-256a-4764-96f0-a54e93478271'),
(11, 11, 1, 'about', 'about', 1, '2021-01-13 19:47:09', '2021-01-13 19:47:09', '7d3c2d30-13d0-48b5-81be-5622a577018b'),
(12, 12, 1, 'about', 'about', 1, '2021-01-13 19:47:09', '2021-01-13 19:47:09', 'fce68145-c8af-4291-ab0f-787cc5ea5e44'),
(13, 13, 1, 'my-first-blog', 'my-first-blog', 1, '2021-01-13 19:47:22', '2021-01-13 19:47:22', 'eb3c0a23-71f6-461c-ba64-8dac54f86b6c'),
(14, 14, 1, 'hompage', '__home__', 1, '2021-01-13 19:47:30', '2021-01-13 19:47:30', '330675a8-363a-43f8-a8cd-214419d5bf2f'),
(15, 15, 1, 'about', 'about', 1, '2021-01-14 18:50:10', '2021-01-14 18:50:10', '5c4edcc9-34c0-40fd-9b92-45c94d71b497'),
(16, 16, 1, 'about', 'about', 1, '2021-01-14 18:50:24', '2021-01-14 18:50:24', '7e5f9b0a-e2a9-4adc-adf6-cb13a6b48f48'),
(17, 17, 1, 'about', 'about', 1, '2021-01-14 18:50:36', '2021-01-14 18:50:36', '8bb9d130-adcc-404f-a343-4bb72afd64e9'),
(18, 18, 1, 'home', '__home__', 1, '2021-01-14 18:53:18', '2021-01-14 18:53:18', 'a15d1daf-d173-4084-8b06-0192477f58f6'),
(19, 19, 1, 'home', '__home__', 1, '2021-01-14 18:53:18', '2021-01-14 18:53:18', '435ce232-6451-44c0-9fbb-586e96038ac3'),
(20, 20, 1, 'home', '__home__', 1, '2021-01-16 11:39:46', '2021-01-16 11:39:46', '8f084fcd-9d89-4b20-b443-db1277a4f3e6'),
(21, 21, 1, NULL, NULL, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '57829d20-84d5-4caf-a1ab-ce512e98c46c'),
(22, 22, 1, NULL, NULL, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', 'c316a158-f531-4e32-89ae-05136d4e1519'),
(23, 23, 1, NULL, NULL, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '223f5d23-f774-45a3-93ec-37d6296e2357'),
(24, 24, 1, NULL, NULL, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', 'a43e5d00-d66d-4eb2-924e-8d92f0ca85f0'),
(25, 25, 1, 'home', '__home__', 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '32ec45a4-f0fe-4c5c-a1e3-d0f74ee3b503'),
(26, 26, 1, NULL, NULL, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', 'eb9c3f15-a7bb-4a97-88bf-8b1e33a72bc4'),
(27, 27, 1, NULL, NULL, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '8963031f-35e9-4575-91da-b3d022411b37'),
(28, 28, 1, NULL, NULL, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '457b3fb8-cc68-4ead-beb7-efcd467c6aa9'),
(29, 29, 1, NULL, NULL, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '23e580cb-3b1d-4bd1-80a4-e93e9d7f9e45'),
(30, 30, 1, 'home', '__home__', 1, '2021-01-16 11:45:26', '2021-01-16 11:45:26', '467d0953-1ae0-4cb1-adbf-0fd08cab146e'),
(31, 31, 1, NULL, NULL, 1, '2021-01-16 11:45:26', '2021-01-16 11:45:26', '5cda829d-d5b1-4bd2-abf8-6d5abf74e240'),
(32, 32, 1, NULL, NULL, 1, '2021-01-16 11:45:26', '2021-01-16 11:45:26', '8d922ad7-86a2-4833-bc0f-7df361add25e'),
(33, 33, 1, NULL, NULL, 1, '2021-01-16 11:45:26', '2021-01-16 11:45:26', 'ff62c8e7-24f9-4a6b-8bbd-98ea6a1b0685'),
(34, 34, 1, NULL, NULL, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', 'c4f0d93f-7629-48b3-a588-e80a12a6c1f9'),
(35, 35, 1, NULL, NULL, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '74a4e4e9-7603-41c1-b694-6a44b975479a'),
(36, 36, 1, 'home', '__home__', 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '76c7432d-e995-42dd-9357-540c0c534e56'),
(37, 37, 1, NULL, NULL, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '813b0f45-0c9b-47a2-a7ff-57f188c89cc1'),
(38, 38, 1, NULL, NULL, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '6d362c8b-3b3e-477e-aaa3-0c37babfa848'),
(39, 39, 1, NULL, NULL, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '1fd1ea42-ce99-4518-bc70-9981b14473f9'),
(40, 40, 1, NULL, NULL, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', 'f49bcb83-88c2-4130-9430-a5ccb7030d9b'),
(41, 41, 1, NULL, NULL, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '56c6d91f-f852-4989-855c-a89a25130d6d'),
(42, 42, 1, 'home', '__home__', 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', 'aaa5c963-8c35-4f8a-bc5d-d413794f703f'),
(43, 43, 1, NULL, NULL, 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', 'ac313a3f-9f86-49f7-83d6-a966667cb625'),
(44, 44, 1, NULL, NULL, 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', 'd4be9091-d9d3-4300-8d59-ee2c3683dbc4'),
(45, 45, 1, NULL, NULL, 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', 'f5239890-93b7-412e-84f7-34a5c122d022'),
(46, 46, 1, NULL, NULL, 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', '89bdec19-f73c-47af-9993-c04fe8444740'),
(47, 47, 1, NULL, NULL, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '3ceb26a8-6b57-4196-96c3-79fd50387611'),
(48, 48, 1, 'home', '__home__', 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '358cb13e-2551-4514-8c17-ddc6a65c78d3'),
(49, 49, 1, NULL, NULL, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '35fca359-9dce-41f2-81e4-8b33873b9f75'),
(50, 50, 1, NULL, NULL, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', 'cfc526eb-77be-43f0-ae36-5addf2d1c87a'),
(51, 51, 1, NULL, NULL, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '570e7434-1022-4fb1-8c56-31fa7d74d73c'),
(52, 52, 1, NULL, NULL, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '226edb36-83b9-42c4-a524-9f710c5ab016'),
(53, 53, 1, NULL, NULL, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '3d124b14-cc83-4d55-aa86-096136344d21'),
(54, 54, 1, 'home', '__home__', 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', '37d983a8-7274-4fbd-b084-9a26652f7ce3'),
(55, 55, 1, NULL, NULL, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'd89862db-8cf9-4b63-9468-69acb69b13f0'),
(56, 56, 1, NULL, NULL, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', '7df7d7bb-6cc8-4a03-b0d4-048be8981f13'),
(57, 57, 1, NULL, NULL, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'fccc395b-42fa-45ff-b79d-41f3992b8aab'),
(58, 58, 1, NULL, NULL, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'd49138db-67b2-46ea-832b-b797f4ad99e5'),
(59, 59, 1, NULL, NULL, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', '2a631c76-c8a6-4761-b1fa-8d71bb505e1b'),
(60, 60, 1, 'home', '__home__', 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', 'c18302a5-24e7-4710-85a0-157ca45b590a'),
(61, 61, 1, NULL, NULL, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', 'eb08f964-85d2-4688-8590-c3263a2c1d26'),
(62, 62, 1, NULL, NULL, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', '6684887c-a24a-42b2-930d-c890f659ec3d'),
(63, 63, 1, NULL, NULL, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', '8895dede-1d60-4860-b153-b6e6bfe76953'),
(64, 64, 1, NULL, NULL, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', 'b2e3d03c-694b-44fd-bb6f-3e118f8df3b9'),
(65, 65, 1, NULL, NULL, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', '2c04c43a-3387-439f-8733-cbfd7ee5cb8a'),
(66, 66, 1, NULL, NULL, 1, '2021-01-16 21:18:30', '2021-01-16 21:18:30', '3b976d7f-1c6e-4712-af55-f791526c59f6'),
(67, 67, 1, NULL, NULL, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '81223b3d-dc21-480e-854b-e50fc756ddb8'),
(68, 68, 1, 'home', '__home__', 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', 'f4e467c5-2fd2-4c8a-afeb-a7f9cf31e1b2'),
(69, 69, 1, NULL, NULL, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '0bb7e77a-816f-44e3-b34e-e2026b0f73ed'),
(70, 70, 1, NULL, NULL, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '06c3c2a8-1693-4ead-b1b5-4292f4e01662'),
(71, 71, 1, NULL, NULL, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '9425d88f-cedd-4b4c-b3b6-07e668466a70'),
(72, 72, 1, NULL, NULL, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '0fcb7237-c73c-4622-8035-29782cf0471d'),
(73, 73, 1, NULL, NULL, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '6d7ab2f2-94e1-4c30-8ac5-98f35f95bdd2'),
(74, 74, 1, NULL, NULL, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', 'd3400a86-d299-443a-83a8-8d59c8b9d6f0'),
(75, 75, 1, 'home', '__home__', 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '73253a70-938b-446a-87d1-8ab7324864d9'),
(76, 76, 1, NULL, NULL, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '0b48189f-3750-4ff0-b0ea-3fb001752f35'),
(77, 77, 1, NULL, NULL, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '31aa5758-e6e0-4792-8b9d-69eff135b030'),
(78, 78, 1, NULL, NULL, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '25642d26-7668-4204-8ff8-1a8f00c0f59d'),
(79, 79, 1, NULL, NULL, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '75eb69b1-9d26-43ff-b4c7-c4fd31e36472'),
(80, 80, 1, NULL, NULL, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '369d9170-efe1-4738-9e16-0b87116f9983'),
(81, 81, 1, NULL, NULL, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '2668e144-9275-4a19-a2c8-13ec28e77de2'),
(82, 82, 1, 'home', '__home__', 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'a1c7effd-f6ab-4f18-a2b4-c82cc1700d65'),
(83, 83, 1, NULL, NULL, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '0e707eea-a973-4780-acc9-19f6116f0dca'),
(84, 84, 1, NULL, NULL, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '06699c44-4171-474f-8099-e3623cbdd36b'),
(85, 85, 1, NULL, NULL, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'b4dfe6a7-63af-4c08-b004-202a42fd9f29'),
(86, 86, 1, NULL, NULL, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '7f0d3038-02f4-4570-8d98-ad2a2e46e6e5'),
(87, 87, 1, NULL, NULL, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'c3358b9c-3a5c-4cbc-9645-ce2d9833fc0d'),
(88, 88, 1, NULL, NULL, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '1674b22b-cf08-4a5e-b5ad-4b7d51b6d203'),
(89, 89, 1, 'home', '__home__', 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '617ce763-dc7d-49ce-b335-47e611514cc3'),
(90, 90, 1, NULL, NULL, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '812c5c45-09b4-4ea6-a2bb-defedd2a8dff'),
(91, 91, 1, NULL, NULL, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '2e2b8fae-6af4-412e-b856-2a2eac86559d'),
(92, 92, 1, NULL, NULL, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', 'f7fb0dcc-ed34-4dad-9004-537a71e9d572'),
(93, 93, 1, NULL, NULL, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', 'cdd1246a-3750-47a8-a3f7-bc4ca9d6b2de'),
(94, 94, 1, NULL, NULL, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', 'a3e5dce4-c55e-4cda-ae5d-de4b10fd00a3'),
(95, 95, 1, NULL, NULL, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '3e9903b3-0921-401a-893d-2aeeee5ba42a'),
(97, 97, 1, NULL, NULL, 1, '2021-01-19 09:46:46', '2021-01-19 09:46:46', '8482163a-76a0-4dcc-a18e-43f9cbc779cc'),
(98, 98, 1, NULL, NULL, 1, '2021-01-19 09:46:56', '2021-01-19 09:46:56', '58df77c7-1aca-403e-9d45-add6bca9828e'),
(99, 99, 1, NULL, NULL, 1, '2021-01-19 09:46:58', '2021-01-19 09:46:58', '3401e5d9-e8c7-4e35-a40d-018e55c5f260'),
(100, 100, 1, NULL, NULL, 1, '2021-01-19 09:46:58', '2021-01-19 09:46:58', '4f29a8fa-8efb-4377-9c7e-514b2b88f930'),
(102, 102, 1, 'vijesti', 'vijesti/vijesti', 1, '2021-01-19 09:47:13', '2021-01-19 09:47:13', '7a9b239f-0235-41cc-b00d-d6afc5120952'),
(103, 103, 1, NULL, NULL, 1, '2021-01-19 09:47:13', '2021-01-19 09:47:13', 'ca41d7c2-c2a2-4aa0-912a-3f9a176c8616'),
(104, 104, 1, 'vijesti', 'vijesti/vijesti', 1, '2021-01-19 09:47:13', '2021-01-19 09:47:13', '7639c704-6046-462c-bad4-807ab3a238ed'),
(105, 105, 1, NULL, NULL, 1, '2021-01-19 09:47:13', '2021-01-19 09:47:13', '9816f15e-ff1e-4364-8d14-4825c7887376'),
(106, 106, 1, NULL, NULL, 1, '2021-01-19 11:06:13', '2021-01-19 11:06:13', '3fad04fd-529e-400f-9453-8352ca4d25da'),
(107, 107, 1, 'home', '__home__', 1, '2021-01-19 11:35:53', '2021-01-19 11:35:53', '669d0ece-12b0-474a-96ed-e46a3e97bcc4'),
(108, 108, 1, 'home', '__home__', 1, '2021-01-19 11:38:46', '2021-01-19 11:38:46', '01f6c6ec-8b64-4b2a-a8e4-e050bc4ed666'),
(109, 109, 1, NULL, NULL, 1, '2021-01-19 11:46:58', '2021-01-19 11:46:58', 'c7293ddc-f2fe-40f9-bc46-38ac74e51d50'),
(110, 110, 1, 'home', '__home__', 1, '2021-01-19 11:46:58', '2021-01-19 11:46:58', 'd8b97b5b-c474-4e6e-9ea2-15c75bb6b63f'),
(111, 111, 1, NULL, NULL, 1, '2021-01-19 11:46:58', '2021-01-19 11:46:58', '057d03dc-725d-452f-b04b-34498efeba90'),
(112, 112, 1, 'home', '__home__', 1, '2021-01-19 12:08:38', '2021-01-19 12:08:38', 'f2150369-ba1a-45bd-8196-a94cc0102444'),
(113, 113, 1, NULL, NULL, 1, '2021-01-19 12:08:38', '2021-01-19 12:08:38', '2345bead-3fcd-43c8-b989-50fb0d33f353'),
(114, 114, 1, 'home', '__home__', 1, '2021-01-19 12:18:09', '2021-01-19 12:18:09', 'b90a406f-8f93-416e-a819-633329ce07f5'),
(115, 115, 1, NULL, NULL, 1, '2021-01-19 12:18:09', '2021-01-19 12:18:09', '58402360-d739-415b-b53f-c08c1a84b13f'),
(116, 116, 1, 'home', '__home__', 1, '2021-01-19 12:19:21', '2021-01-19 12:19:21', '5ccc3593-e665-4052-834f-deb7ae0fe6de'),
(117, 117, 1, NULL, NULL, 1, '2021-01-19 12:19:21', '2021-01-19 12:19:21', '2a792a2f-2234-4767-a09d-9fb39dfbb2d5'),
(118, 118, 1, NULL, NULL, 1, '2021-01-19 12:53:44', '2021-01-19 12:53:44', 'fdb687a8-1572-46b6-8a66-2d1318192464'),
(119, 119, 1, 'home', '__home__', 1, '2021-01-19 12:53:44', '2021-01-19 12:53:44', 'f057d85c-422e-4457-ba11-2e6930ccbdb9'),
(120, 120, 1, NULL, NULL, 1, '2021-01-19 12:53:44', '2021-01-19 12:53:44', 'b9de8f7b-e159-4f1a-be4b-08d18153276e'),
(121, 121, 1, NULL, NULL, 1, '2021-01-19 12:53:44', '2021-01-19 12:53:44', '512fdedf-3062-4a5e-a58d-178014373e55'),
(122, 122, 1, 'about-us', 'about-us', 1, '2021-01-19 13:16:11', '2021-01-19 13:16:11', 'fd428dbe-5443-47fd-87b4-c7bb84af18c8'),
(123, 123, 1, 'about-us', 'about-us', 1, '2021-01-19 13:16:11', '2021-01-19 13:16:11', 'f1a54bd5-a7c1-424e-9310-6c402ea7a3a8'),
(124, 124, 1, 'about-us', 'about-us', 1, '2021-01-19 13:16:19', '2021-01-19 13:16:19', '42817085-7b69-4235-8e91-70d1d888d8dc'),
(125, 125, 1, 'contact', 'contact', 1, '2021-01-19 13:16:46', '2021-01-19 13:16:46', '3e3bfd87-7763-438e-a155-4028ec5b75a7'),
(126, 126, 1, 'contact', 'contact', 1, '2021-01-19 13:16:46', '2021-01-19 13:16:46', 'c836a944-01a9-4b53-998e-f133259dda95'),
(127, 127, 1, 'contact', 'contact', 1, '2021-01-19 13:16:51', '2021-01-19 13:16:51', '50d8e820-9a78-4efa-a376-321cb04ab6ad'),
(128, 128, 1, 'about-us', 'about-us', 1, '2021-01-19 13:17:35', '2021-01-19 13:17:35', '3175f1cc-b1c5-4406-a2a1-9324fcdced2a'),
(129, 129, 1, 'contact', 'contact', 1, '2021-01-19 13:17:42', '2021-01-19 13:17:42', 'a531dbb0-635e-4eea-8623-faa19cd9aade'),
(130, 130, 1, 'about-us', 'about-us', 1, '2021-01-19 13:19:38', '2021-01-19 13:19:38', 'a2f990e6-7c9e-4f16-91d0-01a90ea6a1dd'),
(131, 131, 1, NULL, NULL, 1, '2021-01-19 13:20:06', '2021-01-19 13:20:06', 'a68c6196-fa5e-492e-97fc-aeea1e4a2c50'),
(132, 132, 1, 'about-us', 'about-us', 1, '2021-01-19 13:20:06', '2021-01-19 13:20:06', 'd32d9bd4-5e5d-46e7-9c1d-217dff8f9385'),
(133, 133, 1, NULL, NULL, 1, '2021-01-19 13:20:06', '2021-01-19 13:20:06', '17afff9c-e55e-46d3-90fd-b93a46543378'),
(134, 134, 1, 'contact', 'contact', 1, '2021-01-19 13:21:10', '2021-01-19 13:21:10', 'e1e2f454-8ebf-4df2-a175-4ed920eaec65'),
(135, 135, 1, NULL, NULL, 1, '2021-01-19 13:21:27', '2021-01-19 13:21:27', 'cb680a8a-a232-402e-af25-bafe8cf8e621'),
(136, 136, 1, 'contact', 'contact', 1, '2021-01-19 13:21:27', '2021-01-19 13:21:27', '4b1ec586-3f7d-4825-8885-d0f8918279e4'),
(137, 137, 1, NULL, NULL, 1, '2021-01-19 13:21:27', '2021-01-19 13:21:27', '0ae7648a-c783-476d-ab50-a718f14b0091'),
(138, 138, 1, 'about-us', 'about-us', 1, '2021-01-19 13:21:54', '2021-01-19 13:21:54', '54fa3533-18af-4c22-9432-8e3346115cba'),
(139, 139, 1, NULL, NULL, 1, '2021-01-19 13:21:54', '2021-01-19 13:21:54', 'fd1bf154-8342-4833-b849-86aef2211bb5'),
(140, 140, 1, NULL, NULL, 1, '2021-01-19 13:22:14', '2021-01-19 13:22:14', 'd07c82ad-91f9-411e-a99b-619e7244dc10'),
(141, 141, 1, 'about-us', 'about-us', 1, '2021-01-19 13:22:14', '2021-01-19 13:22:14', 'a1b755fc-40b4-4f43-8d2b-c019af4df14c'),
(142, 142, 1, NULL, NULL, 1, '2021-01-19 13:22:14', '2021-01-19 13:22:14', 'd2c57ff0-acff-4c76-98d4-d59c705db2b0'),
(143, 143, 1, NULL, NULL, 1, '2021-01-19 13:22:14', '2021-01-19 13:22:14', '6c213999-cd18-4e5f-ab15-dcf52364183d'),
(144, 144, 1, NULL, NULL, 1, '2021-01-19 13:25:49', '2021-01-19 13:25:49', '2bfd260c-24eb-4332-81ca-869e8a840b79'),
(145, 145, 1, NULL, NULL, 1, '2021-01-19 13:33:30', '2021-01-19 13:33:30', '9c3143e6-89cd-4660-b15d-a708e61eceeb'),
(146, 146, 1, NULL, NULL, 1, '2021-01-19 13:33:30', '2021-01-19 13:33:30', '91fe34b9-b084-4a70-9d42-0ca42f6afa69'),
(147, 147, 1, 'contact', 'contact', 1, '2021-01-19 14:04:25', '2021-01-19 14:04:25', '7e3e4120-28ce-4f32-b2fe-9d2fe929b2c1'),
(148, 148, 1, NULL, NULL, 1, '2021-01-19 14:04:25', '2021-01-19 14:04:25', 'ada5436f-6a97-4fea-916b-86875cf9b14a'),
(149, 149, 1, 'contact', 'contact', 1, '2021-01-19 14:04:44', '2021-01-19 14:04:44', '5bee0a69-c6f7-4635-9dd1-0b5e04ce4a48'),
(150, 150, 1, NULL, NULL, 1, '2021-01-19 14:04:44', '2021-01-19 14:04:44', '13bde4ef-8975-4c68-bd3d-8259b8c93bc1'),
(152, 152, 1, NULL, NULL, 1, '2021-01-20 19:54:54', '2021-01-20 19:54:54', '613df6bf-2748-4b91-bbb8-9b6ab12d92d7'),
(153, 153, 1, NULL, NULL, 1, '2021-01-20 19:55:03', '2021-01-20 19:55:03', '66dfda98-ea10-4272-86f6-3b315bc8639c'),
(154, 154, 1, NULL, NULL, 1, '2021-01-20 19:55:06', '2021-01-20 19:55:06', 'e5fb638e-ba8b-434c-9500-00101ca091f1'),
(155, 155, 1, NULL, NULL, 1, '2021-01-20 19:55:08', '2021-01-20 19:55:08', 'a57e8f85-4a5b-4443-8d17-f1472e900e4f'),
(156, 156, 1, NULL, NULL, 1, '2021-01-20 19:55:12', '2021-01-20 19:55:12', '77351e96-912f-4de0-884b-212afaec599e'),
(157, 157, 1, NULL, NULL, 1, '2021-01-20 19:55:14', '2021-01-20 19:55:14', 'a8491e28-f62e-4147-add6-f30bc8dd7e0c'),
(158, 158, 1, NULL, NULL, 1, '2021-01-20 19:55:14', '2021-01-20 19:55:14', '14b697fb-b48f-479c-bf8d-9282af7ec82c'),
(159, 159, 1, NULL, NULL, 1, '2021-01-20 19:55:20', '2021-01-20 19:55:20', 'd1bf40b9-9dfe-49ff-b087-aef5418789a1'),
(160, 160, 1, NULL, NULL, 1, '2021-01-20 19:55:21', '2021-01-20 19:55:21', '77dbe3ec-7943-4ae9-834a-cc23d4ac8222'),
(161, 161, 1, NULL, NULL, 1, '2021-01-20 19:55:24', '2021-01-20 19:55:24', 'b8db024e-c899-4c64-84c9-ae503d7103af'),
(162, 162, 1, NULL, NULL, 1, '2021-01-20 19:55:24', '2021-01-20 19:55:24', '4a060e16-f20a-4f82-b5fa-3c6a87b2b14a'),
(163, 163, 1, NULL, NULL, 1, '2021-01-20 19:55:27', '2021-01-20 19:55:27', 'aa74555a-e98b-4ec4-9d52-072bf1427eea'),
(164, 164, 1, NULL, NULL, 1, '2021-01-20 19:55:27', '2021-01-20 19:55:27', 'a811c939-ecb7-48dd-b46f-4d4a9e604cd4'),
(165, 165, 1, NULL, NULL, 1, '2021-01-20 19:55:28', '2021-01-20 19:55:28', 'fab35fd5-8602-4081-a72d-898097cf7f7a'),
(166, 166, 1, NULL, NULL, 1, '2021-01-20 19:55:28', '2021-01-20 19:55:28', 'd8384151-3896-4cae-b4ff-0886559258dd'),
(167, 167, 1, NULL, NULL, 1, '2021-01-20 19:55:28', '2021-01-20 19:55:28', 'f946722b-4c4a-4250-bade-51ed8efe22c4'),
(171, 171, 1, 'vijesti', 'vijesti.twig', 1, '2021-01-20 19:56:06', '2021-01-20 20:22:26', 'fbf1d26a-ccb0-408f-93cb-bce917542d9e'),
(172, 172, 1, NULL, NULL, 1, '2021-01-20 19:56:06', '2021-01-20 19:56:06', '710b87c8-23e5-4f91-b823-0f42a6c98bfb'),
(173, 173, 1, NULL, NULL, 1, '2021-01-20 19:56:06', '2021-01-20 19:56:06', '42c628c2-850a-430e-83ed-888aadf4f7eb'),
(174, 174, 1, NULL, NULL, 1, '2021-01-20 19:56:06', '2021-01-20 19:56:06', 'ca6d1ac1-a42f-43d2-a5e2-b30665e45d95'),
(175, 175, 1, 'senzacionalno', 'vijesti/senzacionalno', 1, '2021-01-20 19:56:06', '2021-01-20 19:56:06', '432d6a87-1184-4f22-a218-f22cf7d4c375'),
(176, 176, 1, NULL, NULL, 1, '2021-01-20 19:56:06', '2021-01-20 19:56:06', '91a97cfc-7c6e-473d-a9c9-798bf0a77617'),
(177, 177, 1, NULL, NULL, 1, '2021-01-20 19:56:06', '2021-01-20 19:56:06', 'f29fcf9b-3823-4ae6-89e5-954011fe7715'),
(178, 178, 1, NULL, NULL, 1, '2021-01-20 19:56:06', '2021-01-20 19:56:06', 'b4f3b081-3531-4092-b70e-fd756b14b2f1'),
(179, 179, 1, 'senzacionalno', 'vijesti/senzacionalno', 1, '2021-01-20 19:57:09', '2021-01-20 19:57:09', '3d3fddd3-aec2-4d63-b6e7-663bc2d1f703'),
(180, 180, 1, NULL, NULL, 1, '2021-01-20 19:57:09', '2021-01-20 19:57:09', 'e33ba6c6-ef6d-4152-a1ed-7de828ac43e2'),
(181, 181, 1, NULL, NULL, 1, '2021-01-20 19:57:09', '2021-01-20 19:57:09', '0f48c0d2-4c64-4eed-a85c-d4e57cb624c7'),
(182, 182, 1, NULL, NULL, 1, '2021-01-20 19:57:09', '2021-01-20 19:57:09', 'b38ad4cf-7e36-49f8-ba42-b4345fab2482'),
(183, 183, 1, 'senzacionalno', 'vijesti/senzacionalno', 1, '2021-01-20 20:03:03', '2021-01-20 20:03:03', 'df3427df-8a1d-4907-99b6-3e5b1217ca78'),
(184, 184, 1, NULL, NULL, 1, '2021-01-20 20:03:03', '2021-01-20 20:03:03', '44398cb2-59ef-4faf-98af-abf39c1e79c2'),
(185, 185, 1, NULL, NULL, 1, '2021-01-20 20:03:03', '2021-01-20 20:03:03', '7d578fca-1dba-46d9-896f-6f4a1223299e'),
(186, 186, 1, NULL, NULL, 1, '2021-01-20 20:03:03', '2021-01-20 20:03:03', 'efc3a472-c837-499d-a0f6-f3164b476d12'),
(187, 187, 1, 'vijesti', 'vijesti/vijesti', 1, '2021-01-20 20:03:14', '2021-01-20 20:03:14', '8966807d-6194-4c8d-b266-135feab03560'),
(188, 188, 1, NULL, NULL, 1, '2021-01-20 20:03:14', '2021-01-20 20:03:14', '9d0bca48-8176-48ff-8af4-93f6b967dbae'),
(189, 189, 1, NULL, NULL, 1, '2021-01-20 20:03:14', '2021-01-20 20:03:14', '333a919b-1463-4b6f-8eb4-97e7f00e7663'),
(190, 190, 1, NULL, NULL, 1, '2021-01-20 20:03:14', '2021-01-20 20:03:14', 'b0981507-c25b-41c9-95e0-6f8172e96265'),
(191, 191, 1, 'vijesti', NULL, 1, '2021-01-20 20:06:09', '2021-01-20 20:06:09', 'a199f7e4-588b-417c-b74b-2f02d2f50e5c'),
(192, 192, 1, NULL, NULL, 1, '2021-01-20 20:06:09', '2021-01-20 20:06:09', 'd4b33532-f23e-4270-b715-b23397915cfc'),
(193, 193, 1, NULL, NULL, 1, '2021-01-20 20:06:09', '2021-01-20 20:06:09', '5cf75f38-3999-4746-a949-c29d5e32f88f'),
(194, 194, 1, NULL, NULL, 1, '2021-01-20 20:06:09', '2021-01-20 20:06:09', 'c0ae0033-2cb8-4491-be95-eeed923158ff'),
(195, 195, 1, 'vijesti', NULL, 1, '2021-01-20 20:06:17', '2021-01-20 20:06:17', '91c75106-7383-4a39-9ac1-0133be0536fb'),
(196, 196, 1, NULL, NULL, 1, '2021-01-20 20:06:17', '2021-01-20 20:06:17', '922e0c03-775d-40ee-ab2a-f756aa638635'),
(197, 197, 1, NULL, NULL, 1, '2021-01-20 20:06:17', '2021-01-20 20:06:17', 'b15d4622-403f-4aa0-97bf-020f21e97960'),
(198, 198, 1, NULL, NULL, 1, '2021-01-20 20:06:17', '2021-01-20 20:06:17', '791982b1-c658-4323-b7c2-da802dc94f6b'),
(199, 199, 1, 'vijesti', NULL, 1, '2021-01-20 20:17:47', '2021-01-20 20:17:47', 'f351afd5-760b-413b-9f4f-9464ee9925fa'),
(200, 200, 1, NULL, NULL, 1, '2021-01-20 20:17:47', '2021-01-20 20:17:47', '32bdd127-394b-42f2-8740-fe9b217d7ee2'),
(201, 201, 1, NULL, NULL, 1, '2021-01-20 20:17:47', '2021-01-20 20:17:47', '204a7e5d-94a2-44bb-838d-22d890c69991'),
(202, 202, 1, NULL, NULL, 1, '2021-01-20 20:17:47', '2021-01-20 20:17:47', '774ea892-4c9f-4637-b424-527b1a9821b2'),
(203, 203, 1, 'vijesti', 'vijesti.twig', 1, '2021-01-20 20:18:51', '2021-01-20 20:18:51', '16457407-a1b8-4295-8857-eda4fc329ac1'),
(204, 204, 1, NULL, NULL, 1, '2021-01-20 20:18:51', '2021-01-20 20:18:51', 'fd9e54e8-cc1a-4a13-a3a3-d8bb3356d7be'),
(205, 205, 1, NULL, NULL, 1, '2021-01-20 20:18:51', '2021-01-20 20:18:51', 'b01b1d2c-e396-4941-bdee-424a190f3671'),
(206, 206, 1, NULL, NULL, 1, '2021-01-20 20:18:51', '2021-01-20 20:18:51', 'ed7150c5-29a5-4e3f-bc45-6a889f4b74a4'),
(207, 207, 1, 'vijesti', 'vijesti.twig', 1, '2021-01-20 20:19:01', '2021-01-20 20:19:01', 'abe046a0-12af-4035-a3cf-c0cc5e330816'),
(208, 208, 1, NULL, NULL, 1, '2021-01-20 20:19:01', '2021-01-20 20:19:01', 'a86e7292-c534-4cbe-93ad-1c89f7bd2c99'),
(209, 209, 1, NULL, NULL, 1, '2021-01-20 20:19:01', '2021-01-20 20:19:01', 'f75d8419-7cb5-4019-ad01-68f591a094e7'),
(210, 210, 1, NULL, NULL, 1, '2021-01-20 20:19:01', '2021-01-20 20:19:01', '057e553b-17c0-49ce-9372-4a16fac88fea'),
(211, 211, 1, 'vijesti', 'vijesti', 1, '2021-01-20 20:22:04', '2021-01-20 20:22:04', '840f2d66-2c1d-4ccf-9186-4ce1e280b2e8'),
(212, 212, 1, NULL, NULL, 1, '2021-01-20 20:22:04', '2021-01-20 20:22:04', 'f2e986a9-5f6f-448a-b25a-3019c494ec50'),
(213, 213, 1, NULL, NULL, 1, '2021-01-20 20:22:04', '2021-01-20 20:22:04', 'fb03ccae-afb7-4aee-be0c-2556f224ba69'),
(214, 214, 1, NULL, NULL, 1, '2021-01-20 20:22:04', '2021-01-20 20:22:04', '6b8d2d7e-1d66-4405-b478-a2d051b84410'),
(215, 215, 1, 'vijesti', 'vijesti', 1, '2021-01-20 20:22:05', '2021-01-20 20:22:05', 'de65ba32-f699-4227-83c5-4904d403fa46'),
(216, 216, 1, NULL, NULL, 1, '2021-01-20 20:22:05', '2021-01-20 20:22:05', '00fe1c20-929a-4096-9447-8d1f737eba5f'),
(217, 217, 1, NULL, NULL, 1, '2021-01-20 20:22:05', '2021-01-20 20:22:05', 'b3a967ad-3f91-4d02-b01f-7c243cae5e50'),
(218, 218, 1, NULL, NULL, 1, '2021-01-20 20:22:05', '2021-01-20 20:22:05', '9704a958-bd4c-4a4b-8f1f-d5710e0a1fae'),
(219, 219, 1, 'vijesti', 'vijesti', 1, '2021-01-20 20:22:08', '2021-01-20 20:22:08', '9b51e82c-ae4c-425f-8868-7cc9923aa903'),
(220, 220, 1, NULL, NULL, 1, '2021-01-20 20:22:08', '2021-01-20 20:22:08', '79edf14d-ee6a-4c9a-9622-a683b7610ae6'),
(221, 221, 1, NULL, NULL, 1, '2021-01-20 20:22:08', '2021-01-20 20:22:08', '6884966c-037f-455c-890a-6cb67a63f264'),
(222, 222, 1, NULL, NULL, 1, '2021-01-20 20:22:08', '2021-01-20 20:22:08', 'aebfb8cb-7555-4aea-a61a-d13f3cdc68ac'),
(223, 223, 1, 'vijesti', 'vijesti.twig', 1, '2021-01-20 20:22:27', '2021-01-20 20:22:27', 'dbaffb84-5864-4478-af0c-70c73b735100'),
(224, 224, 1, NULL, NULL, 1, '2021-01-20 20:22:27', '2021-01-20 20:22:27', 'aa080afa-bd40-4f68-b661-d334420c5d9e'),
(225, 225, 1, NULL, NULL, 1, '2021-01-20 20:22:27', '2021-01-20 20:22:27', '7bce352a-86f8-4c33-8ef9-9c1656ad01b4'),
(226, 226, 1, NULL, NULL, 1, '2021-01-20 20:22:27', '2021-01-20 20:22:27', '3f632ade-6630-48e7-867f-2f419066867f'),
(227, 227, 1, 'vijesti', 'vijesti.twig', 1, '2021-01-20 20:22:27', '2021-01-20 20:22:27', '7d1c9b52-0ed3-43a2-b69c-1a486750cb01'),
(228, 228, 1, NULL, NULL, 1, '2021-01-20 20:22:27', '2021-01-20 20:22:27', '1f8a58e4-e4ca-4007-adf4-c3b354aa40cf'),
(229, 229, 1, NULL, NULL, 1, '2021-01-20 20:22:27', '2021-01-20 20:22:27', '23fe97db-53da-4a48-8edb-f7bd8a15d71f'),
(230, 230, 1, NULL, NULL, 1, '2021-01-20 20:22:27', '2021-01-20 20:22:27', 'e9bfe8a9-668e-4150-858c-c40029063ea6'),
(231, 231, 1, 'vijesti', 'vijesti.twig', 1, '2021-01-21 08:48:58', '2021-01-21 08:48:58', 'a3aefd7c-9a92-4605-9c4f-da5532b2fdf1'),
(232, 232, 1, NULL, NULL, 1, '2021-01-21 08:48:58', '2021-01-21 08:48:58', '9968de35-4b0c-45de-8ca8-a8c5e9575326'),
(233, 233, 1, NULL, NULL, 1, '2021-01-21 08:48:58', '2021-01-21 08:48:58', '5f281bee-67aa-49db-9dae-306679c7c9d9'),
(234, 234, 1, NULL, NULL, 1, '2021-01-21 08:48:58', '2021-01-21 08:48:58', '32cece06-9336-4275-acec-3bfae226c086'),
(235, 235, 1, 'vijesti', 'vijesti', 1, '2021-01-23 13:36:57', '2021-01-23 13:36:57', '2351d5ef-2a90-473d-975b-b44622d402f0'),
(236, 236, 1, 'vijesti', 'vijesti', 1, '2021-01-23 13:36:57', '2021-01-23 13:36:57', '05c67251-bf69-4668-bf87-7d4e93e6e70c'),
(237, 237, 1, 'vijesti', 'vijesti', 1, '2021-01-23 13:39:32', '2021-01-23 13:39:32', '9c19fc7e-47c2-48ba-bf9e-86abe3b88198'),
(238, 238, 1, 'video', 'video', 1, '2021-01-23 13:39:55', '2021-01-23 13:39:55', 'e355dc7d-acc5-4bf7-8028-23d4e24da73a'),
(239, 239, 1, 'video', 'video', 1, '2021-01-23 13:39:55', '2021-01-23 13:39:55', '45af0bc0-e7e6-44ce-a5cb-affb9a26fdab'),
(240, 240, 1, 'video', 'video', 1, '2021-01-23 13:40:01', '2021-01-23 13:40:01', '056998a5-2aa9-4102-bbfa-1c720c838122'),
(241, 241, 1, 'vijesti', 'vijesti', 1, '2021-01-23 14:09:36', '2021-01-23 14:09:36', '4698d750-d84e-481c-8adf-06964ddf0b1c'),
(242, 242, 1, 'video', 'video', 1, '2021-01-23 14:09:53', '2021-01-23 14:09:53', 'fe0a96be-4878-42b9-b15e-0c0419e1a863'),
(243, 243, 1, 'video', 'video', 1, '2021-01-23 14:10:34', '2021-01-23 14:10:34', 'da9457b5-3ab2-40b6-b410-d031b76e1d7b'),
(244, 244, 1, 'vijesti', 'vijesti', 1, '2021-01-23 14:10:48', '2021-01-23 14:10:48', 'b3f8fbb1-61f5-4c8b-b37b-2ef056e3834b'),
(245, 245, 1, NULL, NULL, 1, '2021-01-23 14:11:16', '2021-01-23 14:11:16', '0ab4e6ec-2289-44ee-ad09-39df60cff1ca'),
(246, 246, 1, 'vijesti', 'vijesti', 1, '2021-01-23 14:11:17', '2021-01-23 14:11:17', 'bb7f63c7-e30c-4301-bbb7-e8345bb860b4'),
(247, 247, 1, NULL, NULL, 1, '2021-01-23 14:11:17', '2021-01-23 14:11:17', '8e8c8b4d-8894-44d3-83ff-493b1d557af4'),
(248, 248, 1, NULL, NULL, 1, '2021-01-23 14:11:29', '2021-01-23 14:11:29', 'b69d05e2-13ea-4131-a407-d0445119dd30'),
(249, 249, 1, 'video', 'video', 1, '2021-01-23 14:11:29', '2021-01-23 14:11:29', '0f3efae1-a5c8-402c-8cb8-dbdd170ce04b'),
(250, 250, 1, NULL, NULL, 1, '2021-01-23 14:11:29', '2021-01-23 14:11:29', 'daa5533d-e1e5-47d6-876d-318bee4301a6'),
(251, 251, 1, NULL, NULL, 1, '2021-01-23 14:22:25', '2021-01-23 14:22:25', 'a5438844-2b3d-4bf0-a0bd-99d8aff0d65d'),
(252, 252, 1, NULL, NULL, 1, '2021-01-23 14:27:19', '2021-01-23 14:27:19', '2f5bf511-d2dc-4cc0-9dd2-dfa8823f9a13'),
(253, 253, 1, NULL, NULL, 1, '2021-01-23 14:27:19', '2021-01-23 14:27:19', 'ebf08462-fb14-4718-8060-6daae40a52b2'),
(254, 254, 1, 'vijesti', 'vijesti', 1, '2021-01-23 15:16:36', '2021-01-23 15:16:36', '17afec97-d9ab-44cd-9d2e-f802365746a1'),
(255, 255, 1, NULL, NULL, 1, '2021-01-23 15:16:50', '2021-01-23 15:16:50', '68f01197-4fbe-4ae6-9f12-43bcb6318018'),
(256, 256, 1, 'vijesti', 'vijesti', 1, '2021-01-23 15:16:50', '2021-01-23 15:16:50', 'd11a7d55-94ab-4b61-886a-6af90630a4fb'),
(257, 257, 1, NULL, NULL, 1, '2021-01-23 15:16:50', '2021-01-23 15:16:50', '9d3d1247-9eb4-40aa-afa7-b158b16607e0'),
(258, 258, 1, 'vijesti', 'vijesti', 1, '2021-01-23 15:31:03', '2021-01-23 15:31:03', '2a5c0984-8e33-4cd9-9ef2-5617c43887ce'),
(259, 259, 1, NULL, NULL, 1, '2021-01-23 15:31:03', '2021-01-23 15:31:03', '81a6a1c2-da27-4d77-811f-96004b0bdad2'),
(260, 260, 1, 'vijesti', 'vijesti', 1, '2021-01-23 15:31:17', '2021-01-23 15:31:17', '610218e8-9e30-4d7b-accf-1626a7db8b4d'),
(261, 261, 1, NULL, NULL, 1, '2021-01-23 15:31:17', '2021-01-23 15:31:17', 'd1568f34-3b16-49a1-875f-4e3918ad8034'),
(262, 262, 1, NULL, NULL, 1, '2021-01-23 15:36:01', '2021-01-23 15:36:01', 'c8e0acf0-4725-4202-bccf-b9b14530b97b'),
(263, 263, 1, NULL, NULL, 1, '2021-01-23 15:36:01', '2021-01-23 15:36:01', 'b16afe4f-be03-47a6-a52c-feda47e2da10'),
(264, 264, 1, NULL, NULL, 1, '2021-01-23 15:36:01', '2021-01-23 15:36:01', '0c64944a-5355-48b7-9dfa-532e951480fb'),
(265, 265, 1, NULL, NULL, 1, '2021-01-23 15:36:01', '2021-01-23 15:36:01', '77df0978-871d-47f5-bfd4-6ea65b4d2bfb'),
(266, 266, 1, NULL, NULL, 1, '2021-01-23 15:36:01', '2021-01-23 15:36:01', '38e0d214-0097-4092-b4ba-8ff9c7f2cd5b'),
(267, 267, 1, NULL, NULL, 1, '2021-01-23 15:37:01', '2021-01-23 15:37:01', '0db3a952-d942-4f95-9489-7c5e8525e0dc'),
(268, 268, 1, 'vijesti', 'vijesti', 1, '2021-01-23 16:29:53', '2021-01-23 16:29:53', 'ef61fa33-bf2c-4053-bde1-141aeb044632'),
(269, 269, 1, NULL, NULL, 1, '2021-01-23 16:29:53', '2021-01-23 16:29:53', 'e4c944d5-0d13-4ed0-946e-efaf251ce48f'),
(270, 270, 1, NULL, NULL, 1, '2021-01-24 09:34:50', '2021-01-24 09:34:50', '477a21a6-e45b-4f21-8d17-44447af1bbf1'),
(271, 271, 1, NULL, NULL, 1, '2021-01-24 09:34:58', '2021-01-24 09:34:58', '22adbdff-2a16-4319-b3d2-e4010727f5e1'),
(272, 272, 1, 'vijesti', 'vijesti', 1, '2021-01-24 09:34:58', '2021-01-24 09:34:58', '9f675116-ab1c-4fb1-a841-ba63be7de31f'),
(273, 273, 1, NULL, NULL, 1, '2021-01-24 09:34:58', '2021-01-24 09:34:58', 'a062f986-6d0e-4793-8a47-4e23fb0270c2'),
(274, 274, 1, NULL, NULL, 1, '2021-01-24 09:34:58', '2021-01-24 09:34:58', '91a180f7-d093-4286-9343-1ea7e5bafe26'),
(275, 275, 1, NULL, NULL, 1, '2021-01-24 12:44:25', '2021-01-24 12:44:25', 'ed412288-dbcc-4bd4-8b9a-c847cc7ce630'),
(276, 276, 1, 'vijesti', 'vijesti', 1, '2021-01-24 12:44:49', '2021-01-24 12:44:49', '6abb6629-c247-4fec-aec0-11dcd893c825'),
(277, 277, 1, NULL, NULL, 1, '2021-01-24 12:44:49', '2021-01-24 12:44:49', 'eaf07fbd-d23b-48f4-a5e7-7899732853e7'),
(278, 278, 1, NULL, NULL, 1, '2021-01-24 12:44:49', '2021-01-24 12:44:49', '2e46c2f4-9f61-4596-8fe4-62c961be50bd'),
(279, 279, 1, 'vijesti', 'vijesti', 1, '2021-01-24 18:41:37', '2021-01-24 18:41:37', '83d8944e-6145-4ff0-9e28-f488ea1eb11d'),
(280, 280, 1, NULL, NULL, 1, '2021-01-24 18:41:37', '2021-01-24 18:41:37', '14f60a56-f5ac-4e18-a53a-a5fd272cb4b6'),
(281, 281, 1, 'home', '__home__', 1, '2021-01-24 20:23:42', '2021-01-24 20:23:42', '55d5a9be-9bfe-4360-93bc-e64e075d712a'),
(282, 282, 1, NULL, NULL, 1, '2021-01-24 20:23:42', '2021-01-24 20:23:42', 'd397eb7f-daa4-499c-8983-411a60636ae5'),
(283, 283, 1, NULL, NULL, 1, '2021-01-24 20:23:42', '2021-01-24 20:23:42', 'e92b27b5-57a3-432b-987e-cdb5209106c7'),
(284, 284, 1, NULL, NULL, 1, '2021-01-24 20:25:52', '2021-01-24 20:25:52', '3d2ff42b-0c32-4fac-851a-98c5e0ce1d26'),
(285, 285, 1, 'vijesti', 'vijesti', 1, '2021-01-24 20:25:52', '2021-01-24 20:25:52', 'fd0a1c37-5256-4693-aa8e-f762f2bc09d7'),
(286, 286, 1, NULL, NULL, 1, '2021-01-24 20:25:52', '2021-01-24 20:25:52', 'bac5fd08-b21b-4ce5-8834-2247b7c66ba0'),
(287, 287, 1, NULL, NULL, 1, '2021-01-24 20:25:52', '2021-01-24 20:25:52', 'a653ec2b-a24f-4473-a8ae-17e5b05b21c7'),
(288, 288, 1, 'sport', 'sport', 1, '2021-01-24 20:44:30', '2021-01-24 20:44:30', '467fee5a-876b-4b24-8181-8bf5cb342013'),
(289, 289, 1, 'sport', 'sport', 1, '2021-01-24 20:44:30', '2021-01-24 20:44:30', 'ae1bf45c-3884-4488-9560-19be3f002505'),
(290, 290, 1, 'vijesti', 'vijesti', 1, '2021-01-24 20:44:35', '2021-01-24 20:44:35', '1c118eb5-1c9d-4a0d-b6e3-f1fb8dd1da58'),
(291, 291, 1, NULL, NULL, 1, '2021-01-24 20:44:35', '2021-01-24 20:44:35', 'd9eb4aa8-62ae-4582-ade5-c4b7abd4043c'),
(292, 292, 1, NULL, NULL, 1, '2021-01-24 20:44:35', '2021-01-24 20:44:35', 'f93ded8f-10c6-44b2-a25b-d6d98c5c9560'),
(293, 293, 1, 'sport', 'sport', 1, '2021-01-24 20:45:01', '2021-01-24 20:45:01', 'b41b5332-1a18-4eff-afc6-c510a81fa1d3'),
(294, 294, 1, 'vijesti', 'vijesti', 1, '2021-01-24 20:45:09', '2021-01-24 20:45:09', '8f90d93d-23f5-46a9-af15-a209f35c5775'),
(295, 295, 1, NULL, NULL, 1, '2021-01-24 20:45:09', '2021-01-24 20:45:09', '6bf9affd-f622-4d38-b1e4-db9ee08c9bba'),
(296, 296, 1, NULL, NULL, 1, '2021-01-24 20:45:09', '2021-01-24 20:45:09', 'd5f40294-0a04-40c2-a39e-1ff5f8342a4f'),
(297, 297, 1, 'sport', 'sport', 1, '2021-01-24 20:45:15', '2021-01-24 20:45:15', 'aca227df-3159-4e36-97c7-c64054343372'),
(298, 298, 1, NULL, NULL, 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '9c308f37-e905-4c45-bc87-bc804eb3c5e7'),
(299, 299, 1, NULL, NULL, 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '7404e374-e8d9-4151-b8dd-32e03b3d614a'),
(300, 300, 1, 'sport', 'sport', 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', 'd36eee78-1e37-4a77-b8cc-a88eaefb17d1'),
(301, 301, 1, NULL, NULL, 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', 'f3a77ede-41c5-4618-adf2-98df071d77f9'),
(302, 302, 1, NULL, NULL, 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '772d3594-8045-4ee6-a2bf-cf000712e54f'),
(303, 303, 1, 'novac', 'novac', 1, '2021-01-24 20:52:44', '2021-01-24 20:52:44', 'cffa1987-4dea-40e0-b04d-aaa052cae8f2'),
(304, 304, 1, 'novac', 'novac', 1, '2021-01-24 20:52:45', '2021-01-24 20:52:45', '5d6677c9-75db-4c90-a3b9-fcc3b9f29601'),
(305, 305, 1, 'novac', 'novac', 1, '2021-01-24 20:52:45', '2021-01-24 20:52:45', '42d5c4bb-2425-43ca-9f2b-cdd83dee306b'),
(306, 306, 1, 'novac', 'novac', 1, '2021-01-24 20:53:04', '2021-01-24 20:53:04', 'a1dc082c-899a-45c8-a99c-5ef0cd21bdab'),
(307, 307, 1, NULL, NULL, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '033f22f9-40a3-412a-868d-c493597857e4'),
(308, 308, 1, NULL, NULL, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'c8f36487-8de8-4ffe-96e0-e7cfbb99a880'),
(309, 309, 1, NULL, NULL, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'ea4883b2-46f9-466e-9159-eac7405c9127'),
(310, 310, 1, 'novac', 'novac', 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '7b18a4ee-148c-43a6-b7b6-6db414e9a072'),
(311, 311, 1, NULL, NULL, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'd0330003-4210-49ee-8053-d01a04721834'),
(312, 312, 1, NULL, NULL, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '5ef7fa99-1829-4d8b-af68-65c12b72f6de'),
(313, 313, 1, NULL, NULL, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '5dbdd02a-7fbb-4acc-8efd-6523d0482d4d'),
(314, 314, 1, 'novac', 'novac', 1, '2021-01-24 20:55:21', '2021-01-24 20:55:21', '10eb728b-5317-437b-af21-e539c87b070c'),
(315, 315, 1, NULL, NULL, 1, '2021-01-24 20:55:21', '2021-01-24 20:55:21', '79af0c51-16ca-43d4-9412-444dfcdc84bd'),
(316, 316, 1, NULL, NULL, 1, '2021-01-24 20:55:21', '2021-01-24 20:55:21', 'c7739c42-840a-47a5-a8eb-45ff33726874'),
(317, 317, 1, NULL, NULL, 1, '2021-01-24 20:55:21', '2021-01-24 20:55:21', '460071f8-5e76-437d-94a2-0b5cf1c5a4d4'),
(318, 318, 1, 'novac', 'novac', 1, '2021-01-24 20:55:23', '2021-01-24 20:55:23', 'def049a6-12d4-4399-828f-5933a727513e'),
(319, 319, 1, NULL, NULL, 1, '2021-01-24 20:55:23', '2021-01-24 20:55:23', 'cb241afd-266a-4684-a846-477349902882'),
(320, 320, 1, NULL, NULL, 1, '2021-01-24 20:55:23', '2021-01-24 20:55:23', '54b52a76-ae39-485b-8c0f-43487b06818f'),
(321, 321, 1, NULL, NULL, 1, '2021-01-24 20:55:23', '2021-01-24 20:55:23', '339974b7-df27-473a-84a3-ee4bf7e818ef'),
(322, 322, 1, 'kultura', 'kultura', 1, '2021-01-24 20:56:34', '2021-01-24 20:56:34', '0f9f7eda-b4d9-40b3-8719-20bf8f1714e7'),
(323, 323, 1, 'kultura', 'kultura', 1, '2021-01-24 20:56:34', '2021-01-24 20:56:34', '93c36ff6-08bb-4910-9d32-46f7480baaae'),
(324, 324, 1, 'kultura', 'kultura', 1, '2021-01-24 20:56:42', '2021-01-24 20:56:42', 'b5466db3-51ae-442c-bf0e-deec54ddf4a4'),
(325, 325, 1, NULL, NULL, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '6d09b2f9-0871-4b1e-922c-5074a3798948'),
(326, 326, 1, NULL, NULL, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', 'a5da150c-4eb6-4607-8a78-1cd2ecf39503'),
(327, 327, 1, NULL, NULL, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '909d6bb7-3960-48d2-9219-19b832577b6a'),
(328, 328, 1, 'kultura', 'kultura', 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '5d075f77-180d-4358-a601-2713ede7cb86'),
(329, 329, 1, NULL, NULL, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '407f1b97-8812-48d3-813f-38d2a210ef37'),
(330, 330, 1, NULL, NULL, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', 'e0cdc51b-4578-471f-9e8d-85c871f233f8'),
(331, 331, 1, NULL, NULL, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', 'beba6374-9567-4149-a9bb-391b39ed48b0'),
(332, 332, 1, 'scena', 'scena', 1, '2021-01-24 20:58:54', '2021-01-24 20:58:54', '3f63d087-17d5-49a4-951b-7398a21f1fc6'),
(333, 333, 1, 'scena', 'scena', 1, '2021-01-24 20:58:54', '2021-01-24 20:58:54', '6bafdbeb-0d1a-4f2c-984a-1c0618c0f837'),
(334, 334, 1, 'scena', 'scena', 1, '2021-01-24 20:59:06', '2021-01-24 20:59:06', '7cb1d125-4346-4cd4-9e75-ae0a8ddb28d0'),
(335, 335, 1, NULL, NULL, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '38e5cc2f-fa85-4a4f-8518-e743d26e7cb5'),
(336, 336, 1, NULL, NULL, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', 'd4d3264b-e657-4678-b50a-dc71f0db35bd'),
(337, 337, 1, NULL, NULL, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', 'b7ea6404-3759-4d45-be37-e3a1bc012f15'),
(338, 338, 1, 'scena', 'scena', 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', 'f1769973-8ae7-4179-852a-f4e365760d99'),
(339, 339, 1, NULL, NULL, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '622d8339-3445-4fb1-94b2-086d728f71fa'),
(340, 340, 1, NULL, NULL, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '9bde52ae-5e3d-4c73-9635-49dfba8baf38'),
(341, 341, 1, NULL, NULL, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', 'd3a343ef-4415-4cf0-89aa-8e520b70e9a3'),
(342, 342, 1, 'kultura', 'kultura', 1, '2021-01-24 21:01:03', '2021-01-24 21:01:03', '3108ee4e-d238-4f01-bf1f-953df84c21de'),
(343, 343, 1, NULL, NULL, 1, '2021-01-24 21:01:03', '2021-01-24 21:01:03', 'c4215eac-63a1-4fa2-bd8b-bf1141b2f918'),
(344, 344, 1, NULL, NULL, 1, '2021-01-24 21:01:03', '2021-01-24 21:01:03', 'f44756b1-6c40-4335-bc03-1c4be81f36e6'),
(345, 345, 1, NULL, NULL, 1, '2021-01-24 21:01:03', '2021-01-24 21:01:03', '2158cea9-f1d9-4b5a-9387-e006c200afc1'),
(346, 346, 1, 'kultura', 'kultura', 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '2637c33a-e3d8-497f-8e9d-b49a519ae3eb'),
(347, 347, 1, NULL, NULL, 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '0a109aac-83e3-4f61-840f-af1829b3b731'),
(348, 348, 1, NULL, NULL, 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '67c277a8-18c9-41fb-8b73-08d575bad1d7'),
(349, 349, 1, NULL, NULL, 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '50e0c8f8-704a-48e8-9793-c1d42bbf575f'),
(350, 350, 1, 'scena', 'scena', 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', '98ac4d9a-3000-492c-bae3-35726787cabc'),
(351, 351, 1, NULL, NULL, 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', 'aab505c4-8d42-459f-b4c5-b34b9279eb8b'),
(352, 352, 1, NULL, NULL, 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', '605c0b42-2a08-449a-87c0-f3c215dcb487'),
(353, 353, 1, NULL, NULL, 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', '5daae89e-2779-4f24-ab07-6fb36dc2964d'),
(354, 354, 1, 'scena', 'scena', 1, '2021-01-24 21:01:40', '2021-01-24 21:01:40', '9f979133-5fb5-402d-bf8e-0da70028f0f0'),
(355, 355, 1, NULL, NULL, 1, '2021-01-24 21:01:40', '2021-01-24 21:01:40', '283b19f8-8a9b-4838-af39-443e613bff9e'),
(356, 356, 1, NULL, NULL, 1, '2021-01-24 21:01:40', '2021-01-24 21:01:40', 'c2e325cc-c81e-498b-84ff-e7347152938f'),
(357, 357, 1, NULL, NULL, 1, '2021-01-24 21:01:40', '2021-01-24 21:01:40', 'e46f29e0-53dc-4925-bc8f-2067aae8312b'),
(358, 358, 1, 'kultura', 'kultura', 1, '2021-01-24 21:01:57', '2021-01-24 21:01:57', 'e5419854-8499-4cdd-b518-33e123ce7eef'),
(359, 359, 1, NULL, NULL, 1, '2021-01-24 21:01:57', '2021-01-24 21:01:57', '1e9989c0-d46b-47c5-82ae-9deb19734804'),
(360, 360, 1, NULL, NULL, 1, '2021-01-24 21:01:58', '2021-01-24 21:01:58', 'd3f340ac-e7cb-4646-9e51-d4a742a132e5'),
(361, 361, 1, NULL, NULL, 1, '2021-01-24 21:01:58', '2021-01-24 21:01:58', '993a022a-41b8-4e4a-9e28-dbf385829e47'),
(362, 362, 1, 'novac', 'novac', 1, '2021-01-25 14:09:46', '2021-01-25 14:09:46', '157c4b43-a29b-4947-a901-3774e7c500d0'),
(363, 363, 1, NULL, NULL, 1, '2021-01-25 14:09:46', '2021-01-25 14:09:46', '73741446-68e9-4498-99d0-19b8af07e31f'),
(364, 364, 1, NULL, NULL, 1, '2021-01-25 14:09:46', '2021-01-25 14:09:46', '60b4c4c8-143a-410a-8f90-35e0a4a50491'),
(365, 365, 1, NULL, NULL, 1, '2021-01-25 14:09:46', '2021-01-25 14:09:46', '1a16520f-c0da-4cea-b59c-8fec926379c2'),
(366, 366, 1, 'novac', 'novac', 1, '2021-01-25 14:10:11', '2021-01-25 14:10:11', 'b7d5d04a-cdd0-4c71-bcb2-db88a18b24f9'),
(367, 367, 1, NULL, NULL, 1, '2021-01-25 14:10:11', '2021-01-25 14:10:11', 'f3182ed8-5a40-42a9-9a2e-cef23fe240b0'),
(368, 368, 1, NULL, NULL, 1, '2021-01-25 14:10:11', '2021-01-25 14:10:11', '585b99ef-7f49-4be5-b57b-232e1055abb4'),
(369, 369, 1, NULL, NULL, 1, '2021-01-25 14:10:11', '2021-01-25 14:10:11', 'f8cd14c4-4490-4bd0-bbc6-d8699b7675fd'),
(370, 370, 1, 'novac', 'novac', 1, '2021-01-26 12:00:21', '2021-01-26 12:00:21', 'aa326259-5594-43d4-b478-06f1bd94875f'),
(371, 371, 1, NULL, NULL, 1, '2021-01-26 12:00:21', '2021-01-26 12:00:21', 'cc226fd5-31dc-4804-bed8-5cbabff70c5d'),
(372, 372, 1, NULL, NULL, 1, '2021-01-26 12:00:21', '2021-01-26 12:00:21', '9089660e-2edd-48b3-907a-ad67c450989d'),
(373, 373, 1, NULL, NULL, 1, '2021-01-26 12:00:21', '2021-01-26 12:00:21', '86b8dfce-a143-42f9-9917-32dad5df92b4'),
(374, 374, 1, 'sport', 'sport', 1, '2021-01-26 13:51:07', '2021-01-26 13:51:07', '4e79356d-63e7-4026-81fe-f4ec998ac3e4'),
(375, 375, 1, NULL, NULL, 1, '2021-01-26 13:51:08', '2021-01-26 13:51:08', 'cccd65a5-f5f1-41b3-9d4a-bea5dd5d0f10'),
(376, 376, 1, NULL, NULL, 1, '2021-01-26 13:51:08', '2021-01-26 13:51:08', '5a9ba8dd-9839-482c-9dbd-59bb29c51fe6'),
(377, 377, 1, 'sport', 'sport', 1, '2021-01-26 13:52:44', '2021-01-26 13:52:44', '0379b2f2-d4bb-46d1-9c83-466c239deae0'),
(378, 378, 1, NULL, NULL, 1, '2021-01-26 13:52:44', '2021-01-26 13:52:44', 'cd1c3730-4559-4b86-9146-0421662b573d'),
(379, 379, 1, NULL, NULL, 1, '2021-01-26 13:52:44', '2021-01-26 13:52:44', 'bc6e30b6-8f72-4fff-85ce-fb85cddefb79'),
(380, 380, 1, 'sport', 'sport', 1, '2021-01-26 13:54:11', '2021-01-26 13:54:11', 'ea35a849-f45e-4b17-b31a-61e9e7430d99'),
(381, 381, 1, NULL, NULL, 1, '2021-01-26 13:54:11', '2021-01-26 13:54:11', 'c60c9dfc-fc1d-4ff3-99bd-a229db1312d4'),
(382, 382, 1, NULL, NULL, 1, '2021-01-26 13:54:11', '2021-01-26 13:54:11', '82b35a3e-91a0-4d21-86b0-55caf11ce035'),
(383, 383, 1, 'novac', 'novac', 1, '2021-01-26 13:55:19', '2021-01-26 13:55:19', 'dadac7b3-abb5-47b1-bbe6-89397dc22787'),
(384, 384, 1, NULL, NULL, 1, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '56950a31-f650-4fc9-bde9-a1793c5c3895'),
(385, 385, 1, NULL, NULL, 1, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '02dc64de-e95a-423f-be1e-fc08d7a6508f'),
(386, 386, 1, NULL, NULL, 1, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '883730f0-9c8f-4696-9bc7-bea51a9b4b1e'),
(387, 387, 1, 'novac', 'novac', 1, '2021-01-26 13:55:59', '2021-01-26 13:55:59', 'cfe552b5-f655-471d-b992-cdf36a6e63b2'),
(388, 388, 1, NULL, NULL, 1, '2021-01-26 13:55:59', '2021-01-26 13:55:59', 'f91a688c-112c-4d68-8679-b7ddeb77a095'),
(389, 389, 1, NULL, NULL, 1, '2021-01-26 13:55:59', '2021-01-26 13:55:59', '2a3acd79-e16e-4c54-ace3-8c8d8ee9f88b'),
(390, 390, 1, NULL, NULL, 1, '2021-01-26 13:55:59', '2021-01-26 13:55:59', '5c31897a-3ce4-4ae8-bbdc-dddf1d6586c4'),
(391, 391, 1, 'novac', 'novac', 1, '2021-01-26 13:56:02', '2021-01-26 13:56:02', 'c7b1845a-5d79-4f26-a8fe-a47f8330d155'),
(392, 392, 1, NULL, NULL, 1, '2021-01-26 13:56:02', '2021-01-26 13:56:02', 'b70961d0-f15d-4d89-ae79-3f95de039d7c'),
(393, 393, 1, NULL, NULL, 1, '2021-01-26 13:56:02', '2021-01-26 13:56:02', '5f734351-7711-4f43-95d0-ed462f995eea'),
(394, 394, 1, NULL, NULL, 1, '2021-01-26 13:56:02', '2021-01-26 13:56:02', 'bd1e15ed-5276-4a36-932e-67f8e5ba3d3d');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
CREATE TABLE IF NOT EXISTS `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 2, NULL, 2, NULL, '2021-01-13 14:11:00', NULL, 1, '2021-01-13 14:11:50', '2021-01-13 14:11:50', '883d4ceb-03d5-41db-9601-d551425999a3'),
(3, 2, NULL, 2, NULL, '2021-01-13 14:11:00', NULL, NULL, '2021-01-13 14:11:50', '2021-01-13 14:11:50', '8b4ca1ec-a4f6-4825-8fa6-c7651a34d609'),
(4, 2, NULL, 2, NULL, '2021-01-13 14:11:00', NULL, NULL, '2021-01-13 14:14:13', '2021-01-13 14:14:13', '8128bcf6-1692-4e32-92db-4065592953cb'),
(5, 1, NULL, 1, 1, '2021-01-13 19:39:00', NULL, NULL, '2021-01-13 19:39:31', '2021-01-13 19:39:31', 'c5806fb5-3af9-476a-b6df-26f4c72d04d9'),
(7, 1, NULL, 1, 1, '2021-01-13 19:42:00', NULL, 1, '2021-01-13 19:42:06', '2021-01-13 19:42:06', '81d0d739-599f-4ac4-afbe-5ab65eb12a44'),
(8, 1, NULL, 1, 1, '2021-01-13 19:42:00', NULL, NULL, '2021-01-13 19:42:06', '2021-01-13 19:42:06', 'fc088005-843d-4633-af26-f289281193da'),
(9, 1, NULL, 1, 1, '2021-01-13 19:42:00', NULL, NULL, '2021-01-13 19:42:48', '2021-01-13 19:42:48', '1a6ffc0f-7853-4ebd-bae7-e1968f9289d7'),
(11, 3, NULL, 3, 1, '2021-01-13 19:46:00', NULL, 1, '2021-01-13 19:47:09', '2021-01-13 19:47:09', '65b1922c-3aeb-41e9-abf9-f0a9189713bd'),
(12, 3, NULL, 3, 1, '2021-01-13 19:46:00', NULL, NULL, '2021-01-13 19:47:09', '2021-01-13 19:47:09', '68b6852d-9029-4568-a667-614ae5ce7ef8'),
(13, 1, NULL, 1, 1, '2021-01-13 19:42:00', NULL, NULL, '2021-01-13 19:47:22', '2021-01-13 19:47:22', '4d7d83ab-5934-47dd-8687-c26db78d62d2'),
(14, 2, NULL, 2, NULL, '2021-01-13 14:11:00', NULL, NULL, '2021-01-13 19:47:30', '2021-01-13 19:47:30', '2c4e2832-7c85-48e4-9c98-cb390ca273bd'),
(15, 3, NULL, 3, 1, '2021-01-13 19:46:00', NULL, NULL, '2021-01-14 18:50:10', '2021-01-14 18:50:10', 'f957054f-60d0-4c3b-aa85-1ce03883cfa8'),
(16, 3, NULL, 3, 1, '2021-01-13 19:46:00', NULL, NULL, '2021-01-14 18:50:24', '2021-01-14 18:50:24', '4e946cbb-e9da-4f80-b6d0-96fdb35914fe'),
(17, 3, NULL, 3, 1, '2021-01-13 19:46:00', NULL, NULL, '2021-01-14 18:50:36', '2021-01-14 18:50:36', '8999b8e2-dcfe-47d3-9e5f-34e0cec23144'),
(18, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-14 18:53:18', '2021-01-14 18:53:18', '83ea71aa-3f6e-4c40-9eb2-cf5f124dcc0e'),
(19, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-14 18:53:18', '2021-01-14 18:53:18', 'db53cbf8-b1b5-4d23-b097-b95a9d8eaa3a'),
(20, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 11:39:46', '2021-01-16 11:39:46', 'f669440e-2582-4806-9085-7de82d83bac5'),
(25, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 11:43:27', '2021-01-16 11:43:27', 'd1138489-0d36-4cd2-9568-87039da15526'),
(30, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 11:45:26', '2021-01-16 11:45:26', '27406f3a-a4a4-4c97-bb05-13a625f4e07b'),
(36, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 11:47:56', '2021-01-16 11:47:56', 'd2d12086-5007-4ab9-802d-67d1cdfa819d'),
(42, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 20:30:10', '2021-01-16 20:30:10', '1c5ece35-9002-4b41-b523-560cd807055b'),
(48, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '1780bc61-742d-4906-a9e2-ca08898dc59b'),
(54, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'ee865e00-965b-4186-ac72-c0eace22eb58'),
(60, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 21:13:22', '2021-01-16 21:13:22', 'b300df60-85a1-43a0-96bd-1aa0eebdc56a'),
(68, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 21:18:34', '2021-01-16 21:18:34', 'f6353748-8d8b-4ed1-8bed-b053bcd23599'),
(75, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '1a2c6014-6f6f-437d-8dc9-b4d0984a59ce'),
(82, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'aec5d455-9783-48e3-8e7b-70deaf1dd42b'),
(89, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '9051a048-77f1-4cfe-8e53-167cf4ab9c83'),
(102, 5, NULL, 5, 1, '2021-01-19 09:46:00', NULL, 1, '2021-01-19 09:47:13', '2021-01-19 09:47:13', '9733a845-06d6-4a6c-b6ad-4faed25e800f'),
(104, 5, NULL, 5, 1, '2021-01-19 09:46:00', NULL, NULL, '2021-01-19 09:47:13', '2021-01-19 09:47:13', 'c6dd88e7-c634-44d0-87f5-efc3eaefae74'),
(107, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-19 11:35:53', '2021-01-19 11:35:53', 'ffd9a068-bc09-457e-b015-b556e009cd3d'),
(108, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-19 11:38:46', '2021-01-19 11:38:46', '1f1a244c-8dbd-4dca-83b1-1a7be20a6b02'),
(110, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-19 11:46:58', '2021-01-19 11:46:58', '3b53e659-fcab-4107-a17a-0830381e260e'),
(112, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-19 12:08:38', '2021-01-19 12:08:38', 'dc7a373d-1cf7-43f0-a462-41374cf64911'),
(114, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-19 12:18:09', '2021-01-19 12:18:09', '76c8a4c9-da2b-43f7-89ae-165d288c3a43'),
(116, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-19 12:19:21', '2021-01-19 12:19:21', '4be147dd-d624-411e-8ea6-ad5460a23f64'),
(119, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-19 12:53:44', '2021-01-19 12:53:44', 'fd59913d-f8a6-4d57-9dde-39109bc03104'),
(122, 6, NULL, 6, NULL, '2021-01-19 13:16:00', NULL, 1, '2021-01-19 13:16:11', '2021-01-19 13:16:11', 'fd1ef46e-a6c6-4c98-9f60-356bd1688afa'),
(123, 6, NULL, 6, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:16:11', '2021-01-19 13:16:11', '7ba4769f-0238-4a8e-91c2-d1eb86cab245'),
(124, 6, NULL, 6, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:16:19', '2021-01-19 13:16:19', '0ee71487-7316-4a8c-a518-a66fb8d29692'),
(125, 7, NULL, 7, NULL, '2021-01-19 13:16:00', NULL, 1, '2021-01-19 13:16:46', '2021-01-19 13:16:46', '2fe861a1-43ab-4a1b-9433-dd2d5b4eb26f'),
(126, 7, NULL, 7, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:16:46', '2021-01-19 13:16:46', 'bc2d6bbe-8988-44b0-a01b-64db82ea06a9'),
(127, 7, NULL, 7, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:16:51', '2021-01-19 13:16:51', '561a59f7-9612-4084-898a-7321f95c8fb5'),
(128, 6, NULL, 6, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:17:35', '2021-01-19 13:17:35', 'd80c0561-b35b-4032-8bb1-5d5c4bd9eeb3'),
(129, 7, NULL, 7, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:17:42', '2021-01-19 13:17:42', '80c8b614-b9b1-4b15-9a19-eb95d267e54a'),
(130, 6, NULL, 6, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:19:38', '2021-01-19 13:19:38', '118942e1-2276-4f24-98fc-b25e0d660027'),
(132, 6, NULL, 6, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:20:06', '2021-01-19 13:20:06', '5bb1e0da-86a6-4745-8ae5-32b5c393ec33'),
(134, 7, NULL, 7, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:21:10', '2021-01-19 13:21:10', '295b31ce-94e1-44d3-81d8-c7a769adac1e'),
(136, 7, NULL, 7, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:21:27', '2021-01-19 13:21:27', 'de11d37a-f721-4399-9437-8f1045e1109a'),
(138, 6, NULL, 6, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:21:54', '2021-01-19 13:21:54', '1544c37d-e019-4bb5-9c2b-ef69ac8e51b6'),
(141, 6, NULL, 6, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 13:22:14', '2021-01-19 13:22:14', '558075bb-39cf-455b-a568-78dd81ec6857'),
(147, 7, NULL, 7, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 14:04:25', '2021-01-19 14:04:25', 'ab1bec22-fd17-441e-9229-5e946a108b3f'),
(149, 7, NULL, 7, NULL, '2021-01-19 13:16:00', NULL, NULL, '2021-01-19 14:04:44', '2021-01-19 14:04:44', 'd0db6ed1-f7a8-470d-8e1d-67248a955174'),
(171, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, 1, '2021-01-20 19:56:06', '2021-01-20 20:06:09', 'bcc80fa7-4048-4258-a745-0832b74c4e65'),
(175, 8, NULL, 8, 1, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 19:56:06', '2021-01-20 19:56:06', '8d810e10-3500-44bc-8f39-d4e629c2f5c3'),
(179, 8, NULL, 8, 1, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 19:57:09', '2021-01-20 19:57:09', '51c14d69-bba4-4868-abd0-22ef557be1f7'),
(183, 8, NULL, 8, 1, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:03:03', '2021-01-20 20:03:03', 'bcdfd7f7-e372-41d0-b8b5-4c5f2b9ad883'),
(187, 8, NULL, 8, 1, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:03:14', '2021-01-20 20:03:14', '178f913b-a231-45c5-beb0-bd1299c4d99b'),
(191, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:06:09', '2021-01-20 20:06:09', 'db5ff97d-ef8b-42ed-98b3-b365b9d7bd8d'),
(195, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:06:17', '2021-01-20 20:06:17', 'd232eab4-a990-47bf-90e5-8b7db630daff'),
(199, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:17:47', '2021-01-20 20:17:47', 'fe42ab16-9b9b-4d2d-88cf-7956de850c80'),
(203, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:18:51', '2021-01-20 20:18:51', 'b4700ab6-4957-450a-8677-db0dccebc3a4'),
(207, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:19:01', '2021-01-20 20:19:01', 'c8cfaabf-4201-4ecb-8d53-38336d525852'),
(211, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:22:04', '2021-01-20 20:22:04', 'ed29bae5-47ad-4a41-9f17-23aa160aadb8'),
(215, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:22:05', '2021-01-20 20:22:05', 'dc93072e-5181-4ede-b4b4-a53c881fdc77'),
(219, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:22:08', '2021-01-20 20:22:08', 'e9640c1c-0a11-491b-812b-fba0d2a4e2fa'),
(223, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:22:27', '2021-01-20 20:22:27', '0954c826-d91a-4a88-9116-f5e0dce5d8ff'),
(227, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-20 20:22:27', '2021-01-20 20:22:27', '7a08025e-5a52-4f8f-8361-1975cb5b683e'),
(231, 8, NULL, 8, NULL, '2021-01-20 19:54:00', NULL, NULL, '2021-01-21 08:48:58', '2021-01-21 08:48:58', 'd71fe7c5-2cc4-4ef5-a69f-2c5fd7858dce'),
(235, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 13:36:57', '2021-01-23 13:36:57', 'b1a8c02c-5ce6-43b6-8885-679d4606b73d'),
(236, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 13:36:57', '2021-01-23 13:36:57', '70782c98-1755-458f-acab-51ca311eb8a0'),
(237, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 13:39:32', '2021-01-23 13:39:32', '555f519f-490d-435f-a55d-41d36ebd892e'),
(238, 10, NULL, 11, NULL, '2021-01-23 13:39:00', NULL, NULL, '2021-01-23 13:39:55', '2021-01-23 13:39:55', 'fb2094b8-0b4b-49e7-94a9-368fe10c3a59'),
(239, 10, NULL, 11, NULL, '2021-01-23 13:39:00', NULL, NULL, '2021-01-23 13:39:55', '2021-01-23 13:39:55', 'bb89c6ca-c690-43bd-99f6-82094ab0b576'),
(240, 10, NULL, 11, NULL, '2021-01-23 13:39:00', NULL, NULL, '2021-01-23 13:40:01', '2021-01-23 13:40:01', '555142cd-a75c-4e78-ba32-a6bcb9cc87e1'),
(241, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 14:09:36', '2021-01-23 14:09:36', 'fb690feb-9f23-4fa8-9958-e6d145e2cdd2'),
(242, 10, NULL, 11, NULL, '2021-01-23 13:39:00', NULL, NULL, '2021-01-23 14:09:53', '2021-01-23 14:09:53', '8c846217-988b-45fa-a80d-32d35a2cbb92'),
(243, 10, NULL, 11, NULL, '2021-01-23 13:39:00', NULL, NULL, '2021-01-23 14:10:34', '2021-01-23 14:10:34', '3a78cf18-2e75-4386-b28d-d5b36744b6a8'),
(244, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 14:10:48', '2021-01-23 14:10:48', '3a8757cf-f968-4df6-9b13-86b1bd8c8063'),
(246, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 14:11:17', '2021-01-23 14:11:17', '39e38f8d-fc7a-4fde-aa20-991eca6b49a9'),
(249, 10, NULL, 11, NULL, '2021-01-23 13:39:00', NULL, NULL, '2021-01-23 14:11:29', '2021-01-23 14:11:29', 'afaa0046-ed63-43ca-93ed-a9cdc79141e9'),
(254, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 15:16:36', '2021-01-23 15:16:36', 'da1b6771-7487-4c79-b4bb-2278484c4ae9'),
(256, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 15:16:50', '2021-01-23 15:16:50', '8eb36b0e-5864-4838-b950-b3be652d7789'),
(258, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 15:31:03', '2021-01-23 15:31:03', '5a7a477c-10f0-4910-877f-f3c8b5c242dd'),
(260, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 15:31:17', '2021-01-23 15:31:17', 'a018e57f-03a8-4f78-9bf2-454db6d03974'),
(268, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-23 16:29:53', '2021-01-23 16:29:53', 'c1425e8a-f398-4c36-aa70-e88072078fc8'),
(272, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-24 09:34:58', '2021-01-24 09:34:58', 'a47ec135-f4ad-4c45-a45b-fba526dae000'),
(276, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-24 12:44:49', '2021-01-24 12:44:49', 'c9d7ddb2-dbd4-4539-b8b3-70e2f7264226'),
(279, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-24 18:41:37', '2021-01-24 18:41:37', '130ec8f5-7e73-42f9-9831-ce7b1bab6ff6'),
(281, 4, NULL, 4, NULL, '2021-01-14 18:53:00', NULL, NULL, '2021-01-24 20:23:42', '2021-01-24 20:23:42', '7610e7de-7814-44c9-ad7d-fe1053bb9d0e'),
(285, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-24 20:25:52', '2021-01-24 20:25:52', '591cf0ec-8ff4-40ec-8114-ac6c220a3e2b'),
(288, 11, NULL, 12, NULL, '2021-01-24 20:44:00', NULL, NULL, '2021-01-24 20:44:30', '2021-01-24 20:44:30', 'c6cf1244-5b63-4bd4-8eb9-bd42cfce679a'),
(289, 11, NULL, 12, NULL, '2021-01-24 20:44:00', NULL, NULL, '2021-01-24 20:44:30', '2021-01-24 20:44:30', 'cac9252f-c7ae-4058-bda5-d47d59fd164e'),
(290, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-24 20:44:35', '2021-01-24 20:44:35', 'd01d6fbf-0fb8-4104-a279-f261952b17c7'),
(293, 11, NULL, 12, NULL, '2021-01-24 20:44:00', NULL, NULL, '2021-01-24 20:45:01', '2021-01-24 20:45:01', '6d6f3a04-fc7b-4fe4-9822-412b749ff8bc'),
(294, 9, NULL, 10, NULL, '2021-01-23 13:36:00', NULL, NULL, '2021-01-24 20:45:09', '2021-01-24 20:45:09', 'b5d2dbbb-c504-4567-a2d0-9504289f7dd3'),
(297, 11, NULL, 12, NULL, '2021-01-24 20:44:00', NULL, NULL, '2021-01-24 20:45:15', '2021-01-24 20:45:15', 'ac466946-b36c-44ca-b144-e01311123450'),
(300, 11, NULL, 12, NULL, '2021-01-24 20:44:00', NULL, NULL, '2021-01-24 20:47:23', '2021-01-24 20:47:23', 'b11c6a96-8db7-434b-9b41-22369c4e988c'),
(303, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-24 20:52:44', '2021-01-24 20:52:44', 'cef35f70-7b87-40fd-9133-1312ecdafc7f'),
(304, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-24 20:52:45', '2021-01-24 20:52:45', 'bcd5c7b6-54b7-4b0e-9606-10a2af011738'),
(305, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-24 20:52:45', '2021-01-24 20:52:45', '3f30477b-d866-49bb-b788-cec980086e4a'),
(306, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-24 20:53:04', '2021-01-24 20:53:04', '0228b0ed-6b46-4013-8e2d-f828d05c165d'),
(310, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'd1171502-57a9-406e-964c-cfb76c3cd8dc'),
(314, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-24 20:55:21', '2021-01-24 20:55:21', '9103fab1-2357-4b14-a3d3-aaa8157593a8'),
(318, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-24 20:55:23', '2021-01-24 20:55:23', '0d086878-854e-4742-b302-5c4dfaa08697'),
(322, 13, NULL, 14, NULL, '2021-01-24 20:56:00', NULL, NULL, '2021-01-24 20:56:34', '2021-01-24 20:56:34', '752500ba-3c37-47bd-8e15-9b4628bc9d85'),
(323, 13, NULL, 14, NULL, '2021-01-24 20:56:00', NULL, NULL, '2021-01-24 20:56:34', '2021-01-24 20:56:34', '370a3e3c-7078-4526-9ac2-87873a928955'),
(324, 13, NULL, 14, NULL, '2021-01-24 20:56:00', NULL, NULL, '2021-01-24 20:56:42', '2021-01-24 20:56:42', '1680a38f-459c-4b1e-aeb9-cd9a5304db14'),
(328, 13, NULL, 14, NULL, '2021-01-24 20:56:00', NULL, NULL, '2021-01-24 20:58:31', '2021-01-24 20:58:31', 'a56b0f64-d35d-419b-a89f-a50f9b390f92'),
(332, 14, NULL, 15, NULL, '2021-01-24 20:58:00', NULL, NULL, '2021-01-24 20:58:54', '2021-01-24 20:58:54', 'c3ea5218-d3ad-4ed9-814a-771a34063792'),
(333, 14, NULL, 15, NULL, '2021-01-24 20:58:00', NULL, NULL, '2021-01-24 20:58:54', '2021-01-24 20:58:54', '54f423fe-2844-48b0-b10c-ff0a8ae14edb'),
(334, 14, NULL, 15, NULL, '2021-01-24 20:58:00', NULL, NULL, '2021-01-24 20:59:06', '2021-01-24 20:59:06', 'd0a9d442-bebc-4765-b1c0-930a7c899098'),
(338, 14, NULL, 15, NULL, '2021-01-24 20:58:00', NULL, NULL, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '6845cead-9b89-4939-a982-694453076ca8'),
(342, 13, NULL, 14, NULL, '2021-01-24 20:56:00', NULL, NULL, '2021-01-24 21:01:03', '2021-01-24 21:01:03', '2f5c68f0-83e4-4e9b-9a34-e970c87913ed'),
(346, 13, NULL, 14, NULL, '2021-01-24 20:56:00', NULL, NULL, '2021-01-24 21:01:16', '2021-01-24 21:01:16', 'c96ff61a-1537-40ef-b41d-f70cb9c24cbe'),
(350, 14, NULL, 15, NULL, '2021-01-24 20:58:00', NULL, NULL, '2021-01-24 21:01:21', '2021-01-24 21:01:21', 'e5ccb369-bb3c-4f16-a71e-6f59c1aabf09'),
(354, 14, NULL, 15, NULL, '2021-01-24 20:58:00', NULL, NULL, '2021-01-24 21:01:40', '2021-01-24 21:01:40', '37fe1b3a-8f32-43eb-8fd9-8e3c528275c9'),
(358, 13, NULL, 14, NULL, '2021-01-24 20:56:00', NULL, NULL, '2021-01-24 21:01:57', '2021-01-24 21:01:57', '59b6edc8-c5bd-4a43-bc9c-2517629d49ea'),
(362, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-25 14:09:46', '2021-01-25 14:09:46', '8436ad94-e763-469e-98f3-8b8e0b9c5646'),
(366, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-25 14:10:11', '2021-01-25 14:10:11', 'bb1a9790-0270-4888-b442-e554b96947cd'),
(370, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-26 12:00:21', '2021-01-26 12:00:21', '82804709-add6-44f0-a6f6-89acc33d99b5'),
(374, 11, NULL, 12, NULL, '2021-01-24 20:44:00', NULL, NULL, '2021-01-26 13:51:07', '2021-01-26 13:51:07', '3b2d6337-4175-4f63-884a-03fc5af8ad64'),
(377, 11, NULL, 12, NULL, '2021-01-24 20:44:00', NULL, NULL, '2021-01-26 13:52:44', '2021-01-26 13:52:44', '578b1408-df3a-4cee-af53-91fc63e962db'),
(380, 11, NULL, 12, NULL, '2021-01-24 20:44:00', NULL, NULL, '2021-01-26 13:54:11', '2021-01-26 13:54:11', 'e2bb6289-2896-491f-82d2-d62238fc1c46'),
(383, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '1ddd9438-7a07-4aab-b2ed-7a5cc827d2d5'),
(387, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-26 13:55:59', '2021-01-26 13:55:59', '58512e74-038b-475a-a346-00d9b832125d'),
(391, 12, NULL, 13, NULL, '2021-01-24 20:52:00', NULL, NULL, '2021-01-26 13:56:02', '2021-01-26 13:56:02', 'f35dfbc8-85dc-49c2-8e6d-b3034d373c28');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
CREATE TABLE IF NOT EXISTS `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Blog', 'blog', 1, 'site', NULL, NULL, 1, '2021-01-13 14:11:03', '2021-01-13 14:11:03', '2021-01-14 18:53:03', '21ed801a-68fa-4e14-aed7-d09e245606a2'),
(2, 2, 2, 'Hompage', 'hompage', 0, 'site', NULL, '{section.name|raw}', 1, '2021-01-13 14:11:50', '2021-01-13 14:11:50', '2021-01-14 18:53:00', 'c0a7182a-779d-44bd-ba4a-53521dc5f196'),
(3, 3, 3, 'Pages', 'pages', 1, 'site', NULL, NULL, 1, '2021-01-13 19:44:10', '2021-01-13 19:44:10', '2021-01-14 18:53:05', '966bdffd-f706-40cc-873a-be5fd2fc4e90'),
(4, 4, 4, 'Home', 'home', 0, 'site', NULL, '{section.name|raw}', 1, '2021-01-14 18:53:18', '2021-01-14 18:53:18', NULL, '748420e2-0a24-43a1-99af-4c1fdb3ae084'),
(5, 5, 10, 'Vijesti', 'vijesti', 1, 'site', NULL, NULL, 1, '2021-01-19 09:46:06', '2021-01-19 09:46:06', '2021-01-19 11:34:31', 'e61ac3f4-77b5-45bb-9ac4-2e3a5016a4a8'),
(6, 6, 12, 'About Us', 'aboutUs', 0, 'site', NULL, '{section.name|raw}', 1, '2021-01-19 13:16:11', '2021-01-19 13:16:11', '2021-01-23 13:36:04', '0832f2d6-8bfe-4e06-8ea8-38dc45a0e426'),
(7, 7, 13, 'Contact', 'contact', 0, 'site', NULL, '{section.name|raw}', 1, '2021-01-19 13:16:46', '2021-01-19 13:16:46', '2021-01-23 13:36:06', '798aceb6-d131-422e-ac0e-aeaf2281cde5'),
(8, 8, 19, 'Vijesti', 'vijesti', 1, 'site', NULL, NULL, 1, '2021-01-20 19:50:48', '2021-01-20 19:50:48', '2021-01-23 13:36:08', 'cf488530-c34f-4413-8ec0-696542b25157'),
(9, 8, 20, 'EntryVijesti', 'entryvijesti', 1, 'site', NULL, NULL, 2, '2021-01-20 19:53:39', '2021-01-20 19:53:39', '2021-01-20 19:53:47', '8ba3a86e-b6d9-4df6-a012-299ce1c3b662'),
(10, 9, 21, 'Vijesti', 'vijesti', 1, 'site', NULL, '{section.name|raw}', 1, '2021-01-23 13:36:57', '2021-01-23 14:10:48', NULL, 'c656f7b7-6454-4b9e-b534-cefeb7d1efb6'),
(11, 10, 22, 'Video', 'video', 1, 'site', NULL, '{section.name|raw}', 1, '2021-01-23 13:39:55', '2021-01-23 14:10:34', NULL, '458ad073-9b47-49a3-9570-dc44709fb834'),
(12, 11, 27, 'Sport', 'sport', 1, 'site', NULL, NULL, 1, '2021-01-24 20:44:05', '2021-01-24 20:44:05', NULL, 'e1bfc695-195f-482e-9d87-dc7ba832902b'),
(13, 12, 28, 'Novac', 'novac', 1, 'site', NULL, '{section.name|raw}', 1, '2021-01-24 20:52:44', '2021-01-25 14:09:46', NULL, '85de7c9c-8515-40cd-8723-e8e342ff1867'),
(14, 13, 29, 'Kultura', 'kultura', 1, 'site', NULL, '{section.name|raw}', 1, '2021-01-24 20:56:34', '2021-01-24 21:01:02', NULL, 'ebc79330-87df-4fc8-82cc-8bb666acb5dd'),
(15, 14, 30, 'Scena', 'scena', 1, 'site', NULL, '{section.name|raw}', 1, '2021-01-24 20:58:54', '2021-01-24 21:01:21', NULL, 'fde76035-f6c0-4de9-bc92-c106c75236d5');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE IF NOT EXISTS `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldgroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 'Content Builder', '2021-01-16 11:35:55', '2021-01-16 11:35:55', 'bd70741b-507a-465d-8142-f42a02ec16c3');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
CREATE TABLE IF NOT EXISTS `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(36, 10, 47, 4, 0, 1, '2021-01-19 11:04:22', '2021-01-19 11:04:22', 'a0552228-50c9-4a5c-a3dd-7f6a9d97f59c'),
(39, 4, 51, 4, 0, 1, '2021-01-19 12:18:09', '2021-01-19 12:18:09', '18441409-a115-4ce8-9f1c-184d191c48f6'),
(46, 13, 58, 4, 0, 1, '2021-01-19 13:21:10', '2021-01-19 13:21:10', 'a6e288f9-f506-4714-83c1-6c1cc96f985b'),
(47, 12, 59, 4, 0, 1, '2021-01-19 13:21:54', '2021-01-19 13:21:54', 'df3d0542-0b69-4a3f-bdec-9c4428f058b6'),
(71, 23, 81, 20, 0, 0, '2021-01-23 14:08:54', '2021-01-23 14:08:54', 'c5552351-216d-42f1-901b-881ae9ec5e17'),
(74, 22, 84, 4, 0, 1, '2021-01-23 14:10:34', '2021-01-23 14:10:34', '9c6464c0-47dc-48dd-aeb4-b81a1668a411'),
(76, 24, 86, 22, 1, 0, '2021-01-23 14:21:22', '2021-01-23 14:21:22', 'd75d6706-898e-4715-8851-5fcc5095d20b'),
(77, 24, 86, 23, 1, 1, '2021-01-23 14:21:22', '2021-01-23 14:21:22', 'fcc8e437-48b1-43ac-9169-9af3dc62fa24'),
(78, 25, 87, 21, 0, 0, '2021-01-23 14:22:25', '2021-01-23 14:22:25', 'e8083ff7-bc1a-4d4b-9c69-8d126ab5ac24'),
(80, 21, 89, 4, 0, 1, '2021-01-23 15:31:03', '2021-01-23 15:31:03', '3c5fd04d-31ea-4e87-b3a7-25dbc09e6717'),
(87, 5, 97, 5, 0, 0, '2021-01-24 20:31:30', '2021-01-24 20:31:30', 'f745597d-6b3a-4f07-a340-c88d04bbf359'),
(88, 11, 98, 10, 0, 0, '2021-01-24 20:31:30', '2021-01-24 20:31:30', 'a3006c2a-183c-4935-ad5c-ac6d40d2ad2c'),
(94, 29, 108, 4, 0, 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', 'af2741bc-b24d-4d1e-b539-f9b86047f59c'),
(95, 30, 109, 4, 0, 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', 'f92329ef-8d1d-47da-9f2e-52081b4c657b'),
(97, 27, 111, 24, 0, 1, '2021-01-26 13:51:07', '2021-01-26 13:51:07', '2ffd1b39-dd6c-42fa-b027-c9211bb1d95d'),
(98, 27, 111, 4, 0, 2, '2021-01-26 13:51:07', '2021-01-26 13:51:07', '5607b90a-c1ce-41f3-9598-eadb025ca2f0'),
(99, 28, 112, 24, 0, 1, '2021-01-26 13:55:18', '2021-01-26 13:55:18', '4fae6208-bd27-4ac0-b3f6-c159609270a5'),
(100, 28, 112, 4, 0, 2, '2021-01-26 13:55:18', '2021-01-26 13:55:18', '14035188-5384-4bf0-8bdb-08cddf15eb0f');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
CREATE TABLE IF NOT EXISTS `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2021-01-13 14:11:03', '2021-01-13 14:11:03', '2021-01-14 18:53:03', '0297dae1-b79e-412c-a620-e5f4adf324fc'),
(2, 'craft\\elements\\Entry', '2021-01-13 14:11:50', '2021-01-13 14:11:50', '2021-01-14 18:53:00', '978e6121-ddf2-4c3d-b061-0d8f9b9d76f8'),
(3, 'craft\\elements\\Entry', '2021-01-13 19:44:10', '2021-01-13 19:44:10', '2021-01-14 18:53:05', 'bc400516-9166-4913-b4ed-0e0449caa57f'),
(4, 'craft\\elements\\Entry', '2021-01-14 18:53:18', '2021-01-14 18:53:18', NULL, '23e6035c-a523-4b46-a570-149bba25b17f'),
(5, 'craft\\elements\\MatrixBlock', '2021-01-16 11:39:18', '2021-01-16 11:39:18', NULL, 'c142f187-f1a8-4cb4-93e8-df12f3ceaac0'),
(6, 'craft\\elements\\MatrixBlock', '2021-01-16 11:39:18', '2021-01-16 11:39:18', '2021-01-19 11:34:56', '2a4b86e7-02a3-44b0-bf3a-25b6122e5d7c'),
(7, 'craft\\elements\\MatrixBlock', '2021-01-16 11:39:18', '2021-01-16 11:39:18', '2021-01-19 11:34:56', '0cadfa6a-d99e-4e3d-a50d-a9fa4488836f'),
(8, 'craft\\elements\\MatrixBlock', '2021-01-16 20:44:25', '2021-01-16 20:44:25', '2021-01-19 11:34:56', '72ea5211-e9eb-44f2-8d5c-a7e49bf4ad7e'),
(9, 'craft\\elements\\Asset', '2021-01-16 21:17:15', '2021-01-16 21:17:15', NULL, '6751c6d2-1a40-40bb-a02a-2f5dcef76903'),
(10, 'craft\\elements\\Entry', '2021-01-19 09:46:06', '2021-01-19 09:46:06', '2021-01-19 11:34:31', '207a384f-aa50-4130-b03f-e1e2498f1810'),
(11, 'craft\\elements\\MatrixBlock', '2021-01-19 12:53:06', '2021-01-19 12:53:06', NULL, 'e455c87a-2fa3-4958-a220-44334c899bf8'),
(12, 'craft\\elements\\Entry', '2021-01-19 13:16:11', '2021-01-19 13:16:11', '2021-01-23 13:36:04', 'df941a32-317d-49a4-a519-baec28c98f57'),
(13, 'craft\\elements\\Entry', '2021-01-19 13:16:46', '2021-01-19 13:16:46', '2021-01-23 13:36:06', '574c8f18-7f15-4ef1-9a4d-de74e6c20865'),
(14, 'craft\\elements\\MatrixBlock', '2021-01-19 13:25:02', '2021-01-19 13:25:02', '2021-01-23 14:20:07', 'bd29fd96-c552-4c84-aac6-0920861c7e14'),
(15, 'craft\\elements\\GlobalSet', '2021-01-19 13:25:49', '2021-01-19 13:25:49', '2021-01-23 14:22:03', 'f1dafea4-7f7a-423f-8f7a-dd63ec9cd1dc'),
(16, 'craft\\elements\\MatrixBlock', '2021-01-20 19:34:47', '2021-01-20 19:34:47', '2021-01-23 14:07:08', '528ed32f-4c6b-457e-88c9-434ba5ec0c8f'),
(17, 'craft\\elements\\MatrixBlock', '2021-01-20 19:35:41', '2021-01-20 19:35:41', '2021-01-23 14:07:08', '2dad5a36-259c-4713-b6e6-7a9e71c617cd'),
(18, 'craft\\elements\\MatrixBlock', '2021-01-20 19:36:49', '2021-01-20 19:36:49', '2021-01-23 14:07:08', 'd9d4327a-2e3c-4a60-a7a3-e96f51767d3f'),
(19, 'craft\\elements\\Entry', '2021-01-20 19:50:48', '2021-01-20 19:50:48', '2021-01-23 13:36:08', '4eb77667-c53e-4388-84d7-c1ed1f2d0807'),
(20, 'craft\\elements\\Entry', '2021-01-20 19:53:39', '2021-01-20 19:53:39', '2021-01-20 19:53:47', '1e406b28-fdec-40b1-a0af-fe6be4d61353'),
(21, 'craft\\elements\\Entry', '2021-01-23 13:36:57', '2021-01-23 13:36:57', NULL, 'd94a8b8e-151f-47e8-8d18-58020162e9e3'),
(22, 'craft\\elements\\Entry', '2021-01-23 13:39:55', '2021-01-23 13:39:55', NULL, 'b420e80f-c77a-45e4-8d4f-80dd2a78b801'),
(23, 'craft\\elements\\MatrixBlock', '2021-01-23 14:08:54', '2021-01-23 14:08:54', NULL, '0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3'),
(24, 'craft\\elements\\MatrixBlock', '2021-01-23 14:21:22', '2021-01-23 14:21:22', NULL, 'aed07ede-d287-47ab-b983-32a710737666'),
(25, 'craft\\elements\\GlobalSet', '2021-01-23 14:22:25', '2021-01-23 14:22:25', NULL, '9bdc41bb-15c3-4b91-9e8b-70465daf1018'),
(26, 'craft\\elements\\MatrixBlock', '2021-01-24 09:33:48', '2021-01-24 09:33:48', '2021-01-24 20:31:30', '0f6fd5b5-3c0b-4abd-b94a-f08941a9a89c'),
(27, 'craft\\elements\\Entry', '2021-01-24 20:44:05', '2021-01-24 20:44:05', NULL, '8797999c-c837-4099-b555-3f4d7574eadd'),
(28, 'craft\\elements\\Entry', '2021-01-24 20:52:44', '2021-01-24 20:52:44', NULL, '3726f9ed-8f87-4e9f-bc43-84056b999e49'),
(29, 'craft\\elements\\Entry', '2021-01-24 20:56:34', '2021-01-24 20:56:34', NULL, 'c6aab630-54f8-4e42-9abc-a1976ce4ce74'),
(30, 'craft\\elements\\Entry', '2021-01-24 20:58:54', '2021-01-24 20:58:54', NULL, '3339cc72-7b5d-4e63-b523-9face3133f3b');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
CREATE TABLE IF NOT EXISTS `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-01-13 14:11:50', '2021-01-13 14:11:50', '9c4fe4c4-65f7-4e1f-b484-e6980d91e818'),
(3, 1, 'Intro', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-01-13 19:39:17', '2021-01-13 19:39:17', 'afe9bd14-4457-4d92-9f68-022ccfb036f0'),
(5, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-01-13 19:46:38', '2021-01-13 19:46:38', '528b478c-ad53-4575-8985-0014cd325f66'),
(6, 3, 'Copy', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":75,\"fieldUid\":\"f91324a0-ce7b-49c7-a36f-178db99f5af5\"}]', 2, '2021-01-13 19:46:38', '2021-01-13 19:46:38', '9051a8db-e6e6-445d-b21c-5968a437f6ea'),
(40, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5409feba-8f5c-4bad-b2eb-3ea2897019df\"}]', 1, '2021-01-16 21:23:16', '2021-01-16 21:23:16', 'ea64e1d6-9483-4325-a251-c08f68c200ba'),
(41, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bdc24ea3-af74-44bd-bbc2-1d84092c279f\"}]', 1, '2021-01-16 21:23:16', '2021-01-16 21:23:16', 'fcaa9444-553d-4793-b434-822ac6af91d6'),
(42, 8, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e65a4bba-0535-4e85-b0b4-60b17013f8aa\"}]', 1, '2021-01-16 21:23:16', '2021-01-16 21:23:16', 'a5b3d1e1-a253-40d5-97bb-dd21bdd805c4'),
(47, 10, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-19 11:04:22', '2021-01-19 11:04:22', '8b5ffce6-26c0-4b32-be21-2faee0817bf3'),
(51, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"de8b3417-1472-4cac-84ea-7a5b9f6cc2b1\"}]', 1, '2021-01-19 12:18:09', '2021-01-19 12:18:09', 'abf48452-2dd5-4787-a0f5-7619c3d92f47'),
(58, 13, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-19 13:21:10', '2021-01-19 13:21:10', 'a293d661-9e7b-4430-a1f6-ad94df1e4608'),
(59, 12, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-19 13:21:54', '2021-01-19 13:21:54', 'b21f3199-42f8-4db5-a720-fbc659e6cef8'),
(60, 14, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"13788373-d87c-4d47-ae5c-0e0f8b90169d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"ed663dea-8be0-4808-858a-90cf693e33a8\"}]', 1, '2021-01-19 13:25:02', '2021-01-19 13:25:02', 'c4513fb1-d8f1-4486-95af-9b061d0580c2'),
(61, 15, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"84e5e862-7201-49d3-ae90-5415b6845be2\"}]', 1, '2021-01-19 13:25:49', '2021-01-19 13:25:49', '142b162a-161e-475a-87cb-63258d494cb6'),
(70, 16, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7fd0ac6a-962f-482c-8e87-041ef8ec10a7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"17cda5e7-7cd9-424b-95a4-c3d49726174b\"}]', 1, '2021-01-20 19:47:18', '2021-01-20 19:47:18', '436ac01c-9e42-403e-8c38-895b75be687b'),
(71, 17, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"56ce950c-a8eb-4f8c-ac2b-1ac150b542fe\"}]', 1, '2021-01-20 19:47:18', '2021-01-20 19:47:18', '10cb8e23-8493-4734-aa24-8fce2a6c3e93'),
(72, 18, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"85fbddeb-c898-47bb-9855-12cb4de20182\"}]', 1, '2021-01-20 19:47:18', '2021-01-20 19:47:18', 'a3d41111-52a6-4204-9341-c72605b861bc'),
(74, 20, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"__blank__\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3e769b52-9e08-4b84-9843-96fd95cfb122\"}]', 1, '2021-01-20 19:53:39', '2021-01-20 19:53:39', 'fcf6931b-4574-42ca-a93c-33f7353c4b8b'),
(76, 19, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"__blank__\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3e769b52-9e08-4b84-9843-96fd95cfb122\"}]', 1, '2021-01-20 20:06:17', '2021-01-20 20:06:17', '3ce6a625-3833-43cd-84eb-e7eeaa87f1c6'),
(81, 23, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"26fc1153-6823-4eb9-bebb-978cbe27b950\"}]', 1, '2021-01-23 14:08:54', '2021-01-23 14:08:54', '042523b8-fe7b-4f0f-89e0-4d559ee6cc77'),
(84, 22, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-23 14:10:34', '2021-01-23 14:10:34', '6eb9200e-940c-4b1e-b68e-8397d52d718c'),
(86, 24, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"30dcd176-499b-4431-9d06-78cd8b558e02\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"86f68485-0588-486d-b115-4086c3d18cf6\"}]', 1, '2021-01-23 14:21:22', '2021-01-23 14:21:22', 'c8b546d6-a23d-4cc0-9f8c-92e1b6a8f495'),
(87, 25, 'content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c54876c6-2a9b-4883-87d8-98647d6f9bfe\"}]', 1, '2021-01-23 14:22:25', '2021-01-23 14:22:25', '27720317-402d-4f8a-8e63-131e17dc7fdc'),
(89, 21, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-23 15:31:03', '2021-01-23 15:31:03', 'da785e13-b7db-4a73-9820-8cf6f3d6b032'),
(90, 9, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-01-23 16:41:33', '2021-01-23 16:41:33', '360b4fc7-2c59-43ee-9c81-8ed169aef3b7'),
(96, 26, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ba5f7d68-507b-4e0f-bd21-f2eab0fce712\"}]', 1, '2021-01-24 12:45:36', '2021-01-24 12:45:36', 'a9c9ea9c-bb87-468d-a2dd-a24bcc263851'),
(97, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f4dacd60-b276-42ca-8a57-ae12ad7878c2\"}]', 1, '2021-01-24 20:31:30', '2021-01-24 20:31:30', '65da3484-bf81-4201-8055-dac1335f97cc'),
(98, 11, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f7ad1b46-5c28-4483-b2c8-d63838ed2355\"}]', 1, '2021-01-24 20:31:30', '2021-01-24 20:31:30', '05c7547e-0e9c-4f36-9ac8-1da08e7c8c88'),
(108, 29, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '8defe4ab-9ed5-4121-b91a-ee2c94757ad9'),
(109, 30, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', 'b374fe33-20ba-48a4-8352-ab923fc34d90'),
(111, 27, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"438e98f8-8729-42fb-98fd-133f1230e979\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-26 13:51:07', '2021-01-26 13:51:07', '0697bc47-3cfe-48ac-8365-14b4a3c7438a'),
(112, 28, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"438e98f8-8729-42fb-98fd-133f1230e979\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"}]', 1, '2021-01-26 13:55:18', '2021-01-26 13:55:18', 'd38bd1bb-2d68-4f9a-a8a0-bf38956ac8ca');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
CREATE TABLE IF NOT EXISTS `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fields_handle_context_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 4, 'HomeModules', 'modules', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_modules}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-01-16 11:39:17', '2021-01-20 19:30:43', '7b08d9ba-8697-43f3-a5a6-c077601b74e4'),
(5, NULL, 'Module Text', 'moduleText', 'matrixBlockType:baa3801b-9cd4-4067-a246-3550b15427f7', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2021-01-16 11:39:18', '2021-01-16 11:39:18', 'f4dacd60-b276-42ca-8a57-ae12ad7878c2'),
(10, NULL, 'Module Video', 'moduleVideo', 'matrixBlockType:e3ecabf8-ac33-40d0-932c-e043196bf18d', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2021-01-19 12:53:06', '2021-01-19 12:53:06', 'f7ad1b46-5c28-4483-b2c8-d63838ed2355'),
(19, 4, 'Tekst', 'tekst', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_tekst}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-01-23 14:08:53', '2021-01-23 14:08:53', '4d4e15c8-02ad-476e-ba7d-891aa65cdfb4'),
(20, NULL, 'Text', 'text', 'matrixBlockType:50c817b7-49ef-44b4-87dc-bd04b97732ab', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2021-01-23 14:08:54', '2021-01-23 14:08:54', '26fc1153-6823-4eb9-bebb-978cbe27b950'),
(21, 4, 'Navigation', 'navigation', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_navigation}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-01-23 14:21:22', '2021-01-23 14:21:22', 'c54876c6-2a9b-4883-87d8-98647d6f9bfe'),
(22, NULL, 'Link text', 'linkText', 'matrixBlockType:68f3f84f-6b95-4e52-8928-00d86023001f', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2021-01-23 14:21:22', '2021-01-23 14:21:22', '30dcd176-499b-4431-9d06-78cd8b558e02'),
(23, NULL, 'link destination', 'linkDestination', 'matrixBlockType:68f3f84f-6b95-4e52-8928-00d86023001f', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2021-01-23 14:21:22', '2021-01-23 14:21:22', '86f68485-0588-486d-b115-4086c3d18cf6'),
(24, 4, 'Description', 'description', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":300,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\",\"uiMode\":\"normal\"}', '2021-01-26 13:50:46', '2021-01-26 13:52:22', '438e98f8-8729-42fb-98fd-133f1230e979');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
CREATE TABLE IF NOT EXISTS `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `globalsets`
--

INSERT INTO `globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(144, 'Header', 'header', 15, '2021-01-19 13:25:49', '2021-01-19 13:25:49', '35017395-0617-445f-8b89-1d1ac95dd950'),
(251, 'Header', 'header', 25, '2021-01-23 14:22:25', '2021-01-23 14:22:25', '8e0f1edb-a680-448c-a619-c02956810275');

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
CREATE TABLE IF NOT EXISTS `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
CREATE TABLE IF NOT EXISTS `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
CREATE TABLE IF NOT EXISTS `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.5.17.1', '3.5.13', 1, 'zulmwedttmsn', 'nshoknnxxyzo', '2021-01-11 20:06:57', '2021-01-26 13:55:19', '0bfab198-0af3-48e7-9b3a-3a0e42f0d32f');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
CREATE TABLE IF NOT EXISTS `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocks`
--

INSERT INTO `matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(21, 18, 4, 1, 1, 0, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '0bae6aac-fa42-4d89-a495-a04201c396bc'),
(23, 18, 4, 1, 3, 0, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '93376355-d34f-4bfe-b08d-9b83a20cb1f0'),
(26, 25, 4, 1, 1, NULL, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '680558d4-c9fc-4dfd-b11b-b46d97181ae2'),
(28, 25, 4, 1, 3, NULL, '2021-01-16 11:43:27', '2021-01-16 11:43:27', 'fab5f9f3-3769-446e-84e4-62dabdf7d110'),
(31, 30, 4, 1, 1, NULL, '2021-01-16 11:45:26', '2021-01-16 11:45:26', '2698f289-d558-47c2-bced-34703c2f5801'),
(33, 30, 4, 1, 3, NULL, '2021-01-16 11:45:26', '2021-01-16 11:45:26', 'cfd3a01a-f51f-4181-96dd-7f7c5e81083a'),
(35, 18, 4, 1, 4, 0, '2021-01-16 11:47:56', '2021-01-16 20:30:10', '86247686-25be-4a76-ab1d-8f7859f1bdc0'),
(37, 36, 4, 1, 1, NULL, '2021-01-16 11:47:56', '2021-01-16 11:47:56', 'd5bbd1d9-9225-4721-ad92-b6d53810a71d'),
(39, 36, 4, 1, 3, NULL, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '0ee6972e-4f65-4f6a-a7c5-337ad4038b48'),
(41, 36, 4, 1, 5, NULL, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '37363837-0da8-410e-964f-ac538966cff6'),
(43, 42, 4, 1, 1, NULL, '2021-01-16 20:30:10', '2021-01-16 20:30:10', '40af13df-1345-4a6d-902e-78e537affa20'),
(45, 42, 4, 1, 3, NULL, '2021-01-16 20:30:10', '2021-01-16 20:30:10', '6ac05ef6-4b23-4edb-af28-a34bc0f1e4e6'),
(46, 42, 4, 1, 4, NULL, '2021-01-16 20:30:10', '2021-01-16 20:30:10', '3a985d18-5d5d-4558-9d03-5eb066dd625a'),
(49, 48, 4, 1, 1, NULL, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '0a62a7e8-30b5-4758-b24c-925171f42987'),
(51, 48, 4, 1, 3, NULL, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '7839ae8d-b2ac-45c1-bc0a-4f7234016a81'),
(52, 48, 4, 1, 4, NULL, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '2436aa7d-9391-4c3c-be76-d065f87312d8'),
(55, 54, 4, 1, 1, NULL, '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'c9b6048b-397d-430d-bfad-1b53531f0ef8'),
(57, 54, 4, 1, 3, NULL, '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'af776ba3-71ed-4ea5-ba6e-de83dca09c91'),
(58, 54, 4, 1, 4, NULL, '2021-01-16 21:12:23', '2021-01-16 21:12:23', '945c1bda-a86d-4699-83ab-346e108f80d5'),
(61, 60, 4, 1, 1, NULL, '2021-01-16 21:13:22', '2021-01-16 21:13:22', '132b4c8e-0481-45c9-9bac-382cf98f2540'),
(63, 60, 4, 1, 3, NULL, '2021-01-16 21:13:22', '2021-01-16 21:13:22', '5e3dfc91-7fdc-442f-8f8f-e266bda8f1cd'),
(64, 60, 4, 1, 4, NULL, '2021-01-16 21:13:22', '2021-01-16 21:13:22', 'b5f57350-5c16-40bd-92d3-f41551085730'),
(69, 68, 4, 1, 1, NULL, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '9499ab51-c5ef-4310-bbcb-87d71fbf5207'),
(71, 68, 4, 1, 3, NULL, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '1a97eb6e-48a9-465b-ac9f-23d664b24c85'),
(72, 68, 4, 1, 4, NULL, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '5c38fcbc-7b5b-4b9f-b7f2-b639a23444f2'),
(76, 75, 4, 1, 1, NULL, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '467af625-ab4d-4aeb-98a8-b73f9515e83e'),
(78, 75, 4, 1, 3, NULL, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '40c5141e-2250-4e56-a469-9a1b3c78fe9e'),
(79, 75, 4, 1, 4, NULL, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '438c8ff0-3892-4545-9ac5-c6bd9f144268'),
(83, 82, 4, 1, 1, NULL, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '16cc225d-c003-4b82-8efe-b427d3a0441d'),
(85, 82, 4, 1, 3, NULL, '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'b5e6f060-bd0a-429e-b1f0-cb84cf68fc86'),
(86, 82, 4, 1, 4, NULL, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '8d9b0542-86d0-4d27-ac97-d27fd9c29f8a'),
(90, 89, 4, 1, 1, NULL, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '70940196-2f7c-44c9-a726-49bb48ef52d9'),
(92, 89, 4, 1, 3, NULL, '2021-01-19 09:45:39', '2021-01-19 09:45:39', 'a6d71b76-d05d-4c54-90cf-cf06cf2e1219'),
(93, 89, 4, 1, 4, NULL, '2021-01-19 09:45:39', '2021-01-19 09:45:39', 'dadb5fd8-d62b-4f57-b55a-ab6441cc3f5e'),
(103, 102, 4, 1, 1, 1, '2021-01-19 09:47:13', '2021-01-19 09:47:13', 'b06fa2b5-57f4-4f3b-b6ec-269ac754bb6e'),
(105, 104, 4, 1, 1, NULL, '2021-01-19 09:47:13', '2021-01-19 09:47:13', 'd4c1458a-9dc8-4937-88ea-e4eea03d62f4'),
(109, 18, 4, 1, 1, NULL, '2021-01-19 11:46:58', '2021-01-19 11:46:58', 'aba01c47-88fc-4b97-a5b3-daec828c49c1'),
(111, 110, 4, 1, 1, NULL, '2021-01-19 11:46:58', '2021-01-19 11:46:58', '5e4ad1de-6c0d-497b-b994-2cd24deeaa77'),
(113, 112, 4, 1, 1, NULL, '2021-01-19 12:08:38', '2021-01-19 12:08:38', 'a0701df5-d1cd-4adf-970a-f90bc92c3858'),
(115, 114, 4, 1, 1, NULL, '2021-01-19 12:18:09', '2021-01-19 12:18:09', '56d82dc4-17ad-408c-95b7-13c63b5da9cd'),
(117, 116, 4, 1, 1, NULL, '2021-01-19 12:19:21', '2021-01-19 12:19:21', 'ef76e800-779e-43ed-a3e4-346e5a6f4720'),
(118, 18, 4, 5, 2, NULL, '2021-01-19 12:53:44', '2021-01-19 12:53:44', '75bb3d53-8a73-4f26-ad0c-a1776fabbc09'),
(120, 119, 4, 1, 1, NULL, '2021-01-19 12:53:44', '2021-01-19 12:53:44', 'f6e40eb8-06d8-4312-abcc-8e4200792a6a'),
(121, 119, 4, 5, 2, NULL, '2021-01-19 12:53:44', '2021-01-19 12:53:44', 'a25865e9-e8fe-439b-a08d-e20a5deace7e'),
(131, 122, 4, 1, 1, 1, '2021-01-19 13:20:06', '2021-01-19 13:20:06', '26b7721c-cad7-4bf4-be51-8fbb95091c99'),
(133, 132, 4, 1, 1, NULL, '2021-01-19 13:20:06', '2021-01-19 13:20:06', 'ed2ed469-9dd3-49f0-841a-2979cfd533e0'),
(135, 125, 4, 5, 1, 1, '2021-01-19 13:21:27', '2021-01-19 13:21:27', '5b9e296b-8c13-4483-b915-3a3c85461c81'),
(137, 136, 4, 5, 1, NULL, '2021-01-19 13:21:27', '2021-01-19 13:21:27', '95b1a021-c77d-49c1-9bf0-295cfe455b34'),
(139, 138, 4, 1, 1, NULL, '2021-01-19 13:21:54', '2021-01-19 13:21:54', '4872a524-80c0-4fa3-b802-d3b34519b1be'),
(140, 122, 4, 5, 2, 1, '2021-01-19 13:22:14', '2021-01-19 13:22:14', '4d6a32fd-66ec-494a-a407-99910478277c'),
(142, 141, 4, 1, 1, NULL, '2021-01-19 13:22:14', '2021-01-19 13:22:14', '7391a9f9-27a3-4a4f-ad7a-ef55a20b53b9'),
(143, 141, 4, 5, 2, NULL, '2021-01-19 13:22:14', '2021-01-19 13:22:14', 'fb9ad9a3-2c48-4c04-8ee8-7880246a6b73'),
(148, 147, 4, 5, 1, NULL, '2021-01-19 14:04:25', '2021-01-19 14:04:25', 'b25d01e7-5a18-48b4-a805-430c50609acc'),
(150, 149, 4, 5, 1, NULL, '2021-01-19 14:04:44', '2021-01-19 14:04:44', '7335a972-59b3-4f8b-828e-33214e7abfd5'),
(245, 235, 4, 1, 1, NULL, '2021-01-23 14:11:17', '2021-01-23 14:11:17', 'b25cd8ad-4ac3-462c-ac98-970a9c70a85d'),
(247, 246, 4, 1, 1, NULL, '2021-01-23 14:11:17', '2021-01-23 14:11:17', '411d3a4f-88fb-4a5f-abbb-c65663a0face'),
(248, 238, 4, 1, 1, NULL, '2021-01-23 14:11:29', '2021-01-23 14:11:29', 'db353f70-7f9a-4383-b58a-5db3679ca320'),
(250, 249, 4, 1, 1, NULL, '2021-01-23 14:11:29', '2021-01-23 14:11:29', '3dae6a04-ac28-4109-8cce-d7d67feab9cf'),
(252, 251, 21, 11, 1, NULL, '2021-01-23 14:27:19', '2021-01-23 14:27:19', '59e3e07d-9d3b-454c-a4c7-2eaafeb88eb7'),
(253, 251, 21, 11, 2, NULL, '2021-01-23 14:27:19', '2021-01-23 14:27:19', '783a2c46-d1df-4ed0-a763-eaacdb30b824'),
(255, 235, 19, 10, 1, NULL, '2021-01-23 15:16:50', '2021-01-23 15:16:50', 'bc67d073-fceb-4900-85ae-76da74446828'),
(257, 256, 19, 10, 1, NULL, '2021-01-23 15:16:50', '2021-01-23 15:16:50', '685f7f46-739c-4dba-bbb1-20670d9712f3'),
(259, 258, 4, 1, 1, NULL, '2021-01-23 15:31:03', '2021-01-23 15:31:03', '3708a20d-d22d-4dcc-8dc4-7e3015f5de3c'),
(261, 260, 4, 1, 1, NULL, '2021-01-23 15:31:17', '2021-01-23 15:31:17', 'a842a6ee-e1a2-4c3d-a971-4f4fe0aeb423'),
(262, 251, 21, 11, 3, 0, '2021-01-23 15:36:01', '2021-01-23 15:36:01', 'ef204af5-81d7-48e4-be48-063aad049ccf'),
(263, 251, 21, 11, 3, NULL, '2021-01-23 15:36:01', '2021-01-24 20:40:40', '1c3dc238-ab02-4511-8b65-be6649dd4b8d'),
(264, 251, 21, 11, 4, NULL, '2021-01-23 15:36:01', '2021-01-24 20:40:40', '6e6e49e4-b0a4-44b2-aa23-a180395db9c0'),
(265, 251, 21, 11, 5, NULL, '2021-01-23 15:36:01', '2021-01-24 20:40:40', 'e66acea2-6b21-49e4-a1c3-540d5abbad16'),
(266, 251, 21, 11, 7, 0, '2021-01-23 15:36:01', '2021-01-23 15:36:01', 'abd677ad-b96c-4da4-97cd-0f5c5efa02a5'),
(267, 251, 21, 11, 8, 0, '2021-01-23 15:37:01', '2021-01-23 15:37:01', '8d38cee9-a93c-443e-8045-17a57fabe707'),
(269, 268, 4, 1, 1, NULL, '2021-01-23 16:29:53', '2021-01-23 16:29:53', '5d013e6f-a88d-4e66-9444-1cba2f5dca8d'),
(271, 235, 4, 12, 2, 0, '2021-01-24 09:34:58', '2021-01-24 09:34:58', 'afe26106-e219-46d8-8fda-f0afd5c7c118'),
(273, 272, 4, 1, 1, NULL, '2021-01-24 09:34:58', '2021-01-24 09:34:58', 'e823f8a8-d4e6-4c2f-9d9f-89d65909dce7'),
(274, 272, 4, 12, 2, NULL, '2021-01-24 09:34:58', '2021-01-24 09:34:58', 'b7c36d2f-5b93-4c43-9ef9-5fb448438e67'),
(277, 276, 4, 1, 1, NULL, '2021-01-24 12:44:49', '2021-01-24 12:44:49', 'b43e899b-318f-4eed-a35a-6ed47038693c'),
(278, 276, 4, 12, 2, NULL, '2021-01-24 12:44:49', '2021-01-24 12:44:49', '709a853f-d80b-4b39-9ba3-369e01586868'),
(280, 279, 4, 1, 1, NULL, '2021-01-24 18:41:37', '2021-01-24 18:41:37', 'd2f5f8a0-1f37-4e3b-9321-4fa057b68258'),
(282, 281, 4, 1, 1, NULL, '2021-01-24 20:23:42', '2021-01-24 20:23:42', '51b1625d-6931-4f30-8c05-bdcf9e5f0de2'),
(283, 281, 4, 5, 2, NULL, '2021-01-24 20:23:42', '2021-01-24 20:23:42', '7fdc65a2-a1d1-408e-a4fd-6b1ef3b21e39'),
(284, 235, 4, 5, 2, NULL, '2021-01-24 20:25:52', '2021-01-24 20:25:52', 'f38c55c4-f2da-4482-8d9d-305728ac7ee3'),
(286, 285, 4, 1, 1, NULL, '2021-01-24 20:25:52', '2021-01-24 20:25:52', 'b7dba6d4-76d4-4f95-8233-740f244e5e66'),
(287, 285, 4, 5, 2, NULL, '2021-01-24 20:25:52', '2021-01-24 20:25:52', '34071b2d-2a9a-441e-b3c6-7bb6bb0c3093'),
(291, 290, 4, 1, 1, NULL, '2021-01-24 20:44:35', '2021-01-24 20:44:35', '6a977d13-d44b-4f81-a748-a9837e913434'),
(292, 290, 4, 5, 2, NULL, '2021-01-24 20:44:35', '2021-01-24 20:44:35', 'adc87629-17e9-460f-aaeb-5dad52a53738'),
(295, 294, 4, 1, 1, NULL, '2021-01-24 20:45:09', '2021-01-24 20:45:09', '94353293-84f2-4168-a89e-a786e4c63dfb'),
(296, 294, 4, 5, 2, NULL, '2021-01-24 20:45:09', '2021-01-24 20:45:09', 'f3b9d06a-2b8e-4345-9c07-29ac2524112c'),
(298, 288, 4, 1, 1, NULL, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '68b10f0f-8ac1-4177-825a-f6bcd965b283'),
(299, 288, 4, 5, 2, NULL, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '18211cd9-77bd-474f-8ca9-d3f34e725eec'),
(301, 300, 4, 1, 1, NULL, '2021-01-24 20:47:23', '2021-01-24 20:47:23', 'c6d449b4-ab7c-4eb9-b441-1a34c792f12d'),
(302, 300, 4, 5, 2, NULL, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '2bfdcc83-3bd6-4f3d-9c85-19f1e37f7738'),
(307, 303, 4, 1, 1, NULL, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '8251954f-ea52-49be-bb70-210555e13bee'),
(308, 303, 4, 5, 2, NULL, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'b18205e3-b36f-4fc5-a54f-c161241440db'),
(309, 303, 4, 1, 3, NULL, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '195e3530-b6e8-4db2-9748-1e6b0e8d8409'),
(311, 310, 4, 1, 1, NULL, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'ac3339d0-ac45-4ad2-9b3f-2017cbd009e3'),
(312, 310, 4, 5, 2, NULL, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '287a9bad-e66a-426d-a283-12423ec5a66d'),
(313, 310, 4, 1, 3, NULL, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'cda429ef-1d7c-42b7-8574-df4735b1e151'),
(315, 314, 4, 1, 1, NULL, '2021-01-24 20:55:21', '2021-01-24 20:55:21', '20a6debf-412b-471b-a450-7900a0d7b17d'),
(316, 314, 4, 5, 2, NULL, '2021-01-24 20:55:21', '2021-01-24 20:55:21', '1762b23c-a31c-4d09-9585-d6b434a75ea3'),
(317, 314, 4, 1, 3, NULL, '2021-01-24 20:55:21', '2021-01-24 20:55:21', '3a7732c9-9738-4729-9454-840eb5b6a85c'),
(319, 318, 4, 1, 1, NULL, '2021-01-24 20:55:23', '2021-01-24 20:55:23', 'e9a3d67c-0220-4592-9de6-4b4087664bfa'),
(320, 318, 4, 5, 2, NULL, '2021-01-24 20:55:23', '2021-01-24 20:55:23', '92ed3c14-229e-4ae7-bbe5-4e4f031bda99'),
(321, 318, 4, 1, 3, NULL, '2021-01-24 20:55:23', '2021-01-24 20:55:23', '86441a45-2ba9-4188-b949-8b63482cba95'),
(325, 322, 4, 1, 1, NULL, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '17fc5745-eac5-4b33-a740-4fd24d25471b'),
(326, 322, 4, 5, 2, NULL, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '8b58c8a4-0ab2-4faa-83aa-056816db432c'),
(327, 322, 4, 1, 3, NULL, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '3b5d0fc0-34b9-4660-b75f-8ec8dcd9ef5e'),
(329, 328, 4, 1, 1, NULL, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '12c212e7-ceaf-42a1-a515-45320e8267ba'),
(330, 328, 4, 5, 2, NULL, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '22f8f4de-2f5c-433b-90c1-4342e8435ca4'),
(331, 328, 4, 1, 3, NULL, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '37099b42-c616-4357-b4b3-4ed9d302335c'),
(335, 332, 4, 1, 1, NULL, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '68d06a22-0c9a-4e0a-b79d-f5100c3f6dd4'),
(336, 332, 4, 5, 2, NULL, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '970aec08-3baa-4762-9c3b-fe7a277a71a7'),
(337, 332, 4, 1, 3, NULL, '2021-01-24 21:00:33', '2021-01-24 21:00:33', 'a13febb6-3bdf-4524-b604-53ce9f9a09f6'),
(339, 338, 4, 1, 1, NULL, '2021-01-24 21:00:33', '2021-01-24 21:00:33', 'c28b4bbb-1794-416e-b7f3-d2c80fa259de'),
(340, 338, 4, 5, 2, NULL, '2021-01-24 21:00:33', '2021-01-24 21:00:33', 'e716f93b-8ee7-4e51-aff4-247fc6f56a60'),
(341, 338, 4, 1, 3, NULL, '2021-01-24 21:00:33', '2021-01-24 21:00:33', 'b2389a56-9c15-4338-b10d-1839b0050703'),
(343, 342, 4, 1, 1, NULL, '2021-01-24 21:01:03', '2021-01-24 21:01:03', 'e000ca65-763d-4450-ade9-37c316f2b8b8'),
(344, 342, 4, 5, 2, NULL, '2021-01-24 21:01:03', '2021-01-24 21:01:03', 'aebee77d-f6dc-4a68-afea-85f21cc86ace'),
(345, 342, 4, 1, 3, NULL, '2021-01-24 21:01:03', '2021-01-24 21:01:03', '43b4f91c-997e-45b5-bd9b-386a0da2f226'),
(347, 346, 4, 1, 1, NULL, '2021-01-24 21:01:16', '2021-01-24 21:01:16', 'ff2eb3ce-8312-4ca7-89e2-f0a1a967b9a7'),
(348, 346, 4, 5, 2, NULL, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '451ece28-0495-4c74-92a1-be0f3e3b9e2b'),
(349, 346, 4, 1, 3, NULL, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '327baee4-f52b-4df8-a61e-ae07a01cfb61'),
(351, 350, 4, 1, 1, NULL, '2021-01-24 21:01:21', '2021-01-24 21:01:21', '2ccf354a-67d1-4cdb-a929-261789e84072'),
(352, 350, 4, 5, 2, NULL, '2021-01-24 21:01:21', '2021-01-24 21:01:21', 'c4a28407-c822-4cf2-93d5-5d81e4931021'),
(353, 350, 4, 1, 3, NULL, '2021-01-24 21:01:21', '2021-01-24 21:01:21', '88ee42a2-79ff-45f7-8089-4a3d5c02841e'),
(355, 354, 4, 1, 1, NULL, '2021-01-24 21:01:40', '2021-01-24 21:01:40', 'b3d3de5e-d436-4a11-8d1b-27fa5953ea2d'),
(356, 354, 4, 5, 2, NULL, '2021-01-24 21:01:40', '2021-01-24 21:01:40', '8567a8ba-6f95-4a2c-bd19-338bb42d8d1f'),
(357, 354, 4, 1, 3, NULL, '2021-01-24 21:01:40', '2021-01-24 21:01:40', '745fa6a4-984f-481f-97c4-41025dfe25fe'),
(359, 358, 4, 1, 1, NULL, '2021-01-24 21:01:57', '2021-01-24 21:01:57', 'caa5ebce-7f1a-4869-9d21-3cf9b5a52873'),
(360, 358, 4, 5, 2, NULL, '2021-01-24 21:01:58', '2021-01-24 21:01:58', 'a8002b9e-3acc-4d08-8fb2-e80c2a420291'),
(361, 358, 4, 1, 3, NULL, '2021-01-24 21:01:58', '2021-01-24 21:01:58', 'ade5bb94-7e89-499a-a40e-098d1ef18d46'),
(363, 362, 4, 1, 1, NULL, '2021-01-25 14:09:46', '2021-01-25 14:09:46', '1cfc5848-cea7-423f-9ee8-5f5255bbc555'),
(364, 362, 4, 5, 2, NULL, '2021-01-25 14:09:46', '2021-01-25 14:09:46', 'bda43a4b-9ea7-43d8-a2e2-02e98e69fe18'),
(365, 362, 4, 1, 3, NULL, '2021-01-25 14:09:46', '2021-01-25 14:09:46', 'c9e9e633-b058-4058-ab47-f7e243a3b1ec'),
(367, 366, 4, 1, 1, NULL, '2021-01-25 14:10:11', '2021-01-25 14:10:11', 'd07d19fb-6377-41e5-b69f-da8e5fccabef'),
(368, 366, 4, 5, 2, NULL, '2021-01-25 14:10:11', '2021-01-25 14:10:11', '76652a68-0aac-4f91-b33a-b00fdba99477'),
(369, 366, 4, 1, 3, NULL, '2021-01-25 14:10:11', '2021-01-25 14:10:11', 'e8ae39de-f0c2-4515-9003-c5358bb92e59'),
(371, 370, 4, 1, 1, NULL, '2021-01-26 12:00:21', '2021-01-26 12:00:21', '8a68c693-beef-4f05-a7e3-8d3322ef37d2'),
(372, 370, 4, 5, 2, NULL, '2021-01-26 12:00:21', '2021-01-26 12:00:21', '4bbe481d-c8b0-4430-a2b5-7dcadc92a226'),
(373, 370, 4, 1, 3, NULL, '2021-01-26 12:00:21', '2021-01-26 12:00:21', 'eacc09a6-7aee-402b-b5c7-8dc152d3d77b'),
(375, 374, 4, 1, 1, NULL, '2021-01-26 13:51:08', '2021-01-26 13:51:08', 'ef650061-4700-4265-bd38-f321247952a2'),
(376, 374, 4, 5, 2, NULL, '2021-01-26 13:51:08', '2021-01-26 13:51:08', 'c689110a-2d85-40f6-a066-92d37359c9b1'),
(378, 377, 4, 1, 1, NULL, '2021-01-26 13:52:44', '2021-01-26 13:52:44', '8cc6e540-fc76-491c-883f-14e8ccb76253'),
(379, 377, 4, 5, 2, NULL, '2021-01-26 13:52:44', '2021-01-26 13:52:44', 'ff538209-a2b8-4268-b303-ae4e57e26335'),
(381, 380, 4, 1, 1, NULL, '2021-01-26 13:54:11', '2021-01-26 13:54:11', 'de81fa79-4a6b-4b78-8c68-dd004ee43347'),
(382, 380, 4, 5, 2, NULL, '2021-01-26 13:54:11', '2021-01-26 13:54:11', '13cacabc-d019-4995-81da-65af5d40cce0'),
(384, 383, 4, 1, 1, NULL, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '91a53579-e69c-4b72-a3c9-6acc37ab951d'),
(385, 383, 4, 5, 2, NULL, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '6181f39f-3968-4ec4-a8ff-25772d1dc03e'),
(386, 383, 4, 1, 3, NULL, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '6c185d8a-c4c0-43f8-b83b-f1b868e415db'),
(388, 387, 4, 1, 1, NULL, '2021-01-26 13:55:59', '2021-01-26 13:55:59', 'b180ffce-f9f8-49e4-bb6a-a5648d13bda2'),
(389, 387, 4, 5, 2, NULL, '2021-01-26 13:55:59', '2021-01-26 13:55:59', 'ce101ef7-d935-4921-a3cb-c6fdc37f0826'),
(390, 387, 4, 1, 3, NULL, '2021-01-26 13:55:59', '2021-01-26 13:55:59', '7d5a8f78-898e-4913-ab0f-dbe53e2c87fd'),
(392, 391, 4, 1, 1, NULL, '2021-01-26 13:56:02', '2021-01-26 13:56:02', '1b9302cf-5088-4a00-85fe-94a98d530944'),
(393, 391, 4, 5, 2, NULL, '2021-01-26 13:56:02', '2021-01-26 13:56:02', '7c94d80f-eb13-44d7-b531-31915d14df6f'),
(394, 391, 4, 1, 3, NULL, '2021-01-26 13:56:02', '2021-01-26 13:56:02', 'b28f7b2f-5660-4aec-85b0-77648841d4ca');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
CREATE TABLE IF NOT EXISTS `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocktypes`
--

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 4, 5, 'Module Text', 'moduleText', 1, '2021-01-16 11:39:18', '2021-01-16 11:39:18', 'baa3801b-9cd4-4067-a246-3550b15427f7'),
(5, 4, 11, 'Module Video', 'moduleVideo', 2, '2021-01-19 12:53:06', '2021-01-19 12:53:06', 'e3ecabf8-ac33-40d0-932c-e043196bf18d'),
(10, 19, 23, 'Text', 'text', 1, '2021-01-23 14:08:54', '2021-01-23 14:08:54', '50c817b7-49ef-44b4-87dc-bd04b97732ab'),
(11, 21, 24, 'nav link', 'navLink', 1, '2021-01-23 14:21:22', '2021-01-23 14:21:22', '68f3f84f-6b95-4e52-8928-00d86023001f'),
(12, 4, NULL, 'Module Image', 'moduleImage', 3, '2021-01-24 09:33:48', '2021-01-24 20:31:30', '63f04a1d-1669-4283-b022-4ec8d8efd608');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_modules`
--

DROP TABLE IF EXISTS `matrixcontent_modules`;
CREATE TABLE IF NOT EXISTS `matrixcontent_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_moduleText_moduleText` text,
  `field_moduleVideo_moduleVideo` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_modules_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_modules_siteId_fk` (`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_modules`
--

INSERT INTO `matrixcontent_modules` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_moduleText_moduleText`, `field_moduleVideo_moduleVideo`) VALUES
(1, 21, 1, '2021-01-16 11:43:27', '2021-01-16 21:18:34', 'ed765b76-9d77-4e96-a5c3-539ead13452f', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(2, 22, 1, '2021-01-16 11:43:27', '2021-01-16 21:18:34', 'bf27e9db-4d5c-4ce3-9fd5-4e20e92e8878', NULL, NULL),
(3, 23, 1, '2021-01-16 11:43:27', '2021-01-16 21:18:34', '6efa088c-49a2-4fde-8fc4-a455d7f55ac2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(4, 24, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '5876dea4-7ea9-474e-beda-0368dffa34e4', NULL, NULL),
(5, 26, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '49346af1-7e6d-4d96-a51b-8013b30179f1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(6, 27, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '1f3e142c-0341-4c10-861f-b471aca33501', NULL, NULL),
(7, 28, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '87305cc9-252f-4214-ac17-ded6795ce514', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(8, 29, 1, '2021-01-16 11:43:27', '2021-01-16 11:43:27', '4dce7ed3-775c-4100-b2ea-fe82d56c92b1', NULL, NULL),
(9, 31, 1, '2021-01-16 11:45:26', '2021-01-16 11:45:26', 'd27db518-02dd-457c-a6a8-8dd5cd1c7283', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(10, 32, 1, '2021-01-16 11:45:26', '2021-01-16 11:45:26', 'd301ac22-f9ad-4578-a27e-edbabab1643a', NULL, NULL),
(11, 33, 1, '2021-01-16 11:45:26', '2021-01-16 11:45:26', '2b1a94c3-af14-454f-8cee-0adc5ab4a8f4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(12, 34, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '40346e1c-7c5e-4e06-9ada-a6283126e587', NULL, NULL),
(13, 35, 1, '2021-01-16 11:47:56', '2021-01-16 21:18:34', '877aa1ac-9bbc-4cac-8706-86c8c664bb8b', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(14, 37, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '0db1bf7f-3697-4fc4-a3b6-f66ab86886f3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(15, 38, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '71268957-7d20-447b-9d0c-7f46f8d3194f', NULL, NULL),
(16, 39, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '4908625d-b247-46f5-97ae-6bd36da7d965', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(17, 40, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', 'e20cbfa6-34a8-4866-8a7e-8a27fccef941', NULL, NULL),
(18, 41, 1, '2021-01-16 11:47:56', '2021-01-16 11:47:56', '4ec638cf-133e-4c39-913c-8aba02c71089', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(19, 43, 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', '36515d5c-dbf0-42a2-a533-80411afe660e', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(20, 44, 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', '0531c430-b486-4760-889f-0847e0ffe643', NULL, NULL),
(21, 45, 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', '663f99c4-7112-443d-888a-8d57b6c8058a', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(22, 46, 1, '2021-01-16 20:30:10', '2021-01-16 20:30:10', 'd6ec05a8-9fcb-4b49-b477-a4ba17268b3c', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(23, 47, 1, '2021-01-16 20:44:58', '2021-01-16 21:18:34', 'a600d49e-80bb-47de-a11d-f77efd987a77', NULL, NULL),
(24, 49, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', 'd20caa27-f94a-4b2c-91ce-99ca7cf444ba', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(25, 50, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', 'c4d1e54f-3967-47e0-b4bb-00bd6db9445b', NULL, NULL),
(26, 51, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '6d081c73-de27-4a77-90f4-1c74e94390c3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(27, 52, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '13dd28b6-6975-45d5-add9-ef6fdfac5b7c', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(28, 53, 1, '2021-01-16 20:44:58', '2021-01-16 20:44:58', '50e6de28-ddc6-4e6c-aa96-8cffadf4b324', NULL, NULL),
(29, 55, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'b8ce0964-a00b-40ae-9cab-13a5eeca64ea', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(30, 56, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', 'bd15b4bf-559a-480a-b200-c396b839423a', NULL, NULL),
(31, 57, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', '081e0a69-ed51-4409-84d7-873a420b651b', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(32, 58, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', '5ca01560-1105-4a8a-b994-48805a1246a5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(33, 59, 1, '2021-01-16 21:12:23', '2021-01-16 21:12:23', '9027c778-c5fc-43f9-a12e-fb408f1891bd', NULL, NULL),
(34, 61, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', 'd1616db4-ec03-4734-a7f1-b26cc861e4e7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(35, 62, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', '60d3f144-894d-440e-af13-a9eb93ed9c2d', NULL, NULL),
(36, 63, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', 'bc139e0c-d997-4a1d-94dc-1925ff9e9e40', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(37, 64, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', 'bf43124c-e226-455d-8ddb-cdfced26a941', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(38, 65, 1, '2021-01-16 21:13:22', '2021-01-16 21:13:22', '0d3e894e-edc4-4d53-84ef-c7796104b150', NULL, NULL),
(39, 67, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', 'd49d9f87-80dd-43dd-b099-c5603ea55c03', NULL, NULL),
(40, 69, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', 'aeda0046-f227-4a38-ba45-acc476bec26c', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(41, 70, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '2d1b1cb7-70aa-433f-952f-d28e873069a9', NULL, NULL),
(42, 71, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '874ebcc6-aeb9-4be5-bb01-0502d23336e4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(43, 72, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '387c58d7-0555-49f9-9b59-08398f6da140', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(44, 73, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '208083ed-c0a8-4018-aa49-6abed5778380', NULL, NULL),
(45, 74, 1, '2021-01-16 21:18:34', '2021-01-16 21:18:34', '9a130b4d-4f26-4336-b711-4d8b51395591', NULL, NULL),
(46, 76, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '22eabf64-76f6-4bd8-ae4e-ebe7e944cc5a', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(47, 77, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '7d7a73dd-6f21-4913-b36a-88b78a9945aa', NULL, NULL),
(48, 78, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '5f0de259-97e8-45bd-b64f-ac5b54465c08', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(49, 79, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', '130b832c-7ada-418f-a5b2-5569e1245d7d', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(50, 80, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', 'e65b84ba-743e-4e11-8b63-0104a9957e26', NULL, NULL),
(51, 81, 1, '2021-01-16 21:23:48', '2021-01-16 21:23:48', 'b9bf38ed-dd23-423b-83c4-271c70498e55', NULL, NULL),
(52, 83, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'ddd7c5e5-d121-42a9-bf49-2ff2c2d9ab98', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(53, 84, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '77424b45-2fd2-4fe0-8779-0d5ba22b67c5', NULL, NULL),
(54, 85, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '8380dc0a-639e-4398-ad88-2c78921190d5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(55, 86, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'f3aa5eb7-7f08-45f0-af40-0b70ba844c23', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(56, 87, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', '4038bc27-2354-4dd2-88fe-b5a321a8ef1a', NULL, NULL),
(57, 88, 1, '2021-01-16 21:27:47', '2021-01-16 21:27:47', 'c736f55a-aef0-4da7-8d2a-24e63b6e298a', NULL, NULL),
(58, 90, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '682bcae9-be74-4d20-9f13-e93217309078', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(59, 91, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '6264c6bd-3953-4cf1-9094-afefef781bb1', NULL, NULL),
(60, 92, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '9710d28c-173e-4d3d-a14a-3bfe390571c1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(61, 93, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '155d2603-806b-4a31-8658-44a78e133d46', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(62, 94, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '3c302f49-1a81-446b-a819-8325b3cc5ef6', NULL, NULL),
(63, 95, 1, '2021-01-19 09:45:39', '2021-01-19 09:45:39', '953b2bcc-a946-4d06-9f60-4dcdeb6c8ad7', NULL, NULL),
(64, 97, 1, '2021-01-19 09:46:46', '2021-01-19 09:46:46', 'f846ab41-aad8-410b-97c9-41048a6f7d65', NULL, NULL),
(65, 98, 1, '2021-01-19 09:46:56', '2021-01-19 09:46:56', '2d428938-e3c0-4c5e-977c-864401bd844f', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(66, 99, 1, '2021-01-19 09:46:58', '2021-01-19 09:46:58', 'd5fab8bf-85bd-4256-a5c4-2add49b9205d', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(67, 100, 1, '2021-01-19 09:46:58', '2021-01-19 09:46:58', '1d9445c1-2f9f-4e1e-8cc5-c80439ecbad9', NULL, NULL),
(69, 103, 1, '2021-01-19 09:47:13', '2021-01-19 09:47:13', '87c923c5-2672-4dbb-914b-be13ef73ee0d', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(70, 105, 1, '2021-01-19 09:47:13', '2021-01-19 09:47:13', '265569e0-814b-4852-b580-ca2c04b7106e', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL),
(71, 109, 1, '2021-01-19 11:46:58', '2021-01-24 20:23:42', '501b988f-59ec-4791-9201-8488ab9ce84e', 'Hrvatska metropola sve više opravdava status regionalnog startup sjedišta - huba. Prije četiri godine na Zagrebačkom velesajmu otvoren je Zicer, najveći startup hub u Hrvatskoj. Okuplja više od 100 startupa. Ovdje su uredi tri domaća VC startup fonda: Fil Rouge Capitala, South Central Venturesa i Feelsgooda. U Zagrebu se održava i niz startup konferencija, a tu su i sjedišta najvećih domaćih i stranih tehnoloških kompanija. U Zagrebu se nalazi i najveći broj najrazvikanijih tehnoloških fakulteta u Hrvatskoj. Broj startupa u Hrvatskoj također raste pa se trenutačno procjenjuje da ih je oko 500, a većina je smještena upravo u Zagrebu. Jedino što metropoli još nedostaje su startup kampusi.', NULL),
(72, 111, 1, '2021-01-19 11:46:58', '2021-01-19 11:46:58', '8d57912b-4e08-4420-ac4e-adfdaeeb3181', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL),
(73, 113, 1, '2021-01-19 12:08:38', '2021-01-19 12:08:38', '22753b10-53fc-4147-a33f-edfa20cf98d0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL),
(74, 115, 1, '2021-01-19 12:18:09', '2021-01-19 12:18:09', 'aa5c43f7-0093-457d-a24a-6e3dcee18921', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL),
(75, 117, 1, '2021-01-19 12:19:21', '2021-01-19 12:19:21', '845b0a63-59ec-4ddc-8cfb-231d0ce64adb', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL),
(76, 118, 1, '2021-01-19 12:53:44', '2021-01-24 20:23:42', '8264e2ec-b70d-4321-ad21-96a16994ac85', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/W0RrmDB74ZM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(77, 120, 1, '2021-01-19 12:53:44', '2021-01-19 12:53:44', '0e168335-3428-445a-ac60-40b7d7185e68', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL),
(78, 121, 1, '2021-01-19 12:53:44', '2021-01-19 12:53:44', '595e4d04-2816-4623-a029-6f239d6f99c8', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Qampe5VFgCA\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(79, 131, 1, '2021-01-19 13:20:06', '2021-01-19 13:22:14', '13b619b3-fee1-4ef0-9432-15f8e53b32a5', 'Ajdeeeeeee', NULL),
(80, 133, 1, '2021-01-19 13:20:06', '2021-01-19 13:20:06', '2f5e62cb-287d-472e-acd5-d3d48105adf3', 'Ajdeeeeeee', NULL),
(81, 135, 1, '2021-01-19 13:21:27', '2021-01-19 13:21:27', '01f6dd3c-f53f-4e1e-92bd-da2ac912c812', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qh_SgLqPVYc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(82, 137, 1, '2021-01-19 13:21:27', '2021-01-19 13:21:27', '0b334716-c24c-48ae-b80a-effceb70a0c5', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qh_SgLqPVYc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(83, 139, 1, '2021-01-19 13:21:54', '2021-01-19 13:21:54', 'ff050c97-d55e-4708-8a96-9f7575f65739', 'Ajdeeeeeee', NULL),
(84, 140, 1, '2021-01-19 13:22:14', '2021-01-19 13:22:14', '87b19e12-d97f-4f28-9a16-98207092047d', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qh_SgLqPVYc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(85, 142, 1, '2021-01-19 13:22:14', '2021-01-19 13:22:14', 'ae60cc59-2813-4d20-9f22-7f9800ce00b9', 'Ajdeeeeeee', NULL),
(86, 143, 1, '2021-01-19 13:22:14', '2021-01-19 13:22:14', 'c9aaf59c-fe90-4662-86fe-72a33babfe91', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qh_SgLqPVYc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(87, 148, 1, '2021-01-19 14:04:25', '2021-01-19 14:04:25', 'b9453f27-77a0-4dea-8047-3ef0e853a377', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qh_SgLqPVYc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(88, 150, 1, '2021-01-19 14:04:44', '2021-01-19 14:04:44', 'c8c346b5-1a38-4216-b02e-e1609b41a52d', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qh_SgLqPVYc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(89, 245, 1, '2021-01-23 14:11:16', '2021-01-24 20:25:52', '4fd4248d-eef0-4ebd-9533-734a4080b149', 'Hrvatska metropola sve više opravdava status regionalnog startup sjedišta - huba. Prije četiri godine na Zagrebačkom velesajmu otvoren je Zicer, najveći startup hub u Hrvatskoj. Okuplja više od 100 startupa. Ovdje su uredi tri domaća VC startup fonda: Fil Rouge Capitala, South Central Venturesa i Feelsgooda. U Zagrebu se održava i niz startup konferencija, a tu su i sjedišta najvećih domaćih i stranih tehnoloških kompanija. U Zagrebu se nalazi i najveći broj najrazvikanijih tehnoloških fakulteta u Hrvatskoj. Broj startupa u Hrvatskoj također raste pa se trenutačno procjenjuje da ih je oko 500, a većina je smještena upravo u Zagrebu. Jedino što metropoli još nedostaje su startup kampusi.\n\nPrije dvije godine o startup kampusima počelo se pričati i u Zagrebu. Lani je Mate Rimac najavio da će Rimac Automobili u blizini glavnog grada Hrvatske izgraditi svoj kampus u koji će uložiti sto milijuna kuna u okviru kojeg će razvijati, testirati i proizvoditi električne automobile. Godinu prije doznali smo i da je Infobip, nakon što je 2017. svečano otvorio svoj prvi kampus, Pangeu u Vodnjanu u Istri, odakle su mu tri osnivača Silvio Kutić, Izabel Jelenić i Roberto Kutić, počeo raditi na projektu još jednog kampusa - onog u Zagrebu. Hrvatska metropola tako napokon dobiva infrastrukturu kakva je postala uobičajena u Silicijskoj dolini i s kojom može takmičiti za titulu regionalnog startup sjedišta.', NULL),
(90, 247, 1, '2021-01-23 14:11:17', '2021-01-23 14:11:17', '97e7e5c9-ff97-43c1-a2e6-c0b48160321f', 'Lorem ipsum', NULL),
(91, 248, 1, '2021-01-23 14:11:29', '2021-01-23 14:11:29', '78536ad4-e57e-42a6-b3c3-00d0f950d75c', 'Lorem ipsum', NULL),
(92, 250, 1, '2021-01-23 14:11:29', '2021-01-23 14:11:29', 'ed3eec75-8ee6-49fc-b12a-b64e91727f04', 'Lorem ipsum', NULL),
(93, 259, 1, '2021-01-23 15:31:03', '2021-01-23 15:31:03', 'b52d2fa4-3614-43a8-90ec-211bf99c7982', 'Lorem ipsum', NULL),
(94, 261, 1, '2021-01-23 15:31:17', '2021-01-23 15:31:17', 'f6d4c7cb-7fae-4497-a5fb-2e11c4841d53', 'Lorem ipsum', NULL),
(95, 269, 1, '2021-01-23 16:29:53', '2021-01-23 16:29:53', 'a9433fe0-d44d-4644-a0ce-c6812bd9554f', 'Lorem ipsum bok lidija', NULL),
(96, 271, 1, '2021-01-24 09:34:58', '2021-01-24 09:34:58', 'de9a9d14-8cec-4e20-af76-9cd4ecf5a7cc', NULL, NULL),
(97, 273, 1, '2021-01-24 09:34:58', '2021-01-24 09:34:58', '3886cf0e-d19d-4267-9c6a-5f5e122aa739', 'Lorem ipsum', NULL),
(98, 274, 1, '2021-01-24 09:34:58', '2021-01-24 09:34:58', 'df9084d7-2eda-4d98-b672-ff62fb2e0278', NULL, NULL),
(99, 277, 1, '2021-01-24 12:44:49', '2021-01-24 12:44:49', 'e5b610fc-91a0-42e3-89a4-fcfdf3cf5b91', 'Lorem ipsum', NULL),
(100, 278, 1, '2021-01-24 12:44:49', '2021-01-24 12:44:49', '87b5346f-113e-4243-aceb-fefea0a2139b', NULL, NULL),
(101, 280, 1, '2021-01-24 18:41:37', '2021-01-24 18:41:37', 'dd493c51-6c39-4432-bc46-f3afe1a1f340', 'Lorem ipsum', NULL),
(102, 282, 1, '2021-01-24 20:23:42', '2021-01-24 20:23:42', 'fc369df9-8277-4edf-affb-31c38fe4425d', 'Hrvatska metropola sve više opravdava status regionalnog startup sjedišta - huba. Prije četiri godine na Zagrebačkom velesajmu otvoren je Zicer, najveći startup hub u Hrvatskoj. Okuplja više od 100 startupa. Ovdje su uredi tri domaća VC startup fonda: Fil Rouge Capitala, South Central Venturesa i Feelsgooda. U Zagrebu se održava i niz startup konferencija, a tu su i sjedišta najvećih domaćih i stranih tehnoloških kompanija. U Zagrebu se nalazi i najveći broj najrazvikanijih tehnoloških fakulteta u Hrvatskoj. Broj startupa u Hrvatskoj također raste pa se trenutačno procjenjuje da ih je oko 500, a većina je smještena upravo u Zagrebu. Jedino što metropoli još nedostaje su startup kampusi.', NULL),
(103, 283, 1, '2021-01-24 20:23:42', '2021-01-24 20:23:42', '4f42517b-a363-4da6-a50d-e93b0055e9dc', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/W0RrmDB74ZM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(104, 284, 1, '2021-01-24 20:25:52', '2021-01-24 20:25:52', '3133c8a4-2c59-4631-9d94-9c8941a906e7', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/W0RrmDB74ZM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(105, 286, 1, '2021-01-24 20:25:52', '2021-01-24 20:25:52', 'b2a08284-2089-48c7-84aa-e53268abbf5d', 'Hrvatska metropola sve više opravdava status regionalnog startup sjedišta - huba. Prije četiri godine na Zagrebačkom velesajmu otvoren je Zicer, najveći startup hub u Hrvatskoj. Okuplja više od 100 startupa. Ovdje su uredi tri domaća VC startup fonda: Fil Rouge Capitala, South Central Venturesa i Feelsgooda. U Zagrebu se održava i niz startup konferencija, a tu su i sjedišta najvećih domaćih i stranih tehnoloških kompanija. U Zagrebu se nalazi i najveći broj najrazvikanijih tehnoloških fakulteta u Hrvatskoj. Broj startupa u Hrvatskoj također raste pa se trenutačno procjenjuje da ih je oko 500, a većina je smještena upravo u Zagrebu. Jedino što metropoli još nedostaje su startup kampusi.\n\nPrije dvije godine o startup kampusima počelo se pričati i u Zagrebu. Lani je Mate Rimac najavio da će Rimac Automobili u blizini glavnog grada Hrvatske izgraditi svoj kampus u koji će uložiti sto milijuna kuna u okviru kojeg će razvijati, testirati i proizvoditi električne automobile. Godinu prije doznali smo i da je Infobip, nakon što je 2017. svečano otvorio svoj prvi kampus, Pangeu u Vodnjanu u Istri, odakle su mu tri osnivača Silvio Kutić, Izabel Jelenić i Roberto Kutić, počeo raditi na projektu još jednog kampusa - onog u Zagrebu. Hrvatska metropola tako napokon dobiva infrastrukturu kakva je postala uobičajena u Silicijskoj dolini i s kojom može takmičiti za titulu regionalnog startup sjedišta.', NULL),
(106, 287, 1, '2021-01-24 20:25:52', '2021-01-24 20:25:52', 'b780dd69-0197-4496-b657-274a13e1760d', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/W0RrmDB74ZM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(107, 291, 1, '2021-01-24 20:44:35', '2021-01-24 20:44:35', 'ddebf06b-bf6a-4e1f-b961-82398f15d81b', 'Hrvatska metropola sve više opravdava status regionalnog startup sjedišta - huba. Prije četiri godine na Zagrebačkom velesajmu otvoren je Zicer, najveći startup hub u Hrvatskoj. Okuplja više od 100 startupa. Ovdje su uredi tri domaća VC startup fonda: Fil Rouge Capitala, South Central Venturesa i Feelsgooda. U Zagrebu se održava i niz startup konferencija, a tu su i sjedišta najvećih domaćih i stranih tehnoloških kompanija. U Zagrebu se nalazi i najveći broj najrazvikanijih tehnoloških fakulteta u Hrvatskoj. Broj startupa u Hrvatskoj također raste pa se trenutačno procjenjuje da ih je oko 500, a većina je smještena upravo u Zagrebu. Jedino što metropoli još nedostaje su startup kampusi.\n\nPrije dvije godine o startup kampusima počelo se pričati i u Zagrebu. Lani je Mate Rimac najavio da će Rimac Automobili u blizini glavnog grada Hrvatske izgraditi svoj kampus u koji će uložiti sto milijuna kuna u okviru kojeg će razvijati, testirati i proizvoditi električne automobile. Godinu prije doznali smo i da je Infobip, nakon što je 2017. svečano otvorio svoj prvi kampus, Pangeu u Vodnjanu u Istri, odakle su mu tri osnivača Silvio Kutić, Izabel Jelenić i Roberto Kutić, počeo raditi na projektu još jednog kampusa - onog u Zagrebu. Hrvatska metropola tako napokon dobiva infrastrukturu kakva je postala uobičajena u Silicijskoj dolini i s kojom može takmičiti za titulu regionalnog startup sjedišta.', NULL),
(108, 292, 1, '2021-01-24 20:44:35', '2021-01-24 20:44:35', '018b84c1-b8a6-42ac-8878-05cddae65c41', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/W0RrmDB74ZM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(109, 295, 1, '2021-01-24 20:45:09', '2021-01-24 20:45:09', '2c4a795d-a444-463d-ae3e-3b1735f4ffbb', 'Hrvatska metropola sve više opravdava status regionalnog startup sjedišta - huba. Prije četiri godine na Zagrebačkom velesajmu otvoren je Zicer, najveći startup hub u Hrvatskoj. Okuplja više od 100 startupa. Ovdje su uredi tri domaća VC startup fonda: Fil Rouge Capitala, South Central Venturesa i Feelsgooda. U Zagrebu se održava i niz startup konferencija, a tu su i sjedišta najvećih domaćih i stranih tehnoloških kompanija. U Zagrebu se nalazi i najveći broj najrazvikanijih tehnoloških fakulteta u Hrvatskoj. Broj startupa u Hrvatskoj također raste pa se trenutačno procjenjuje da ih je oko 500, a većina je smještena upravo u Zagrebu. Jedino što metropoli još nedostaje su startup kampusi.\n\nPrije dvije godine o startup kampusima počelo se pričati i u Zagrebu. Lani je Mate Rimac najavio da će Rimac Automobili u blizini glavnog grada Hrvatske izgraditi svoj kampus u koji će uložiti sto milijuna kuna u okviru kojeg će razvijati, testirati i proizvoditi električne automobile. Godinu prije doznali smo i da je Infobip, nakon što je 2017. svečano otvorio svoj prvi kampus, Pangeu u Vodnjanu u Istri, odakle su mu tri osnivača Silvio Kutić, Izabel Jelenić i Roberto Kutić, počeo raditi na projektu još jednog kampusa - onog u Zagrebu. Hrvatska metropola tako napokon dobiva infrastrukturu kakva je postala uobičajena u Silicijskoj dolini i s kojom može takmičiti za titulu regionalnog startup sjedišta.', NULL),
(110, 296, 1, '2021-01-24 20:45:09', '2021-01-24 20:45:09', 'a7659c4f-8786-4bf4-8639-d0057be4fda4', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/W0RrmDB74ZM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(111, 298, 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '797dd8c7-289c-495a-bc71-2349691b2f0e', 'Nogometaši Barcelone slavili su u 20. kolu Primere u gostima kod Elchea s 2-0, a pobjedom su se popeli na treće mjesto. \n\nKatalonci su u Elche stigli bez Lionela Mesija, ali su ipak stigli do četvrte prvenstvene pobjede u nizu.\n\nZasluge idu Nizozemcu Frenkieu de Jongu u 39. minuti i mladog Riqui Puigu, koji je minutu prije kraja zabio svoj prvi gol za Barcu.\n\nBarcelona je treća s 37 bodova, sedam manje i dvije utakmice više od vodećeg Atletica, dok Real bježi tri boda. Elche je predzadnji sa 17 bodova.', NULL),
(112, 299, 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '9bb76a30-7c06-479f-91e4-f4061ac94dbe', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Q-LFtMslQxc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(113, 301, 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', 'af237ac3-dd17-4808-930e-1c9470813260', 'Nogometaši Barcelone slavili su u 20. kolu Primere u gostima kod Elchea s 2-0, a pobjedom su se popeli na treće mjesto. \n\nKatalonci su u Elche stigli bez Lionela Mesija, ali su ipak stigli do četvrte prvenstvene pobjede u nizu.\n\nZasluge idu Nizozemcu Frenkieu de Jongu u 39. minuti i mladog Riqui Puigu, koji je minutu prije kraja zabio svoj prvi gol za Barcu.\n\nBarcelona je treća s 37 bodova, sedam manje i dvije utakmice više od vodećeg Atletica, dok Real bježi tri boda. Elche je predzadnji sa 17 bodova.', NULL),
(114, 302, 1, '2021-01-24 20:47:23', '2021-01-24 20:47:23', '020b6dcd-dbc2-460d-8999-08545bc9e915', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Q-LFtMslQxc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(115, 307, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'bc081656-97f4-4ec7-b903-487a05142992', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(116, 308, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'eccdef47-8421-49ab-9309-0b75f69888a1', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(117, 309, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'bf127d7d-49ff-4cf9-9d0e-157756062860', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(118, 311, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '0c41c5d1-f0e4-4e92-91a3-60c6046212c7', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(119, 312, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', '78935c22-1a4c-478d-8936-43e8a521f7f6', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(120, 313, 1, '2021-01-24 20:54:27', '2021-01-24 20:54:27', 'a02c64e2-ed4a-4f95-b132-bd18e8887231', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(121, 315, 1, '2021-01-24 20:55:21', '2021-01-24 20:55:21', 'b7f23e0a-bba1-40b2-b605-b76a08fafc5e', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(122, 316, 1, '2021-01-24 20:55:21', '2021-01-24 20:55:21', 'cc9b7d41-6e37-47e8-9a48-52c19729b6d5', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(123, 317, 1, '2021-01-24 20:55:21', '2021-01-24 20:55:21', '0a807f3e-ab9a-43fd-a820-0f7b8dbf212f', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(124, 319, 1, '2021-01-24 20:55:23', '2021-01-24 20:55:23', 'd6b68936-f5e5-4ff1-a083-8ee50c3087a8', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(125, 320, 1, '2021-01-24 20:55:23', '2021-01-24 20:55:23', 'db376ab4-00db-456c-b9bb-d603ab4427ca', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');
INSERT INTO `matrixcontent_modules` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_moduleText_moduleText`, `field_moduleVideo_moduleVideo`) VALUES
(126, 321, 1, '2021-01-24 20:55:23', '2021-01-24 20:55:23', 'a62d7135-d53f-484c-bda2-b2acf860bb52', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(127, 325, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '307b6843-f978-4111-bed1-86a5e6883627', 'Od početka 21. stoljeća pa do prije tri godine, premda je povremeno patio od štulićevskog sindroma objave prekobrojnih pjesama i albuma, Ryan Adams je bio miljenik kritike, jedan od najcjenjenijih američkih (rock) kantautora i favorit publike koja voli kantautorsku rock-glazbu. Često se Ryana navodilo i kao jednog od lidera americane ili alt-countryja, prije svega zbog tri albuma s grupom Whiskeytown iz druge polovice 90-ih, koji je kao solist, ponekad u pratnji grupe The Cardinals koju je rabio kao i Neil Young skupinu Crazy Horse, tijekom prvih sedamnaest godina ovog stoljeća objavio dvadesetak albuma.\n\nNepobitno, diskografski mu je opus koliko obiman toliko i razbarušen, sačinjen od albuma s vlastitim pjesmama i obradama drugih izvođača, neujednačen i obilježen usponima i padovima u kvaliteti. Ipak, od \"Heartbreakera\" (2000.) do \"Prisonera\" (2017.) našlo bi se još barem osam antologijskih albuma zbog kojih su Ryana Adamsa mjerili s Neilom Youngom, Bobom Dylanom, Gramom Parsonsom i Steveom Earleom. Takav aršin malo koji kantautor uspijeva podnijeti, ali Ryan je, kako god okrenuli, postao jedan od najboljih u dugoj tradiciji američke kantautorske (rock) glazbe.', NULL),
(128, 326, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '16a83e49-0fff-4eb7-a5a6-626512fd98cd', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vTwRrP9Ovq4\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(129, 327, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', 'c57ba7fa-dc83-4fc1-8a72-6e27d30a89d4', 'Njegov trosatni nastup 2002. godine u minhenskoj Georg Elser Halle - kojom je protutnjao u stilu Stonesa iz vremena dvostrukog albuma \"Exile On Main St.\", The Banda, Flying Burrito Brothersa pa i Springsteena s The E Street Bandom, uz osobine usporedive s karizmatičnošću mladog Dylana, erotičnošću Jima Morrisona, autodestruktivnošću Cobaina, melankolijom Parsonsa, emotivnošću Neila Younga, nihilizmom Iggyja Popa, grijesima Hanka Williamsa, odmetništvom Stevea Earlea i obješenjaštvom Keitha Richardsa - i danas smatram jednim od najimpresivnijih koncerata kojem sam ikada svjedočio. Ako se zbog životnog stila zamalo pridružio famoznom \"klubu 27\" ili postao notorni pijanac poput Paula Westerberga iz The Replacementsa, ipak je uspio ostati na nogama, izuzetno ga cijene i John Fogerty i Stephen King, a prikupio je i sedam nominacija za Grammy.', NULL),
(130, 329, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '79454e2a-9c1a-4532-92de-ed22012b2717', 'Od početka 21. stoljeća pa do prije tri godine, premda je povremeno patio od štulićevskog sindroma objave prekobrojnih pjesama i albuma, Ryan Adams je bio miljenik kritike, jedan od najcjenjenijih američkih (rock) kantautora i favorit publike koja voli kantautorsku rock-glazbu. Često se Ryana navodilo i kao jednog od lidera americane ili alt-countryja, prije svega zbog tri albuma s grupom Whiskeytown iz druge polovice 90-ih, koji je kao solist, ponekad u pratnji grupe The Cardinals koju je rabio kao i Neil Young skupinu Crazy Horse, tijekom prvih sedamnaest godina ovog stoljeća objavio dvadesetak albuma.\n\nNepobitno, diskografski mu je opus koliko obiman toliko i razbarušen, sačinjen od albuma s vlastitim pjesmama i obradama drugih izvođača, neujednačen i obilježen usponima i padovima u kvaliteti. Ipak, od \"Heartbreakera\" (2000.) do \"Prisonera\" (2017.) našlo bi se još barem osam antologijskih albuma zbog kojih su Ryana Adamsa mjerili s Neilom Youngom, Bobom Dylanom, Gramom Parsonsom i Steveom Earleom. Takav aršin malo koji kantautor uspijeva podnijeti, ali Ryan je, kako god okrenuli, postao jedan od najboljih u dugoj tradiciji američke kantautorske (rock) glazbe.', NULL),
(131, 330, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', 'd470e7eb-149d-40d5-b4df-826e8248b154', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vTwRrP9Ovq4\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(132, 331, 1, '2021-01-24 20:58:31', '2021-01-24 20:58:31', '835de974-6d53-4c34-9c3d-54243f74c039', 'Njegov trosatni nastup 2002. godine u minhenskoj Georg Elser Halle - kojom je protutnjao u stilu Stonesa iz vremena dvostrukog albuma \"Exile On Main St.\", The Banda, Flying Burrito Brothersa pa i Springsteena s The E Street Bandom, uz osobine usporedive s karizmatičnošću mladog Dylana, erotičnošću Jima Morrisona, autodestruktivnošću Cobaina, melankolijom Parsonsa, emotivnošću Neila Younga, nihilizmom Iggyja Popa, grijesima Hanka Williamsa, odmetništvom Stevea Earlea i obješenjaštvom Keitha Richardsa - i danas smatram jednim od najimpresivnijih koncerata kojem sam ikada svjedočio. Ako se zbog životnog stila zamalo pridružio famoznom \"klubu 27\" ili postao notorni pijanac poput Paula Westerberga iz The Replacementsa, ipak je uspio ostati na nogama, izuzetno ga cijene i John Fogerty i Stephen King, a prikupio je i sedam nominacija za Grammy.', NULL),
(133, 335, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '63155280-5f22-48f0-a2d2-d316706717f3', 'Nakon što je krajem listopada dobila gromoglasni pljesak i niz pohvala kada je utjelovila bivšu predsjednicu Kolindu Grabar-Kitarović na daskama zagrebačkog kazališta Kerempuh, a potom i sudjelovala u popularnom kvizu \"Tko želi biti milijunaš\" koji je novac u predblagdansko prikupljao u humanitarne svrhe, Ornela Vištica posvetila se vlastitom izgledu.\n\nNaime, glumica je ujutro ošišala i skratila svoju dugu prepoznatljivu kosu koju je osvježila svjetlijim pramenovima. Ornela je svaki korak u frizerskom salonu snimila i video objavila na svom Instagram profilu, a nakon što je sredila dojmove nam je ispričala:\n\n- Nisam imala nikakav plan, no moja draga frizerka Antonija Mužar u koju već godinama imam potpuno povjerenje to je učinila umjesto mene. I uistinu sam prezadovoljna. U ovim tmurnim vremenima što je ljepše i veselije za jednu ženu nego promjena - kazala je Ornela koja je nakon šetnje gradom dobila niz komplemenata.', NULL),
(134, 336, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '8f47a125-f881-4f3e-b276-082905bf275a', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/r4E5ilwZHOM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(135, 337, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '4ce03cdb-5a70-4658-8328-36d6cfe053bc', '- Simpatično mi je što ljudi moju promjenu primjećuju i hvale. Neki me sada uspoređuju s Melanijom Trump. Nemam ništa protiv. Dapače, zadovoljna sam zbog toga pa možda ne bi bilo loše da nakon Kolinde utjelovim upravo Melaniju - kroz smijeh nam je ispričala Vištica koja se ovih dana namjerava pripremati za neke nove uloge o kojima će pričati kada za tu temu dođe vrijeme.\n\nA dok je s nama čavrljala o svojem novom izgledu komentari na njezinu Instagramu nisu izostajali.\n\nNjezini pratitelji su je obasipali riječima: \"Konačno\", \"Super slatkica\", \"Predivna\", Ti si tako lijepa i slatka, super ti stoji\", samo je dio onoga što su joj fanovi napisali.\n\nInače, Ornela Vištica je nedavno otkrila kako se odlučila dodatno obrazovati jer zbog pandemije ima manje predstava i više slobodnog vremena.', NULL),
(136, 339, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '84dcfaaa-56e5-4642-b6bb-4ccf0e45a3e1', 'Nakon što je krajem listopada dobila gromoglasni pljesak i niz pohvala kada je utjelovila bivšu predsjednicu Kolindu Grabar-Kitarović na daskama zagrebačkog kazališta Kerempuh, a potom i sudjelovala u popularnom kvizu \"Tko želi biti milijunaš\" koji je novac u predblagdansko prikupljao u humanitarne svrhe, Ornela Vištica posvetila se vlastitom izgledu.\n\nNaime, glumica je ujutro ošišala i skratila svoju dugu prepoznatljivu kosu koju je osvježila svjetlijim pramenovima. Ornela je svaki korak u frizerskom salonu snimila i video objavila na svom Instagram profilu, a nakon što je sredila dojmove nam je ispričala:\n\n- Nisam imala nikakav plan, no moja draga frizerka Antonija Mužar u koju već godinama imam potpuno povjerenje to je učinila umjesto mene. I uistinu sam prezadovoljna. U ovim tmurnim vremenima što je ljepše i veselije za jednu ženu nego promjena - kazala je Ornela koja je nakon šetnje gradom dobila niz komplemenata.', NULL),
(137, 340, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '198a238a-e1a6-414b-b64b-acf5a31083cf', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/r4E5ilwZHOM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(138, 341, 1, '2021-01-24 21:00:33', '2021-01-24 21:00:33', '9a4741e8-ad1c-4ae8-9314-bdb3f0aa365c', '- Simpatično mi je što ljudi moju promjenu primjećuju i hvale. Neki me sada uspoređuju s Melanijom Trump. Nemam ništa protiv. Dapače, zadovoljna sam zbog toga pa možda ne bi bilo loše da nakon Kolinde utjelovim upravo Melaniju - kroz smijeh nam je ispričala Vištica koja se ovih dana namjerava pripremati za neke nove uloge o kojima će pričati kada za tu temu dođe vrijeme.\n\nA dok je s nama čavrljala o svojem novom izgledu komentari na njezinu Instagramu nisu izostajali.\n\nNjezini pratitelji su je obasipali riječima: \"Konačno\", \"Super slatkica\", \"Predivna\", Ti si tako lijepa i slatka, super ti stoji\", samo je dio onoga što su joj fanovi napisali.\n\nInače, Ornela Vištica je nedavno otkrila kako se odlučila dodatno obrazovati jer zbog pandemije ima manje predstava i više slobodnog vremena.', NULL),
(139, 343, 1, '2021-01-24 21:01:03', '2021-01-24 21:01:03', 'cfd6c335-1d97-47ea-bf77-10712e21d499', 'Od početka 21. stoljeća pa do prije tri godine, premda je povremeno patio od štulićevskog sindroma objave prekobrojnih pjesama i albuma, Ryan Adams je bio miljenik kritike, jedan od najcjenjenijih američkih (rock) kantautora i favorit publike koja voli kantautorsku rock-glazbu. Često se Ryana navodilo i kao jednog od lidera americane ili alt-countryja, prije svega zbog tri albuma s grupom Whiskeytown iz druge polovice 90-ih, koji je kao solist, ponekad u pratnji grupe The Cardinals koju je rabio kao i Neil Young skupinu Crazy Horse, tijekom prvih sedamnaest godina ovog stoljeća objavio dvadesetak albuma.\n\nNepobitno, diskografski mu je opus koliko obiman toliko i razbarušen, sačinjen od albuma s vlastitim pjesmama i obradama drugih izvođača, neujednačen i obilježen usponima i padovima u kvaliteti. Ipak, od \"Heartbreakera\" (2000.) do \"Prisonera\" (2017.) našlo bi se još barem osam antologijskih albuma zbog kojih su Ryana Adamsa mjerili s Neilom Youngom, Bobom Dylanom, Gramom Parsonsom i Steveom Earleom. Takav aršin malo koji kantautor uspijeva podnijeti, ali Ryan je, kako god okrenuli, postao jedan od najboljih u dugoj tradiciji američke kantautorske (rock) glazbe.', NULL),
(140, 344, 1, '2021-01-24 21:01:03', '2021-01-24 21:01:03', '9601640b-4af1-4abc-9bcf-76736c00e9b5', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vTwRrP9Ovq4\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(141, 345, 1, '2021-01-24 21:01:03', '2021-01-24 21:01:03', '71641222-9df9-4b9e-baea-73d3c3659a30', 'Njegov trosatni nastup 2002. godine u minhenskoj Georg Elser Halle - kojom je protutnjao u stilu Stonesa iz vremena dvostrukog albuma \"Exile On Main St.\", The Banda, Flying Burrito Brothersa pa i Springsteena s The E Street Bandom, uz osobine usporedive s karizmatičnošću mladog Dylana, erotičnošću Jima Morrisona, autodestruktivnošću Cobaina, melankolijom Parsonsa, emotivnošću Neila Younga, nihilizmom Iggyja Popa, grijesima Hanka Williamsa, odmetništvom Stevea Earlea i obješenjaštvom Keitha Richardsa - i danas smatram jednim od najimpresivnijih koncerata kojem sam ikada svjedočio. Ako se zbog životnog stila zamalo pridružio famoznom \"klubu 27\" ili postao notorni pijanac poput Paula Westerberga iz The Replacementsa, ipak je uspio ostati na nogama, izuzetno ga cijene i John Fogerty i Stephen King, a prikupio je i sedam nominacija za Grammy.', NULL),
(142, 347, 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '9f80efd2-1293-4984-988c-512267ad064c', 'Od početka 21. stoljeća pa do prije tri godine, premda je povremeno patio od štulićevskog sindroma objave prekobrojnih pjesama i albuma, Ryan Adams je bio miljenik kritike, jedan od najcjenjenijih američkih (rock) kantautora i favorit publike koja voli kantautorsku rock-glazbu. Često se Ryana navodilo i kao jednog od lidera americane ili alt-countryja, prije svega zbog tri albuma s grupom Whiskeytown iz druge polovice 90-ih, koji je kao solist, ponekad u pratnji grupe The Cardinals koju je rabio kao i Neil Young skupinu Crazy Horse, tijekom prvih sedamnaest godina ovog stoljeća objavio dvadesetak albuma.\n\nNepobitno, diskografski mu je opus koliko obiman toliko i razbarušen, sačinjen od albuma s vlastitim pjesmama i obradama drugih izvođača, neujednačen i obilježen usponima i padovima u kvaliteti. Ipak, od \"Heartbreakera\" (2000.) do \"Prisonera\" (2017.) našlo bi se još barem osam antologijskih albuma zbog kojih su Ryana Adamsa mjerili s Neilom Youngom, Bobom Dylanom, Gramom Parsonsom i Steveom Earleom. Takav aršin malo koji kantautor uspijeva podnijeti, ali Ryan je, kako god okrenuli, postao jedan od najboljih u dugoj tradiciji američke kantautorske (rock) glazbe.', NULL),
(143, 348, 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '7c20c3eb-6fe6-40c8-857e-ba3dd47a7001', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vTwRrP9Ovq4\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(144, 349, 1, '2021-01-24 21:01:16', '2021-01-24 21:01:16', '4c046f34-6a6c-45c7-a55d-112e84634adc', 'Njegov trosatni nastup 2002. godine u minhenskoj Georg Elser Halle - kojom je protutnjao u stilu Stonesa iz vremena dvostrukog albuma \"Exile On Main St.\", The Banda, Flying Burrito Brothersa pa i Springsteena s The E Street Bandom, uz osobine usporedive s karizmatičnošću mladog Dylana, erotičnošću Jima Morrisona, autodestruktivnošću Cobaina, melankolijom Parsonsa, emotivnošću Neila Younga, nihilizmom Iggyja Popa, grijesima Hanka Williamsa, odmetništvom Stevea Earlea i obješenjaštvom Keitha Richardsa - i danas smatram jednim od najimpresivnijih koncerata kojem sam ikada svjedočio. Ako se zbog životnog stila zamalo pridružio famoznom \"klubu 27\" ili postao notorni pijanac poput Paula Westerberga iz The Replacementsa, ipak je uspio ostati na nogama, izuzetno ga cijene i John Fogerty i Stephen King, a prikupio je i sedam nominacija za Grammy.', NULL),
(145, 351, 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', 'a2ae3fda-6f1f-4ccc-a02f-80fdd9ce06d1', 'Nakon što je krajem listopada dobila gromoglasni pljesak i niz pohvala kada je utjelovila bivšu predsjednicu Kolindu Grabar-Kitarović na daskama zagrebačkog kazališta Kerempuh, a potom i sudjelovala u popularnom kvizu \"Tko želi biti milijunaš\" koji je novac u predblagdansko prikupljao u humanitarne svrhe, Ornela Vištica posvetila se vlastitom izgledu.\n\nNaime, glumica je ujutro ošišala i skratila svoju dugu prepoznatljivu kosu koju je osvježila svjetlijim pramenovima. Ornela je svaki korak u frizerskom salonu snimila i video objavila na svom Instagram profilu, a nakon što je sredila dojmove nam je ispričala:\n\n- Nisam imala nikakav plan, no moja draga frizerka Antonija Mužar u koju već godinama imam potpuno povjerenje to je učinila umjesto mene. I uistinu sam prezadovoljna. U ovim tmurnim vremenima što je ljepše i veselije za jednu ženu nego promjena - kazala je Ornela koja je nakon šetnje gradom dobila niz komplemenata.', NULL),
(146, 352, 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', 'ecbafc35-615d-4580-b033-ac87edbcdd45', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/r4E5ilwZHOM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(147, 353, 1, '2021-01-24 21:01:21', '2021-01-24 21:01:21', '2225468f-765f-42b7-aa14-1a63fdb8a6b2', '- Simpatično mi je što ljudi moju promjenu primjećuju i hvale. Neki me sada uspoređuju s Melanijom Trump. Nemam ništa protiv. Dapače, zadovoljna sam zbog toga pa možda ne bi bilo loše da nakon Kolinde utjelovim upravo Melaniju - kroz smijeh nam je ispričala Vištica koja se ovih dana namjerava pripremati za neke nove uloge o kojima će pričati kada za tu temu dođe vrijeme.\n\nA dok je s nama čavrljala o svojem novom izgledu komentari na njezinu Instagramu nisu izostajali.\n\nNjezini pratitelji su je obasipali riječima: \"Konačno\", \"Super slatkica\", \"Predivna\", Ti si tako lijepa i slatka, super ti stoji\", samo je dio onoga što su joj fanovi napisali.\n\nInače, Ornela Vištica je nedavno otkrila kako se odlučila dodatno obrazovati jer zbog pandemije ima manje predstava i više slobodnog vremena.', NULL),
(148, 355, 1, '2021-01-24 21:01:40', '2021-01-24 21:01:40', 'b6807872-adb9-4f10-81a1-ca3d46f22e57', 'Nakon što je krajem listopada dobila gromoglasni pljesak i niz pohvala kada je utjelovila bivšu predsjednicu Kolindu Grabar-Kitarović na daskama zagrebačkog kazališta Kerempuh, a potom i sudjelovala u popularnom kvizu \"Tko želi biti milijunaš\" koji je novac u predblagdansko prikupljao u humanitarne svrhe, Ornela Vištica posvetila se vlastitom izgledu.\n\nNaime, glumica je ujutro ošišala i skratila svoju dugu prepoznatljivu kosu koju je osvježila svjetlijim pramenovima. Ornela je svaki korak u frizerskom salonu snimila i video objavila na svom Instagram profilu, a nakon što je sredila dojmove nam je ispričala:\n\n- Nisam imala nikakav plan, no moja draga frizerka Antonija Mužar u koju već godinama imam potpuno povjerenje to je učinila umjesto mene. I uistinu sam prezadovoljna. U ovim tmurnim vremenima što je ljepše i veselije za jednu ženu nego promjena - kazala je Ornela koja je nakon šetnje gradom dobila niz komplemenata.', NULL),
(149, 356, 1, '2021-01-24 21:01:40', '2021-01-24 21:01:40', '4803b0d1-4f86-4e3c-8f66-ebf46ce8217f', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/r4E5ilwZHOM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(150, 357, 1, '2021-01-24 21:01:40', '2021-01-24 21:01:40', '32fc4b29-9a87-4f4f-ac2f-9de578c37280', '- Simpatično mi je što ljudi moju promjenu primjećuju i hvale. Neki me sada uspoređuju s Melanijom Trump. Nemam ništa protiv. Dapače, zadovoljna sam zbog toga pa možda ne bi bilo loše da nakon Kolinde utjelovim upravo Melaniju - kroz smijeh nam je ispričala Vištica koja se ovih dana namjerava pripremati za neke nove uloge o kojima će pričati kada za tu temu dođe vrijeme.\n\nA dok je s nama čavrljala o svojem novom izgledu komentari na njezinu Instagramu nisu izostajali.\n\nNjezini pratitelji su je obasipali riječima: \"Konačno\", \"Super slatkica\", \"Predivna\", Ti si tako lijepa i slatka, super ti stoji\", samo je dio onoga što su joj fanovi napisali.\n\nInače, Ornela Vištica je nedavno otkrila kako se odlučila dodatno obrazovati jer zbog pandemije ima manje predstava i više slobodnog vremena.', NULL),
(151, 359, 1, '2021-01-24 21:01:57', '2021-01-24 21:01:57', '31439a2c-93fe-4de6-8f25-30809ed572cd', 'Od početka 21. stoljeća pa do prije tri godine, premda je povremeno patio od štulićevskog sindroma objave prekobrojnih pjesama i albuma, Ryan Adams je bio miljenik kritike, jedan od najcjenjenijih američkih (rock) kantautora i favorit publike koja voli kantautorsku rock-glazbu. Često se Ryana navodilo i kao jednog od lidera americane ili alt-countryja, prije svega zbog tri albuma s grupom Whiskeytown iz druge polovice 90-ih, koji je kao solist, ponekad u pratnji grupe The Cardinals koju je rabio kao i Neil Young skupinu Crazy Horse, tijekom prvih sedamnaest godina ovog stoljeća objavio dvadesetak albuma.\n\nNepobitno, diskografski mu je opus koliko obiman toliko i razbarušen, sačinjen od albuma s vlastitim pjesmama i obradama drugih izvođača, neujednačen i obilježen usponima i padovima u kvaliteti. Ipak, od \"Heartbreakera\" (2000.) do \"Prisonera\" (2017.) našlo bi se još barem osam antologijskih albuma zbog kojih su Ryana Adamsa mjerili s Neilom Youngom, Bobom Dylanom, Gramom Parsonsom i Steveom Earleom. Takav aršin malo koji kantautor uspijeva podnijeti, ali Ryan je, kako god okrenuli, postao jedan od najboljih u dugoj tradiciji američke kantautorske (rock) glazbe.', NULL),
(152, 360, 1, '2021-01-24 21:01:58', '2021-01-24 21:01:58', '4b7c1a75-5dfd-4225-80fd-f417d475f857', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vTwRrP9Ovq4\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(153, 361, 1, '2021-01-24 21:01:58', '2021-01-24 21:01:58', '753685ab-e75b-4abb-b95e-014dc7cada17', 'Njegov trosatni nastup 2002. godine u minhenskoj Georg Elser Halle - kojom je protutnjao u stilu Stonesa iz vremena dvostrukog albuma \"Exile On Main St.\", The Banda, Flying Burrito Brothersa pa i Springsteena s The E Street Bandom, uz osobine usporedive s karizmatičnošću mladog Dylana, erotičnošću Jima Morrisona, autodestruktivnošću Cobaina, melankolijom Parsonsa, emotivnošću Neila Younga, nihilizmom Iggyja Popa, grijesima Hanka Williamsa, odmetništvom Stevea Earlea i obješenjaštvom Keitha Richardsa - i danas smatram jednim od najimpresivnijih koncerata kojem sam ikada svjedočio. Ako se zbog životnog stila zamalo pridružio famoznom \"klubu 27\" ili postao notorni pijanac poput Paula Westerberga iz The Replacementsa, ipak je uspio ostati na nogama, izuzetno ga cijene i John Fogerty i Stephen King, a prikupio je i sedam nominacija za Grammy.', NULL),
(154, 363, 1, '2021-01-25 14:09:46', '2021-01-25 14:09:46', '960fbe19-89b6-440c-87f7-a1bf2ffd874c', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(155, 364, 1, '2021-01-25 14:09:46', '2021-01-25 14:09:46', 'd4126596-019b-45bc-84f4-465e3ce61093', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(156, 365, 1, '2021-01-25 14:09:46', '2021-01-25 14:09:46', 'c3738f2e-fe66-4bf9-802f-bf3405f60612', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(157, 367, 1, '2021-01-25 14:10:11', '2021-01-25 14:10:11', '4b329871-b75c-49f8-bffa-7d06089cab34', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(158, 368, 1, '2021-01-25 14:10:11', '2021-01-25 14:10:11', 'fec56756-ae40-446a-81c5-3fa4b80c07c8', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(159, 369, 1, '2021-01-25 14:10:11', '2021-01-25 14:10:11', '9c0d197d-0a36-4f8d-9951-73d4d4e386a7', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(160, 371, 1, '2021-01-26 12:00:21', '2021-01-26 12:00:21', '405fb7b8-43a5-4134-a98c-d60ce7cc752f', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(161, 372, 1, '2021-01-26 12:00:21', '2021-01-26 12:00:21', 'cd956e91-f193-4cd0-a296-50dd2e0da5d9', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(162, 373, 1, '2021-01-26 12:00:21', '2021-01-26 12:00:21', '54817031-1ca2-4e8a-921d-4af91647fac8', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(163, 375, 1, '2021-01-26 13:51:08', '2021-01-26 13:51:08', '8dd0d37e-a34f-4630-b3f3-f1de0ec8d6e5', 'Nogometaši Barcelone slavili su u 20. kolu Primere u gostima kod Elchea s 2-0, a pobjedom su se popeli na treće mjesto. \n\nKatalonci su u Elche stigli bez Lionela Mesija, ali su ipak stigli do četvrte prvenstvene pobjede u nizu.\n\nZasluge idu Nizozemcu Frenkieu de Jongu u 39. minuti i mladog Riqui Puigu, koji je minutu prije kraja zabio svoj prvi gol za Barcu.\n\nBarcelona je treća s 37 bodova, sedam manje i dvije utakmice više od vodećeg Atletica, dok Real bježi tri boda. Elche je predzadnji sa 17 bodova.', NULL),
(164, 376, 1, '2021-01-26 13:51:08', '2021-01-26 13:51:08', 'e7adb590-d272-461e-8f18-5f44a5d084f6', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Q-LFtMslQxc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(165, 378, 1, '2021-01-26 13:52:44', '2021-01-26 13:52:44', 'c02b6882-1290-4ce3-b0b1-4c999e7ca5c9', 'Nogometaši Barcelone slavili su u 20. kolu Primere u gostima kod Elchea s 2-0, a pobjedom su se popeli na treće mjesto. \n\nKatalonci su u Elche stigli bez Lionela Mesija, ali su ipak stigli do četvrte prvenstvene pobjede u nizu.\n\nZasluge idu Nizozemcu Frenkieu de Jongu u 39. minuti i mladog Riqui Puigu, koji je minutu prije kraja zabio svoj prvi gol za Barcu.\n\nBarcelona je treća s 37 bodova, sedam manje i dvije utakmice više od vodećeg Atletica, dok Real bježi tri boda. Elche je predzadnji sa 17 bodova.', NULL),
(166, 379, 1, '2021-01-26 13:52:44', '2021-01-26 13:52:44', '5a1b4462-06ae-41bb-9b26-d103661321ea', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Q-LFtMslQxc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(167, 381, 1, '2021-01-26 13:54:11', '2021-01-26 13:54:11', 'd4a94688-fe80-42e9-be70-8141cf7e4286', 'Nogometaši Barcelone slavili su u 20. kolu Primere u gostima kod Elchea s 2-0, a pobjedom su se popeli na treće mjesto. \n\nKatalonci su u Elche stigli bez Lionela Mesija, ali su ipak stigli do četvrte prvenstvene pobjede u nizu.\n\nZasluge idu Nizozemcu Frenkieu de Jongu u 39. minuti i mladog Riqui Puigu, koji je minutu prije kraja zabio svoj prvi gol za Barcu.\n\nBarcelona je treća s 37 bodova, sedam manje i dvije utakmice više od vodećeg Atletica, dok Real bježi tri boda. Elche je predzadnji sa 17 bodova.', NULL),
(168, 382, 1, '2021-01-26 13:54:11', '2021-01-26 13:54:11', '34adc399-7005-4fc3-8a9d-46fa3028f886', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Q-LFtMslQxc\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(169, 384, 1, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '5edf4551-22d9-4093-82c4-820d9c8b196d', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(170, 385, 1, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '38853a8c-f01e-4d6e-908f-497d2e2734b4', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(171, 386, 1, '2021-01-26 13:55:19', '2021-01-26 13:55:19', '1f9e6d63-93ca-4121-8cc9-7d5b67d34ed4', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(172, 388, 1, '2021-01-26 13:55:59', '2021-01-26 13:55:59', 'a9735110-71be-43f8-98d2-5d88203f0087', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(173, 389, 1, '2021-01-26 13:55:59', '2021-01-26 13:55:59', '01923fb2-c4bf-4f18-ad4f-39872705dd3f', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(174, 390, 1, '2021-01-26 13:55:59', '2021-01-26 13:55:59', '0d7cc66e-8625-42f3-8725-21e2c5aefdef', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL),
(175, 392, 1, '2021-01-26 13:56:02', '2021-01-26 13:56:02', 'd9177058-3ff6-41f4-b435-aef2fc65d98d', 'LG Electronics mogao bi napustiti proizvodnju pametnih telefona, nakon što je u proteklih pet godina u tom poslu izgubio izgubio oko 4,5 milijardi dolara, piše korejski poslovni portal The Korea Herald. \nIzvršni direktor LG-a Kwon Bong-seok poslao je zaposlenima u koncernu poruku koja je nagovijestila da bi mogle uslijediti velike promjene u segmentu pametnih telefona. \n\"Bez obzira na bilo kakve promjene u smjeru poslovanja pametnih telefona, zaposlenost će se zadržati, tako da nema potrebe za brigom\", rekao je. \n\"Budući da je konkurencija na svjetskom tržištu mobilnih uređaja sve jača, vrijeme je da LG donese hladnu prosudbu i najbolji izbor\", rekao je LG-ev menadžer.', NULL),
(176, 393, 1, '2021-01-26 13:56:02', '2021-01-26 13:56:02', '8f34d412-464d-40ad-8649-9b25d1631bb8', NULL, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4-psYKvcgjw\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(177, 394, 1, '2021-01-26 13:56:02', '2021-01-26 13:56:02', '2f2cc704-24fa-4b60-bf94-330934534a96', '\"Tvrtka razmatra sve moguće mjere, uključujući prodaju, povlačenje i smanjenje poslovanja sa pametnim telefonima\", kaže se u poruci.\nRanije su se pojavile informacije da se LG možda sprema smanjiti ili demontirati svoju poslovnu jedinicu mobilnih uređaja. Prema tim glasinama, oko 60 posto zaposlenih premjestilo bi se i prerasporedilo u druge poslovne jedinice unutar tvrtke ili u druge podružnice LG-a.\nKada je stupio na dužnost u siječnju prošle godine, izvršni direktor Kwon obećao je da će napraviti zaokret u poslovanju s pametnim telefonima.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_navigation`
--

DROP TABLE IF EXISTS `matrixcontent_navigation`;
CREATE TABLE IF NOT EXISTS `matrixcontent_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_navLink_linkText` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_navigation_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_navigation_siteId_fk` (`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_navigation`
--

INSERT INTO `matrixcontent_navigation` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_navLink_linkText`) VALUES
(1, 252, 1, '2021-01-23 14:27:19', '2021-01-24 21:12:02', '24a2047f-9f45-4394-9760-dbb02894b448', 'Vijesti'),
(2, 253, 1, '2021-01-23 14:27:19', '2021-01-24 21:12:02', '2e99ccf9-bf80-4799-911c-0fc0bf4756b2', 'Sport'),
(3, 262, 1, '2021-01-23 15:36:01', '2021-01-23 15:45:20', '78161d20-d1ff-4e0c-ab3d-e0f9284a9c03', 'j2'),
(4, 263, 1, '2021-01-23 15:36:01', '2021-01-24 21:12:02', '358b9848-fcc7-467a-b948-73c3d613b37b', 'Novac'),
(5, 264, 1, '2021-01-23 15:36:01', '2021-01-24 21:12:02', 'ef4a234c-8bf5-4f12-83a8-b64cb434a66f', 'Kultura'),
(6, 265, 1, '2021-01-23 15:36:01', '2021-01-24 21:12:02', '3cb35783-8493-48d5-84cf-91f8ebb64185', 'Scena'),
(7, 266, 1, '2021-01-23 15:36:01', '2021-01-23 15:45:21', '58cef40f-4543-4a8f-8427-2e03d04bd7a4', 'video'),
(8, 267, 1, '2021-01-23 15:37:01', '2021-01-23 15:45:21', '5d3598bb-bdee-430f-8796-1068d5ee65b4', 'preptlata');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_tekst`
--

DROP TABLE IF EXISTS `matrixcontent_tekst`;
CREATE TABLE IF NOT EXISTS `matrixcontent_tekst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_text_text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_tekst_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_tekst_siteId_fk` (`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_tekst`
--

INSERT INTO `matrixcontent_tekst` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_text_text`) VALUES
(1, 255, 1, '2021-01-23 15:16:50', '2021-01-23 15:16:50', '635690ec-eb2f-41e5-a575-20502f1e0934', 'Text'),
(2, 257, 1, '2021-01-23 15:16:50', '2021-01-23 15:16:50', '502c22f0-33e1-448e-805d-590513038535', 'Text');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '23646a3b-2c52-441f-af86-e4fd464bff14'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'c259e391-abf7-48dc-813e-983f69e148e1'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '8e26a01a-e8ac-480d-bfb1-e84407cfbcb7'),
(4, 'craft', 'm150403_184533_field_version', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '54315072-3ecb-4cc9-aa6b-fc1df423f691'),
(5, 'craft', 'm150403_184729_type_columns', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f645546a-0c8b-4d41-b706-00741f4cffd8'),
(6, 'craft', 'm150403_185142_volumes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'c452ba58-81dc-485a-a3ea-faaa51cdf4bb'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '20fb911c-0a92-46ad-8b95-a19501b6674e'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'def4257c-bc43-4beb-82e5-acc6d4315928'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '4565b055-1364-4315-91e8-752779844376'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '6e493dd9-4e37-4f5a-b72c-9408f1e3d242'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b52a3641-2f73-423f-ba09-e1dd7c9119db'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '66abdbd1-262d-451a-babf-b1d001f8c2aa'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '9ddda6f0-0729-4414-81ec-baad28814399'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '445ca4af-6507-479e-b225-5e7d9adc1e29'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '67c5f6ce-50f2-4c62-8360-9403ec127f64'),
(16, 'craft', 'm151209_000000_move_logo', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '02a859be-3904-4c49-a638-a28d252790c5'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '8c0d3fb9-814d-4874-84f2-c424ba38c7ac'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b05f62c5-e5a8-4a7e-983d-a87ee1883778'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '40a272e7-fc88-4707-abde-5f285a070776'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '7e501872-e899-45ac-8300-ba7e8cab6fd0'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '70bcfe93-97a5-430e-8523-27f933d045d1'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'e33996bd-66ae-4873-9050-e98c581dc403'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '384667c4-6a29-4dcd-a06f-d9c641bf9d98'),
(24, 'craft', 'm160807_144858_sites', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '027e8b99-ccc4-4489-9117-6af854437f17'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '225f9b8d-9461-4cef-84fa-2b1e84013133'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '57f68d62-e0a1-4a14-b3e1-63b7fce89a01'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '08ff0243-ebb6-4075-b2d8-f79252493569'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '92cd5b2e-c5f6-4376-8b9d-cbddc5b0405f'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '6de0e3cb-7637-47c8-a585-8480c59082dc'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'c19e88e0-72e6-4086-a157-661b9c7ea33f'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '555c1bab-bf1d-4f0e-8adc-2ce3bd858f35'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b35ed99e-68ad-4511-9489-51fba34e24d2'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '88ab8bc2-6fe4-4b26-897b-5c028c8aba2f'),
(34, 'craft', 'm161013_175052_newParentId', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ee2f2f50-2531-485f-b593-40a7ff33b34c'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'd7426975-81a0-4e19-b387-3d4a979c1301'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '382bad73-2498-4c05-b66b-b2bcd24bf826'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '33b5689e-81d1-4174-b4ed-9c6f25400cb6'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '58dee7d2-8a89-4efb-95f0-171197bb2f61'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '30b30244-790c-40b4-95bd-5e057ed5bf3c'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '885e5041-5565-41a1-a600-411e6a1d31e6'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '8646110c-6bf2-413b-a348-4d2c485736fb'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'cfdb03fd-fb95-476e-a296-b81cbccb800b'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '828557b4-7764-45e4-8741-76e1924d1abc'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '8ff95afe-878f-499c-8020-8478cd548302'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '4f6b27e4-ff0a-48af-a00f-dce07533a8aa'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '94d7fe53-6ecf-48b1-a5a9-7f954f33c76d'),
(47, 'craft', 'm170206_142126_system_name', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'fda90da7-88f5-4278-afc5-8a3a66643f1a'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '021c97e9-e6c8-40c5-9b35-46dcdd03621f'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '0a1d83c9-7c0f-4e74-a29e-53776dcb92e7'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '9fea2629-daa1-48b2-9707-e032f3a920ed'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '97f2a5aa-9f6a-42cd-ba91-36360b6f8b64'),
(52, 'craft', 'm170228_171113_system_messages', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'd3b7a865-a6a4-4944-8698-7d1217aebcf7'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '7dd3442f-a151-4885-acd4-e010343508fd'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '29d75670-91b6-4c56-94ee-18becbd3a997'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '123910a8-ea7d-4687-b94f-b12cf427d876'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '858ada0a-76f2-4575-bfc8-b2a143aeb08f'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '51f0cf96-4dfe-437a-8090-eb58007d86c4'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '07407820-f26d-4dba-8516-d3d3f739a71d'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b8fd1ad2-d04e-4f5d-bcfb-c1b2c277b0cf'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f032e757-097a-4645-889d-31398a2c0bf5'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '0b6e5bd7-cff4-47f7-9591-8853e45d22d2'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '244924f8-9e9c-4d10-ad2b-869ea6e61acf'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '5d380a19-8018-4bb5-9012-d38bf1834cdb'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ba6bf4b1-34cc-4224-87d0-5d5418faa8d8'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b69c6dce-8f7f-422f-a272-3e2614ec0df6'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '237237ad-1f85-4c16-95ac-a61b6292fac8'),
(67, 'craft', 'm171011_214115_site_groups', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'd22ed060-b676-43d1-a583-7b1e416a011a'),
(68, 'craft', 'm171012_151440_primary_site', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '999c85ee-42fe-4e48-a27e-85ee2c6fe14e'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2728c5e5-2681-44a5-9831-99bb5048ea9c'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '29c44389-d7f6-4b41-a614-429897bbd6cf'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f4022ad4-c28b-44ae-aaad-e7bf1684870c'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ea8300ee-c863-496a-9df6-08553ba195e7'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '58017dc9-5766-4f5d-8792-03e6a3ed246d'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '4d3cfae4-32bd-4892-a477-7e53c40d1671'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'c7f02fbe-09f8-4cee-8f34-28c95aaab7b2'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'dab28f7b-5cab-41bc-8cd1-360facb93751'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2bb584ce-a95a-4bfb-9638-48fa6ae9b1d7'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '134e78d9-3ec6-462f-8811-91711c725cba'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'd1222eac-b7e4-4171-8122-1f3b614a6ee1'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '60f50ee0-fd2b-47ba-a630-20cb1ecb0c04'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'c247bc60-4969-42fd-bb34-b002c37695bc'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2db0a5a4-3143-45d9-a267-6f2d5e78d804'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '73fd3d17-f276-4a65-8837-10627e7afbf5'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '633b2201-c127-4c56-b59f-c20b5bd316e5'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'bad3420f-cef0-4b21-9155-f2a6487e4c53'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2878bd49-1273-40e1-a7a6-397162852d1d'),
(87, 'craft', 'm180321_233505_small_ints', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ed75e9d2-96f0-4236-a0b0-b10a26d2f694'),
(88, 'craft', 'm180328_115523_new_license_key_statuses', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '757ce3e3-4f55-411e-92d0-1f9d4273cd3c'),
(89, 'craft', 'm180404_182320_edition_changes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '90c84019-d087-4a47-9708-170cb0203630'),
(90, 'craft', 'm180411_102218_fix_db_routes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '86b5b799-7674-442b-80fc-8ef6964bfbdc'),
(91, 'craft', 'm180416_205628_resourcepaths_table', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '51aec2ed-7097-4a49-a7a6-8d34b94ca426'),
(92, 'craft', 'm180418_205713_widget_cleanup', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'e8993030-b0a8-4d36-b5eb-82a2c6c304fb'),
(93, 'craft', 'm180425_203349_searchable_fields', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b56a1106-8500-43e3-91c7-357f47103b0d'),
(94, 'craft', 'm180516_153000_uids_in_field_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '4e406091-cc08-420f-b0da-402d60531f70'),
(95, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'c0d3a53a-5098-4128-a320-4b21ab2a9b67'),
(96, 'craft', 'm180518_173000_permissions_to_uid', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '4c7e93a6-4538-4263-b364-3b3c63f908a3'),
(97, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f6179d9e-6b4f-4573-ab8c-3f40e2673237'),
(98, 'craft', 'm180521_172900_project_config_table', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '69fe557b-b9dc-4112-a19a-02b42baa4e6c'),
(99, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '4ba0b7e3-fc1d-456f-af5f-c249fe7ed1c3'),
(100, 'craft', 'm180731_162030_soft_delete_sites', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '1c02f4e7-337a-4422-af89-a1382e44ce86'),
(101, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'a04fea71-d06e-4295-be1b-4c3b0352cddd'),
(102, 'craft', 'm180810_214439_soft_delete_elements', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f942c1a8-b691-446d-b121-8bd5d64e0d66'),
(103, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f0111815-6e26-47b9-82c9-2e2a6d489028'),
(104, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'd1954e64-871b-4eb9-9c0c-5a70c4c58ba6'),
(105, 'craft', 'm180904_112109_permission_changes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ad4c41aa-777c-4d2e-ae69-c0ae92588208'),
(106, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '3a23373d-639a-41f4-adc6-7445289eeb41'),
(107, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '81e6c5e3-a161-423f-bf6e-08b61a9f9eee'),
(108, 'craft', 'm181016_183648_set_default_user_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '898cba99-fbe2-45b0-a1cb-14bc83ec447d'),
(109, 'craft', 'm181017_225222_system_config_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'dc884ee0-5f9a-45d2-afb8-d493fc93656f'),
(110, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f635718e-94fd-4e35-bc4b-2418454b1cd7'),
(111, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '6ee39e8e-1d34-438c-a7d7-dcb02beb8f19'),
(112, 'craft', 'm181112_203955_sequences_table', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '895926a1-7f72-444d-ae91-a68dbb6adf91'),
(113, 'craft', 'm181121_001712_cleanup_field_configs', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '0b12dbe5-6d12-4b5c-8ff4-9015e47a872b'),
(114, 'craft', 'm181128_193942_fix_project_config', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '9579f5ee-036e-4051-a630-6b540781dc8c'),
(115, 'craft', 'm181130_143040_fix_schema_version', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ebff904f-226c-43e3-87ed-82d1c3f865e1'),
(116, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ae66f432-7ee5-4e76-ac09-ffae75030929'),
(117, 'craft', 'm181217_153000_fix_structure_uids', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '75e4fc6a-fab6-4d6a-80f5-72a3bc390bd0'),
(118, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2abfa7b0-0e15-4156-90e3-eb181b1110b8'),
(119, 'craft', 'm190108_110000_cleanup_project_config', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '0be9f4f3-e311-4544-a0d1-28c776e1c2ac'),
(120, 'craft', 'm190108_113000_asset_field_setting_change', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '5084030b-bc66-4e3e-9391-9489c9908386'),
(121, 'craft', 'm190109_172845_fix_colspan', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '35135520-fef9-4318-bf3b-eb5ffa2d9350'),
(122, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'c15dd951-6caa-498f-a1e3-0a1d3a1cb35a'),
(123, 'craft', 'm190110_214819_soft_delete_volumes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '160386de-ad28-4bf3-bad7-f4cf6c7236cc'),
(124, 'craft', 'm190112_124737_fix_user_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ea49b488-6dd9-491c-988f-fe657c421091'),
(125, 'craft', 'm190112_131225_fix_field_layouts', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b62f8c94-fa39-448f-8bc3-22b016be920b'),
(126, 'craft', 'm190112_201010_more_soft_deletes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'cc8fd535-ffa0-4bc0-96b0-84495425f488'),
(127, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '500f3c09-c349-43fa-8cc8-f7d6a8c65573'),
(128, 'craft', 'm190121_120000_rich_text_config_setting', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f86e784c-d2a0-4377-80fa-3e2a64de71a1'),
(129, 'craft', 'm190125_191628_fix_email_transport_password', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'e847fc62-c085-46f9-9717-4e8a30c78fe4'),
(130, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '27dc8944-ce5a-420b-b33a-7985a7067244'),
(131, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '70d1762b-8ab3-4181-8ee6-4119c6f62e4f'),
(132, 'craft', 'm190218_143000_element_index_settings_uid', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '74cb5f7b-a674-47ce-bf75-c90a27c2cdf9'),
(133, 'craft', 'm190312_152740_element_revisions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f8637516-7731-4bc3-b992-e893978742a3'),
(134, 'craft', 'm190327_235137_propagation_method', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'e80edda9-7ddb-48fb-91d2-e29ceb61913b'),
(135, 'craft', 'm190401_223843_drop_old_indexes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '56d09405-bf17-445b-b5b2-36b54acf9dcb'),
(136, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '7ec9f817-be0f-45e4-8340-2c15612792dc'),
(137, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '9b0266a1-8085-4dae-b1e2-581f3669e4e3'),
(138, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2adfe49e-254d-4647-9e9c-28d5c47a54ec'),
(139, 'craft', 'm190504_150349_preview_targets', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '37c73342-6b6b-4b7b-8598-c664a301aa7f'),
(140, 'craft', 'm190516_184711_job_progress_label', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '1ebb8dcd-8a2d-47cd-8ac6-b0e382c139b7'),
(141, 'craft', 'm190523_190303_optional_revision_creators', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '641eeebe-f428-4366-a125-ce39a32f2bba'),
(142, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '3a33633f-c37e-4713-b818-2b71a2b0e40d'),
(143, 'craft', 'm190605_223807_unsaved_drafts', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'bdd67abc-7e15-4caf-87dc-d37bcb5a12fc'),
(144, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '798e36af-3804-4093-bd57-bc5fba3fdc7d'),
(145, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b9e955f0-b73c-4e00-97fc-3b162c47dfe3'),
(146, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f33e5fcf-4dd9-458a-a01b-bc688cd2c7be'),
(147, 'craft', 'm190624_234204_matrix_propagation_method', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'a795aa82-b435-4e7d-9fae-23ad7e4e8a08'),
(148, 'craft', 'm190711_153020_drop_snapshots', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '8b6db4da-5735-4a73-9336-41db878c7a89'),
(149, 'craft', 'm190712_195914_no_draft_revisions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '912f58b8-534e-4a98-b2dc-03ce6cc6bc8c'),
(150, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '766cfdd3-d5f3-4733-b184-de6f83fef90d'),
(151, 'craft', 'm190820_003519_flush_compiled_templates', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '63c5107f-4c86-460c-b48c-4eeb2d4b060f'),
(152, 'craft', 'm190823_020339_optional_draft_creators', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '161be9b7-d2a5-49bb-aed6-0631fa457c85'),
(153, 'craft', 'm190913_152146_update_preview_targets', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'a700c3d6-541c-4d02-b7a1-d5e630456768'),
(154, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '66d319d6-0252-4103-b74d-52653b25f083'),
(155, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '3978f0e4-e3ba-4ae2-ac15-ae9d564e7ad9'),
(156, 'craft', 'm191206_001148_change_tracking', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '475cd204-176a-4998-9298-9bf7af328b31'),
(157, 'craft', 'm191216_191635_asset_upload_tracking', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'a5eff654-6eef-41cd-bfd8-f27d3d9bc7a0'),
(158, 'craft', 'm191222_002848_peer_asset_permissions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2b5c169d-7d01-496c-87fb-1d3e10d3f09e'),
(159, 'craft', 'm200127_172522_queue_channels', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '36f48b57-c1a1-42f9-aff4-fb691c5388dc'),
(160, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'bc670b8d-21ca-46b6-925b-1d15d1032b62'),
(161, 'craft', 'm200213_172522_new_elements_index', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b3825c13-06ae-4109-991a-600abd4ce47d'),
(162, 'craft', 'm200228_195211_long_deprecation_messages', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'a798f3d7-1112-42f8-abe8-24f7d6f9cc8a'),
(163, 'craft', 'm200306_054652_disabled_sites', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '7e4bea49-4539-4753-af0e-ae3bcaf5a40e'),
(164, 'craft', 'm200522_191453_clear_template_caches', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'eda7276e-8d0c-40ae-a01d-c9efb6093d15'),
(165, 'craft', 'm200606_231117_migration_tracks', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '38947f57-50ee-47e4-8d1a-c69d83ff8f77'),
(166, 'craft', 'm200619_215137_title_translation_method', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'ab97c4ea-7161-4302-ab50-22a2f1791205'),
(167, 'craft', 'm200620_005028_user_group_descriptions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'fdde5b69-3f71-424d-b469-fb0e110c53d4'),
(168, 'craft', 'm200620_230205_field_layout_changes', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '4d79e01c-b3ee-422d-982d-13a777d33f3b'),
(169, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'cbc856ea-9fe7-4917-9f3d-c65ad5fe68c4'),
(170, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'aba45622-f1e7-4c6b-b26e-ff2e12700768'),
(171, 'craft', 'm200630_183000_drop_configmap', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '68b467d3-9858-446f-8637-a8a1c7f47b5f'),
(172, 'craft', 'm200715_113400_transform_index_error_flag', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'b1b6acaa-6c22-4066-a6ce-b2f47efda8dd'),
(173, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '0d938c46-2fef-4141-8d98-e75b177e1ca8'),
(174, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f0e6d661-27a9-44c7-ac30-2906049acd0d'),
(175, 'craft', 'm200720_175543_drop_unique_constraints', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '09192a25-4178-439c-b362-41a34460f027'),
(176, 'craft', 'm200825_051217_project_config_version', '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-11 20:06:58', 'f9f6d6f6-518b-4c43-ae34-25493edacb1f');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
CREATE TABLE IF NOT EXISTS `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('assets.tempVolumeUid', '\"8403cece-ffd6-4601-8d95-cbe0f57885cf\"'),
('dateModified', '1611669318'),
('email.fromEmail', '\"ljubojevic.dario@gmail.com\"'),
('email.fromName', '\"craftcmsfinal\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.class', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.disabled', 'false'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.id', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.instructions', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.label', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.max', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.min', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.name', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.orientation', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.readonly', 'false'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.requirable', 'false'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.size', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.step', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.tip', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.title', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.warning', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.0.width', '100'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.1.fieldUid', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.1.instructions', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.1.label', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.1.required', 'false'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.1.tip', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.1.warning', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.elements.1.width', '100'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.name', '\"Content\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.fieldLayouts.b420e80f-c77a-45e4-8d4f-80dd2a78b801.tabs.0.sortOrder', '1'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.handle', '\"video\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.hasTitleField', 'true'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.name', '\"Video\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.section', '\"98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.sortOrder', '1'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.titleTranslationKeyFormat', 'null'),
('entryTypes.458ad073-9b47-49a3-9570-dc44709fb834.titleTranslationMethod', '\"site\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.class', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.disabled', 'false'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.id', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.instructions', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.label', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.max', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.min', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.name', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.orientation', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.readonly', 'false'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.requirable', 'false'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.size', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.step', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.tip', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.title', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.warning', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.0.width', '100'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.1.fieldUid', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.1.instructions', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.1.label', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.1.required', 'false'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.1.tip', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.1.warning', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.1.width', '100'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.2.fieldUid', '\"de8b3417-1472-4cac-84ea-7a5b9f6cc2b1\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.2.instructions', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.2.label', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.2.required', 'false'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.2.tip', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.2.warning', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.elements.2.width', '100'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.name', '\"Content\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.fieldLayouts.23e6035c-a523-4b46-a570-149bba25b17f.tabs.0.sortOrder', '1'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.handle', '\"home\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.hasTitleField', 'false'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.name', '\"Home\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.section', '\"25f059e4-b94c-4f83-a006-2e5662480d60\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.sortOrder', '1'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.titleTranslationKeyFormat', 'null'),
('entryTypes.748420e2-0a24-43a1-99af-4c1fdb3ae084.titleTranslationMethod', '\"site\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.class', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.disabled', 'false'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.id', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.instructions', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.label', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.max', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.min', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.name', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.orientation', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.readonly', 'false'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.requirable', 'false'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.size', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.step', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.tip', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.title', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.warning', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.0.width', '100'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.1.fieldUid', '\"438e98f8-8729-42fb-98fd-133f1230e979\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.1.instructions', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.1.label', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.1.required', 'false'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.1.tip', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.1.warning', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.1.width', '100'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.2.fieldUid', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.2.instructions', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.2.label', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.2.required', 'false'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.2.tip', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.2.warning', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.elements.2.width', '100'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.name', '\"Content\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.fieldLayouts.3726f9ed-8f87-4e9f-bc43-84056b999e49.tabs.0.sortOrder', '1'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.handle', '\"novac\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.hasTitleField', 'true'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.name', '\"Novac\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.section', '\"4055508f-6675-45f7-90bf-4d3c93433896\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.sortOrder', '1'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.titleTranslationKeyFormat', 'null'),
('entryTypes.85de7c9c-8515-40cd-8723-e8e342ff1867.titleTranslationMethod', '\"site\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.class', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.disabled', 'false'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.id', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.instructions', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.label', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.max', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.min', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.name', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.orientation', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.readonly', 'false'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.requirable', 'false'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.size', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.step', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.tip', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.title', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.warning', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.0.width', '100'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.1.fieldUid', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.1.instructions', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.1.label', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.1.required', 'false'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.1.tip', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.1.warning', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.elements.1.width', '100'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.name', '\"Content\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.fieldLayouts.d94a8b8e-151f-47e8-8d18-58020162e9e3.tabs.0.sortOrder', '1'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.handle', '\"vijesti\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.hasTitleField', 'true'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.name', '\"Vijesti\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.section', '\"9b32921a-a2af-43c8-91a3-c42c06af20ed\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.sortOrder', '1'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.titleTranslationKeyFormat', 'null'),
('entryTypes.c656f7b7-6454-4b9e-b534-cefeb7d1efb6.titleTranslationMethod', '\"site\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.class', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.disabled', 'false'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.id', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.instructions', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.label', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.max', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.min', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.name', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.orientation', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.readonly', 'false'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.requirable', 'false'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.size', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.step', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.tip', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.title', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.warning', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.0.width', '100'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.1.fieldUid', '\"438e98f8-8729-42fb-98fd-133f1230e979\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.1.instructions', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.1.label', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.1.required', 'false'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.1.tip', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.1.warning', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.1.width', '100'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.2.fieldUid', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.2.instructions', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.2.label', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.2.required', 'false'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.2.tip', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.2.warning', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.elements.2.width', '100'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.name', '\"Content\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.fieldLayouts.8797999c-c837-4099-b555-3f4d7574eadd.tabs.0.sortOrder', '1'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.handle', '\"sport\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.hasTitleField', 'true'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.name', '\"Sport\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.section', '\"a82ce81e-a4b5-4d32-9016-3b26ecce792a\"'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.sortOrder', '1'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.titleFormat', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.titleTranslationKeyFormat', 'null'),
('entryTypes.e1bfc695-195f-482e-9d87-dc7ba832902b.titleTranslationMethod', '\"site\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.class', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.disabled', 'false'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.id', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.instructions', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.label', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.max', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.min', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.name', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.orientation', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.readonly', 'false'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.requirable', 'false'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.size', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.step', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.tip', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.title', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.warning', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.0.width', '100'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.1.fieldUid', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.1.instructions', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.1.label', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.1.required', 'false'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.1.tip', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.1.warning', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.elements.1.width', '100'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.name', '\"Content\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.fieldLayouts.c6aab630-54f8-4e42-9abc-a1976ce4ce74.tabs.0.sortOrder', '1'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.handle', '\"kultura\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.hasTitleField', 'true'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.name', '\"Kultura\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.section', '\"09218a53-a687-45a6-be95-6adce64d1e32\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.sortOrder', '1'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.titleTranslationKeyFormat', 'null'),
('entryTypes.ebc79330-87df-4fc8-82cc-8bb666acb5dd.titleTranslationMethod', '\"site\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.class', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.disabled', 'false'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.id', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.instructions', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.label', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.max', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.min', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.name', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.orientation', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.readonly', 'false'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.requirable', 'false'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.size', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.step', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.tip', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.title', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.warning', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.0.width', '100'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.1.fieldUid', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.1.instructions', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.1.label', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.1.required', 'false'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.1.tip', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.1.warning', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.elements.1.width', '100'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.name', '\"Content\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.fieldLayouts.3339cc72-7b5d-4e63-b523-9face3133f3b.tabs.0.sortOrder', '1'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.handle', '\"scena\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.hasTitleField', 'true'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.name', '\"Scena\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.section', '\"f0a648ec-6eb2-46ff-94ee-ec503157072f\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.sortOrder', '1'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.titleTranslationKeyFormat', 'null'),
('entryTypes.fde76035-f6c0-4de9-bc92-c106c75236d5.titleTranslationMethod', '\"site\"'),
('fieldGroups.bd70741b-507a-465d-8142-f42a02ec16c3.name', '\"Content Builder\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.contentColumnType', '\"string(1200)\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.fieldGroup', '\"bd70741b-507a-465d-8142-f42a02ec16c3\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.handle', '\"description\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.instructions', '\"\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.name', '\"Description\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.searchable', 'false'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.settings.byteLimit', 'null'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.settings.charLimit', '300'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.settings.code', '\"\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.settings.columnType', 'null'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.settings.initialRows', '\"4\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.settings.multiline', '\"1\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.settings.placeholder', '\"\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.settings.uiMode', '\"normal\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.translationKeyFormat', 'null'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.translationMethod', '\"none\"'),
('fields.438e98f8-8729-42fb-98fd-133f1230e979.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.contentColumnType', '\"string\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.fieldGroup', '\"bd70741b-507a-465d-8142-f42a02ec16c3\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.handle', '\"tekst\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.instructions', '\"\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.name', '\"Tekst\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.searchable', 'false'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.settings.contentTable', '\"{{%matrixcontent_tekst}}\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.settings.maxBlocks', '\"\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.settings.minBlocks', '\"\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.settings.propagationMethod', '\"all\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.translationKeyFormat', 'null'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.translationMethod', '\"site\"'),
('fields.4d4e15c8-02ad-476e-ba7d-891aa65cdfb4.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.contentColumnType', '\"string\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.fieldGroup', '\"bd70741b-507a-465d-8142-f42a02ec16c3\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.handle', '\"modules\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.instructions', '\"\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.name', '\"HomeModules\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.searchable', 'false'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.settings.contentTable', '\"{{%matrixcontent_modules}}\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.settings.maxBlocks', '\"\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.settings.minBlocks', '\"\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.settings.propagationMethod', '\"all\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.translationKeyFormat', 'null'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.translationMethod', '\"site\"'),
('fields.7b08d9ba-8697-43f3-a5a6-c077601b74e4.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.contentColumnType', '\"string\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.fieldGroup', '\"bd70741b-507a-465d-8142-f42a02ec16c3\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.handle', '\"navigation\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.instructions', '\"\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.name', '\"Navigation\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.searchable', 'false'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.settings.contentTable', '\"{{%matrixcontent_navigation}}\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.settings.maxBlocks', '\"\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.settings.minBlocks', '\"\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.settings.propagationMethod', '\"all\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.translationKeyFormat', 'null'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.translationMethod', '\"site\"'),
('fields.c54876c6-2a9b-4883-87d8-98647d6f9bfe.type', '\"craft\\\\fields\\\\Matrix\"'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.elements.0.fieldUid', '\"c54876c6-2a9b-4883-87d8-98647d6f9bfe\"'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.elements.0.instructions', 'null'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.elements.0.label', 'null'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.elements.0.required', 'false'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.elements.0.tip', 'null'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.elements.0.warning', 'null'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.elements.0.width', '100'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.name', '\"content\"'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.fieldLayouts.9bdc41bb-15c3-4b91-9e8b-70465daf1018.tabs.0.sortOrder', '1'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.handle', '\"header\"'),
('globalSets.8e0f1edb-a680-448c-a619-c02956810275.name', '\"Header\"'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.format', 'null'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.handle', '\"imagetransform\"'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.height', '700'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.interlace', '\"none\"'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.mode', '\"fit\"'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.name', '\"ImageTransform\"'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.position', '\"center-center\"'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.quality', 'null'),
('imageTransforms.c20bf755-3d14-44df-9305-47b9c0f8ff3d.width', '700'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.field', '\"4d4e15c8-02ad-476e-ba7d-891aa65cdfb4\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.elements.0.fieldUid', '\"26fc1153-6823-4eb9-bebb-978cbe27b950\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fieldLayouts.0aaa4311-8133-4c9c-b2eb-6d0b76d56ca3.tabs.0.sortOrder', '1'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.contentColumnType', '\"text\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.fieldGroup', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.handle', '\"text\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.instructions', '\"\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.name', '\"Text\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.searchable', 'false'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.settings.byteLimit', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.settings.charLimit', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.settings.code', '\"\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.settings.columnType', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.settings.initialRows', '\"4\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.settings.multiline', '\"\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.settings.placeholder', '\"\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.translationKeyFormat', 'null'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.translationMethod', '\"none\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.fields.26fc1153-6823-4eb9-bebb-978cbe27b950.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.handle', '\"text\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.name', '\"Text\"'),
('matrixBlockTypes.50c817b7-49ef-44b4-87dc-bd04b97732ab.sortOrder', '1'),
('matrixBlockTypes.63f04a1d-1669-4283-b022-4ec8d8efd608.field', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('matrixBlockTypes.63f04a1d-1669-4283-b022-4ec8d8efd608.handle', '\"moduleImage\"'),
('matrixBlockTypes.63f04a1d-1669-4283-b022-4ec8d8efd608.name', '\"Module Image\"'),
('matrixBlockTypes.63f04a1d-1669-4283-b022-4ec8d8efd608.sortOrder', '3'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.field', '\"c54876c6-2a9b-4883-87d8-98647d6f9bfe\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.0.fieldUid', '\"30dcd176-499b-4431-9d06-78cd8b558e02\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.1.fieldUid', '\"86f68485-0588-486d-b115-4086c3d18cf6\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.1.required', 'true'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fieldLayouts.aed07ede-d287-47ab-b983-32a710737666.tabs.0.sortOrder', '1'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.contentColumnType', '\"text\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.fieldGroup', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.handle', '\"linkText\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.instructions', '\"\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.name', '\"Link text\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.searchable', 'false'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.settings.byteLimit', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.settings.charLimit', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.settings.code', '\"\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.settings.columnType', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.settings.initialRows', '\"4\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.settings.multiline', '\"\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.settings.placeholder', '\"\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.translationKeyFormat', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.translationMethod', '\"none\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.30dcd176-499b-4431-9d06-78cd8b558e02.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.contentColumnType', '\"string\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.fieldGroup', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.handle', '\"linkDestination\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.instructions', '\"\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.name', '\"link destination\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.searchable', 'false'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.limit', '\"1\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.localizeRelations', 'false'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.showSiteMenu', 'false'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.source', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.sources', '\"*\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.targetSiteId', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.settings.viewMode', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.translationKeyFormat', 'null'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.translationMethod', '\"site\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.fields.86f68485-0588-486d-b115-4086c3d18cf6.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.handle', '\"navLink\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.name', '\"nav link\"'),
('matrixBlockTypes.68f3f84f-6b95-4e52-8928-00d86023001f.sortOrder', '1'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.field', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.elements.0.fieldUid', '\"f4dacd60-b276-42ca-8a57-ae12ad7878c2\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fieldLayouts.c142f187-f1a8-4cb4-93e8-df12f3ceaac0.tabs.0.sortOrder', '1'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.contentColumnType', '\"text\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.fieldGroup', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.handle', '\"moduleText\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.instructions', '\"\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.name', '\"Module Text\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.searchable', 'false'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.settings.byteLimit', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.settings.charLimit', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.settings.code', '\"\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.settings.columnType', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.settings.initialRows', '\"4\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.settings.multiline', '\"1\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.settings.placeholder', '\"\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.translationKeyFormat', 'null'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.translationMethod', '\"none\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.fields.f4dacd60-b276-42ca-8a57-ae12ad7878c2.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.handle', '\"moduleText\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.name', '\"Module Text\"'),
('matrixBlockTypes.baa3801b-9cd4-4067-a246-3550b15427f7.sortOrder', '1'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.field', '\"7b08d9ba-8697-43f3-a5a6-c077601b74e4\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.elements.0.fieldUid', '\"f7ad1b46-5c28-4483-b2c8-d63838ed2355\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fieldLayouts.e455c87a-2fa3-4958-a220-44334c899bf8.tabs.0.sortOrder', '1'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.contentColumnType', '\"text\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.fieldGroup', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.handle', '\"moduleVideo\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.instructions', '\"\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.name', '\"Module Video\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.searchable', 'false'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.settings.byteLimit', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.settings.charLimit', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.settings.code', '\"\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.settings.columnType', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.settings.initialRows', '\"4\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.settings.multiline', '\"\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.settings.placeholder', '\"\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.translationKeyFormat', 'null'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.translationMethod', '\"none\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.fields.f7ad1b46-5c28-4483-b2c8-d63838ed2355.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.handle', '\"moduleVideo\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.name', '\"Module Video\"'),
('matrixBlockTypes.e3ecabf8-ac33-40d0-932c-e043196bf18d.sortOrder', '2'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.enableVersioning', 'true'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.handle', '\"kultura\"'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.name', '\"Kultura\"'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.propagationMethod', '\"all\"'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.enabledByDefault', 'true'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.hasUrls', 'true'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.template', '\"general\"'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.uriFormat', '\"kultura\"'),
('sections.09218a53-a687-45a6-be95-6adce64d1e32.type', '\"single\"'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.enableVersioning', 'true'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.handle', '\"home\"'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.name', '\"Home\"'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.propagationMethod', '\"all\"'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.enabledByDefault', 'true'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.hasUrls', 'true'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.template', '\"home\"'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.uriFormat', '\"__home__\"'),
('sections.25f059e4-b94c-4f83-a006-2e5662480d60.type', '\"single\"'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.enableVersioning', 'true'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.handle', '\"novac\"'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.name', '\"Novac\"'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.propagationMethod', '\"all\"'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.enabledByDefault', 'true'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.hasUrls', 'true'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.template', '\"general\"'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.uriFormat', '\"novac\"'),
('sections.4055508f-6675-45f7-90bf-4d3c93433896.type', '\"single\"'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.enableVersioning', 'true'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.handle', '\"video\"'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.name', '\"Video\"'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.propagationMethod', '\"all\"'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.enabledByDefault', 'true'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.hasUrls', 'true'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.template', '\"general\"'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.uriFormat', '\"video\"'),
('sections.98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3.type', '\"single\"'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.enableVersioning', 'true'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.handle', '\"vijesti\"'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.name', '\"Vijesti\"'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.propagationMethod', '\"all\"'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.enabledByDefault', 'true'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.hasUrls', 'true'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.template', '\"general\"'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.uriFormat', '\"vijesti\"'),
('sections.9b32921a-a2af-43c8-91a3-c42c06af20ed.type', '\"single\"'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.enableVersioning', 'true'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.handle', '\"sport\"'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.name', '\"Sport\"'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.propagationMethod', '\"all\"'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.enabledByDefault', 'true'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.hasUrls', 'true'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.template', '\"general\"'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.uriFormat', '\"sport\"'),
('sections.a82ce81e-a4b5-4d32-9016-3b26ecce792a.type', '\"single\"'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.enableVersioning', 'true'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.handle', '\"scena\"'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.name', '\"Scena\"'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.propagationMethod', '\"all\"'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.enabledByDefault', 'true'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.hasUrls', 'true'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.template', '\"general\"'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.siteSettings.5767ef54-af4c-422c-8628-8c8f024eef96.uriFormat', '\"scena\"'),
('sections.f0a648ec-6eb2-46ff-94ee-ec503157072f.type', '\"single\"'),
('siteGroups.b1692a26-5b78-421c-abc5-dbbf14cd6107.name', '\"craftcmsfinal\"'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.baseUrl', '\"@web\"'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.enabled', 'true'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.handle', '\"default\"'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.hasUrls', 'true'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.language', '\"en-US\"'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.name', '\"craftcmsfinal\"'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.primary', 'true'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.siteGroup', '\"b1692a26-5b78-421c-abc5-dbbf14cd6107\"'),
('sites.5767ef54-af4c-422c-8628-8c8f024eef96.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"craftcmsfinal\"'),
('system.schemaVersion', '\"3.5.13\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.autocomplete', 'false'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.autocorrect', 'true'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.class', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.disabled', 'false'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.id', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.instructions', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.label', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.max', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.min', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.name', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.orientation', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.placeholder', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.readonly', 'false'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.requirable', 'false'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.size', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.step', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.tip', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.title', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.warning', 'null'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.elements.0.width', '100'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.name', '\"Content\"'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.fieldLayouts.6751c6d2-1a40-40bb-a02a-2f5dcef76903.tabs.0.sortOrder', '1'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.handle', '\"webImages\"'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.hasUrls', 'true'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.name', '\"Web images\"'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.settings.path', '\"@webroot/assets/images\"'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.sortOrder', '1'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.8403cece-ffd6-4601-8d95-cbe0f57885cf.url', '\"@web/assets/images\"');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
CREATE TABLE IF NOT EXISTS `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 23, 252, NULL, 235, 1, '2021-01-23 14:27:19', '2021-01-23 14:27:19', 'efc41062-72ee-4fb9-91d5-8f1bffa911a6'),
(10, 23, 262, NULL, 235, 1, '2021-01-23 15:36:01', '2021-01-23 15:36:01', '470a9688-6d66-4c74-b471-868a85362a07'),
(14, 23, 266, NULL, 235, 1, '2021-01-23 15:36:01', '2021-01-23 15:36:01', 'e726ba13-b27b-4b79-a34b-9aec61b10ae6'),
(15, 23, 267, NULL, 235, 1, '2021-01-23 15:37:01', '2021-01-23 15:37:01', '48fa6a2c-1da0-402f-aa2e-0a2e1fc097f3'),
(19, 23, 253, NULL, 288, 1, '2021-01-24 20:48:25', '2021-01-24 20:48:25', '5e14002d-753a-42a7-88df-be56df8fbf47'),
(20, 23, 263, NULL, 303, 1, '2021-01-24 20:54:59', '2021-01-24 20:54:59', '75904ac1-8b55-4a78-8074-bd8bf09f7b39'),
(21, 23, 264, NULL, 322, 1, '2021-01-24 21:02:35', '2021-01-24 21:02:35', '45d796d7-44fc-4e46-afef-45bd265e6448'),
(22, 23, 265, NULL, 332, 1, '2021-01-24 21:02:35', '2021-01-24 21:02:35', '9b886a70-e539-4887-9b0b-a2eef69269d5');

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
CREATE TABLE IF NOT EXISTS `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('121fa3a9', '@craft/web/assets/editsection/dist'),
('13637f4b', '@lib/jquery-ui'),
('14c6ffbb', '@craft/web/assets/plugins/dist'),
('19b43f02', '@lib/axios'),
('345f9c77', '@lib/vue'),
('36773900', '@craft/web/assets/craftsupport/dist'),
('3ce01e0c', '@craft/web/assets/dbbackup/dist'),
('3e718ecd', '@craft/web/assets/login/dist'),
('41ed4b06', '@lib/jquery.payment'),
('49f07dd9', '@craft/web/assets/updates/dist'),
('4c451393', '@bower/jquery/dist'),
('4fa2cc73', '@craft/web/assets/deprecationerrors/dist'),
('5087e08f', '@craft/web/assets/editentry/dist'),
('5dcae4ee', '@lib/velocity'),
('63aba62d', '@craft/web/assets/routes/dist'),
('63d5b866', '@lib/element-resize-detector'),
('6febc1e3', '@craft/web/assets/matrixsettings/dist'),
('7021228f', '@craft/web/assets/dashboard/dist'),
('82de26e5', '@craft/web/assets/pluginstore/dist'),
('86d94d4e', '@craft/web/assets/installer/dist'),
('8ba51698', '@craft/web/assets/cp/dist'),
('91dbcf09', '@craft/web/assets/updateswidget/dist'),
('94910290', '@lib/selectize'),
('9620444', '@craft/web/assets/feed/dist'),
('96de7ff', '@craft/web/assets/edittransform/dist'),
('97bc43c', '@craft/web/assets/clearcaches/dist'),
('98f49b52', '@craft/web/assets/generalsettings/dist'),
('9c98ec50', '@craft/web/assets/fieldsettings/dist'),
('9efd461a', '@lib/xregexp'),
('a1021e6f', '@lib/timepicker'),
('a223724f', '@craft/web/assets/findreplace/dist'),
('a6a2cb38', '@craft/web/assets/updater/dist'),
('af618d67', '@craft/web/assets/recententries/dist'),
('c0ef2f14', '@lib/picturefill'),
('c5cd195f', '@lib/prismjs'),
('c74b13d6', '@lib/jquery-touch-events'),
('ce4a0f45', '@lib/d3'),
('cf8fbc71', '@craft/web/assets/sites/dist'),
('d1572e52', '@craft/web/assets/utilities/dist'),
('d4a411fd', '@lib/iframe-resizer'),
('d6b4d472', '@craft/web/assets/queuemanager/dist'),
('d8072eea', '@lib/fileupload'),
('d98cfa2b', '@craft/web/assets/matrix/dist'),
('e8b1ccfd', '@lib/fabric'),
('f16f3451', '@craft/web/assets/fields/dist'),
('f841cc84', '@craft/web/assets/admintable/dist'),
('fdf718c3', '@lib/garnishjs');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
CREATE TABLE IF NOT EXISTS `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 7, 1, 1, NULL),
(4, 7, 1, 2, ''),
(5, 11, 1, 1, NULL),
(6, 7, 1, 3, ''),
(7, 2, 1, 3, ''),
(8, 11, 1, 2, NULL),
(9, 11, 1, 3, NULL),
(10, 11, 1, 4, NULL),
(11, 18, 1, 1, NULL),
(12, 18, 1, 2, NULL),
(13, 18, 1, 3, ''),
(14, 18, 1, 4, ''),
(15, 18, 1, 5, ''),
(16, 18, 1, 6, ''),
(17, 18, 1, 7, ''),
(18, 18, 1, 8, ''),
(19, 18, 1, 9, NULL),
(20, 18, 1, 10, ''),
(21, 18, 1, 11, ''),
(22, 18, 1, 12, ''),
(23, 18, 1, 13, NULL),
(24, 102, 1, 1, NULL),
(25, 18, 1, 14, ''),
(26, 18, 1, 15, NULL),
(27, 18, 1, 16, ''),
(28, 18, 1, 17, NULL),
(29, 18, 1, 18, NULL),
(30, 18, 1, 19, ''),
(31, 18, 1, 20, ''),
(32, 122, 1, 1, NULL),
(33, 122, 1, 2, NULL),
(34, 125, 1, 1, NULL),
(35, 125, 1, 2, NULL),
(36, 122, 1, 3, NULL),
(37, 125, 1, 3, NULL),
(38, 122, 1, 4, NULL),
(39, 122, 1, 5, ''),
(40, 125, 1, 4, NULL),
(41, 125, 1, 5, ''),
(42, 122, 1, 6, NULL),
(43, 122, 1, 7, ''),
(44, 125, 1, 6, NULL),
(45, 125, 1, 7, ''),
(46, 171, 1, 1, NULL),
(47, 171, 1, 2, ''),
(48, 171, 1, 3, ''),
(49, 171, 1, 4, ''),
(50, 171, 1, 5, NULL),
(51, 171, 1, 6, NULL),
(52, 171, 1, 7, NULL),
(53, 171, 1, 8, NULL),
(54, 171, 1, 9, NULL),
(55, 171, 1, 10, NULL),
(56, 171, 1, 11, NULL),
(57, 171, 1, 12, NULL),
(58, 171, 1, 13, NULL),
(59, 171, 1, 14, NULL),
(60, 171, 1, 15, ''),
(61, 235, 1, 1, NULL),
(62, 235, 1, 2, NULL),
(63, 238, 1, 1, NULL),
(64, 238, 1, 2, NULL),
(65, 235, 1, 3, NULL),
(66, 238, 1, 3, NULL),
(67, 238, 1, 4, NULL),
(68, 235, 1, 4, NULL),
(69, 235, 1, 5, ''),
(70, 238, 1, 5, ''),
(71, 235, 1, 6, NULL),
(72, 235, 1, 7, ''),
(73, 235, 1, 8, NULL),
(74, 235, 1, 9, ''),
(75, 235, 1, 10, ''),
(76, 235, 1, 11, ''),
(77, 235, 1, 12, ''),
(78, 235, 1, 13, ''),
(79, 18, 1, 21, ''),
(80, 235, 1, 14, ''),
(81, 288, 1, 1, NULL),
(82, 235, 1, 15, NULL),
(83, 288, 1, 2, NULL),
(84, 235, 1, 16, NULL),
(85, 288, 1, 3, NULL),
(86, 288, 1, 4, ''),
(87, 303, 1, 1, NULL),
(88, 303, 1, 2, NULL),
(89, 303, 1, 3, NULL),
(90, 303, 1, 4, ''),
(91, 303, 1, 5, ''),
(92, 303, 1, 6, ''),
(93, 322, 1, 1, NULL),
(94, 322, 1, 2, NULL),
(95, 322, 1, 3, ''),
(96, 332, 1, 1, NULL),
(97, 332, 1, 2, NULL),
(98, 332, 1, 3, ''),
(99, 322, 1, 4, NULL),
(100, 322, 1, 5, NULL),
(101, 332, 1, 4, NULL),
(102, 332, 1, 5, ''),
(103, 322, 1, 6, ''),
(104, 303, 1, 7, NULL),
(105, 303, 1, 8, ''),
(106, 303, 1, 9, ''),
(107, 288, 1, 5, NULL),
(108, 288, 1, 6, ''),
(109, 288, 1, 7, ''),
(110, 303, 1, 10, NULL),
(111, 303, 1, 11, ''),
(112, 303, 1, 12, '');

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
CREATE TABLE IF NOT EXISTS `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' ljubojevic dario gmail com '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' hompage '),
(7, 'slug', 0, 1, ' my first blog '),
(2, 'title', 0, 1, ' hompage '),
(7, 'title', 0, 1, ' my first blog '),
(11, 'title', 0, 1, ' about '),
(11, 'slug', 0, 1, ' about '),
(18, 'title', 0, 1, ' home '),
(18, 'slug', 0, 1, ' home '),
(21, 'slug', 0, 1, ''),
(22, 'slug', 0, 1, ''),
(23, 'slug', 0, 1, ''),
(24, 'slug', 0, 1, ''),
(34, 'slug', 0, 1, ''),
(35, 'slug', 0, 1, ''),
(47, 'slug', 0, 1, ''),
(66, 'filename', 0, 1, ' slike jpg '),
(66, 'extension', 0, 1, ' jpg '),
(66, 'kind', 0, 1, ' image '),
(66, 'slug', 0, 1, ''),
(66, 'title', 0, 1, ' slike '),
(67, 'slug', 0, 1, ''),
(102, 'slug', 0, 1, ' vijesti '),
(102, 'title', 0, 1, ' vijesti '),
(103, 'slug', 0, 1, ''),
(106, 'filename', 0, 1, ' slike jpg '),
(106, 'extension', 0, 1, ' jpg '),
(106, 'kind', 0, 1, ' image '),
(106, 'slug', 0, 1, ''),
(106, 'title', 0, 1, ' slike '),
(109, 'slug', 0, 1, ''),
(118, 'slug', 0, 1, ''),
(122, 'title', 0, 1, ' about us '),
(122, 'slug', 0, 1, ' about us '),
(125, 'title', 0, 1, ' contact '),
(125, 'slug', 0, 1, ' contact '),
(131, 'slug', 0, 1, ''),
(135, 'slug', 0, 1, ''),
(140, 'slug', 0, 1, ''),
(144, 'slug', 0, 1, ''),
(145, 'slug', 0, 1, ''),
(146, 'slug', 0, 1, ''),
(171, 'title', 0, 1, ' vijesti '),
(172, 'slug', 0, 1, ''),
(173, 'slug', 0, 1, ''),
(174, 'slug', 0, 1, ''),
(171, 'slug', 0, 1, ' vijesti '),
(238, 'slug', 0, 1, ' video '),
(235, 'title', 0, 1, ' prvi smo usli na impresivno gradiliste silicijske doline u zagrebu '),
(238, 'title', 0, 1, ' video '),
(245, 'slug', 0, 1, ''),
(248, 'slug', 0, 1, ''),
(251, 'slug', 0, 1, ''),
(252, 'slug', 0, 1, ''),
(253, 'slug', 0, 1, ''),
(255, 'slug', 0, 1, ''),
(262, 'slug', 0, 1, ''),
(263, 'slug', 0, 1, ''),
(264, 'slug', 0, 1, ''),
(265, 'slug', 0, 1, ''),
(266, 'slug', 0, 1, ''),
(267, 'slug', 0, 1, ''),
(270, 'filename', 0, 1, ' ispitni rjesenje jpg '),
(270, 'extension', 0, 1, ' jpg '),
(270, 'kind', 0, 1, ' image '),
(270, 'slug', 0, 1, ''),
(270, 'title', 0, 1, ' ispitni rjesenje '),
(271, 'slug', 0, 1, ''),
(275, 'filename', 0, 1, ' ispitni rjesenje 2021 01 24 124425 jpg '),
(275, 'extension', 0, 1, ' jpg '),
(275, 'kind', 0, 1, ' image '),
(275, 'slug', 0, 1, ''),
(275, 'title', 0, 1, ' ispitni rjesenje '),
(284, 'slug', 0, 1, ''),
(288, 'title', 0, 1, ' barcelona pobjeduje i bez lionela messija mladi talent zabio prvijenac za katalonce '),
(235, 'slug', 0, 1, ' vijesti '),
(298, 'slug', 0, 1, ''),
(299, 'slug', 0, 1, ''),
(288, 'slug', 0, 1, ' sport '),
(303, 'title', 0, 1, ' u pet godina izgubili 4 5 milijardi dolara razmisljamo o izlasku s trzista pametnih telefona '),
(307, 'slug', 0, 1, ''),
(308, 'slug', 0, 1, ''),
(309, 'slug', 0, 1, ''),
(322, 'slug', 0, 1, ' kultura '),
(332, 'title', 0, 1, ' ornela vistica drasticno promijenila imidz usporeduju me s melanijom trump '),
(322, 'title', 0, 1, ' donedavno miljenik svijeta glazbe sada o njegovom novom albumu ne pise gotovo nitko '),
(325, 'slug', 0, 1, ''),
(326, 'slug', 0, 1, ''),
(327, 'slug', 0, 1, ''),
(332, 'slug', 0, 1, ' scena '),
(335, 'slug', 0, 1, ''),
(336, 'slug', 0, 1, ''),
(337, 'slug', 0, 1, ''),
(303, 'slug', 0, 1, ' novac ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Blog', 'blog', 'channel', 1, 'all', NULL, '2021-01-13 14:11:03', '2021-01-13 14:11:03', '2021-01-14 18:53:03', 'ef674676-504c-4d0a-bbcf-dbe1b54d085f'),
(2, NULL, 'Hompage', 'hompage', 'single', 1, 'all', NULL, '2021-01-13 14:11:50', '2021-01-13 14:11:50', '2021-01-14 18:53:01', 'a1e099ae-5886-430d-acc5-cd7de6722462'),
(3, 1, 'Pages', 'pages', 'structure', 1, 'all', NULL, '2021-01-13 19:44:10', '2021-01-13 19:44:10', '2021-01-14 18:53:05', 'dc0171e9-0f91-4077-af8e-ba0dcacd0cc0'),
(4, NULL, 'Home', 'home', 'single', 1, 'all', NULL, '2021-01-14 18:53:18', '2021-01-14 18:53:18', NULL, '25f059e4-b94c-4f83-a006-2e5662480d60'),
(5, NULL, 'Vijesti', 'vijesti', 'channel', 1, 'all', NULL, '2021-01-19 09:46:05', '2021-01-19 09:46:05', '2021-01-19 11:34:31', '9811df0d-125d-47c7-9e53-84e2f54ef1b8'),
(6, NULL, 'About Us', 'aboutUs', 'single', 1, 'all', NULL, '2021-01-19 13:16:11', '2021-01-19 13:16:11', '2021-01-23 13:36:04', 'ae80c80d-aebf-4c7a-a867-ecf59abd27fe'),
(7, NULL, 'Contact', 'contact', 'single', 1, 'all', NULL, '2021-01-19 13:16:46', '2021-01-19 13:16:46', '2021-01-23 13:36:06', '584f0a09-de0f-43f2-8934-9159c47a06ff'),
(8, NULL, 'Vijesti', 'vijesti', 'single', 1, 'all', NULL, '2021-01-20 19:50:48', '2021-01-20 20:06:09', '2021-01-23 13:36:08', '836ed357-cbef-466f-91bc-295e4db62990'),
(9, NULL, 'Vijesti', 'vijesti', 'single', 1, 'all', NULL, '2021-01-23 13:36:57', '2021-01-23 13:36:57', NULL, '9b32921a-a2af-43c8-91a3-c42c06af20ed'),
(10, NULL, 'Video', 'video', 'single', 1, 'all', NULL, '2021-01-23 13:39:55', '2021-01-23 13:39:55', NULL, '98d9dafd-0a7c-46dc-b221-be1ebcf6a1a3'),
(11, NULL, 'Sport', 'sport', 'single', 1, 'all', NULL, '2021-01-24 20:44:05', '2021-01-24 20:44:30', NULL, 'a82ce81e-a4b5-4d32-9016-3b26ecce792a'),
(12, NULL, 'Novac', 'novac', 'single', 1, 'all', NULL, '2021-01-24 20:52:44', '2021-01-24 20:52:44', NULL, '4055508f-6675-45f7-90bf-4d3c93433896'),
(13, NULL, 'Kultura', 'kultura', 'single', 1, 'all', NULL, '2021-01-24 20:56:34', '2021-01-24 20:56:34', NULL, '09218a53-a687-45a6-be95-6adce64d1e32'),
(14, NULL, 'Scena', 'scena', 'single', 1, 'all', NULL, '2021-01-24 20:58:54', '2021-01-24 20:58:54', NULL, 'f0a648ec-6eb2-46ff-94ee-ec503157072f');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
CREATE TABLE IF NOT EXISTS `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '{slug}', 'blog/_entry.twig', 1, '2021-01-13 14:11:03', '2021-01-13 14:11:03', 'a8d50a53-85b8-432b-8379-588fa748670a'),
(2, 2, 1, 1, '__home__', 'index.twig', 1, '2021-01-13 14:11:50', '2021-01-13 14:11:50', '480c1e75-6c2f-4f66-bcf7-9f882acf14fb'),
(3, 3, 1, 1, '{slug}', 'pages/_entry', 1, '2021-01-13 19:44:10', '2021-01-13 19:44:10', '2883165c-517d-4b92-940c-c63e6d40f4d5'),
(4, 4, 1, 1, '__home__', 'home', 1, '2021-01-14 18:53:18', '2021-01-19 12:08:38', '38b8ed78-ecd9-404e-8050-9513f3efa57b'),
(5, 5, 1, 1, 'vijesti/{slug}', 'vijesti', 1, '2021-01-19 09:46:06', '2021-01-19 09:50:04', '04a7a4a8-167f-4a41-866e-ec54711b2be5'),
(6, 6, 1, 1, 'about-us', 'general', 1, '2021-01-19 13:16:11', '2021-01-19 13:16:11', '5314216e-9060-4d74-82cd-5a9103585c6a'),
(7, 7, 1, 1, 'contact', 'Contact', 1, '2021-01-19 13:16:46', '2021-01-19 14:04:25', '612f6dc7-d771-41ee-8ef0-466bdc9470b4'),
(8, 8, 1, 1, 'vijesti.twig', 'vijesti', 1, '2021-01-20 19:50:48', '2021-01-20 20:22:26', '3ab653af-f4d8-48c4-a2a1-af12238d5103'),
(9, 9, 1, 1, 'vijesti', 'general', 1, '2021-01-23 13:36:57', '2021-01-23 13:36:57', '90e87959-11d4-421c-872b-c3431308860a'),
(10, 10, 1, 1, 'video', 'general', 1, '2021-01-23 13:39:55', '2021-01-23 13:39:55', 'e684a805-ea73-474f-a2eb-54f2ea071408'),
(11, 11, 1, 1, 'sport', 'general', 1, '2021-01-24 20:44:05', '2021-01-24 20:44:30', '84f708fa-4f75-401c-8960-be9422cb2e34'),
(12, 12, 1, 1, 'novac', 'general', 1, '2021-01-24 20:52:44', '2021-01-24 20:52:44', 'b4f3429e-9d7f-4ea9-aa61-259bb9a269aa'),
(13, 13, 1, 1, 'kultura', 'general', 1, '2021-01-24 20:56:34', '2021-01-24 20:56:34', 'bdbbf88b-c7b9-463c-89f5-5cca336456e7'),
(14, 14, 1, 1, 'scena', 'general', 1, '2021-01-24 20:58:54', '2021-01-24 20:58:54', '325c7a05-5880-4626-895d-f516124f2a6e');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
CREATE TABLE IF NOT EXISTS `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '-E8bqt0nLqP8z0wi67pZMomgsC-b6Fquh9FxiXemeXI9o0bY17XSyPyitbOdLffjH907ba-6aZM3FDwUV4mSOkiMsx3Scmzgai8o', '2021-01-11 20:13:11', '2021-01-11 20:14:56', 'b336e37a-2ecb-4495-8b6d-f7f53019fe7b'),
(2, 1, '8413NSmzJfF89b5JERvwEKByRUSf-kd4vyH4si-UUeJfyI2nQBmpYsE-QDckab3ugPdPY4N4sZEsQc7Vb1Dj1BPnvwazryX7bhDr', '2021-01-11 20:16:45', '2021-01-11 20:16:45', 'bfc6230e-90b7-4e27-9927-a197f1624474'),
(4, 1, 'i74ajWv8sfKEpSBwa_b9DJLeGNkCMJjvRq9pYBLFNeDfznYWTuFUzkhi8ydCW0kyeZz2ezeGIcWacToGTdevwhT0GnUUQSPMD1L0', '2021-01-13 19:21:02', '2021-01-13 20:19:43', '82537320-1d79-461e-938f-2a7c84d3b1ca'),
(5, 1, '_8nUCg2v3ioHTCFVxKu6D6s-ohRg3i_KY4EtAHrstvebVx9gT9CJEZAQBQ0U_5pG-BmF3peE0eXACVKVgSi3VpoSX_dUYaVsvKeQ', '2021-01-19 09:27:14', '2021-01-19 14:41:18', '2f178bd7-55e4-45cf-a750-a079e80e5dd8'),
(8, 1, '3eJKGShSjL_JR0Wpz_9Rd7XaFFiPRCoZb_J7EpcKP540V5UyUjTu8e-AAY27vPIecDi8xYA1XSe7Nc3WWmx5p80YGNb2cVwg6_bw', '2021-01-24 18:40:21', '2021-01-24 21:14:37', '3e917b97-3637-4c0b-b763-f7413dd917fc'),
(9, 1, 'c2q8CMEWZVSKKupG7HeqoAvfpDSNoQHIrmezuLrTxfeEq7cUz9iRRLKEpyvUNECM1sXDD49Nw4ixg5HnRlYtFvGvpMr1wRge84rP', '2021-01-25 13:56:56', '2021-01-25 14:23:42', '9b6fb936-a924-4e51-8afe-20c8e413b56e'),
(10, 1, 'wiRZEVYw8YAUZSSQbjc9ORiadlD7b09Hnj5TwDpDnAAV8LVvxhbxUzRo7qDNgd_kwSHBXhn-Ehz9p4QmYh4qFEcsVubJ8OhMW15K', '2021-01-26 11:41:17', '2021-01-26 14:03:18', 'c69d0881-e3ab-4d9f-89e3-1418ca149de7');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
CREATE TABLE IF NOT EXISTS `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
CREATE TABLE IF NOT EXISTS `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craftcmsfinal', '2021-01-11 20:06:57', '2021-01-11 20:06:57', NULL, 'b1692a26-5b78-421c-abc5-dbbf14cd6107');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'craftcmsfinal', 'default', 'en-US', 1, '@web', 1, '2021-01-11 20:06:57', '2021-01-23 16:32:40', NULL, '5767ef54-af4c-422c-8628-8c8f024eef96');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
CREATE TABLE IF NOT EXISTS `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 10, 0, '2021-01-13 19:46:48', '2021-01-14 18:53:05', '5487a02e-af2f-4037-b847-1393b68a3962'),
(4, 1, 12, 1, 8, 9, 1, '2021-01-13 19:47:09', '2021-01-14 18:53:05', 'dd07bdba-db42-4057-861e-0a9b22511ce1'),
(5, 1, 15, 1, 6, 7, 1, '2021-01-14 18:50:10', '2021-01-14 18:53:05', '1c73f230-f94f-4304-8cc7-9ea8a1af7dbd'),
(6, 1, 16, 1, 4, 5, 1, '2021-01-14 18:50:24', '2021-01-14 18:53:05', 'ade4b250-c479-4f59-a39c-470ea1e7315a'),
(7, 1, 17, 1, 2, 3, 1, '2021-01-14 18:50:36', '2021-01-14 18:53:05', 'b46dde89-6b15-4116-afb4-e9560bfef535');

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
CREATE TABLE IF NOT EXISTS `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, '2021-01-13 19:44:10', '2021-01-13 19:44:10', '2021-01-14 18:53:05', 'afba707f-a6a5-4172-a323-fdb3e470d9c5');

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
CREATE TABLE IF NOT EXISTS `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
CREATE TABLE IF NOT EXISTS `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
CREATE TABLE IF NOT EXISTS `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
CREATE TABLE IF NOT EXISTS `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
CREATE TABLE IF NOT EXISTS `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'cDYkjMDRfn7JJX9RH4GO2iyNExad41Wu', '[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":5,\"siteId\":1,\"draftId\":1,\"revisionId\":null}]', NULL, NULL, '2021-01-14 19:41:41', '2021-01-13 19:41:41', '2021-01-13 19:41:41', '08a87186-2a72-42b5-a2f1-a5356ea81351');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE IF NOT EXISTS `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usergroups_handle_idx` (`handle`),
  KEY `usergroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
CREATE TABLE IF NOT EXISTS `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE IF NOT EXISTS `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
CREATE TABLE IF NOT EXISTS `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
CREATE TABLE IF NOT EXISTS `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
CREATE TABLE IF NOT EXISTS `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'ljubojevic.dario@gmail.com', '$2y$13$ccp0aSjW/K6YCWbACaEiaugvswZ6j6hfds4JwPGNFj.rSiySS9krK', 1, 0, 0, 0, '2021-01-26 11:41:17', NULL, NULL, NULL, '2021-01-11 20:12:12', NULL, 1, NULL, NULL, NULL, 0, '2021-01-11 20:06:58', '2021-01-11 20:06:58', '2021-01-26 11:41:17', '31495592-0763-4c70-be50-129772419bb4');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
CREATE TABLE IF NOT EXISTS `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Web images', '', '2021-01-16 21:17:15', '2021-01-16 21:17:15', 'd9fc96f6-824b-4bd4-be64-78742f07701e'),
(2, NULL, NULL, 'Temporary source', NULL, '2021-01-16 21:18:18', '2021-01-16 21:18:18', 'b1a752f8-4bf4-44a8-a390-60b93c68d768'),
(3, 2, NULL, 'user_1', 'user_1/', '2021-01-16 21:18:18', '2021-01-16 21:18:18', 'a8ade532-6c72-40d1-96a0-3787ae1a8e73');

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
CREATE TABLE IF NOT EXISTS `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 9, 'Web images', 'webImages', 'craft\\volumes\\Local', 1, '@web/assets/images', '{\"path\":\"@webroot/assets/images\"}', 1, '2021-01-16 21:17:15', '2021-01-23 16:41:33', NULL, '8403cece-ffd6-4601-8d95-cbe0f57885cf');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2021-01-11 20:13:11', '2021-01-11 20:13:11', 'f435eff4-8e5d-47d9-8887-626305ba0abf'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-01-11 20:13:11', '2021-01-11 20:13:11', '158d8546-a4d0-4a87-b3e2-3f150ad80fe9'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-01-11 20:13:11', '2021-01-11 20:13:11', '946ac535-a76e-40a1-922b-f17720d7f540'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-01-11 20:13:11', '2021-01-11 20:13:11', '546d2b78-0a83-4406-a92b-28acc4fc8302');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixcontent_modules`
--
ALTER TABLE `matrixcontent_modules`
  ADD CONSTRAINT `matrixcontent_modules_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_modules_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_navigation`
--
ALTER TABLE `matrixcontent_navigation`
  ADD CONSTRAINT `matrixcontent_navigation_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_navigation_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_tekst`
--
ALTER TABLE `matrixcontent_tekst`
  ADD CONSTRAINT `matrixcontent_tekst_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_tekst_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
