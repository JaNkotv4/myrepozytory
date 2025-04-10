-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2025 at 09:31 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qbcoreframework_f6dfee`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `apartments`
--

CREATE TABLE `apartments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
(1, 'apartment17938', 'apartment1', 'South Rockford Drive 7938', 'SLA19950');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `citizenid`, `account_name`, `account_balance`, `account_type`, `users`) VALUES
(1, NULL, 'vineyard', 0, 'job', '[]'),
(2, NULL, 'garbage', 0, 'job', '[]'),
(3, NULL, 'tow', 0, 'job', '[]'),
(4, NULL, 'judge', 0, 'job', '[]'),
(5, NULL, 'cardealer', 0, 'job', '[]'),
(6, NULL, 'taxi', 0, 'job', '[]'),
(7, NULL, 'ambulance', 0, 'job', '[]'),
(8, NULL, 'mechanic2', 0, 'job', '[]'),
(9, NULL, 'police', 0, 'job', '[]'),
(10, NULL, 'beeker', 0, 'job', '[]'),
(11, NULL, 'reporter', 0, 'job', '[]'),
(12, NULL, 'hotdog', 0, 'job', '[]'),
(13, NULL, 'realestate', 0, 'job', '[]'),
(14, NULL, 'mechanic3', 0, 'job', '[]'),
(15, NULL, 'bennys', 0, 'job', '[]'),
(16, NULL, 'unemployed', 0, 'job', '[]'),
(17, NULL, 'trucker', 0, 'job', '[]'),
(18, NULL, 'mechanic', 0, 'job', '[]'),
(19, NULL, 'bus', 0, 'job', '[]'),
(20, NULL, 'lawyer', 0, 'job', '[]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bank_statements`
--

CREATE TABLE `bank_statements` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crypto`
--

CREATE TABLE `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `crypto`
--

INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
('qbit', 1002, '[{\"PreviousWorth\":1006,\"NewWorth\":1001},{\"PreviousWorth\":1006,\"NewWorth\":1001},{\"PreviousWorth\":1006,\"NewWorth\":1001},{\"PreviousWorth\":1001,\"NewWorth\":1002}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dealers`
--

CREATE TABLE `dealers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `houselocations`
--

CREATE TABLE `houselocations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `house_plants`
--

CREATE TABLE `house_plants` (
  `id` int(11) NOT NULL,
  `building` varchar(50) DEFAULT NULL,
  `stage` int(11) DEFAULT 1,
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `inventories`
--

CREATE TABLE `inventories` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `items` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `identifier`, `items`) VALUES
(1, 'glovebox-09MKY465', '[]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lapraces`
--

CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `occasion_vehicles`
--

CREATE TABLE `occasion_vehicles` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_gallery`
--

CREATE TABLE `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_tweets`
--

CREATE TABLE `phone_tweets` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
(1, 'SLA19950', 1, 'license:a84b0ab46dd1fc09fe30ab633bd2cb15bde559a8', 'JaNkoTV', '{\"crypto\":0,\"cash\":500,\"bank\":5625}', '{\"lastname\":\"gnrjung9iertig\",\"cid\":1,\"gender\":0,\"account\":\"US05QBCore2551380488\",\"birthdate\":\"1982-09-15\",\"phone\":\"2455671847\",\"firstname\":\"hyheffjrjge\",\"nationality\":\"Afghanistan\"}', '{\"type\":\"mechanic\",\"onduty\":true,\"label\":\"LS Customs\",\"payment\":100,\"isboss\":false,\"name\":\"mechanic\",\"grade\":{\"level\":2,\"isboss\":false,\"name\":\"Experienced\",\"payment\":100}}', '{\"grade\":{\"level\":0,\"isboss\":false,\"name\":\"Unaffiliated\"},\"isboss\":false,\"name\":\"none\",\"label\":\"No Gang\"}', '{\"x\":-639.072509765625,\"y\":-351.21759033203127,\"z\":34.806640625}', '{\"injail\":0,\"inlaststand\":false,\"phonedata\":{\"SerialNumber\":87563844,\"InstalledApps\":[]},\"criminalrecord\":{\"hasRecord\":false},\"licences\":{\"weapon\":false,\"business\":false,\"driver\":true},\"inside\":{\"apartment\":[]},\"status\":[],\"fingerprint\":\"DK647z97PFU2474\",\"jailitems\":[],\"rep\":[],\"vehicleKeys\":{\"09MKY465\":true,\"09OYY112\":true},\"ishandcuffed\":false,\"tracker\":false,\"isdead\":false,\"hunger\":20.19999999999995,\"phone\":[],\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"stress\":0,\"thirst\":27.80000000000004,\"bloodtype\":\"AB-\",\"walletid\":\"QB-42602565\"}', '[{\"name\":\"phone\",\"info\":[],\"slot\":1,\"amount\":1,\"type\":\"item\"},{\"name\":\"driver_license\",\"info\":{\"birthdate\":\"1982-09-15\",\"lastname\":\"gnrjung9iertig\",\"type\":\"Class C Driver License\",\"firstname\":\"hyheffjrjge\"},\"slot\":2,\"amount\":1,\"type\":\"item\"},{\"name\":\"id_card\",\"info\":{\"birthdate\":\"1982-09-15\",\"gender\":0,\"nationality\":\"Afghanistan\",\"firstname\":\"hyheffjrjge\",\"citizenid\":\"SLA19950\",\"lastname\":\"gnrjung9iertig\"},\"slot\":3,\"amount\":1,\"type\":\"item\"},{\"name\":\"weapon_crowbar\",\"info\":{\"ammo\":0,\"quality\":100,\"serie\":\"88OxE5ii409iHxL\"},\"slot\":4,\"amount\":1,\"type\":\"weapon\"},{\"name\":\"weapon_pistol_mk2\",\"info\":{\"quality\":100,\"serie\":\"44ksh9WP904XNXT\"},\"slot\":5,\"amount\":1,\"type\":\"weapon\"}]', '2025-04-10 13:15:25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playerskins`
--

INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
(1, 'SLA19950', '1885233650', '{\"nose_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":1},\"lips_thickness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eye_color\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"torso2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"moles\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_bone_lowering\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eye_opening\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"neck_thikness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_hole\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"face\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"face2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_0\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_bone_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_5\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"cheek_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"cheek_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"cheek_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"jaw_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"hat\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"nose_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"facemix\":{\"defaultShapeMix\":0.0,\"shapeMix\":0,\"defaultSkinMix\":0.0,\"skinMix\":0},\"nose_4\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eyebrown_high\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":1},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1}}', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int(255) NOT NULL,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(8) NOT NULL,
  `fakeplate` varchar(8) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_warns`
--

CREATE TABLE `player_warns` (
  `id` int(11) NOT NULL,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `name` (`name`);

--
-- Indeksy dla tabeli `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `account_name` (`account_name`);

--
-- Indeksy dla tabeli `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`);

--
-- Indeksy dla tabeli `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `discord` (`discord`),
  ADD KEY `ip` (`ip`);

--
-- Indeksy dla tabeli `crypto`
--
ALTER TABLE `crypto`
  ADD PRIMARY KEY (`crypto`);

--
-- Indeksy dla tabeli `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indeksy dla tabeli `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `houselocations`
--
ALTER TABLE `houselocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indeksy dla tabeli `house_plants`
--
ALTER TABLE `house_plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building` (`building`),
  ADD KEY `plantid` (`plantid`);

--
-- Indeksy dla tabeli `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `id` (`id`);

--
-- Indeksy dla tabeli `lapraces`
--
ALTER TABLE `lapraces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raceid` (`raceid`);

--
-- Indeksy dla tabeli `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasionId` (`occasionid`);

--
-- Indeksy dla tabeli `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indeksy dla tabeli `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `number` (`number`);

--
-- Indeksy dla tabeli `phone_tweets`
--
ALTER TABLE `phone_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indeksy dla tabeli `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `id` (`id`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `license` (`license`);

--
-- Indeksy dla tabeli `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indeksy dla tabeli `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indeksy dla tabeli `player_houses`
--
ALTER TABLE `player_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house` (`house`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeksy dla tabeli `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indeksy dla tabeli `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `outfitId` (`outfitId`);

--
-- Indeksy dla tabeli `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- Indeksy dla tabeli `player_warns`
--
ALTER TABLE `player_warns`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houselocations`
--
ALTER TABLE `houselocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_plants`
--
ALTER TABLE `house_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lapraces`
--
ALTER TABLE `lapraces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_houses`
--
ALTER TABLE `player_houses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_warns`
--
ALTER TABLE `player_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
