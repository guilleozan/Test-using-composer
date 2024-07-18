-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 18, 2024 at 06:22 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marina-test`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8mb4_unicode_ci,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexingsessions`
--

CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL,
  `indexedVolumes` text COLLATE utf8mb4_unicode_ci,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8mb4_unicode_ci,
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets_sites`
--

CREATE TABLE `assets_sites` (
  `assetId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `alt` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authenticator`
--

CREATE TABLE `authenticator` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `auth2faSecret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oldTimestamp` int(11) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb4_unicode_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `layoutElementUid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elementactivity`
--

CREATE TABLE `elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `deletedWithOwner`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2024-07-18 03:24:26', '2024-07-18 03:24:26', NULL, NULL, NULL, 'c5011f8a-44dd-4002-94af-f22106d321fa');

-- --------------------------------------------------------

--
-- Table structure for table `elements_bulkops`
--

CREATE TABLE `elements_bulkops` (
  `elementId` int(11) NOT NULL,
  `key` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements_owners`
--

CREATE TABLE `elements_owners` (
  `elementId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, 1, '2024-07-18 03:24:26', '2024-07-18 03:24:26', 'f7a897f6-4673-47ba-ad11-97f8df9837df');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entries_authors`
--

CREATE TABLE `entries_authors` (
  `entryId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imagetransformindex`
--

CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imagetransforms`
--

CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `fill` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '5.2.8', '5.0.0.21', 0, 'yogfdmqohbst', '3@aydeyrdnrp', '2024-07-18 03:24:26', '2024-07-18 03:25:19', '0fd5702a-0eaf-4e55-8ec5-70fc3094f696');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '9ab8580b-566c-47e8-97d7-64678cf71fbb'),
(2, 'craft', 'm221101_115859_create_entries_authors_table', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '894b6103-034d-46b7-ba47-e6fe533b069e'),
(3, 'craft', 'm221107_112121_add_max_authors_to_sections', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', 'a41f997f-8c56-4f60-a405-c24ed20f1d6f'),
(4, 'craft', 'm221205_082005_translatable_asset_alt_text', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2d325bf1-60ce-4be1-a049-e91778763900'),
(5, 'craft', 'm230314_110309_add_authenticator_table', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '10356ff8-e0cd-4e18-9be2-b155fadcd122'),
(6, 'craft', 'm230314_111234_add_webauthn_table', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '4828a421-031c-4d52-826b-8fb0fc0dcc0d'),
(7, 'craft', 'm230503_120303_add_recoverycodes_table', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '6bfe85fa-6b7c-41b8-a959-98ff4f291f5f'),
(8, 'craft', 'm230511_000000_field_layout_configs', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '9c71101f-5b49-43a2-b363-03a6bc8bfca8'),
(9, 'craft', 'm230511_215903_content_refactor', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2e193de4-ed48-4296-99f1-cecfd817230e'),
(10, 'craft', 'm230524_000000_add_entry_type_show_slug_field', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '364c06d6-5e48-46fa-86cb-be5365faca82'),
(11, 'craft', 'm230524_000001_entry_type_icons', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', 'f54410df-fed9-47b6-a649-6150d95835cd'),
(12, 'craft', 'm230524_000002_entry_type_colors', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '1ecae3a1-7b17-4c66-9a9c-8a66d6603774'),
(13, 'craft', 'm230524_220029_global_entry_types', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '05bac0b6-122e-43a7-bf5e-a86bede2417d'),
(14, 'craft', 'm230531_123004_add_entry_type_show_status_field', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '631ea977-267a-4f57-ad94-6a23abcd7c86'),
(15, 'craft', 'm230607_102049_add_entrytype_slug_translation_columns', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', 'd0d66251-69c6-4bb4-97fb-6a7c4fb424d5'),
(16, 'craft', 'm230616_173810_kill_field_groups', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '15093071-6562-4a4c-8111-9062e1fc71ad'),
(17, 'craft', 'm230616_183820_remove_field_name_limit', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', 'e8eadba8-2740-4440-baea-f71cd83272fc'),
(18, 'craft', 'm230617_070415_entrify_matrix_blocks', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '3ef2744f-1b23-4f8d-b207-5e5dd624128e'),
(19, 'craft', 'm230710_162700_element_activity', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', 'adb89b56-839b-4492-a541-8d86f83d7874'),
(20, 'craft', 'm230820_162023_fix_cache_id_type', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '6f353d38-ecc6-4f79-aaa9-5020b880e2fc'),
(21, 'craft', 'm230826_094050_fix_session_id_type', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '344040de-13c6-4b43-a8a7-2f5577588f34'),
(22, 'craft', 'm230904_190356_address_fields', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '77302240-fb25-408f-be31-2fea33be7a26'),
(23, 'craft', 'm230928_144045_add_subpath_to_volumes', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', 'cc40363f-afaa-4788-8f2b-76e09f351845'),
(24, 'craft', 'm231013_185640_changedfields_amend_primary_key', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '772bcdc3-5f3c-4747-83b3-d41141b81904'),
(25, 'craft', 'm231213_030600_element_bulk_ops', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '748cf5c2-1b99-4148-88fa-0aecc2f0543c'),
(26, 'craft', 'm240129_150719_sites_language_amend_length', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '96e922a4-5724-4248-bb20-22510c4eb072'),
(27, 'craft', 'm240206_035135_convert_json_columns', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', 'fa4da8d0-f32d-4431-bb1c-d0cb90672448'),
(28, 'craft', 'm240207_182452_address_line_3', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '506d33f5-c211-4d3c-8daf-28560b0720ab'),
(29, 'craft', 'm240302_212719_solo_preview_targets', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '602fadd2-8793-4bcb-822e-707c624ca937'),
(30, 'craft', 'm240619_091352_add_auth_2fa_timestamp', '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27', 'dbe1cea8-4082-4346-90a5-e10515360521');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1721273066'),
('email.fromEmail', '\"guilleozan25@gmail.com\"'),
('email.fromName', '\"marina.test\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('meta.__names__.5dfe7698-caeb-43e1-b4b3-18047d11d635', '\"marina.test\"'),
('meta.__names__.66c8c5ae-2fa8-4e37-8021-b19b4c88216f', '\"marina.test\"'),
('siteGroups.66c8c5ae-2fa8-4e37-8021-b19b4c88216f.name', '\"marina.test\"'),
('sites.5dfe7698-caeb-43e1-b4b3-18047d11d635.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.5dfe7698-caeb-43e1-b4b3-18047d11d635.handle', '\"default\"'),
('sites.5dfe7698-caeb-43e1-b4b3-18047d11d635.hasUrls', 'true'),
('sites.5dfe7698-caeb-43e1-b4b3-18047d11d635.language', '\"en-US\"'),
('sites.5dfe7698-caeb-43e1-b4b3-18047d11d635.name', '\"marina.test\"'),
('sites.5dfe7698-caeb-43e1-b4b3-18047d11d635.primary', 'true'),
('sites.5dfe7698-caeb-43e1-b4b3-18047d11d635.siteGroup', '\"66c8c5ae-2fa8-4e37-8021-b19b4c88216f\"'),
('sites.5dfe7698-caeb-43e1-b4b3-18047d11d635.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"marina.test\"'),
('system.schemaVersion', '\"5.0.0.21\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.require2fa', 'false'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recoverycodes`
--

CREATE TABLE `recoverycodes` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `recoveryCodes` text COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('984b7442', '@craft/web/assets/installer/dist');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'email', 0, 1, ' guilleozan25 gmail com '),
(1, 'firstname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'slug', 0, 1, ''),
(1, 'username', 0, 1, ' admin ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint(6) UNSIGNED NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections_entrytypes`
--

CREATE TABLE `sections_entrytypes` (
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb4_unicode_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'marina.test', '2024-07-18 03:24:26', '2024-07-18 03:24:26', NULL, '66c8c5ae-2fa8-4e37-8021-b19b4c88216f');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'true', 'marina.test', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2024-07-18 03:24:26', '2024-07-18 03:24:26', NULL, '5dfe7698-caeb-43e1-b4b3-18047d11d635');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\": \"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
(1, NULL, 1, 0, 0, 0, 1, 'admin', NULL, NULL, NULL, 'guilleozan25@gmail.com', '$2y$13$TVmtui.7/Egp25NY5kkxreUEv2Ln01MBk.TWfIp.sT7hr/67fkM66', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '2024-07-18 03:24:27', '2024-07-18 03:24:27', '2024-07-18 03:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformFs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `altTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webauthn`
--

CREATE TABLE `webauthn` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `credentialId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credential` text COLLATE utf8mb4_unicode_ci,
  `credentialName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_metssssoldgyitywnilgtogmprmaiqzgxzmy` (`primaryOwnerId`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_khvmnklhuaqltexwdwmgwqwtxwwaknahyawq` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_apwhlmjejwzyfwicchnoaolbtmqfmkztifej` (`dateRead`),
  ADD KEY `fk_bwwsbqjkuugfesobvcrfvdvongybtttwbcgf` (`pluginId`);

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lxsdflqmcxpvnuzwbwehxhkvjenruohltafi` (`sessionId`,`volumeId`),
  ADD KEY `idx_ohiqtffasfiwzgdnwojbbaxxhwkreskpoibm` (`volumeId`);

--
-- Indexes for table `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_havtlaqzsvgjdeqjxxrihopvqksgcilomodp` (`filename`,`folderId`),
  ADD KEY `idx_uobnvqpvrgfjlgoftfadxvhinrhzlyzfyqez` (`folderId`),
  ADD KEY `idx_qihdfgklkzcmvwzycpnhupjrcfzkrwhuksue` (`volumeId`),
  ADD KEY `fk_ysugijeegowvygubbbmqspcmkovtqkwvdrno` (`uploaderId`);

--
-- Indexes for table `assets_sites`
--
ALTER TABLE `assets_sites`
  ADD PRIMARY KEY (`assetId`,`siteId`),
  ADD KEY `fk_cdfokbjyhcjskvhfjchbogaafhzebzcjwnau` (`siteId`);

--
-- Indexes for table `authenticator`
--
ALTER TABLE `authenticator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fseexepdczvakgwdogxkvrkdmshhuzpubigk` (`userId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_epcyllgqssbicytwwgktefnsyvywcccwzfmt` (`groupId`),
  ADD KEY `fk_ipppwpouedalvhqmmmftdjktxoytmfpbftxm` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jwfetvfpawthpeslrhqwdtspjvaidioraocl` (`name`),
  ADD KEY `idx_flqsihvuczeovctmupatxwvrhwpedoqfhwit` (`handle`),
  ADD KEY `idx_raliiagbpdgotdfauaifhulhdkamzfebyukl` (`structureId`),
  ADD KEY `idx_bywlspmkewxkupemuthitkeysjqeayhbbaui` (`fieldLayoutId`),
  ADD KEY `idx_zpeuaqgfogwvfofvxaagedshcgmhoyjwwslv` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ntinjqjphxsmhacrfihsdfbperbhhbcocrqi` (`groupId`,`siteId`),
  ADD KEY `idx_afmlzoqabjgdyijjdptuefwcmdgbknbmzvgv` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_krwuhaaytgnnihwbelephhajctjiiboajvkg` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_eezecrghquklrhdkiyxsyxzhdwpbrfvmjynz` (`siteId`),
  ADD KEY `fk_ubkvsnmpcuihkhqygxnbfsrifngoonsrcydl` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  ADD KEY `idx_xmqrtfvxmccwesjblgumwrqkgpxrupbeffmb` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_kyubvuuzjiaxbiavtfaoygpobtvenbtteplz` (`siteId`),
  ADD KEY `fk_sguudbovxuitosxbnxfpbibmsbjmijgvzlwa` (`fieldId`),
  ADD KEY `fk_asnkrswutycxfuricdeqbhjyjjittyjyault` (`userId`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rbvffqgqmcdzvtokrsnqqourxgyoaqwbmfvm` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jctqtpgrpbwrexmkgujxvrbxhprmwcqjtgay` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mozsdybuofciyoxqbrxkjmabzbesapsqnxyt` (`creatorId`,`provisional`),
  ADD KEY `idx_bwlegvjxgehvrxnmznsdhsgikwtybuluoqzk` (`saved`),
  ADD KEY `fk_uzscgmffboaxiuegxrtuwtiovgiphvevfkml` (`canonicalId`);

--
-- Indexes for table `elementactivity`
--
ALTER TABLE `elementactivity`
  ADD PRIMARY KEY (`elementId`,`userId`,`type`),
  ADD KEY `idx_heonbiovgcpuwqbaanqneaicnnikivcmoluj` (`elementId`,`timestamp`,`userId`),
  ADD KEY `fk_ailfhyaxudhogrfgvaneyxkvsncpsnvhiljd` (`userId`),
  ADD KEY `fk_nzdykrmzrwbhprjhaxnzmouildfsvibxqxct` (`siteId`),
  ADD KEY `fk_oojqwiteecedesxsekeorffbqosqcmfdagfg` (`draftId`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pumjobbrogvjcjzmpdqmobujzevdrecwlait` (`dateDeleted`),
  ADD KEY `idx_sryhebstheacncuidpvswqbpmqrmrimtmhgs` (`fieldLayoutId`),
  ADD KEY `idx_zzgwxlujzfnidmxcwrhmiupqomgpscnqzjpu` (`type`),
  ADD KEY `idx_wvrpjmmovivfsswtrbsiqfuvhxmdyrztxdzo` (`enabled`),
  ADD KEY `idx_jiugbjbzcrbqgowbihfuwhtyrcudhbtghsaq` (`canonicalId`),
  ADD KEY `idx_ykdqpahoiehcmavauvnnzlsthtptmqcsmcmq` (`archived`,`dateCreated`),
  ADD KEY `idx_lyidyryepbmvzqpihdwizqyznylnpxxrgccs` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `idx_sbuoedpddadwrwngvylffeiwbuuhzktecnnc` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  ADD KEY `fk_ehcbhvmqpyiazxlzfzcovjksqhawosqemkyi` (`draftId`),
  ADD KEY `fk_lfzuveuhoueqdzqcuvmmgzuawmqfhkeeqlbx` (`revisionId`);

--
-- Indexes for table `elements_bulkops`
--
ALTER TABLE `elements_bulkops`
  ADD PRIMARY KEY (`elementId`,`key`),
  ADD KEY `idx_wnnnokqqfxwuhwvknwqwhflooynvhoxtxzta` (`timestamp`);

--
-- Indexes for table `elements_owners`
--
ALTER TABLE `elements_owners`
  ADD PRIMARY KEY (`elementId`,`ownerId`),
  ADD KEY `fk_ncgtineqrpvsnugrxzwhxdosjrhxpcphjzyt` (`ownerId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_calajtwirfuijayklfuwgjgllrhezdvysjko` (`elementId`,`siteId`),
  ADD KEY `idx_kbfhoxuforzwxuyzldoqqzcjibqnktsjclps` (`siteId`),
  ADD KEY `idx_qvkrivogqprwrqyigbraapkuaqvqftbdpnad` (`title`,`siteId`),
  ADD KEY `idx_xcutgqtyiolovlxlzzlhkvmqdiawplubqvag` (`slug`,`siteId`),
  ADD KEY `idx_bwrcujsddmbscnycrjvbbbnzsgvmiwpbiigs` (`enabled`),
  ADD KEY `idx_iqajypapzqlriiqgljrdqrspkapmexqdlbid` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qvwbhzrsmxisoovxlbfefmqtzwcjjjkrrmsr` (`postDate`),
  ADD KEY `idx_ndunoefbbsaemhquhvummnlejvpzjgoubhnh` (`expiryDate`),
  ADD KEY `idx_rjacbieewnsfsarkbgdjqccrtyzpqufeezru` (`sectionId`),
  ADD KEY `idx_liboohtwlijtcvnykblzfulznujbnmenafqy` (`typeId`),
  ADD KEY `idx_nhzxlxxxqsvtkfqjpvkmnxrfbrpsgkrvldrm` (`primaryOwnerId`),
  ADD KEY `idx_mehysilnzoxmbiartssrbtxqvfxvgtzetldn` (`fieldId`),
  ADD KEY `fk_vwhgnnojboxrumzrgdyqhvuayozgdclxympj` (`parentId`);

--
-- Indexes for table `entries_authors`
--
ALTER TABLE `entries_authors`
  ADD PRIMARY KEY (`entryId`,`authorId`),
  ADD KEY `idx_cobqkwdboafxzwgbtzvvhwivfhuvbcmvyqul` (`authorId`),
  ADD KEY `idx_lsqvtefnhrqtfgexonzjwdqwwxiaqhkaligw` (`entryId`,`sortOrder`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bniszabcpvuzqpbzyjagyzxbnxbahnfqdrju` (`fieldLayoutId`),
  ADD KEY `idx_einfddpzdhmjewlgxphlkxlmyrgttntufstk` (`dateDeleted`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hhikucacljxljvifvsjdolorrtzsaxlgjwdu` (`dateDeleted`),
  ADD KEY `idx_uwbmhpwlrfbupxldoohcldwrqbvqwarkpfvm` (`type`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nrynlixfckbjrsboqbgmbrappfkumfingmeo` (`handle`,`context`),
  ADD KEY `idx_vrceebgdlsxjvgxvvjezudwplfftnifrbcxt` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wjspsxbgswndtosxbewgnwqrybrvyxixammr` (`name`),
  ADD KEY `idx_uncdcvplvnlrnaoajrhgutjmgzhibfyyqgnp` (`handle`),
  ADD KEY `idx_shpekojlglpgtteeqctolvpoylbgcoyyjnev` (`fieldLayoutId`),
  ADD KEY `idx_sfltrhosplxvylynpytuikjbwvikcneefirb` (`sortOrder`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ohcfeazmptxcpyefkhosxpmaiusewucvaody` (`accessToken`),
  ADD UNIQUE KEY `idx_kibdoicngrqsnbspjjudrjjsndmrhmevdnpf` (`name`),
  ADD KEY `fk_bwosilghhigstyatfmksldsebvmxmpvftmfx` (`schemaId`);

--
-- Indexes for table `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_budvynjhqfbrqvuvsquqzlrpsxbhuwmrygqd` (`assetId`,`transformString`);

--
-- Indexes for table `imagetransforms`
--
ALTER TABLE `imagetransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vnaxppufnuabgqwrbfugqdrewiaywyresfmc` (`name`),
  ADD KEY `idx_dtfvgpenkubdrpwvkwjckiahkwnxllqzfikr` (`handle`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hjwwcrtgdrgdivyczawjxbnshltqmgxmwjko` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lztchbfvnaercqufdvkbgozxsxbqosnthjme` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mtedboqhgrvdznahitwdutjrxfjdmvsashkx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_ftvdsxphlcgxbhavnmdoqnzgzelxcvrzuffw` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `recoverycodes`
--
ALTER TABLE `recoverycodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_axewqjutozgijivylvqvpyrqpypsnonvlwde` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_ibrfwaylfddbieisfbtxekkiqokjbxilsfxw` (`sourceId`),
  ADD KEY `idx_fnuxeuiopjssqwgxeieyhwcxrpozyhyifadx` (`targetId`),
  ADD KEY `idx_wuxylvzgpnbbzbkkbxygjfchdfpkiwfcaifz` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_gsnnupepllxygxpkkvosvvaoksljitczczax` (`canonicalId`,`num`),
  ADD KEY `fk_wkneyufpbmjptqjpsjcuhuwjwrxnrzuhhtre` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_vatlmcbudworcxsybajcmuzawqyfnavbimwx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lycaldawasshjidiimwjbonilzsotmzsmngd` (`handle`),
  ADD KEY `idx_onyrgnmmhbhelhaxgvpxiumxkbckjtpevcll` (`name`),
  ADD KEY `idx_rdqksknvbjyznudmjbhdojzzutcopzesymma` (`structureId`),
  ADD KEY `idx_fbtjefdehsqpgwxwxkdyvyjhlsnrjbglkgan` (`dateDeleted`);

--
-- Indexes for table `sections_entrytypes`
--
ALTER TABLE `sections_entrytypes`
  ADD PRIMARY KEY (`sectionId`,`typeId`),
  ADD KEY `fk_drfhbyogolxzbgeojynhqfuwuffhdbbwrrhv` (`typeId`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_zxheiqmnpgdssqkyegjglwxqvqdidhlgdnre` (`sectionId`,`siteId`),
  ADD KEY `idx_ljrjenvjzilpsyqesnhdduitpcaiiryrhthz` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rhlvmiyblrqctcqprpnotpiqpmdgwhyltgju` (`uid`),
  ADD KEY `idx_falkfrxdjxzbggjrgsawqzojtehtrfcsrjmg` (`token`),
  ADD KEY `idx_lomtxggligtnlkmdbragphdnzlgngwtmbdez` (`dateUpdated`),
  ADD KEY `idx_ucakkjxgtbeidnjohdcdrcopcyckilsqllei` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ltbuwlmyuklknsmviclwnkqsiknzozjfsrbj` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vxzummztidfrhbtiogtqoctpwukdltuvmoca` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nkhxzbjutnwhazbpdqohlcadlhekqkbcyqyz` (`dateDeleted`),
  ADD KEY `idx_dywknrgddiicjmwlhljtzqjmpxegzwqnwqxf` (`handle`),
  ADD KEY `idx_xjihqarxillxwspdfedusbxcgwuvmpjqghth` (`sortOrder`),
  ADD KEY `fk_lbiwwjkzfafdfafiktxsnwktgrwbtvkpohds` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ldgeqntpofbcfjegpqiyknapjsefuqbfsvmm` (`structureId`,`elementId`),
  ADD KEY `idx_hwzxcjjfkmukuibnsusnuzewvpneswhoveze` (`root`),
  ADD KEY `idx_lkdddqypfaksgoxjgbdoqndjhvrxbpfxfhpv` (`lft`),
  ADD KEY `idx_xqxqbjuzxgosssbrjgoyhmghfkppnpzmeezy` (`rgt`),
  ADD KEY `idx_fedhsggiilcwynclzoiobzipgujazchshvgw` (`level`),
  ADD KEY `idx_mzpchjevpshnqnphadihzcucdatwvvsmftik` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_yvdlxtymzdkpwoypujvfrjhgtnojhsospcnh` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_grrthwleqqfmyephzapelhcrnbatdcgjyuhn` (`key`,`language`),
  ADD KEY `idx_iuemiitkxtiyucglxkknsmhkjlrqexoptovk` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jlosashrsskgumdyutxudqvepzxnuxgsbwdd` (`name`),
  ADD KEY `idx_nnpnhqwpnmgtwuqfbmrfixmjvlxugtugsisr` (`handle`),
  ADD KEY `idx_zzmempwsvjxzggqdytpyclnoqvfjysiidtjv` (`dateDeleted`),
  ADD KEY `fk_qpcqwsnrktzwthecgbjivvuihgsledvggjeh` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hsbiucfvoyyxmvkrinkceokbfkmktuxklnoh` (`groupId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rafirvdxqawfmajhdbxghongbntpviytcjen` (`token`),
  ADD KEY `idx_kifbnlyyxnuiqevcnjynvwluhihfurdmevqm` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pxjydddjnjgyltgvnxbdpkwliczoockxcrur` (`handle`),
  ADD KEY `idx_smvdmgworrrxuussubmsmeyxtspbklgxdoti` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lwaxrtaldotqccadefipjxvrywlkxrsffbsl` (`groupId`,`userId`),
  ADD KEY `idx_jaoolpodberzyutqqkvcwhjcegxzbenikdmi` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_yopawlvwwsyvffxjalezlafgdqriirvavbgf` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_iuvaqxooqemufscfzcjvitnpsywgxrjmyiqy` (`permissionId`,`groupId`),
  ADD KEY `idx_blpchxzhfnqrtlatkmdtokrdypfzaddvlqyh` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ydhzozstfxgruuastkadqysfwalfbwbnucaz` (`permissionId`,`userId`),
  ADD KEY `idx_rkxfoyxrgakkfojcbtytiwuzlccblkxgecym` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jiqsuhdejzqojpfzpdtplkavkonjpmfpfztc` (`active`),
  ADD KEY `idx_lwxytktuqvxxahblabxcxcrpqvvglhrdyisq` (`locked`),
  ADD KEY `idx_fimoforjwaoqltgsdpybydjpdhruccpbgzhd` (`pending`),
  ADD KEY `idx_tlviapszwjsachacufulmjpmdaixevcmlvpr` (`suspended`),
  ADD KEY `idx_psqwpxuljoxjctsyupftkogoenxmlkclgmhy` (`verificationCode`),
  ADD KEY `idx_ufoisbbxklincejrrdivxbopjrenihkecwbu` (`email`),
  ADD KEY `idx_vqjtgemtknpgjjvycgydybcbsctykskvnmvy` (`username`),
  ADD KEY `fk_pnsoeliszghxzbneksecyliohfktfrysiejm` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_bfwgauhtkyqvevgdgesafzeyltmdoyppnbns` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_pjfdkjjoeqabnrtaqffzcexizqsuzzwbnjvu` (`parentId`),
  ADD KEY `idx_uwpxmlqnqgdtcgqbheeymnkvzisueulsnsjb` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qihhitxyzbbacchkgtkigbwgqshgpqicanhp` (`name`),
  ADD KEY `idx_qtnswohxyqgwpndriftbixvjahrnrchugfye` (`handle`),
  ADD KEY `idx_eitvizzysrdczjhjdabqhwwgqvhegliumuvf` (`fieldLayoutId`),
  ADD KEY `idx_cikuxgasjzhkxqqblvyvwgnezbsfnhkryrul` (`dateDeleted`);

--
-- Indexes for table `webauthn`
--
ALTER TABLE `webauthn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ybqmaphleqojzfyrqefjuliznkjyatqssguw` (`userId`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qtihfphwvogrbqobbzchmlhbbceogyaqtwyg` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authenticator`
--
ALTER TABLE `authenticator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imagetransforms`
--
ALTER TABLE `imagetransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recoverycodes`
--
ALTER TABLE `recoverycodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webauthn`
--
ALTER TABLE `webauthn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_metssssoldgyitywnilgtogmprmaiqzgxzmy` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nfxxqndquvhylwyobgnuaafhxafygjwhefnc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_bwwsbqjkuugfesobvcrfvdvongybtttwbcgf` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jnsjwnatflrccdinkwftlwpffeqovaucyztj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_ikeyhctckwfujrqkjpcftklttxkvgqdlhmen` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_plyuedisruuxtrhirfvbuvncnzuryjzgcpwm` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_bbfgcnjjuviwymhnwdktbvjbwcnmhhfadsct` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tcehnwkbxqqyigejbdyixtjcqvraosmvwrql` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tgfkofxnilmxpksrctupsfmsszmcuqrwmzkg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ysugijeegowvygubbbmqspcmkovtqkwvdrno` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `assets_sites`
--
ALTER TABLE `assets_sites`
  ADD CONSTRAINT `fk_cdfokbjyhcjskvhfjchbogaafhzebzcjwnau` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_uqerxzgbwwaohesvmvmyxkaxnujvoxihdwgj` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `authenticator`
--
ALTER TABLE `authenticator`
  ADD CONSTRAINT `fk_fseexepdczvakgwdogxkvrkdmshhuzpubigk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_ipppwpouedalvhqmmmftdjktxoytmfpbftxm` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_umiwzhuzzxtbnhkgcfwcvlkysqnupqptwrmb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uoxsxbsnloudrkofeuqfckxzywwwzbpgpevq` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_sbzfyeceefqnhdpfaieymdbjndoyyxwxiqws` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xkzbnjaifbzacgrwguepfmdhijsvsllcwwia` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_bxwbzzxwcqieybfadksgvcfcgzjdbuimybfd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dwhglypwhddvsfrwytkalqqedxbawexapnix` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_eezecrghquklrhdkiyxsyxzhdwpbrfvmjynz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sefgdstzzevmuqeigpqblpkmmiluabstgpbb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ubkvsnmpcuihkhqygxnbfsrifngoonsrcydl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_asnkrswutycxfuricdeqbhjyjjittyjyault` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kyubvuuzjiaxbiavtfaoygpobtvenbtteplz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_liiqodnjebxlkiwgnvphzygnrwqyxrqcgbjp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sguudbovxuitosxbnxfpbibmsbjmijgvzlwa` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_rbvffqgqmcdzvtokrsnqqourxgyoaqwbmfvm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_aehiztznwwcszzzyrdjcgdiytpnwwemyusgm` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_uzscgmffboaxiuegxrtuwtiovgiphvevfkml` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elementactivity`
--
ALTER TABLE `elementactivity`
  ADD CONSTRAINT `fk_ailfhyaxudhogrfgvaneyxkvsncpsnvhiljd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nzdykrmzrwbhprjhaxnzmouildfsvibxqxct` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_oojqwiteecedesxsekeorffbqosqcmfdagfg` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_twbpsfmvaxsrojbztvlhvbkwajswduwrxkqz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_ehcbhvmqpyiazxlzfzcovjksqhawosqemkyi` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ewmbbusuwqjumqgputrukikkrruijvpcbbki` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_lfzuveuhoueqdzqcuvmmgzuawmqfhkeeqlbx` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ngiyktrowxnexbcypmggauoukwttpvyqysrg` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `elements_bulkops`
--
ALTER TABLE `elements_bulkops`
  ADD CONSTRAINT `fk_boxfxcplizkvajeudmylaxkomlkqzwhfidhz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_owners`
--
ALTER TABLE `elements_owners`
  ADD CONSTRAINT `fk_ncgtineqrpvsnugrxzwhxdosjrhxpcphjzyt` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wxlomwmzrlyqavvcyyvvndtxzkeufgjibket` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_viuldlumsedebyvcmnilzsjuocgywogtjmln` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yorlfvjrmcbxyjwgahoqwltfzdqhanxdzvwn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_hnektkyuyahfszdxxqxubmhmptolftbrldwp` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_itkkmemvxfkgmoctyilmzzumqyjtezdxufvr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_knremxhoiyhvxypvkfqtfpnlkxknljwwuowk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nufziunucvmowxiucvnrcrfkkuqnpiexwlzd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pslttlimfrspmvnigcucqbjhjhmicnncomep` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vwhgnnojboxrumzrgdyqhvuayozgdclxympj` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `entries_authors`
--
ALTER TABLE `entries_authors`
  ADD CONSTRAINT `fk_nnqgchgohcyxymzccwtwilfnhlrsnmvvsygp` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xcwkymojlzolzxdxcjduntexyjzmsfeaaqje` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_thdavtumtbwkowcekvnxgvvoapkhhozifglp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_ptqzuinmkngnrgsgwytybracmxpslmfaulhp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xzndwysluxxhvgdqrbrtwxagxnoqdjrzfhul` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_bwosilghhigstyatfmksldsebvmxmpvftmfx` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_edxcivddrywgrwlbwzqllkwlnltekvhoafsh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fjdfugrvlvlhlqkpwynhbspedoegdywmuhvn` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_xmpflyyhsqwqyddypzqilelsjareuquiufde` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_nzjjsehyyqokffcikxgaluujhtatyutufjdh` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wkneyufpbmjptqjpsjcuhuwjwrxnrzuhhtre` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_bkoaoiyxgvirvdspshofwksaucjcmqnzkbqn` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_entrytypes`
--
ALTER TABLE `sections_entrytypes`
  ADD CONSTRAINT `fk_drfhbyogolxzbgeojynhqfuwuffhdbbwrrhv` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gctotutdwbvxqwmbudoizhpdubshwztpokre` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_ekqrshcgfcbbbjwdzexzojkqvihgxcqcdwnb` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xymbulyzkathfqcilnvcwkhkewzcwxodhzck` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_yjbsjrkuluweqnkupgmgpirvvnpakfehoamg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_vwlnhfpxpggdhewckplzawusrrvhcaoynfau` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_lbiwwjkzfafdfafiktxsnwktgrwbtvkpohds` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_gpfvzexggfjftmdywlvllsvlqrvffgwlrchu` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_qpcqwsnrktzwthecgbjivvuihgsledvggjeh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_crbqtjvpuwwpyrlnxklrhkbosvizifuejhlx` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ttkbzybhvagjqrfisjokmsuedmxdqtypsbod` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_bswrggxgwghsmruftyrokbutpuckhpbngcxt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yyezrefidtaawtbrynbgvefkxtulemjadmrp` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_cwucmdxfsqtjgjnoungisalfgzdeohfkyppt` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lvlutqomnkykjyrohtjszjwstjdpwxojasnh` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_sllbxfqmvaxgextsklyiwxxihwtjlmijdsqa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vezghhzwwqstaounrxkyucexmhuqrixusoew` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_jkwlvfraqhxrbyustjmfqnmiftlawpaywyhb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_gsakuszljghisisjeqlntvqootckuosyxxke` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pnsoeliszghxzbneksecyliohfktfrysiejm` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_hfllblruuuhlibjhmxrwvonyabpxoqncjark` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jdxwhiganehmxndravykenoesqiklukyjhsr` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_ybjwhrdypvgsaivbssrwsohmwwvpkpwiskcz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `webauthn`
--
ALTER TABLE `webauthn`
  ADD CONSTRAINT `fk_ybqmaphleqojzfyrqefjuliznkjyatqssguw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_fskmdfwsnaeclfyllttfvbjuqygtdpsrdaim` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
