-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 02:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktors`
--

CREATE TABLE `aktors` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `negara_asal` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `aktors`
--

INSERT INTO `aktors` (`id`, `nama`, `tgl_lahir`, `gender`, `negara_asal`) VALUES
(1, 'Brie Larson', '1989-10-01', 'P', 'Konoha'),
(2, 'Samuel L. Jackson', '1948-12-21', 'L', 'Sudan Selatan'),
(3, 'Gemma Chan', '1982-11-29', 'P', 'Kutub Baratan'),
(4, 'Jude Law', '1972-12-13', 'L', 'Dolly Selatan'),
(5, 'Sandra Prinsloo', '1947-09-15', 'P', 'Vertix'),
(6, 'Nǃxau ǂToma', '1944-01-01', 'L', 'Sepande'),
(7, 'Patrick Wilson', '1973-07-03', 'L', 'Agoda'),
(8, 'Vera Farmiga', '1973-08-06', 'P', 'Mumbai'),
(9, 'Jason Momoa', '1979-08-01', 'L', 'Chernobyl'),
(10, 'Amber Heard', '1986-04-22', 'P', 'Madagaskar');

-- --------------------------------------------------------

--
-- Table structure for table `aktor_film`
--

CREATE TABLE `aktor_film` (
  `aktors_id` int(11) NOT NULL,
  `films_id` int(11) NOT NULL,
  `peran` enum('UTAMA','PEMBANTU','FIGURAN') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `aktor_film`
--

INSERT INTO `aktor_film` (`aktors_id`, `films_id`, `peran`) VALUES
(1, 2, 'UTAMA'),
(1, 5, 'UTAMA'),
(2, 2, 'UTAMA'),
(4, 2, 'PEMBANTU'),
(5, 4, 'UTAMA'),
(6, 4, 'UTAMA'),
(7, 1, 'UTAMA'),
(8, 1, 'UTAMA'),
(8, 5, 'UTAMA'),
(9, 3, 'UTAMA'),
(10, 3, 'UTAMA');

-- --------------------------------------------------------

--
-- Table structure for table `cinemas`
--

CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL,
  `nama_cabang` varchar(45) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `tgl_dibuka` date NOT NULL,
  `kota` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cinemas`
--

INSERT INTO `cinemas` (`id`, `nama_cabang`, `alamat`, `tgl_dibuka`, `kota`) VALUES
(1, 'Tunjungan Plaza', 'Jl. Jenderal Basuki Rachmat.8-12', '2013-12-18', 'Surabaya'),
(2, 'Lippo Plaza Sidoarjo', 'Jl. Jati Raya No.1', '2015-12-16', 'Sidoarjo'),
(3, 'Transmart Tenggilis', 'Jl. Tenggilis Mejoyo Jl. Raya Kalirungkut', '2016-12-08', 'Surabaya'),
(4, 'Sunrise Mall Mojokerto', 'Jl. Benteng Pancasila No.9', '2018-08-21', 'Mojokerto'),
(5, 'Malang Town Square', 'Jl. Veteran No.2, Penanggungan', '2016-02-17', 'Malang'),
(6, 'Pakuwon City Mall', 'Jl. Raya Laguna KJW Putih Tambak No.2', '1994-12-15', 'Surabaya'),
(7, 'Mall Taman Anggrek', 'Letjen S. Parman St No.Kav 21, RT.12/RW.1', '1983-12-15', 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `judul` varchar(45) NOT NULL,
  `sinopsis` text NOT NULL,
  `tahun` int(11) NOT NULL,
  `durasi` smallint(6) NOT NULL,
  `kelompoks_id` int(11) NOT NULL,
  `bahasa` enum('EN','ID','CHN','KOR','JPN','OTH') NOT NULL DEFAULT 'EN',
  `is_sub_indo` tinyint(4) NOT NULL DEFAULT 1,
  `cover_image` varchar(100) DEFAULT NULL,
  `diskon_nominal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id`, `judul`, `sinopsis`, `tahun`, `durasi`, `kelompoks_id`, `bahasa`, `is_sub_indo`, `cover_image`, `diskon_nominal`) VALUES
