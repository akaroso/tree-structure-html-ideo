-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Cze 2021, 16:38
-- Wersja serwera: 10.4.19-MariaDB
-- Wersja PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `laravel2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_06_07_184112_create_trees_table', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trees`
--

CREATE TABLE `trees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentID` bigint(20) UNSIGNED DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `trees`
--

INSERT INTO `trees` (`id`, `created_at`, `updated_at`, `text`, `parentID`, `depth`) VALUES
(1, '2021-06-08 11:06:29', '2021-06-08 11:06:29', 'Tree1', NULL, 0),
(2, '2021-06-08 11:06:37', '2021-06-08 11:06:37', 'Tree2', NULL, 0),
(3, '2021-06-08 11:06:43', '2021-06-08 11:06:43', 'Tree3', NULL, 0),
(4, '2021-06-08 11:06:53', '2021-06-08 11:06:53', 'Tree2-2', 2, 1),
(5, '2021-06-08 11:08:05', '2021-06-08 11:08:05', 'Tree2-2-2', 4, 2),
(6, '2021-06-08 11:08:22', '2021-06-08 11:08:22', 'Tree1-1', 1, 1),
(10, '2021-06-08 11:22:12', '2021-06-08 11:22:12', 'Tree3-3', 3, 1),
(11, '2021-06-08 11:22:30', '2021-06-08 11:22:30', 'tre3-3.1', 10, 2),
(12, '2021-06-08 11:22:45', '2021-06-08 11:22:45', 'Tree3.3.2', 10, 2),
(13, '2021-06-08 11:22:54', '2021-06-08 11:22:54', 'Tree3.3.22', 3, 1),
(15, '2021-06-08 11:26:54', '2021-06-08 11:27:22', 'Tree66', 1, 1),
(16, '2021-06-08 12:20:20', '2021-06-08 12:20:20', 'Tree166', NULL, 0),
(17, '2021-06-08 12:20:33', '2021-06-08 12:20:33', 'Tree346', NULL, 0),
(18, '2021-06-08 12:31:16', '2021-06-08 12:31:16', 'Tree2-2-2-2', 5, 3),
(19, '2021-06-08 12:31:26', '2021-06-08 12:31:26', 'Tree2-2-2-2-2', 18, 4),
(20, '2021-06-08 12:31:37', '2021-06-08 12:36:31', 'Tree2-2-2-2-2.2', 4, 2),
(22, '2021-06-08 12:32:20', '2021-06-08 12:32:20', 'Świat', NULL, 0),
(23, '2021-06-08 12:32:30', '2021-06-08 12:32:30', 'Europa', 22, 1),
(24, '2021-06-08 12:32:38', '2021-06-08 12:32:38', 'Azja', 22, 1),
(25, '2021-06-08 12:32:57', '2021-06-08 12:32:57', 'Ameryka Północna', 22, 1),
(26, '2021-06-08 12:33:05', '2021-06-08 12:33:05', 'Polska', 23, 2),
(27, '2021-06-08 12:33:14', '2021-06-08 12:33:14', 'Niemcy', 23, 2),
(28, '2021-06-08 12:33:25', '2021-06-08 12:33:25', 'Chiny', 24, 2),
(29, '2021-06-08 12:33:32', '2021-06-08 12:33:32', 'USA', 25, 2),
(30, '2021-06-08 12:33:49', '2021-06-08 12:33:49', 'Podkarpackie', 26, 3),
(31, '2021-06-08 12:34:06', '2021-06-08 12:34:06', 'Mazowieckie', 26, 3),
(32, '2021-06-08 12:34:15', '2021-06-08 12:34:15', 'Rzeszów', 30, 4),
(33, '2021-06-08 12:34:24', '2021-06-08 12:34:24', 'Warszawa', 31, 4),
(34, '2021-06-08 12:34:53', '2021-06-08 12:34:53', 'Jarosław', 30, 4),
(35, '2021-06-08 12:35:04', '2021-06-08 12:35:04', 'Krasne', 32, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Axel Savage', 'qamofec@mailinator.com', NULL, '$2y$10$FJVwoF0gg1Et/Y67Ab/MCua9LMyJ3KjUL/5D24eT.uWdxsWuR4H7u', NULL, '2021-06-08 11:04:58', '2021-06-08 11:04:58'),
(2, 'Emery Tanner', 'bidupola@mailinator.com', NULL, '$2y$10$p0O5qp0fCTQOAk1Vt2p46ehci/OxjdHdoGjEo803gXxKZVuoUQLpS', NULL, '2021-06-08 11:33:26', '2021-06-08 11:33:26'),
(3, 'Flavia Delgado', 'tone@mailinator.com', NULL, '$2y$10$z40ILXtRgLy929s.B2BgVebousDPLdAGTKIjOS6hRf97FN1.UUplm', NULL, '2021-06-08 11:33:59', '2021-06-08 11:33:59'),
(4, 'Raya Frye', 'quvyce@mailinator.com', NULL, '$2y$10$FynFjaFMiGlnqrmLumTgLexFS2jKScegtwl2KLvVKVDKUixVlKAcG', NULL, '2021-06-08 12:20:10', '2021-06-08 12:20:10'),
(5, 'admin', 'admin@example.com', NULL, '$2y$10$gvhgRwyDzxa8f8rLOAcbju4yY0OZCzhTTnXVJE4jWVzQjoKUAqEFq', NULL, '2021-06-08 12:30:16', '2021-06-08 12:30:16');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeksy dla tabeli `trees`
--
ALTER TABLE `trees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trees_parentid_foreign` (`parentID`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `trees`
--
ALTER TABLE `trees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `trees`
--
ALTER TABLE `trees`
  ADD CONSTRAINT `trees_parentid_foreign` FOREIGN KEY (`parentID`) REFERENCES `trees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