(1, 'Annabelle', '\"Annabelle\" mengisahkan kisah mengerikan dari sebuah boneka antik yang memiliki daya tarik jahat. John dan Mia Form merupakan pasangan muda yang menantikan kelahiran anak pertama mereka. Suatu hari, John memberikan boneka antik langka bernama Annabelle kepada Mia sebagai hadiah. Namun, kebahagiaan mereka berubah menjadi mimpi buruk ketika rumah mereka diserang oleh sekelompok sekte kejam yang berhubungan dengan roh jahat.\r\n\r\nSetelah serangan tersebut, kejadian-kejadian supernatural yang mengerikan mulai terjadi di sekitar rumah John dan Mia. Boneka Annabelle tampaknya menjadi fokus utama kejadian-kejadian tersebut. Mia mulai merasa terancam dan ketakutan oleh kehadiran roh jahat yang berusaha mengambil jiwa anak mereka yang belum lahir.\r\n\r\nDalam upaya untuk melindungi diri mereka, pasangan ini mencari bantuan dari para ahli paranormal, termasuk Ed dan Lorraine Warren, yang sebelumnya terlibat dalam kasus-kasus supranatural yang sulit. Perjalanan untuk mengungkap sumber kejahatan di balik boneka Annabelle membawa mereka ke dunia yang gelap dan mengerikan.', 2014, 90, 4, 'EN', 0, 'C:\\\\Users\\\\HM\\\\Downloads\\\\annabelle.jpg', 7500),
(2, 'Captain Marvel', '\"Captain Marvel\" adalah sebuah film pahlawan super yang dirilis pada tahun 2019. Film ini disutradarai oleh Anna Boden dan Ryan Fleck. Ceritanya berfokus pada Carol Danvers, seorang mantan pilot Angkatan Udara Amerika Serikat yang mendapatkan kekuatan super dan menjadi salah satu pahlawan terkuat di alam semesta Marvel.\r\n\r\nCarol Danvers, diperankan oleh Brie Larson, mendapati dirinya terlibat dalam perang antara dua ras alien yang kuat, yaitu Kree dan Skrull. Dalam perjalanannya, ia mengungkap misteri tentang masa lalunya dan mengembangkan kekuatan luar biasa sebagai Captain Marvel. Bersama-sama dengan agen Nick Fury, yang diperankan oleh Samuel L. Jackson, mereka berusaha menghentikan ancaman alien dan melindungi Bumi.', 2019, 120, 4, 'EN', 0, 'C:\\\\Users\\\\HM\\\\Downloads\\\\captain marvel.jpg', 10000),
(3, 'Aquaman', 'film ini mengisahkan kisah Arthur Curry, yang diperankan oleh Jason Momoa, yang dikenal sebagai Aquaman.\r\n\r\nDalam dunia yang terbagi antara daratan dan lautan, Arthur merupakan seorang pria keturunan campuran antara manusia dan Atlantean. Meskipun ia tumbuh di dunia manusia, Arthur harus menghadapi takdirnya sebagai penguasa lautan setelah takhta Atlantis terancam oleh konflik internal dan ancaman dari permukaan bumi.\r\n\r\nSetelah munculnya saudaranya yang haus kekuasaan, Orm, yang diperankan oleh Patrick Wilson, sebagai ancaman terhadap kedamaian di kedalaman lautan, Arthur harus memutuskan apakah ia akan memenuhi takhtanya sebagai Aquaman dan menyelamatkan dunia bawah air atau mengabaikannya. Dalam perjalanannya, Arthur dibantu oleh Mera, yang diperankan oleh Amber Heard, seorang pahlawan Atlantean yang tangguh.', 2018, 120, 4, 'EN', 0, 'C:\\\\Users\\\\HM\\\\Downloads\\\\aquaman.jpg', 5000),
(4, 'The god must big crazy', '\"The Gods Must Be Crazy\" adalah film komedi Afrika Selatan yang disutradarai oleh Jamie Uys. Ceritanya berkisar pada suku terpencil di Afrika yang menemukan botol Coca-Cola dijatuhkan dari pesawat. Percaya bahwa itu adalah hadiah dari para dewa, suku tersebut mengalami konflik dan kekacauan saat mereka mencoba memahami dan menggunakan benda misterius tersebut.\r\n\r\nSaat suku tersebut menghadapi berbagai situasi komedi dan kesalahpahaman saat mencoba memahami botol tersebut, film ini juga mengikuti kisah seorang guru sekolah dan ahli biologi di wilayah tersebut. Kedua alur cerita tersebut akhirnya bertemu, mengarah pada eksplorasi perbedaan budaya dan sifat manusia yang mengharukan dan lucu.\r\n\r\nFilm ini terkenal dengan perpaduan unik antara humor, sindiran, dan komentar sosial, menjadikannya film klasik dalam genre komedi. Jika Anda tertarik dengan sinopsis yang lebih detail atau aspek spesifik dari film tersebut, silakan beri tahu saya!', 1980, 109, 2, 'EN', 0, 'C:\\\\Users\\\\HM\\\\Downloads\\\\The god must be crazy.jpg', 5000),
(5, 'a', 'a', 1900, 120, 1, 'ID', 0, 'C:\\Users\\HM\\Downloads\\Five nights at freddys.jpg', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `film_studio`
--

CREATE TABLE `film_studio` (
  `studios_id` int(11) NOT NULL,
  `films_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `film_studio`
--

INSERT INTO `film_studio` (`studios_id`, `films_id`) VALUES
(1, 1),
(1, 2),
(3, 3),
(3, 4),
(20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `deskripsi` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `nama`, `deskripsi`) VALUES
(1, 'Horor', 'takut, kecemasan, ketegangan.'),
(2, 'Aksi', 'aksi mendebarkan dan kegembiraan.'),
(3, 'Komedi', 'tawa, keceriaan, dan kelucuan.'),
(4, 'Dokumentasi', ' fakta, pengetahuan, kebenaran.'),
(5, 'Drama', 'emosi mendalam dan kisah mengharukan.'),
(6, 'Fiksi ilmiah', 'imajinasi futuristik dan teknologi.'),
(7, 'Petualangan', 'eksplorasi, tantangan, dan keberanian.'),
(8, 'Propaganda', 'sejarah atau konteks penggunaan propaganda.'),
(9, 'Politik', 'eksplorasi kekuasaan dan dinamika politik.'),
(10, 'Pendidikan', 'eksplorasi pembelajaran dan pengetahuan.');

-- --------------------------------------------------------

--
-- Table structure for table `genre_film`
--

CREATE TABLE `genre_film` (
  `films_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `genre_film`
--

INSERT INTO `genre_film` (`films_id`, `genres_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `grand_total` double NOT NULL,
  `diskon_nominal` double DEFAULT NULL,
  `konsumens_id` int(11) NOT NULL,
  `kasir_id` int(11) DEFAULT NULL,
  `status` enum('PENDING','VALIDASI','TERBAYAR') NOT NULL DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `tanggal`, `grand_total`, `diskon_nominal`, `konsumens_id`, `kasir_id`, `status`) VALUES
(1, '2024-01-06 17:25:59', 130000, 7500, 1, 2, 'TERBAYAR'),
(2, '2024-01-06 17:27:01', 180000, 7500, 1, 2, 'TERBAYAR'),
(3, '2024-01-06 17:30:52', 260000, 7500, 1, 2, 'TERBAYAR'),
(4, '2024-01-06 17:31:36', 180000, 7500, 2, 2, 'TERBAYAR'),
(5, '2024-01-06 17:31:52', 210000, 7500, 2, 2, 'TERBAYAR'),
(6, '2024-01-06 18:02:39', 280000, 5000, 2, 2, 'TERBAYAR'),
(7, '2024-01-06 18:03:13', 315000, 10000, 2, 2, 'TERBAYAR'),
(8, '2024-02-14 18:32:29', 1000000, 7500, 2, 2, 'TERBAYAR'),
(9, '2024-04-10 18:39:18', 10000, 2023, 1, 2, 'TERBAYAR'),
(10, '2024-01-06 18:41:06', 1000000, 5000, 3, 2, 'TERBAYAR'),
(11, '2024-01-06 20:42:17', 146000, 5000, 5, 2, 'TERBAYAR'),
(12, '2024-01-06 20:42:38', 146000, 5000, 4, 2, 'TERBAYAR'),
(13, '2024-01-09 20:33:23', 30000, 7500, 2, 2, 'TERBAYAR'),
(14, '2024-01-16 21:32:59', 160000, 5000, 1, 3, 'TERBAYAR'),
(15, '2024-01-16 21:33:40', 360000, 10000, 2, NULL, 'PENDING'),
(16, '2024-01-16 21:34:14', 320000, 5000, 3, NULL, 'PENDING'),
(17, '2024-01-16 21:34:46', 390000, 7500, 4, 2, 'TERBAYAR'),
(18, '2024-01-16 21:35:13', 480000, 7500, 5, NULL, 'PENDING'),
(19, '2024-01-16 21:36:02', 320000, 5000, 6, NULL, 'PENDING'),
(20, '2024-01-16 21:36:50', 450000, 10000, 7, NULL, 'PENDING'),
(21, '2024-01-16 21:37:26', 600000, 5000, 8, NULL, 'PENDING'),
(22, '2024-01-16 21:43:12', 40000, 5000, 1, NULL, 'PENDING'),
(23, '2024-01-16 21:43:44', 40000, 5000, 2, NULL, 'PENDING'),
(24, '2024-01-16 21:44:11', 80000, 5000, 3, NULL, 'PENDING'),
(25, '2024-01-17 10:25:23', 100000, 7500, 1, 2, 'TERBAYAR');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_films`
--

CREATE TABLE `jadwal_films` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_pemutaran` enum('I','II','III','IV') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jadwal_films`
--

INSERT INTO `jadwal_films` (`id`, `tanggal`, `jam_pemutaran`) VALUES
(17, '2024-01-16', 'I'),
(18, '2024-01-16', 'III'),
(19, '2024-01-16', 'II'),
(20, '2024-01-16', 'IV'),
(21, '2024-01-17', 'I'),
(22, '2024-01-23', 'I'),
(23, '2024-01-23', 'III');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_studios`
--

CREATE TABLE `jenis_studios` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `deskripsi` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jenis_studios`
--

INSERT INTO `jenis_studios` (`id`, `nama`, `deskripsi`) VALUES
(1, 'I', 'Reguler'),
(2, 'II', '3D'),
(3, 'III', 'Premiere '),
(4, 'IV', 'IMAX 3D'),
(5, 'V', 'Dolby Atmos 3D');

-- --------------------------------------------------------

--
-- Table structure for table `kelompoks`
--

CREATE TABLE `kelompoks` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kelompoks`
--

INSERT INTO `kelompoks` (`id`, `nama`) VALUES
(1, 'Semua Umur'),
(2, 'Remaja'),
(3, 'Remaja Dewasa'),
(4, 'Dewasa'),
(5, 'Dewasa Bersertifikat'),
(6, 'Film untuk Orang Tua'),
(7, 'Supervisi Orang Tua');

-- --------------------------------------------------------

--
-- Table structure for table `konsumens`
--

CREATE TABLE `konsumens` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `no_hp` varchar(45) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `saldo` double NOT NULL DEFAULT 0,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `konsumens`
--

INSERT INTO `konsumens` (`id`, `nama`, `email`, `no_hp`, `gender`, `tgl_lahir`, `saldo`, `username`, `password`) VALUES
(1, 'Amirullah', 'KO160421001@clikoor.io', 'KO160421001', 'L', '1900-06-04', 827500, 'KO1', 'a08517729400e20bb8df334d4aa2e2746a4c91529132417e5ec34b5d6f019900c7e55a423fe2328d43b74affa6a2ec44be9ac4764e98a45a8da85fc25f44f616'),
(2, 'Said', 'KO160421002@clikoor.io', 'KO160421002', 'L', '1891-06-17', 615000, 'KO2', '611753d920f099a44d904b7f803e87aff9bb8b75f40929b32a25e35821f80cbf7103e7b8cce9a55747d8aec5e40f8e907e1160e68307f2c92fa09f0942fb5779'),
(3, 'Rissel', 'KO160421003@clikoor.io', 'KO160421003', 'L', '2024-01-06', 610000, 'KO3', '00bcec3cb72c1dd752fea90b9d07d3b2c66b018da0adf8797f3654a6d060ded3939cb56cd9d0caed2f78125eda9abf858f27b23769c53ca14be95343049431d1'),
(4, 'Stewart', 'KO160421004@clikoor.io', 'KO160421004', 'L', '1924-06-19', 617500, 'KO4', '527dda29ca633816bf15f43fae98a9169b648bc735c124e0f3512c80785c4d7e772f8242ec2dab0c17b1abbaeae1b493550e9d69c7b4729b72d27f36b6c37bef'),
(5, 'Bryan', 'KO160421005@clikoor.io', 'KO160421005', 'L', '1964-07-23', 627500, 'KO5', 'de9c55adc2964c70522097ca983f6164466b4d60f491c806a1565be6a01a1c30a4257b12578caf7dd68a374bde27c56ac99177a35b1b3b33e894ca2f5b9f592f'),
(6, 'Semeneh', 'KO160421006@clikoor.io', 'KO160421006', 'L', '1910-07-19', 685000, 'KO6', '164c2cfde41725b76df93672651afa0ed12cfbdccbeacaa95dfe9429ac39601d79995aa326bc47c05f08db451060f9940a9b238b0b6cff8586f62c8f15188e3c'),
(7, 'Tukiem', 'KO160421007@clikoor,io', 'KO160421007', 'L', '1845-07-23', 560000, 'KO7', '6ef93599d3b172f64ea1774d569f7cc026cde6b40ab32f366f8799abfbb3037988866192c176827c7b7af078e6e154352c20696651ee3bfc07b705337cc8117f'),
(8, 'Sarminah', 'KO160421008@clikoor.io', 'KO160421008', 'P', '1966-06-14', 405000, 'KO8', '77916956174f011209932805a19851c7ef29e1954cdfd08c24a494a5f34ed8f10261e2ff116601134d81ff2756eaf9d0fe864dacc39985cd2c62ec386f045eba'),
(9, 'Bob', 'KO160421009@clikoor.io', 'KO160421009', 'L', '1753-06-29', 1000000, 'KO9', '51087247b5ff751702cb22adc0e1a46d2a0267ca2d5030bd51875402bec3149c6adae5115986f0713e680bd55e0031580ada979d32c88ddc00b10e1d65593175'),
(10, 'Alice', 'KO160421010@clikoor.io', 'KO160421010', 'P', '1753-01-01', 1000000, 'KO10', '40cae6fe034ba1f1b30e3a58b7cac7783a6905bf4193d09a42c2a76b9804b1f3e22b5abb17819246507aa712881c2b5c7b0c55bc39b3f4140803b8d425c14af4');

-- --------------------------------------------------------

--
-- Table structure for table `pegawais`
--

CREATE TABLE `pegawais` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` enum('ADMIN','KASIR','OPERATOR') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pegawais`
--

INSERT INTO `pegawais` (`id`, `nama`, `email`, `username`, `password`, `roles`) VALUES
(1, 'Amirullah', 'PG160421001@clikoor.cinema.io', 'PG1', 'f064ec9fb09b3908492bae952e030d36bd167e9dd162f11ffcb91a3f3572075d7711a1fa10c7535a8fa0ace43b1aa73dd882edcd7eaab7b22b47dd2270d35f3d', 'ADMIN'),
(2, 'Said', 'PG160421002@clikoor.cinema.io', 'PG2', 'edd72e854d32165187b6405bcc3bfc0029d86a968a82daa1a73babc69e927ab1af0a15f5cc986e2ec3e5175bccfcf0ff549242d7b64ae8001cda25e570affed2', 'KASIR'),
(3, 'Rissel', 'PG160421003@clikoor.cinema.io', 'PG3', 'd757030a3218e8d81ec37a0fb2b1be9cbe4a158fbe8eb09b6f076d4e130130f18281482dd2bad4a428587ce2fbf5fe625714f5fe152e8d3d5b6a461bc0ef5287', 'KASIR'),
(4, 'Stewart', 'PG160421004@clikoor.cinema.io', 'PG4', '5f9e941f5b82edaf0bf40f9b7ed7c93c6ec4a1bc1b5ecba9b4a9fdbadce86e56fa8187a0bcd51f1c531ab3daf60c686dff0fc326e6a48e3b550f806e074e55e7', 'OPERATOR'),
(5, 'Bryan', 'PG160421005@clikoor.cinema.io', 'PG5', 'd290ea2e6f86473f611aaa9e8e042964b61cc70b94933f6f59b2a6448aff79a07a30352e12f948cdec710449bd0b1a4e9de2186b4c98f1963c148a7538604e38', 'OPERATOR');

-- --------------------------------------------------------

--
-- Table structure for table `sesi_films`
--

CREATE TABLE `sesi_films` (
  `jadwal_film_id` int(11) NOT NULL,
  `studios_id` int(11) NOT NULL,
  `films_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sesi_films`
--

INSERT INTO `sesi_films` (`jadwal_film_id`, `studios_id`, `films_id`) VALUES
(17, 1, 1),
(17, 3, 3),
(18, 1, 1),
(18, 3, 3),
(19, 1, 2),
(19, 3, 4),
(20, 1, 2),
(20, 3, 4),
(22, 20, 1),
(23, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `studios`
--

CREATE TABLE `studios` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `jenis_studios_id` int(11) NOT NULL,
  `cinemas_id` int(11) NOT NULL,
  `harga_weekday` int(11) NOT NULL,
  `harga_weekend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `studios`
--

INSERT INTO `studios` (`id`, `nama`, `kapasitas`, `jenis_studios_id`, `cinemas_id`, `harga_weekday`, `harga_weekend`) VALUES
(1, 'I', 84, 1, 1, 30000, 32500),
(2, 'II', 70, 2, 1, 35000, 37500),
(3, 'III', 56, 3, 1, 40000, 42500),
(4, 'IV', 50, 4, 1, 45000, 47500),
(5, 'V', 40, 5, 1, 50000, 52500),
(6, 'I', 80, 1, 2, 30000, 35000),
(7, 'II', 76, 2, 2, 40000, 45000),
(8, 'III', 72, 3, 2, 50000, 55000),
(9, 'IV', 68, 4, 2, 60000, 65000),
(10, 'V', 64, 5, 2, 70000, 75000),
(11, 'I', 82, 1, 3, 30000, 32500),
(12, 'II', 78, 2, 3, 35000, 37500),
(13, 'III', 74, 3, 3, 40000, 42500),
(14, 'I', 84, 1, 4, 30000, 34000),
(15, 'II', 76, 2, 4, 38000, 42000),
(16, 'I', 84, 1, 5, 32000, 36000),
(17, 'III', 76, 3, 5, 40000, 44000),
(18, 'IV', 84, 4, 6, 50000, 55000),
(19, 'V', 72, 5, 6, 70000, 80000),
(20, 'III', 72, 3, 7, 50000, 60000),
(21, 'V', 64, 5, 7, 70000, 80000);

-- --------------------------------------------------------

--
-- Table structure for table `tikets`
--

CREATE TABLE `tikets` (
  `invoices_id` int(11) NOT NULL,
  `nomor_kursi` varchar(3) NOT NULL,
  `status_hadir` tinyint(4) NOT NULL DEFAULT 0,
  `operator_id` int(11) DEFAULT NULL,
  `harga` double NOT NULL,
  `jadwal_film_id` int(11) NOT NULL,
  `studios_id` int(11) NOT NULL,
  `films_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tikets`
--

INSERT INTO `tikets` (`invoices_id`, `nomor_kursi`, `status_hadir`, `operator_id`, `harga`, `jadwal_film_id`, `studios_id`, `films_id`) VALUES
(14, 'B25', 1, 5, 155000, 19, 3, 4),
(14, 'B26', 0, NULL, 155000, 19, 3, 4),
(14, 'B27', 0, NULL, 155000, 19, 3, 4),
(14, 'B28', 0, NULL, 155000, 19, 3, 4),
(15, 'A13', 0, NULL, 350000, 19, 1, 2),
(15, 'A14', 0, NULL, 350000, 19, 1, 2),
(15, 'A25', 0, NULL, 350000, 19, 1, 2),
(15, 'A26', 0, NULL, 350000, 19, 1, 2),
(15, 'A27', 0, NULL, 350000, 19, 1, 2),
(15, 'A28', 0, NULL, 350000, 19, 1, 2),
(15, 'B14', 0, NULL, 350000, 19, 1, 2),
(15, 'B15', 0, NULL, 350000, 19, 1, 2),
(15, 'C14', 0, NULL, 350000, 19, 1, 2),
(15, 'C15', 0, NULL, 350000, 19, 1, 2),
(15, 'C27', 0, NULL, 350000, 19, 1, 2),
(15, 'C28', 0, NULL, 350000, 19, 1, 2),
(16, 'B23', 0, NULL, 315000, 17, 3, 3),
(16, 'B24', 0, NULL, 315000, 17, 3, 3),
(16, 'B25', 0, NULL, 315000, 17, 3, 3),
(16, 'B26', 0, NULL, 315000, 17, 3, 3),
(16, 'C15', 0, NULL, 315000, 17, 3, 3),
(16, 'C16', 0, NULL, 315000, 17, 3, 3),
(16, 'C17', 0, NULL, 315000, 17, 3, 3),
(16, 'C18', 0, NULL, 315000, 17, 3, 3),
(17, 'A17', 0, NULL, 382500, 17, 1, 1),
(17, 'A19', 0, NULL, 382500, 17, 1, 1),
(17, 'A25', 0, NULL, 382500, 17, 1, 1),
(17, 'A26', 0, NULL, 382500, 17, 1, 1),
(17, 'A27', 0, NULL, 382500, 17, 1, 1),
(17, 'B19', 0, NULL, 382500, 17, 1, 1),
(17, 'B20', 0, NULL, 382500, 17, 1, 1),
(17, 'B26', 0, NULL, 382500, 17, 1, 1),
(17, 'B27', 0, NULL, 382500, 17, 1, 1),
(17, 'B28', 0, NULL, 382500, 17, 1, 1),
(17, 'C15', 0, NULL, 382500, 17, 1, 1),
(17, 'C19', 0, NULL, 382500, 17, 1, 1),
(17, 'C20', 0, NULL, 382500, 17, 1, 1),
(18, 'A13', 0, NULL, 472500, 18, 1, 1),
(18, 'A14', 0, NULL, 472500, 18, 1, 1),
(18, 'A18', 0, NULL, 472500, 18, 1, 1),
(18, 'A19', 0, NULL, 472500, 18, 1, 1),
(18, 'A23', 0, NULL, 472500, 18, 1, 1),
(18, 'A24', 0, NULL, 472500, 18, 1, 1),
(18, 'A28', 0, NULL, 472500, 18, 1, 1),
(18, 'B19', 0, NULL, 472500, 18, 1, 1),
(18, 'B20', 0, NULL, 472500, 18, 1, 1),
(18, 'B25', 0, NULL, 472500, 18, 1, 1),
(18, 'C10', 0, NULL, 472500, 18, 1, 1),
(18, 'C11', 0, NULL, 472500, 18, 1, 1),
(18, 'C25', 0, NULL, 472500, 18, 1, 1),
(18, 'C26', 0, NULL, 472500, 18, 1, 1),
(18, 'C27', 0, NULL, 472500, 18, 1, 1),
(18, 'C28', 0, NULL, 472500, 18, 1, 1),
(19, 'B21', 0, NULL, 315000, 18, 3, 3),
(19, 'B22', 0, NULL, 315000, 18, 3, 3),
(19, 'B23', 0, NULL, 315000, 18, 3, 3),
(19, 'B24', 0, NULL, 315000, 18, 3, 3),
(19, 'C21', 0, NULL, 315000, 18, 3, 3),
(19, 'C22', 0, NULL, 315000, 18, 3, 3),
(19, 'C23', 0, NULL, 315000, 18, 3, 3),
(19, 'C24', 0, NULL, 315000, 18, 3, 3),
(20, 'A13', 0, NULL, 440000, 20, 1, 2),
(20, 'A18', 0, NULL, 440000, 20, 1, 2),
(20, 'A23', 0, NULL, 440000, 20, 1, 2),
(20, 'A28', 0, NULL, 440000, 20, 1, 2),
(20, 'B25', 0, NULL, 440000, 20, 1, 2),
(20, 'B26', 0, NULL, 440000, 20, 1, 2),
(20, 'B27', 0, NULL, 440000, 20, 1, 2),
(20, 'B28', 0, NULL, 440000, 20, 1, 2),
(20, 'C15', 0, NULL, 440000, 20, 1, 2),
(20, 'C16', 0, NULL, 440000, 20, 1, 2),
(20, 'C18', 0, NULL, 440000, 20, 1, 2),
(20, 'C19', 0, NULL, 440000, 20, 1, 2),
(20, 'C21', 0, NULL, 440000, 20, 1, 2),
(20, 'C22', 0, NULL, 440000, 20, 1, 2),
(20, 'C25', 0, NULL, 440000, 20, 1, 2),
(21, 'B10', 0, NULL, 595000, 20, 3, 4),
(21, 'B11', 0, NULL, 595000, 20, 3, 4),
(21, 'B13', 0, NULL, 595000, 20, 3, 4),
(21, 'B16', 0, NULL, 595000, 20, 3, 4),
(21, 'B18', 0, NULL, 595000, 20, 3, 4),
(21, 'B23', 0, NULL, 595000, 20, 3, 4),
(21, 'B24', 0, NULL, 595000, 20, 3, 4),
(21, 'B25', 0, NULL, 595000, 20, 3, 4),
(21, 'B26', 0, NULL, 595000, 20, 3, 4),
(21, 'C15', 0, NULL, 595000, 20, 3, 4),
(21, 'C16', 0, NULL, 595000, 20, 3, 4),
(21, 'C17', 0, NULL, 595000, 20, 3, 4),
(21, 'C18', 0, NULL, 595000, 20, 3, 4),
(21, 'C27', 0, NULL, 595000, 20, 3, 4),
(21, 'C28', 0, NULL, 595000, 20, 3, 4),
(22, 'B1', 0, NULL, 35000, 19, 3, 4),
(23, 'B15', 0, NULL, 35000, 20, 3, 4),
(24, 'B11', 0, NULL, 75000, 19, 3, 4),
(24, 'B12', 0, NULL, 75000, 19, 3, 4),
(25, 'A14', 0, NULL, 92500, 23, 20, 1),
(25, 'A15', 0, NULL, 92500, 23, 20, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktors`
--
ALTER TABLE `aktors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aktor_film`
--
ALTER TABLE `aktor_film`
  ADD PRIMARY KEY (`aktors_id`,`films_id`),
  ADD KEY `fk_aktors_has_films_films1_idx` (`films_id`),
  ADD KEY `fk_aktors_has_films_aktors1_idx` (`aktors_id`);

--
-- Indexes for table `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_films_kelompoks1_idx` (`kelompoks_id`);

--
-- Indexes for table `film_studio`
--
ALTER TABLE `film_studio`
  ADD PRIMARY KEY (`studios_id`,`films_id`),
  ADD KEY `fk_studios_has_films_films1_idx` (`films_id`),
  ADD KEY `fk_studios_has_films_studios1_idx` (`studios_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre_film`
--
ALTER TABLE `genre_film`
  ADD PRIMARY KEY (`films_id`,`genres_id`),
  ADD KEY `fk_films_has_genres_genres1_idx` (`genres_id`),
  ADD KEY `fk_films_has_genres_films1_idx` (`films_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_invoices_konsumens1_idx` (`konsumens_id`),
  ADD KEY `fk_invoices_pegawais1_idx` (`kasir_id`);

--
-- Indexes for table `jadwal_films`
--
ALTER TABLE `jadwal_films`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_studios`
--
ALTER TABLE `jenis_studios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelompoks`
--
ALTER TABLE `kelompoks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsumens`
--
ALTER TABLE `konsumens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sesi_films`
--
ALTER TABLE `sesi_films`
  ADD PRIMARY KEY (`jadwal_film_id`,`studios_id`,`films_id`),
  ADD KEY `fk_jadwal_film_has_film_studio_film_studio1_idx` (`studios_id`,`films_id`),
  ADD KEY `fk_jadwal_film_has_film_studio_jadwal_film1_idx` (`jadwal_film_id`);

--
-- Indexes for table `studios`
--
ALTER TABLE `studios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_studios_jenis_studios_idx` (`jenis_studios_id`),
  ADD KEY `fk_studios_cinemas1_idx` (`cinemas_id`);

--
-- Indexes for table `tikets`
--
ALTER TABLE `tikets`
  ADD PRIMARY KEY (`invoices_id`,`nomor_kursi`),
  ADD KEY `fk_film_studio_has_invoices_invoices1_idx` (`invoices_id`),
  ADD KEY `fk_film_studio_has_invoices_pegawais1_idx` (`operator_id`),
  ADD KEY `fk_tikets_sesi_films1_idx` (`jadwal_film_id`,`studios_id`,`films_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktors`
--
ALTER TABLE `aktors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `jadwal_films`
--
ALTER TABLE `jadwal_films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jenis_studios`
--
ALTER TABLE `jenis_studios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kelompoks`
--
ALTER TABLE `kelompoks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `konsumens`
--
ALTER TABLE `konsumens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pegawais`
--
ALTER TABLE `pegawais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `studios`
--
ALTER TABLE `studios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktor_film`
--
ALTER TABLE `aktor_film`
  ADD CONSTRAINT `fk_aktors_has_films_aktors1` FOREIGN KEY (`aktors_id`) REFERENCES `aktors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aktors_has_films_films1` FOREIGN KEY (`films_id`) REFERENCES `films` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `fk_films_kelompoks1` FOREIGN KEY (`kelompoks_id`) REFERENCES `kelompoks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `film_studio`
--
ALTER TABLE `film_studio`
  ADD CONSTRAINT `fk_studios_has_films_films1` FOREIGN KEY (`films_id`) REFERENCES `films` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_studios_has_films_studios1` FOREIGN KEY (`studios_id`) REFERENCES `studios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `genre_film`
--
ALTER TABLE `genre_film`
  ADD CONSTRAINT `fk_films_has_genres_films1` FOREIGN KEY (`films_id`) REFERENCES `films` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_films_has_genres_genres1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_invoices_konsumens1` FOREIGN KEY (`konsumens_id`) REFERENCES `konsumens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_invoices_pegawais1` FOREIGN KEY (`kasir_id`) REFERENCES `pegawais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sesi_films`
--
ALTER TABLE `sesi_films`
  ADD CONSTRAINT `fk_jadwal_film_has_film_studio_film_studio1` FOREIGN KEY (`studios_id`,`films_id`) REFERENCES `film_studio` (`studios_id`, `films_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jadwal_film_has_film_studio_jadwal_film1` FOREIGN KEY (`jadwal_film_id`) REFERENCES `jadwal_films` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `studios`
--
ALTER TABLE `studios`
  ADD CONSTRAINT `fk_studios_cinemas1` FOREIGN KEY (`cinemas_id`) REFERENCES `cinemas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_studios_jenis_studios` FOREIGN KEY (`jenis_studios_id`) REFERENCES `jenis_studios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tikets`
--
ALTER TABLE `tikets`
  ADD CONSTRAINT `fk_film_studio_has_invoices_invoices1` FOREIGN KEY (`invoices_id`) REFERENCES `invoices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_film_studio_has_invoices_pegawais1` FOREIGN KEY (`operator_id`) REFERENCES `pegawais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tikets_sesi_films1` FOREIGN KEY (`jadwal_film_id`,`studios_id`,`films_id`) REFERENCES `sesi_films` (`jadwal_film_id`, `studios_id`, `films_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
