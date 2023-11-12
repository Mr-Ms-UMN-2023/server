-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2023 at 12:27 AM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 8.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MRMS_2023`
--

-- --------------------------------------------------------

--
-- Table structure for table `awarding`
--

CREATE TABLE `awarding` (
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransactionProof` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Origin` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransactionDate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finalis2020`
--

CREATE TABLE `finalis2020` (
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Year` int(11) NOT NULL,
  `Tagline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finalis2022`
--

CREATE TABLE `finalis2022` (
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Year` int(11) NOT NULL,
  `Tagline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metanoia`
--

CREATE TABLE `metanoia` (
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransactionProof` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Origin` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransactionDate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StudentID` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BirthDate` date NOT NULL,
  `BirthPlace` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IGUsername` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Year` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GPA` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpaPict` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Height` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Weight` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clothesSize` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pantsSize` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shoeSize` int(11) NOT NULL,
  `AboutMe` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Motivation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Talents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrganizationExperience` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Achievements` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleModelCharacter` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `essai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` int(11) NOT NULL,
  `QuestionType` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peserta_2023`
--

CREATE TABLE `peserta_2023` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_student` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tiktok_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_gpa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clothes_size` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shoe_size` int(11) NOT NULL,
  `pants_size` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_me` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `talents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `achievements` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personality_screenshot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grades_screenshot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_card_screenshot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `himalaya_items` (
  `id` VARCHAR(100), 
  `nama` VARCHAR(255),
  `deskripsi` VARCHAR(255), 
  `quota` INTEGER,
  `reserved` INTEGER DEFAULT 0,
  `harga` INTEGER,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `transactions` (
  `id` VARCHAR(50),
  `status` VARCHAR(30) NULL,
  `quantity` INTEGER, 
  `item_id` VARCHAR(100),
  `payment_init_time` datetime NULL DEFAULT NULL,
  `payment_done_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`item_id`) REFERENCES `himalaya_items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `himalaya_audiences` (
  `id` VARCHAR(100), 
  `nama` VARCHAR(255), 
  `email` VARCHAR(255), 
  `whatsapp` VARCHAR(50),
  `transaction_id` VARCHAR(50) NULL,
  `created_at` datetime NULL DEFAULT NULL, 
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`transaction_id`) REFERENCES transactions (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `himalaya_qr_tokens` (
  `token` VARCHAR(100), 
  `audience_id` VARCHAR(100), 
  `attendance` TINYINT(1) DEFAULT 0,
  PRIMARY KEY (`token`), 
  FOREIGN KEY (`audience_id`) REFERENCES `himalaya_audiences` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `finalis_2023` (
  `id` varchar(100) PRIMARY KEY,
  `name` varchar(255),
  `major` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `tagline` LONGTEXT DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL, 
  `about` LONGTEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `voter_2023` (
--   `id` varchar(100) PRIMARY KEY,
--   `name` varchar(255), 
--   `email` varchar(255), 
--   `whatsapp` VARCHAR(50),  
--   `created_at` datetime NULL DEFAULT NULL, 
--   `updated_at` datetime NULL DEFAULT NULL  
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- CREATE TABLE `vote_list_2023` (
--   `voter_id` varchar(100),
--   `finalis_id` varchar(100),
--   `quantity` int(11) DEFAULT(1),
--   FOREIGN KEY (`voter_id`) REFERENCES `voter_2023` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
--   FOREIGN KEY (`finalis_id`) REFERENCES `finalis_2023` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vote_list_2023` (
  `id` varchar(100),
  `finalis_id` varchar(100),
  `quantity` int(11) DEFAULT(1),
  FOREIGN KEY (`finalis_id`) REFERENCES `finalis_2023` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Dumping data for table `peserta_2023`
--

INSERT INTO `himalaya_items` VALUES ("(TESTING) TICKET HIMALAYA", "(TESTING) Tiket HIMALAYA MR. & MS. UMN 2023", "-", 1300, 0, 20000);

INSERT INTO `peserta_2023` (`id`, `name`, `nim`, `email_student`, `birth_place`, `birth_date`, `gender`, `address`, `phone_number`, `line_id`, `instagram_username`, `tiktok_username`, `major`, `year`, `sub_gpa`, `gpa`, `height`, `weight`, `clothes_size`, `shoe_size`, `pants_size`, `about_me`, `motivation`, `personality`, `talents`, `achievements`, `picture`, `personality_screenshot`, `grades_screenshot`, `student_card_screenshot`, `created_at`) VALUES
(31, 'Nixon Osel Linuel', '00000069221', 'nixon.osel@student.umn.ac.id', 'Tangerang', '2004-04-07', 'm', 'Jalan Raya Pondok Aren No.3, Bintaro', '087876829899', 'nixonosel24', '@nixnosl', '', 'Komunikasi Strategis', '2022', '', '3.78', '173', '68', 'L', 44, '30', 'Saya merupakan mahasiswa aktif Universitas Multimedia Nusantara yang mengambil jurusan Ilmu Komunikasi Angkatan 2022. Saya menyukai hal-hal berbau olahraga dan musik.', 'Saya ingin mengeksplor hal baru, berusaha mengembangkan kualitas diri, dan membangun relasi yang baik terhadap mahasiswa/i UMN', 'INFJ-A', 'Saya bisa bermain musik (piano dan gitar), saya menyukai olahraga (gym, calisthenics, berenang, badminton), saya bisa bermain berbagai macam rubik', '', '/public/images/pictures/1681315554505_Pas Foto Nixon (1).png', '/public/images/personality_screenshots/1681315554506_MBTI.jpg', '/public/images/grades_screenshots/1681315554565_IPK.jpg', '/public/images/student_card_screenshots/1681315554567_KTM.jpg', '2023-04-12 09:05:54'),
(34, 'Aulalia Dzulaikha Qoizun', '00000063262', 'aulalia.dzulaikha1@student.umn.ac.id', 'Jakarta', '2003-02-06', 'f', 'Nuri Bintaro, Tangerang Selatan', '0811242042', 'aulaliaa', 'aulaliadq', '', 'Komunikasi Strategis', '2021', '3.57', '3.42', '158', '49', 'S', 37, '28', 'Saya merupakan seorang mahasiswa jurusan Komunikasi Strategis di UMN. Saat ini saya sedang fokus dalam pembelajaran selama kuliah dan mendaftarkan diri di organisasi untuk meningkatkan pengalaman saya. ', 'Motivasi saya untuk mengikuti Mr. & Ms. UMN adalah untuk mengembangkan dan menyalurkan bakat saya dalam organisasi serta mempelajari hal-hal baru. Saya juga ingin menunjukkan potensi yang saya miliki dengan berkontribusi pada Mr. & Ms. UMN.', 'INTJ-A', 'Saya selalu mencoba banyak hal yang menarik perhatian saya, dan sejauh ini saya dapat mengatakan bahwa saya memiliki bakat dalam bermain musik, melukis/menggambar dan bermain dalam drama.', '', '/public/images/pictures/1681451192372_3x4 a.jpg', '/public/images/personality_screenshots/1681451192375_AF7AF947-8B37-4A44-BDB4-74EAE9740108.png', '/public/images/grades_screenshots/1681451192382_99989DEE-830A-4F5F-81DF-8A4081786326.jpeg', '/public/images/student_card_screenshots/1681451192389_WhatsApp Image 2023-04-14 at 12.21.50.jpeg', '2023-04-13 22:46:32'),
(35, 'Jessyca Caroline', '00000081915', 'jessyca.caroline@student.umn.ac.id', 'Jakarta', '2003-12-08', 'f', 'Jakarta barat, cengkareng, perumahan kosambi baru', '087888122003', 'jessyca08', 'jessyca.crln', 'jessyca.crln', 'Komunikasi Strategis', '2022', '3.68', '3.68', '168', '50', 'M', 39, '29', 'Halo, perkenalkan nama saya Jessyca Caroline, bisa di panggil Jessy atau Jessyca. Saya adalah anak ke-2 dari 3 bersaudara. Saya sedang berkuliah di Universitas Multimedia Nusantara secara online dikarenakan saya berkuliah sambil bekerja untuk memenuhi kebutuhan hidup keluarga. Saya memiliki beberapa hobi, yaitu menyanyi, menari, melukas dan menggambar, bermain alat musik gitar, dan olahraga basket.  ', 'Saya bekerja di bidang fashion dan kecantikan. Saya sangat tertarik untuk mengikuti ajang-ajang seperti puteri Indonesia, Miss Indonesia, dan Indonesia Next Top Model. Karena ketertarikan saya sangat tinggi pada bidang tersebut, saya merasa dengan mengikuti acara mrmsumn saya dapat mendapatkan pengalaman yang berharga yang bisa dijadikan bekal ilmu di waktu yang mendatang. Sehingga saya berharap saat saya mengikuti event mrmsumn, saya dapat lebih siap dalam menghadapi rintangan yang ada di masa depan yang pastinya jauh lebih berat dan susah. Saya juga merupakan orang yang sangat suka mencari pengalaman baru diluar zona nyaman saya, karena saya sangat menyukai perasaan saat kita mendapatkan pengalaman dan teman baru. Maupun itu pengalaman baik ataupun buruk. Motivasi yang terakhir adalah tentu saja keuntungan saya sebagai mahasiswa yang akan diberikan beasiswa dan point skkm. Saya akan sangat bersyukur jika saya berhasil menjadi ms umn dan mendapatkan beasiswa, sehingga saya dapat mengurangi beban pengeluaran saya dan dapat disimpan atau digunakan untuk keperluan keluarga. ', 'INFJ-T', 'Sebagai seorang model, saya diberikan anugerah oleh Tuhan diberikan bentuk dan paras yang baik. Namun selain itu, saya juga memiliki talenta , yaitu menyanyi dan menari. Saya dapat dengan baik mengikuti gerakan tarian yang saya pelajari dan juga walaupun dulu saya merasa insecure dengan suara saya, semakin dewasa saya mengerti bahwa kita dapat berlatih menyanyi dan tidak bisa menyanyi bukan berarti suara kita jelek, hanya saja kita perlu latihan lebih. ', 'Berhasil menjadi juara favorite pada event fashion show pada tahun 2012, Berhasil menjadi Juara 1 dalam lomba menggambar dan mewarnai event faber castle tahun 2014, Berhasil menjadi Juara pertama sebagai Fashion Girl Indomodel pada tahun 2021', '/public/images/pictures/1681488551481_WhatsApp Image 2023-04-14 at 23.03.48.jpeg', '/public/images/personality_screenshots/1681488551541_WhatsApp Image 2023-04-14 at 23.00.35.jpeg', '/public/images/grades_screenshots/1681488551542_WhatsApp Image 2023-04-14 at 23.07.17.jpeg', '/public/images/student_card_screenshots/1681488551544_WhatsApp Image 2023-04-14 at 23.03.26.jpeg', '2023-04-14 09:09:12'),
(36, 'Wilcoustine Qhristmas Pniel Wijaya', '00000056960', 'Wilcoustine@student.umn.ac.id', 'Makassar', '2003-12-22', 'm', 'Jl. Allogio Barat V, no. 27, pagedangan, kab. Tangerang, banten', '082324770131', 'Ichigohosimia', 'Pnieelwijayaa', '', 'Informatika', '2021', '3.60', '3.44', '167', '47', 'S', 41, '27', 'Hi! My name is pniel, i’m 19 years old, and i’m from south pf sulawesi. I believe at my self that i can do anything and exceed my limits. I always stay with my personality, and always add the pniel effect in everything i do. People know me as someone who always cheerfull, confident, and creative. I start modelling about 2 years ago, and i still keep growing and growing to make my modelling skill better and even great.', 'My motivation is my own self, i always said that i need to take every chances that i got, and even though i didn’t suceed but at least i try and already give my best. I always said that i need be better than my yesterday self and be better for my tomorrow self.', 'ENTJ', 'If i can describe my talent, i believe that my talent is to be confident and public speaking. Other than that, i also can say that i’m a dancer.', 'Top 10 Icon Tangerang Fashion Parade(Best Couple and Best photo), Top 10 PaPi Chara 2018, Participant of international dancesportship. ', '/public/images/pictures/1681569597502_4B81BC5F-00F2-43AE-B6B3-851CDACC66D0.jpeg', '/public/images/personality_screenshots/1681569597531_0756BFFE-44B7-48D7-B831-02CF3758A2A9.jpeg', '/public/images/grades_screenshots/1681569597533_960A328F-4F94-4240-837A-E66A8C10B66A.png', '/public/images/student_card_screenshots/1681569597538_44BAF764-8030-42A7-822A-5BA4D3E29B62.jpeg', '2023-04-15 07:39:59'),
(37, 'Devara', '00000071616', 'devara@student.umn.ac.id', 'jogja', '2004-04-22', 'm', 'alo', '09181616161', 'oke', 'oke', '', 'Informatika', '2022', '3.7', '3.8', '198', '78', 'L', 42, '32', 'ok', 'ok', 'iipps', 'ok', '', '/public/images/pictures/1682158769942_C6EAF3EE-DC05-4D07-93BB-A33523ED26BE.png', '/public/images/personality_screenshots/1682158771643_BA48FDBD-83F9-4C58-A0BF-52F1D05E2248.jpeg', '/public/images/grades_screenshots/1682158771645_E24DBB40-3C77-4C32-8891-4F09950D1798.jpeg', '/public/images/student_card_screenshots/1682158771655_4FB649A4-66B2-43B1-93D4-55EB7C3C2902.jpeg', '2023-04-22 03:19:32'),
(38, 'Bryan Wijaya Hartono', '00000053476', 'bryan.wijaya3@student.umn.ac.id', 'Bandung', '2003-05-25', 'm', 'Newton Timur 32', '08225267890', 'bryannnw', 'bryannnw', '@diamkaubgst', 'Akuntansi', '2021', '3.5', '3.9', '185', '20', 'XS', 50, '30', 'wkwkwkkwkwkwkw', 'wkwkwkkwkwkw', 'wkwkwkwkkw', 'wkwkkww', 'wkwkkww', '/public/images/pictures/1682158830253_Bryan Wijaya_53476_k10_1.jpg', '/public/images/personality_screenshots/1682158830294_bukti magenta radio.jpg', '/public/images/grades_screenshots/1682158830300_SWARGALOKA.png', '/public/images/student_card_screenshots/1682158830303_WhatsApp Image 2023-03-29 at 17.35.34.jpeg', '2023-04-22 03:20:30'),
(39, 'Sheren Oktiva Adam', '00000069109', 'sheren.oktiva@student.umn.ac.id', 'Jakarta', '2004-10-16', 'f', 'Jalan alamanda 3 no. 15 Blok B5 Komplek Sarana Indah Permai, Kedaung, Ciputat, Tangerang Selatan, Banten.', '081288375060', 'magdashrn', 'magdashrn', 'shrncantik', 'Komunikasi Strategis', '2022', '3.910', '3.910', '165', '43', 'S', 39, '32', 'Saya merupakan pribadi yang to the point, tidak suka bertele-tele, saya sangat suka sharing dan menginspirasi banyak orang dengan cerita dan pengalaman yang telah saya lalui didalam kehidupan saya, saya suka berdebat mengenai ilmu pengetahuan, saya memiliki banyak ide-ide kreatif saat membuat konten di media sosial saya, saya memiliki banyak teman, dan saya memiliki kepercayaan diri. Saya juga dapat memengaruhi orang lain dapat mengambil keputusan yang positif dan sudah dibuktikan dengan semua perkataan teman-teman saya dan hasil dalam saya berorganisasi.', 'motivasi saya adalah untuk menjadi remaja yang memiliki banyak ilmu, dan pengalaman diberbagai bidang. Saya juga termotivasi untuk semakin maju agar saya dapat meringkankan biaya uang semester saya dengan beasiswa dan dengan mengikuti Mr. and Ms. UMN 2023 ini. Saya juga memiliki motivasi untuk menjadi manusia yang berguna untuk orang lain, dan kehadiran saya disekitar orang-orang membawa dampak yang baik, dan saya suka untuk berbuat aksi sosial sekecil apapun itu.', 'ESFJ-A', 'Saya bisa berdebat, menari tradisional, saya memiliki ke kreatifan dalam membuat konten setiap harinya.', 'Juara Harapan 1 Paduan Suara Tingkat SMP se-KAJ (Maret, 2018),  Juara 2 Lomba Akuntansi Tingkat Nasional dari Universitas Atma Jaya (Oktober 2021)', '/public/images/pictures/1682509363214_554F3BF6-1156-4645-9BA7-2BB14B82346F.jpeg', '/public/images/personality_screenshots/1682509363225_D2ADAD0D-80B9-4EAF-94A9-443E933F1C7A.png', '/public/images/grades_screenshots/1682509363231_Lampiran ScreenShot IPK dan IPS.pdf', '/public/images/student_card_screenshots/1682509363356_D93359BE-9D0B-4055-AC1A-9A79118D28DE.png', '2023-04-26 04:42:45'),
(40, 'Sheren Oktiva Adam', '00000069109', 'sheren.oktiva@student.umn.ac.id', 'Jakarta', '2004-10-16', 'f', 'Jalan Alamanda 3 No.15 Blok B5 Komplek Sarana Indah Permai, Kedaung, Ciputat, Tangerang selatan, Banten.', '081288375060', 'magdashrn', 'magdashrn', 'shrncantik', 'Komunikasi Strategis', '2022', '3.910', '3.910', '165', '43', 'S', 39, '32', 'saya merupakan pribadi yang to the point, tidak suka bertele-tele, saya sangat suka perdebatan mengenai ilmu pengetahuan hingga politik dan saya sangat suka mengajak serta menginspirasi orang orang disekitar saya. saya merupakan pribadi yang dapat ber Bawur dengan orang baru dengan cepat dan juga saya dapat mempengaruhi keputusan orang lain di dalam suatu peristiwa yang positif. saya memiliki ide ide kreatif yang tiap harinya akan saya berikan dan saya implementasikan ke dalam konten konten di media sosial saya sendiri. saya juga suka suatu tantangan dan juga saya selalu mau berkembang.', 'saya memiliki motivasi menjadi pribadi yang berguna untuk orang orang disekitar saya di dalam bidang yang positif, saya juga ingin menunjukkan ke orang orang lain bahwa saya ini memiliki patient di dalam diri saya untuk memimpin atau untuk mengajak orang orang dalam bergabung ke universitas multimedia Nusantara. saya juga termotivasi untuk meringankan pembayaran uang semester saya dengan mengikuti Mr and Ms UMN 2023. ', 'ESFJ-A', 'Saya dapat menari tradisional, saya bisa bernyanyi, bermain ukulele.', 'Juara Harapan 1 Paduan Suara Tingkat SMP se-KAJ (Maret,2018), Juara 2 Lomba Akuntansi Tingkat Nasional dari Universitas Atma Jaya (Oktober,2021)', '/public/images/pictures/1682510078407_CE946DEC-7ED7-48F5-999B-56508182A2CF.jpeg', '/public/images/personality_screenshots/1682510078503_65BDB98B-964C-487E-95B7-3DB16D4F1716.jpeg', '/public/images/grades_screenshots/1682510078509_686DAD8C-5E5A-43C4-9DC3-A212A656261B.jpeg', '/public/images/student_card_screenshots/1682510078516_E7E73A79-EA56-42E2-A3F8-7112E11686E1.png', '2023-04-26 04:54:39'),
(41, 'Calista Abigail Wairata', '00000068283', 'calista.abigail@student.umn.ac.id', 'Jakarta', '2004-10-12', 'f', 'Taman Parahyangan 5 no. 30', '085891324917', 'calistaabigail1210', 'calistabgail', '', 'Desain Komunikasi Visual', '2022', '3.57', '3.57', '165', '47', 'M', 39, '27', 'Pribadi yang selalu memikirkan masa depan dari karir dan hidup, mempertimbangkan semua pilihan dalam jangka waktu yang lama sehingga dapat menjadi sebuah kelebihan dan kelemahan', 'Pendapatn beasiswa dan nama baik dalam UMN', 'ESFP-T (Entertainer)', 'Ballet, lebih ke hal-jal yang berhubungan dengan pergerakan klasik daripada modern karena tarian klasik mempunyai kebudayaannya tersendiri', '', '/public/images/pictures/1682523347194_7334foo.jpg_sharp.jpg', '/public/images/personality_screenshots/1682523347345_Screenshot_20230426-221614_Chrome.jpg', '/public/images/grades_screenshots/1682523347356_Screenshot_20230426-211530_Chrome.jpg', '/public/images/student_card_screenshots/1682523347357_20230426_222538.jpg', '2023-04-26 08:35:47'),
(42, 'Cathrine Natasya ', '00000087992', 'cathrine.natasya@student.umn.ac.id', 'Jambi', '2003-10-14', 'f', 'Allogio Barat 3 no 20', '082273212200', 'cat_03', 'cathrinenatasya', '', 'Desain Komunikasi Visual', '2022', '3.65', '3.65', '165', '50', 'M', 39, '28', 'saya merupakan pribadi yang cukup introvert tetapi jika sudah dekat saya akan telihat cukup extrovert. Dari hasil test yang saya lakukan, sisi introvert yang saya miliki adalah 55%. Banyak yang bilang saya merupakan orang yang ceria dan periang terutama di antara teman teman saya. ', 'motivasi saya adalah mendapatkan beasiswa dan menambah pengalaman dalam public speaking', 'INTP', 'saya bisa berbahasa mandarin dan menggambar', '', '/public/images/pictures/1682760011781_Untitled26_20230301222402.png', '/public/images/personality_screenshots/1682760011988_Screenshot_20230427-141126_Chrome.jpg', '/public/images/grades_screenshots/1682760011990_Screenshot_20230429-161410_Samsung Internet.jpg', '/public/images/student_card_screenshots/1682760011991_20230429_154402.jpg', '2023-04-29 02:20:13'),
(43, 'Cathrine Natasya', '00000087992', 'cathrine.natasya@student.umn.ac.id', 'Jambi', '2003-10-14', 'f', 'Allogio Barat 3 No.20', '082273212200', 'cat_03', 'cathrinenatasya', '', 'Desain Komunikasi Visual', '2022', '3.65', '3.65', '163', '50', 'M', 39, '28', 'saya merupakan pribadi yang cukup introvert tetapi jika sudah dekat saya akan telihat cukup extrovert. Dari hasil test yang saya lakukan, sisi introvert yang saya miliki adalah 55%. Banyak yang bilang saya merupakan orang yang ceria dan periang terutama di antara teman teman saya. ', 'motivasi saya adalah mendapatkan beasiswa dan menambah pengalaman dalam public speaking', 'INTP', 'saya bisa berbasa mandarin dan menggambar', '', '/public/images/pictures/1682784201109_Untitled26_20230301222402.png', '/public/images/personality_screenshots/1682784201490_Screenshot_20230427-141126_Chrome.jpg', '/public/images/grades_screenshots/1682784201492_Screenshot_20230429-161410_Samsung Internet.jpg', '/public/images/student_card_screenshots/1682784201494_20230429_154402.jpg', '2023-04-29 09:03:22'),
(44, 'Christopher Evan Pangestu', '00000056264', 'christopher.evan@student.umn.ac.id', 'Jakarta', '2003-08-17', 'm', 'Jl. Allogio Barat 3 no. 20, House of Seven8Nine, Tangerang.', '087788661056', 'evan.pangestu', '@christopher.evann', '', 'Komunikasi Strategis', '2021', '3.30', '3.29', '175', '79', 'L', 45, '34', 'Saya merupakan anak pertama dari tiga bersaudara. Ketika berada di tingkat SD, saya bersekolah di SDK 10 PENABUR, Jakarta Utara. Kemudian, saya berlanjut ke SMPK 6 PENABUR dan SMAK 6 PENABUR. Belakangan ini, saya sedang aktif dalam salah satu UKM di UMN, yaitu Teater Katak. Setelah bergabung dan melewati pementasa inaugurasi sebagai pemain, saya merasa hobi, minat, dan bakat saya berada pada UKM tersebut, khususnya berakting. Pada akhirnya, saya mulai untuk bertekun dalam menempuh karir dan menggapai mimpi saya agar dapat berhasil di dunia seni akting. Setelah bergabung dengan Teater Katak, saya mempunyai begitu banyak kerabat dan koneksi baik di dalam UMN, maupun di luar.  Kelebihan saya adalah saya dapat beradaptasi dengan mudah di lingkungan baru, terbuka dalam menerima kritik dan saran, mempunyai rasa ingin tahu yang besar, suka mencoba hal yang baru, bertanggung jawab, proaktif, disiplin, berkomitmen, percaya diri, ambisius, dapat bekerja sama dengan baik dalam tim, dan peka terhadap sekitar. Sedangkan, untuk kekurangan, saya terkadang suka melakukan prokrastinasi dan terlalu ambisius terhadap satu pekerjaan, sehingga pekerjaan lain tertinggal. Namun, saat ini saya sedang mulai berhasil untuk menanganinya dengan membuat to do list dan belajar dari kesalahan saya. Selain itu, saya juga tidak mudah percaya dengan orang baru/rekan, namun saat ini saya sedang berusaha untuk lebih percaya. ', 'Saat ini, motivasi saya adalah saya ingin menempuh keinginan dan impian saya yang belum lama ini muncul, yaitu itu berkarir di dunia akting. Saya merasa sangat tertarik dan bahagia ketika berakting dalam suatu karya. Tiap projek menjadi tantangan baru bagi saya, karena tuntutan di mana saya harus dapat berperan sebagai karakter yang berbeda-beda. Selain itu, saya juga ingin sekali bergabung pada Mr & Ms UMN, karena jika saya berhasil lolos, saya yakin hal tersebut menjadi salah satu pencapaian/prestasi terbesar bagi saya dan patut membanggakan untuk orangtua saya. Saya juga ingin menunjukkan kepada keluarga dan kerabat saya, bahwa saya mamu menempuh karir dan menciptakan prestasi saya sendiri tanpa bantuan dari orang lain. Terakhir, mungkin motivasi saya juga timbul dari besarnya rasa ingin tahu dan ingin mencoba hal baru yang saya miliki.', 'ENFJ-A', 'Saya yakin dan merasa bahwa saya diberkahi dengan multitalenta, di mana dalam berbagai hal, terutama olahraga, saya mampu melakukannya berbagai jenis olahraga dengan baik dan diatas rata-rata, kemudian saya juga mampu belajar dengan baik. Selain itu, talenta yang saya temukan belakangan ini, adalah bakat saya dalam seni peran/berakting. Ketika belajar/mencoba hal baru, saya juga merasa bahwa saya mempunyai talenta untuk belajar dan memahami dengan cepat dan baik.', 'Saya berhasil menjadi bagian dari OSIS SMAK 6 PENABUR, sebagai Koordinator bidang 3 (Wawasan bangsa & bela negara). Ketika lulus SMA, saya menempati Ranking 6 di kelas saya, dan ranking 14 secara parallel, jurusan IPS. Kemudian, saya juga aktif dalam berbagai kepanitiaan sewaktu SMA, menjadi ketua PASKIBRA di SMAK 6 Penabur dan saat ini saya telah menjadi PASKIBRA pada OMB 2022 dan Pembawa Bendera pada Kuliah Perdana 2022 dan Wisuda UMN, awal tahun ini. Saya juga sempat menjadi panitia INARA 4.0 di UMN, pada divisi acara.', '/public/images/pictures/1682844961733_Foto Muka.jpg', '/public/images/personality_screenshots/1682844961893_Screenshot (54).png', '/public/images/grades_screenshots/1682844961897_Screenshot (56).png', '/public/images/student_card_screenshots/1682844961931_Foto-KTM.jpg', '2023-04-30 01:56:03'),
(45, 'Jimmy Filiolus Yonatan', '00000055379', 'jimmy.filiolus@student.umn.ac.id', 'Garut', '2003-02-03', 'm', 'Jl.Pembangunan no.2a Garut', '085340411107', 'jimmyyonatan2003', 'Jimmyyonatan', '', 'Managemen', '2021', '3.43', '3.53', '167', '52', 'M', 41, '29', 'Saya merupakan mahasiswa Management Universitas Multimedia Nusantara angkatan 2021. Selama saya berkukiah, saya mengikuti beberapa kegiatan di kampus juga diluar kampus. Saya tertarik untuk terus belajar guna menambah relasi, wawasan, dan pengalaman. ', 'Motivasi saya dalam mengikuti Mr & Ms UMN adalah untuk menjadi pribadi yang lebih baik dan juga memotivasi banyak orang bahwa Mr & Ms juga banyak hal - hal positif yang dapat dilakukan.', 'ESFJ - A', 'Saya memiliki bakat di bidang Basket, saya tertarik dengan olahraga basket sejak umur 12 Tahun. Sejak SMP, saya sering mengikuti beberapa lomba basket. Dalam basket saya berada di posisi Point Guard, yaitu posisi yang mengatur dan menguasai lapangan dan juga tim. Motivasi saya dalam olahraga basket yaitu dulu saya memiliki tubuh yang pendek, sehingga saya berkeinginan untuk memiliki tubuh yang tinggi, akan tetapi seiring berjalannya waktu, saya memiliki minat lebih di olahraga basket ini, sehingga saya terus belajar dan mendalami di dunia olahraga basket.', 'Juara 2 Lomba Basket ( Duta Cup) - 2016 , Juara 3 Lomba basket ( Yayasan Salib Suci) - 2017 ', '/public/images/pictures/1683010931192_inbound4463858475481381872.jpg', '/public/images/personality_screenshots/1683010931354_inbound1920178733105882572.jpg', '/public/images/grades_screenshots/1683010931444_inbound3819127505245635138.jpg', '/public/images/student_card_screenshots/1683010932232_inbound2512518822085413368.jpg', '2023-05-02 00:02:12'),
(46, 'koong hiap', '0000055136', 'koong.hiap@student.umn.ac.id', 'test', '2023-05-02', 'm', 'graha sujaya jl. yos sudarso no. 133', '08125788893', 'test', 'test', 'test', 'Informatika', '2021', '4', '4', '160', '66', 'L', 30, '30', 'test', 'test', 'test', 'test', 'test', '/public/images/pictures/1683034858671_Screenshot_2023-04-17-01-13-06-14_1c337646f29875672b5a61192b9010f9.jpg', '/public/images/personality_screenshots/1683034858763_Screenshot_2023-04-17-01-13-21-67_1c337646f29875672b5a61192b9010f9.jpg', '/public/images/grades_screenshots/1683034858770_Screenshot_2023-04-17-01-13-06-14_1c337646f29875672b5a61192b9010f9.jpg', '/public/images/student_card_screenshots/1683034858779_Screenshot_2023-04-17-01-13-21-67_1c337646f29875672b5a61192b9010f9.jpg', '2023-05-02 06:41:01'),
(47, 'TEST Farrel Dinarta', '00000055702', 'farrel.dinarta@student.umn.ac.id', 'Tangerang', '2003-03-24', 'm', 'Tgr', '081383533583', 'ADA', 'SFD', '', 'Informatika', '2020', '3.4', '3.7', '12', '12', 'M', 23, '23', '2sd', 'fsd', 'sdf', 'sd', 'sdf', '/public/images/pictures/1683036113884_345555.png', '/public/images/personality_screenshots/1683036113930_389904.jpg', '/public/images/grades_screenshots/1683036113932_Dimensi Kamui.png', '/public/images/student_card_screenshots/1683036113939_black-wallpaper-25.jpg', '2023-05-02 07:01:53'),
(48, 'Levita Chen', '00000057178', 'levita.chen@student.umn.ac.id', 'Pekanbaru, Riau', '2023-06-05', 'f', 'Ruko Newton Timur No. 30, Jl. Scientia Square Utara, Curug Sangereng, Kec. Klp. Dua, Kabupaten Tangerang, Banten 15810', '0882002297944', 'lvitaacn12', 'levitaacn', 'levitachn', 'Komunikasi Strategis', '2021', '3.93', '3.85', '162', '50', 'M', 38, '28', 'Saya sebagai seorang individu, saya memiliki kepribadian yang cukup ceria  dan antusias untuk melakukan tantangan dan hal baru. Hal ini juga menjadikan saya sebagai individu yang mudah bergaul dan beradaptasi dengan lingkungan baru yang menandakan adanya sikap terbuka terhadap hal-hal baru dalam diri saya yakni tidak takut mengambil risiko dalam kehidupan. Namun, terkadang hal ini membuat saya sedikit ceroboh dalam mengambil keputusan. Meskipun begitu, saya akan tetap berusaha memandang sisi positif dari segala hal yang saya alami sehingga dampak positif tersebut juga dapat dirasakan oleh diri saya sendiri dan juga orang lain.', 'Seperti yang diketahui, Mr. & Ms. UMN adalah ajang pencarian duta kampus bagi UMN untuk mewujudkan generasi penerus bangsa yang ekspresif, inovatif, kreatif, dan adaptif. Begitupun bagi saya, dimana ajang ini berperan cukup penting dalam memproses diri saya untuk memaksimalkan segala potensi sehingga kemampuan yang saya miliki dapat tersalurkan dengan baik dengan adanya berbagai dampak positif yang diterima baik oleh lingkungan UMN maupun lingkungan saya secara pribadi.', 'ENFP-T', 'Dengan kepribadian yang saya miliki yakni ENFP-T, hal ini juga mempengaruhi talenta yang saya miliki seperti adanya kreativitas yang saya tuangkan dalam hobi membuat konten makeup art, namun untuk menjadikannya lebih realistik maka saya mengambil peran pada creative ministry di gereja untuk melakukan pelayanan makeup bagi para pelayan Tuhan yang tampil di panggung. Selain itu, saya juga diberikan talenta atau kemampuan untuk berbicara dan berkomunikasi di depan orang banyak sehingga hal tersebut saya manfaatkan untuk sesekali menjadi MC dalam berbagai acara baik yang akademik (kegiatan kepanitian kampus) maupun non akademik (kegiatan gereja). Kemampuan komunikasi tersebut juga saya manfaat untuk membangun relasi dan sebagai individu yang memiliki personaliti tersebut tidak jarang saya memiliki keinginan untuk tampil di depan banyak orang, baik untuk melakukan komunikasi persuasi maupun menunjukkan penampilan yang bersifat menghibur seperti melakukan salah satu hobi saya yakni menari (tradisional maupun modern).', '', '/public/images/pictures/1683092923334_Screenshot 2023-05-03 at 12.47.25 PM.png', '/public/images/personality_screenshots/1683092923337_Screenshot 2023-05-03 at 12.47.50 PM.png', '/public/images/grades_screenshots/1683092923345_Screenshot 2023-05-03 at 12.48.09 PM.png', '/public/images/student_card_screenshots/1683092923349_Screenshot 2023-05-03 at 12.48.24 PM.png', '2023-05-02 22:48:43'),
(49, 'Sean Nalendra Hakim', '00000058526', 'sean.nalendra@student.umn.ac.id', 'Jakarta', '2002-05-14', 'm', 'Jl. Warung Jati Barat no.12-13, Kel. Jatipadang, Kec. Ps. Minggu, Jakarta Selatan, 12540', '085892651263', 'its.sean', 'sean.hakim', '-', 'Komunikasi Strategis', '2021', '3.51', '3.68', '174', '53', 'M', 42, '28', 'Saya adalah seorang mahasiswa yang sedang menempuh program studi Komunikasi Strategis. Saya memiliki hobi utama yaitu menari, saya sudah aktif menari selama kurang lebih 6 tahun. Sepanjang pengalaman menari tersebut, saya belajar dan mendapatkan berbagai pengalaman dan pelajaran, mulai dari melatih fisik, bekerja sama dalam tim dance saya, menampilkan performance pada berbagai acara, serta menjadi pemimpin kelompok dance inti. Selain itu, saya memiliki kemampuan dan kepribadian yaitu fast-learning, ramah, adaptif, murah senyum, aktif, serta fasih dalam berbahasa Indonesia maupun bahasa Inggris.', 'Selain pengalaman menari, saya juga memiliki pengalaman kerja yaitu menjadi barista selama 4 bulan, dan sedang menjalani pekerjaan sebagai guru ekstrakurikuler untuk murid sekolah dasar (SD) selama 2 bulan terakhir. Saya percaya diri dengan kepribadian, kemampuan, serta pengalaman yang saya miliki, saya dapat menyalurkan hal-hal tersebut melalui menjalani tugas sebagai Mr. UMN untuk menjadi cerminan positif Universitas Multimedia Nusantara baik secara internal maupun eksternal. Saya memiliki keteguhan untuk mengoptimalkan kelebihan yang saya miliki, serta memperbaiki dan meningkatkan kekurangan yang dapat dikembangkan melalui oportunitas yang tersedia melalui menjadi kandidat Mr. UMN.', 'ESFJ-T', 'Saya memiliki talenta utama yaitu pandai menari, saya telah aktif menari selama 6 tahun dan tergabung dalam komunitas dance cover bernama Diadems Official. Selama aktif menari dan menjadi anggota dalam komunitas tersebut, saya memiliki berbagai pengalaman seperti juara 1 dalam suatu lomba dance yang diselenggarakan di suatu SMA di Tangerang, menampilkan performance di salah satu mal di Jakarta Barat yaitu Hublife Jakarta, serta bekerja sama dalam tim untuk membuat konten YouTube, menampilkan performance, maupun latihan dan evaluasi rutin.', 'Juara 1 Lomba Dance DKFEST19', '/public/images/pictures/1683122507968_Foto 3x4.png', '/public/images/personality_screenshots/1683122507972_MBTI Result - Sean.jpg', '/public/images/grades_screenshots/1683122507973_IPS dan IPK Sem 3 - Sean.png', '/public/images/student_card_screenshots/1683122507974_0C462BCA-B6C2-48B2-920F-DEEEB10ADFC2.jpeg', '2023-05-03 07:01:49'),
(50, 'Tiara Naomi Abigail', '00000068068', 'tiara.naomi@student.umn.ac.id', 'Jakarta', '2004-10-20', 'f', 'Tangerang', '085714053166', 'catsareme', '@tiara.naa_', '@tiaranaomi1', 'Komunikasi Strategis', '2022', '3.61', '3.61', '168', '57', 'M', 39, '38', 'Seorang mahasiswa Komunikasi Strategis yang bersedia untuk menjadi Ms UMN', 'Menunjukkan saya mampu menjadi seorang Ms UMN dan mendapatkan beasiswa untuk membanggakan orangtua', 'ENFP-T', '- Memiliki bakat dalam seni berkategori: Menari, menggambar, menyanyi, melukis serta terampil dalam bahasa Inggris', '- ', '/public/images/pictures/1683126432340_965642A7-4C90-4509-91DE-02E60AA44DD2.png', '/public/images/personality_screenshots/1683126432365_2023-05-03 (1).png', '/public/images/grades_screenshots/1683126432369_2023-05-01.png', '/public/images/student_card_screenshots/1683126432372_4DF1E66B-BF4F-433A-BD75-43584155984D.png', '2023-05-03 08:07:12'),
(51, 'Tiara Naomi Abigail', '00000068068', 'tiara.naomi@student.umn.ac.id', 'Jakarta', '2004-10-20', 'f', 'Tangerang', '085714053166', 'catsareme', '@tiara.naa_', '@tiaranaomi1', 'Komunikasi Strategis', '2022', '3.61', '3.61', '168', '57', 'M', 39, '38', 'Seorang mahasiswa Komunikasi Strategiswad yang bersedia untuk menjadi Ms UMN', 'Menunjukkan saya mampu menjadi seorang Ms UMN dan mendapatkan beasiswa untuk membanggakan orangtua', 'ENFP-T', '- Memiliki bakat dalam seni berkategori: Menari, menggambar, menyanyi, melukis serta terampil dalam bahasa Inggris', '-', '/public/images/pictures/1683127760632_8890FD93-F81B-4303-9555-F97D7EC3E085.png', '/public/images/personality_screenshots/1683127760688_1B66A318-E0A6-41F0-8BBD-166FD41FE5F9.png', '/public/images/grades_screenshots/1683127760691_6FC43699-81FE-43F1-9851-80201C8A2428.png', '/public/images/student_card_screenshots/1683127760695_9016BCD9-E0C2-4E0F-B620-B7616B6F9918.png', '2023-05-03 08:29:20'),
(52, 'Florence Agatha ', '00000072449', 'florence.agatha@student.umn.ac.id', 'Tangerang Selatan', '2003-11-20', 'f', 'BSD Puspitaloka Blok A5 no.16 Jalan srigading III', '08567867264', '08567867264', 'Florence.agathaa', 'Florence.agathaa', 'Komunikasi Strategis', '2022', '3.65', '3.65', '155', '54', 'M', 36, '29', 'Perkenalkan nama saya Florence Agatha mahasiswi komunikasi strategis angkatan 2022 usia saya 19 tahun dari Tangerang Selatan. Saya adalah seseorang yang optimis, kreatif, dan ambisius. Saya senang berkompetisi untuk keluar dari zona nyaman dan mengasah kemampuan diri saya. saya suka berbagi ilmu karena dengan mengajar saya juga belajar untuk diri saya sendiri, saya senang belajar dan menjadi murid teladan, saya memiliki nilai akademik yang  baik  terbukti dari SMA saya  selalu masuk 10 besar ranking terbaik di kelas, saya juga aktif dalam berprestasi di luar kelas mulai dari lomba menyanyi, public speaking, design, hingga leadership, saya berusaha keras membangun diri saya yang penuh ambsisi untuk menjadi teladan yang baik bagi orang-orang di sekitar saya. Oleh karena itu saya inguin menjadi Ms.UMN agar dapat menjadi versi yang lebih baik bagi diri saya sendiri dan bisa menjadi motivasi serta teladan bagi  orang-orang dilingkungan saya terutama di lingkingan kampus UMN.', 'Tidak ada yang tidak mungkin, selagi berusaha sebaik mungkin. ', 'ENTJ-T ', '1. Saya pandai public speaking, saya adalah pribadi yang aktif dan mudah beradaptasi dengan lingkungan baru, saya senang berbicara di depan umum untuk menyampaikan aspirasi saya. Tidak mau menyia-nyiakan bakat ini, saya aktif menyalurkan bakat public speaking saya di bidang story telling, dan alhamdulilah dengan kerja keras, saya berhasil menjuarai kompetisi story telling dari tingkat jabodetabek hingga ke tingkat nasional. 2. Saya memiliki jiwa kepemimpinan yang kuat, saya adalah seorang visioner, jika saya berada di suatu grup, hati saya selalu memiliki inisiatif untuk mengajak grup tersebut bergerak untuk mencapai visi misi bersama. Hal ini dapat dibuktikan dengan saya selalu menjabat sebagai ketua kelas sedari SD hingga saya duduk di bangku SMA, saya juga pernah menjabat sebagai wakil ketua osis. Saya juga pernah mengikuti kompetisi LIP ICE future leader dan berhasil menjadi juara 3 dalam ajang bergengsi tersebut.  3. Saya pandai bernyanyi, hal ini terbukti dari pengalaman saya yang rajin mengikuti kompetisi menyanyi mulai dari tingkat pendidikan hingga tingkat nasional di televisi. Saya pernah menjadi bagian dari team Kaka slank Thevoice kids 2018 hingga ke tahap battle round. Saya juga pernah menyanyi di acara kementrian hingga di depan presiden. Pengalaman saya yang luar biasa dari talenta ini adalah saya pernah mendapatkan tawaran private audition dari agency besar dari korea selatan yaitu SM.Ent. Bakat menyanyi saya masih berlanjut hingga saat ini. Sekarang saya masih aktif menjadi vokalis band.  4. Saya memiliki ketertarikan di bidang fashion design, saya cukup pandai dalam menggambar dan mengilustrasikan ide saya dalam bentuk pakaian, design saya pernah masuk 80 besar dalam kompetisi bunda latinas  dengan tema evening gown yang akan di gunakan langsung oleh miss grand internasional, sophia rogan. Acara ini disponsori langsung oleh Ivan Gunawan, walaupun belum juara, namun saya senang talenta saya sudah memiliki pencapaian dalam pengalaman pertamanya. 5. Saya cukup pandai dalam menyulam dan merajut, saya suka mencoba dan melatih skill baru.  6. Saya juga memiliki bakat pengusaha, saat ini saya sudah membangun bisnis dan sudah mendapatkan penghasilan dari bisnis tersebut.', '1. Lip Ice Future Leader 3rd Winner ( Lipice young Brand Ambassador)  2. 1st Winner National Story Telling Competition R18 2021. 3. 3rd Winner Story Telling Jabodetabek. 4. Starlight UMN 2022 finalist. 5. Prom Queen. 6. The Voice Kids 2018. 7. Indonesian Next Big Star selected Contestant.  8. Gadis Sampul Squad 2020. 9. Emina Girl Gang Ambassador 2023. 10. PASS 2019 2nd Winner Band Competition. 11. The Voice 2019 Blind Audition with stephanie Poetri.', '/public/images/pictures/1683128980332_FF5DA1B9-6CF4-43E9-A480-8FF4F76A48D2.jpeg', '/public/images/personality_screenshots/1683128980377_E37AAEB1-5E75-41FE-9CC4-94690DC3F13D.jpeg', '/public/images/grades_screenshots/1683128980378_9DF0FE58-D669-4F77-8EA4-923A984923AB.jpeg', '/public/images/student_card_screenshots/1683128980380_13654732-0DE8-4D49-957A-AE149B98A9F2.png', '2023-05-03 08:49:40'),
(53, 'Raquel Felicia', '00000055299', 'raquel.felicia@student.umn.ac.id', 'Tangerang Selatan', '2003-04-04', 'f', 'Tangerang Selatan', '085312420662', 'raquel_felicia', 'quel_felicia', '', 'Desain Komunikasi Visual', '2021', '3.94', '3.85', '157', '52', 'S', 39, '29', 'Halo semuanya! Perkenalkan saya Raquel Felicia, seorang mahasiswi DKV 2021. Di perkuliahan, saya gemar mengikuti kegiatan kampus dan juga bekerja freelance dalam desain atau seni dan modelling. Jika disebutkan dalam 3 kata, saya adalah orang yang terbuka, berani, dan intuitif. Mari hampiri media sosial saya untuk mengenal lebih dalam😊.', 'Saya bermimpi untuk menjadi penggerak orang lain dalam mengembangkan diri. Saya ingin menjadi suara bagi orang yang malu ataupun takut berusaha untuk menunjukan kemampuannya. Hal ini tentu berasal dari perjalanan saya dalam mendapatkan kepercayaan diri. Melalui Mr. & Ms. UMN, saya ingin membuktikan bahwa siapa saja berhak berada di tingkat lebih tinggi dan tidak takut akan kegagalan.', 'ENFP', 'Melukis telah menjadi talenta saya sejak kecil. Hiburan saya saat berpegian adalah secarik kertas dan pensil. Namun semakin besar saya dipertemukan dengan menari, mulai dari tari tradisional hingga modern dance. Selain kedua hal tersebut, saya menemukan banyak talenta lain seperti bermain musik, futsal, kreasi seni, dan game. Tidak jarang bagi saya untuk mendengar julukan \"Jake Of All Trades\" oleh karena kemampuan saya untuk mencoba hal baru dan mencapai tingkat keahlian sedang atau lebih.', 'Saat masa saya bersekolah di tk hingga sd, saya memenangi beberapa lomba tari tradisional. Di masa SMP hingga SMA, saya mulai aktif mengikuti lomba mural antar sekolah dan memenanginya di antara juara 1 hingga 3.', '/public/images/pictures/1683131905846_Foto Raquel Felicia.png', '/public/images/personality_screenshots/1683131906176_16personality raquel.png', '/public/images/grades_screenshots/1683131906177_ipk ips raquel felicia.jpg', '/public/images/student_card_screenshots/1683131906199_KTM Raquel Felicia.jpg', '2023-05-03 09:38:26'),
(54, 'Florence Agatha ', '00000072449', 'florence.agatha@student.umn.ac.id', 'Tangerang Selatan', '2003-11-20', 'f', 'BSD Puspitaloka Blok A5 no.16 Jalan srigading III', '08567867264', '08567867264', 'Florence.agathaa', 'Florence.agathaa', 'Komunikasi Strategis', '2022', '3.65', '3.65', '155', '54', 'M', 36, '29', 'Perkenalkan nama saya Florence Agatha mahasiswi komunikasi strategis angkatan 2022 usia saya 19 tahun dari Tangerang Selatan. Saya adalah seseorang yang optimis, kreatif, dan ambisius. Saya senang berkompetisi untuk keluar dari zona nyaman dan mengasah kemampuan diri saya. saya suka berbagi ilmu karena dengan mengajar saya juga belajar untuk diri saya sendiri, saya senang belajar dan menjadi murid teladan, saya memiliki nilai akademik yang  baik  terbukti dari SMA saya  selalu masuk 10 besar ranking terbaik di kelas, saya juga aktif dalam berprestasi di luar kelas mulai dari lomba menyanyi, public speaking, design, hingga leadership, saya berusaha keras membangun diri saya yang penuh ambsisi untuk menjadi teladan yang baik bagi orang-orang di sekitar saya. Oleh karena itu saya inguin menjadi Ms.UMN agar dapat menjadi versi yang lebih baik bagi diri saya sendiri dan bisa menjadi motivasi serta teladan bagi  orang-orang dilingkungan saya terutama di lingkingan kampus UMN.', 'Tidak ada yang tidak mungkin, selagi berusaha sebaik mungkin. ', 'ENTJ-T ', '1. Saya pandai public speaking, saya adalah pribadi yang aktif dan mudah beradaptasi dengan lingkungan baru, saya senang berbicara di depan umum untuk menyampaikan aspirasi saya. Tidak mau menyia-nyiakan bakat ini, saya aktif menyalurkan bakat public speaking saya di bidang story telling, dan alhamdulilah dengan kerja keras, saya berhasil menjuarai kompetisi story telling dari tingkat jabodetabek hingga ke tingkat nasional. 2. Saya memiliki jiwa kepemimpinan yang kuat, saya adalah seorang visioner, jika saya berada di suatu grup, hati saya selalu memiliki inisiatif untuk mengajak grup tersebut bergerak untuk mencapai visi misi bersama. Hal ini dapat dibuktikan dengan saya selalu menjabat sebagai ketua kelas sedari SD hingga saya duduk di bangku SMA, saya juga pernah menjabat sebagai wakil ketua osis. Saya juga pernah mengikuti kompetisi LIP ICE future leader dan berhasil menjadi juara 3 dalam ajang bergengsi tersebut.  3. Saya pandai bernyanyi, hal ini terbukti dari pengalaman saya yang rajin mengikuti kompetisi menyanyi mulai dari tingkat pendidikan hingga tingkat nasional di televisi. Saya pernah menjadi bagian dari team Kaka slank Thevoice kids 2018 hingga ke tahap battle round. Saya juga pernah menyanyi di acara kementrian hingga di depan presiden. Pengalaman saya yang luar biasa dari talenta ini adalah saya pernah mendapatkan tawaran private audition dari agency besar dari korea selatan yaitu SM.Ent. Bakat menyanyi saya masih berlanjut hingga saat ini. Sekarang saya masih aktif menjadi vokalis band.  4. Saya memiliki ketertarikan di bidang fashion design, saya cukup pandai dalam menggambar dan mengilustrasikan ide saya dalam bentuk pakaian, design saya pernah masuk 80 besar dalam kompetisi bunda latinas  dengan tema evening gown yang akan di gunakan langsung oleh miss grand internasional, sophia rogan. Acara ini disponsori langsung oleh Ivan Gunawan, walaupun belum juara, namun saya senang talenta saya sudah memiliki pencapaian dalam pengalaman pertamanya. 5. Saya cukup pandai dalam menyulam dan merajut, saya suka mencoba dan melatih skill baru.  6. Saya juga memiliki bakat pengusaha, saat ini saya sudah membangun bisnis dan sudah mendapatkan penghasilan dari bisnis tersebut.', '1. Lip Ice Future Leader 3rd Winner ( Lipice young Brand Ambassador)  2. 1st Winner National Story Telling Competition R18 2021. 3. 3rd Winner Story Telling Jabodetabek. 4. Starlight UMN 2022 finalist. 5. Prom Queen. 6. The Voice Kids 2018. 7. Indonesian Next Big Star selected Contestant.  8. Gadis Sampul Squad 2020. 9. Emina Girl Gang Ambassador 2023. 10. PASS 2019 2nd Winner Band Competition. 11. The Voice 2019 Blind Audition with stephanie Poetri.', '/public/images/pictures/1683132940696_FF5DA1B9-6CF4-43E9-A480-8FF4F76A48D2.jpeg', '/public/images/personality_screenshots/1683132940725_422CD9C1-09AA-4243-82EC-CC44A7065922.jpeg', '/public/images/grades_screenshots/1683132940728_9DF0FE58-D669-4F77-8EA4-923A984923AB.jpeg', '/public/images/student_card_screenshots/1683132940728_71ED5A7E-CAB9-49AC-AB90-0F53DAFD4068.png', '2023-05-03 09:55:40'),
(55, 'koong Hiap', '55136', 'koong.hiap@student.umn.ac.id', 'Singkawang', '2023-05-04', 'm', 'graha sujaya jl. yos sudarso no. 13', '08125788893', 'test', 'test', 'test', 'Informatika', '2021', '3', '3', '160', '123', 'M', 34, '33', 'test', 'test', 'test', 'test', 'test', '/public/images/pictures/1683200250485_1683198574396.jpg', '/public/images/personality_screenshots/1683200250489_1683198574396.jpg', '/public/images/grades_screenshots/1683200250496_1683198574396.jpg', '/public/images/student_card_screenshots/1683200250498_1683198574396.jpg', '2023-05-04 04:37:32'),
(56, 'Yvest Tanno', '00000070634', 'yvest.tanno@student.umn.ac.id', 'Surabaya', '2004-07-28', 'f', 'Jl. Allogio Timur 1 No. 15. Medang, Kec. Pagedangan, Kabupaten Tangerang, Banten.', '082123452205', 'yvest_dncr28', '@yvesttanno', '-', 'Komunikasi Strategis', '2022', '3.51', '3.51', '165', '55', 'M', 37, '29', 'Saya adalah seorang pribadi yang aktif serta berkeinginan kuat untuk terus belajar dengan mengeksplor berbagai hal baru. Saat ini, saya aktif sebagai bagian dari Campus Visit, I\'M KOM, dan Teater KataK.', 'Saya ingin mempelajari berbagai hal baru, yang dapat meningkatkan kualitas diri, sehingga dapat menjadi pribadi yang berdampak positif bagi sesama. ', 'INTP-T', 'Saya memiliki keterampilan dalam bermain peran. Hingga sekarang, saya pernah berpartisipasi dalam Dante The Musical 2020 oleh SMA Santo Yakobus, Shakal oleh Teater KataK, dan Batin oleh Teater KataK. Selain itu, saya juga terampil dalam menari, yang merupakan talenta yang saya tekuni sejak saya berusia 4 tahun.', 'Top 25 World of Dance Indonesia 2019, Juara 3 Kejuaraan Nasional Cheerleading 2019 Kategori SMP, Top 5 UBS GOLD Dance Competition @Honda DBL North Region, Juara 1 Kejuaraan Nasional Cheerleading 2020 Kategori Rutin Bebas SMA.', '/public/images/pictures/1683218405538_IMG_20220617_235352.jpg', '/public/images/personality_screenshots/1683218405555_IMG_20230504_213832.jpg', '/public/images/grades_screenshots/1683218405572_IMG_20230504_213902.jpg', '/public/images/student_card_screenshots/1683218405575_IMG20230504225728.jpg', '2023-05-04 09:40:06'),
(57, 'Fielita Maya', '00000063568', 'fielita.maya@student.umn.ac.id', 'Jakarta', '2000-11-06', 'f', 'Perum. Vila Nusa Indah 2, Blok FF 3/4, Bojong Kulur, Gunung Putri, Bogor', '085711771700', 'mayafielitaa', 'fielitama', '-', 'Komunikasi Strategis', '2021', '3.40', '3.46', '160', '45', 'S', 40, '27', 'Saya merupakan anak ke-4 dari 6 bersaudara. Saya memiliki 3 orang kakak dan 2 orang adik. Saya merupakan orang yang ceria dan mudah bergaul. Saya senang bersosialisasi dan berkenalan dengan orang baru.', 'Motivasi saya mengikuti Mr & Ms UMN yaitu untuk memberikan tantangan baru bagi diri saya, karena saya belum pernah memiliki pengalaman dibidang seperti ini sebelumnya. Selain itu, saya juga ingin menambah wawasan saya mengenai modelling dan pageant.', 'ENFJ', 'Saya memiliki talenta di bidang tarik suara atau bernyanyi. Sejak kecil, saya suka sekali bernyanyi. Untuk itu, pada masa sekolah dulu saya selalu mengikuti kegiatan paduan suara untuk mengasah suara serta menambah pengetahuan saya mengenai dunia tarik suara. Bahkan, saya juga sempat mengikuti beberapa kompetisi paduan suara antarsekolah.', '-', '/public/images/pictures/1683218574833_Fielita_Maya.jpg', '/public/images/personality_screenshots/1683218574835_Screenshot (111).png', '/public/images/grades_screenshots/1683218574838_Screenshot (112).png', '/public/images/student_card_screenshots/1683218574840_SS_KTM_Fielita.jpg', '2023-05-04 09:42:54'),
(58, 'Levy Annabel', '00000070335', 'levyannabel@student.umn.ac.id', 'Jakarta', '2004-05-26', 'f', 'Taman Ubud Permata Timur II No.10', '082125005188', 'levyannabel', 'levyannabel', '-      ', 'Akuntansi', '2022', '0.00', '3.64', '175', '55', 'M', 40, '29', 'Saya tidak bisa menilai kepribadian diri secara objektif namun, ada beberapa karakteristik yang sudah ditanam sejak kecil karena didikan orang tua yaitu kepribadian yang baik, ramah, dan murah senyum. Watak yang dibentuk dari usia kanak sangat membantu dalam segala aspek yang dapat mempengaruhi cara berpikir dan perilaku saya pribadi. Seiring proses menuju kedewasaan, saya belajar beberapa hal dari pengalaman sendiri maupun orang lain. Hal tersebut membuka pandangan saya mengenai hidup. Dalam menjalani keseharian, saya sering menjadi pemurung dan tidak percaya diri. Akan tetapi, jika saya merasakan ada dorongan/motivasi yang kuat, saya akan mempertimbangkannya dan bahkan mencoba melawan hal yang ditakuti. Sebagai contoh, mendaftar di Mr Ms UMN 2023 merupakan langkah awal serta tantangan dan motivasi saya untuk melawan sikap/pikiran negatif. Pikiran negatif berupa ketidakpercayaan diri dan rendah diri. Selain itu, saya merupakan tipe orang yang tidak cepat beradaptasi di lingkungan baru. Walaupun saya merupakan pribadi yang suka berinteraksi dengan orang baru, saya masih membutuhkan waktu untuk menyesuaikan dengan kondisi baru. Terkadang situasi yang asing dapat memuat saya tidak nyaman sehingga saya terjebak dengan kondisi panik. Dalam hal ini, saya harus memiliki waktu sendiri untuk melakukan aktivitas yang dapat mereset pikiran saya seperti melakukan hobi, mencoba hal baru, atau istirahat sejenak dari segala aktivitas sehari-hari. Saya sendiri masih berada dalam perjalanan mencari self-worth atau value diri. Saya percaya melalui proses kehidupan dan pertumbuhan, akan membantu saya untuk menemukan value selayaknya manusia.', 'Motivasi dapat berasal dari mana saja dan dapat disebut motivasi apabila mendukung seseorang untuk mencapai tujuannya. Motivasi terbesar saya berasal dari orang-orang sekitar yaitu orang asing, teman dekat, dan keluarga, terutama ibu. Motivasi dalam diri saya tidak cukup untuk mendorong langkah kedepan apabila tidak ada pendukung. Alasan pendukung berupa kalimat semangat atau mendeskripsikan suatu kondisi bahwa mereka ada disisi saya dan selalu mendukung segala hal menuju tujuan akhir. Namun, semua alasan pendukung tersebut dapat saja hilang jika tidak ada kemauan dalam diri saya. Semua kata motivasi yang dikatakan akan selalu kembali dan berubah menjadi keputusan yang harus saya pilih menuju langkah berikutnya. Contoh nyatanya adalah mengikuti Mr Ms UMN 2023, dimana pengalaman baru, proses pertumbuhan karakter serta perubahan baik, dapat diasah melalui kesempatan ini. Melalui dukungan dari teman dan keluarga, saya putuskan untuk mencoba mendaftar menjadi Ms UMN 2023. Hal tersebut didasarkan atas niat, keberanian dan motivasi dari ibu yang berbunyi \"Dicoba dulu daripada menyesal di kemudian hari karena tidak berani mencoba\".', 'INFJ-T', 'Dari masa kecil, saya senang melakukan kegiatan yang meningkatkan kreativitas terutama di bidang seni rupa. Dengan kepribadian saya yang suka mencoba hal baru sehingga hobi/ketertarikan terhadap suatu hal banyak tetapi yang diminati secara sungguh-sungguh hanya beberapa saja. Dalam seni rupa, saya suka belajar membuat handicrafts atau melukis; seni apapun yang berkaitan langsung dengan karya tangan. Bagian yang terseru dan paling saya suka adalah proses pembuatannya yang membutuhkan ketelitian, kreatifitas, fokus, dan memberikan yang terbaik untuk sebuah karya. Sama halnya dengan melukis, saya menyukai prosesnya terutama dalam lukisan abstrak dimana warna mewakili perasaan pelukis dan teknik atau arah melukisnya menentukan cara untuk mengekspresikan suatu perasaan.', '', '/public/images/pictures/1683531340280_20230503_071157.jpg', '/public/images/personality_screenshots/1683531340295_Elegant Minimalist A4 Stationery Paper Document.png', '/public/images/grades_screenshots/1683531340304_Screenshot (1499).png', '/public/images/student_card_screenshots/1683531340305_20230504_235332.jpg', '2023-05-08 00:35:42');
INSERT INTO `peserta_2023` (`id`, `name`, `nim`, `email_student`, `birth_place`, `birth_date`, `gender`, `address`, `phone_number`, `line_id`, `instagram_username`, `tiktok_username`, `major`, `year`, `sub_gpa`, `gpa`, `height`, `weight`, `clothes_size`, `shoe_size`, `pants_size`, `about_me`, `motivation`, `personality`, `talents`, `achievements`, `picture`, `personality_screenshot`, `grades_screenshot`, `student_card_screenshot`, `created_at`) VALUES
(59, 'Christie Holy Gracia Wijaya', '00000089426', 'christie.holy@student.umn.ac.id', 'Jakarta', '2004-01-17', 'f', 'Cluster Bohemia (Bohemia 1/1) Gading Serpong, Tangerang 15810', '085885905088', 'cholygw', 'christieeholy', '', 'Managemen', '2022', '3.28', '3.28', '172', '55', 'M', 42, '32', 'Saya Christie Holy Gracia Wijaya. Nama panggilan saya holy atau lily. Saya berumur 19 tahun. Saya menempuh pendidikan di Universitas Multimedia Nusantara dan mengambil jurusan Management. Saya suka bertemu dengan orang baru dan ingin membawa dampak yang positif bagi mereka. Saya selalu berusaha untuk selalu berbuat baik dan pantang menyerah, karena wanita itu tangguh dan kuat. Saya ingin mencoba hal-hal baru yang positif selama masih ada kesempatan dan saya mampu melakukannya. Karena, hidup ini sebentar dan hanya sekali. Tidak ada yang tahu kapan waktunya kita pergi meninggalkan dunia ini. Saya mau terus melangkah dan berusaha menjadi yang terbaik. Saya harus selalu menempatkan Tuhan di posisi pertama. Biarlah Tuhan yang memberkati setiap usaha dan kerja keras kita.', 'Love Yourself And Be The Best Version Of Yourself', 'The Most Harmonious', 'Saya memiliki talenta menyanyi dan menulis lagu. Saya sangat suka musik dan seni. Menurut saya, lagu adalah seni yang sangat mahal dan berharga. Dengan membuat lagu dan bernyanyi, saya dapat mengekspresikan perasaan dan pesan yang ingin saya ungkapkan, bahkan ketika saya belum bisa mengungkapkan perasaan atau pesan tersebut secara langsung. Saya berharap lagu-lagu saya dapat didengar dan disukai banyak orang bahkan sampai go international. Saya berusaha membuat lagu yang enak didengar dan membuat lirik lagu sebagus mungkin.', 'Juara II Lomba Menyanyi Dalam Rangka Hari Kartini Di Sekolah (2008)', '/public/images/pictures/1683553372639_IMG-20230507-WA0009.jpg', '/public/images/personality_screenshots/1683553372641_2_Personality Test(1).jpg', '/public/images/grades_screenshots/1683553372785_Screenshot_20230508-194649_Chrome.jpg', '/public/images/student_card_screenshots/1683553372786_20230508_195943.jpg', '2023-05-08 06:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `peserta_candidate`
--

CREATE TABLE `peserta_candidate` (
  `StudentID` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CandidateImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peserta_tugas`
--

CREATE TABLE `peserta_tugas` (
  `StudentID` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tugas1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeTugas1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_medpar`
--

CREATE TABLE `sponsor_medpar` (
  `Sponsor_MedparID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `src` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sponsor_medpar`
--

INSERT INTO `sponsor_medpar` (`Sponsor_MedparID`, `type`, `src`, `nama`, `url`, `bg`) VALUES
('052ef5b9-0190-459c-b5df-19eb538de923', 1, '/images/Sponsor/Logo_PUYO_DEFAULT.png', 'PUYO Desserts', 'https://www.puyodesserts.com/', 0),
('05445737-0f3a-43cb-a366-b629def456ed', 2, '/images/Sponsor/LOGO_gdcumn.jpg', 'GDC UMN', 'https://gdc.umn.ac.id', 0),
('0bdeccc0-3ed7-4478-9cd8-7e323507022e', 1, 'https://cdn.discordapp.com/attachments/1125453534062719016/1141058868353445918/Logo_Roti_Bakar_88.png', 'Rotbak 88', 'https://rotibakar88.id', 0),
('0f70c8da-56d8-4bd1-b260-6cfe933706af', 1, '/images/Sponsor/LOGO_MASAMI.png', 'Masami', 'http://www.masamishouko.com/', 1),
('16bc7889-302e-4fe2-9f85-816ab5e08263', 2, '/images/Sponsor/LOGO_mmtctv.PNG', 'MMTC TV', 'https://www.instagram.com/mmtctv', 0),
('18512c4d-3488-4a5c-9f2c-8c63d012cd43', 1, '/images/Sponsor/Logo Myca Tulisan Putih.png', 'Myca', 'https://www.instagram.com/mycaflorist/', 0),
('1a854e25-b7b6-4577-9714-b296dea9a75c', 2, '/images/Sponsor/LOGO_eventtangsel.PNG', 'Event Tangsel', 'https://www.instagram.com/eventtangsel', 0),
('1c42fd21-2492-4f1b-8b7a-b7f013a13e20', 2, '/images/Sponsor/LOGO_eventfest.id.png', 'Event Fest ID', 'https://www.instagram.com/eventfest.id', 0),
('1dade9ad-5973-459a-9fc8-e076c82ab01e', 1, '/images/Sponsor/LOGO_chi.jpg', 'Chi Forest', 'https://chiforest.com', 0),
('32d0ba86-bb2e-4446-b685-bbc8ea24ec4c', 2, '/images/Sponsor/LOGO_dkbm.png', 'DKBM Muda', 'https://dkbm.umn.ac.id', 0),
('3e605495-7431-4d74-9e5a-6f03b401bd63', 2, '/images/Sponsor/LOGO_kmi.png', 'Komunitas Muda Inspiratif', 'https://www.instagram.com/komunitasmudainspiratif', 0),
('3e890c70-1cfa-4825-8502-8c42080605e0', 1, '/images/Sponsor/LOGO_msp.jpg', 'MSP Film Equipment', 'https://msprental.com/', 0),
('428b5a0a-79bd-4567-b644-0cdb023581d5', 2, '/images/Sponsor/LOGO_umntv.png', 'UMN TV', 'https://tv.umn.ac.id/', 0),
('43126d12-6e69-4201-abad-9b4ad0c0190d', 2, '/images/Sponsor/LOGO_umnlions.jpg', 'UMN Lions Basketball', 'https://www.instagram.com/umnlions_basketball', 0),
('465ff89d-29fa-4da1-9236-6e61376ab86b', 1, '/images/Sponsor/LOGO_CJ.png', 'Christoper John', 'https://www.instagram.com/christjhn', 0),
('4c4f3a5f-edf2-4669-9768-3159cb8b04d6', 1, '/images/Sponsor/Logo Mile.jpg', 'Miliè', 'https://www.instagram.com/milieofficial', 0),
('4e72fc21-360c-4d22-ad4f-96821dbe835b', 2, '/images/Sponsor/LOGO_ultimagz.png', 'Ultimagz', 'https://ultimagz.com/', 0),
('5507a0f7-76d6-4dbc-a715-7732eda19467', 1, '/images/Sponsor/1694668954255_MILIO 6.png', 'Milio', '#', 0),
('5d9a5b87-d320-4a14-acbc-7c34f05f0b7a', 2, '/images/Sponsor/LOGO_events.ina.jpg', 'events.ina', 'https://www.instagram.com/events.ina', 0),
('5e146142-b1aa-4e1b-8347-319d061fb573', 1, '/images/Sponsor/LOGO_KAY_COLLECTION.png', 'Kay Collection', 'https://www.kaycollection.com/', 1),
('64e05141-9d33-42d7-9675-9dbcbc1ad7ec', 2, '/images/Sponsor/LOGO_himtara.jpeg', 'HIMTARA', 'https://www.instagram.com/himtara', 0),
('67fce9fc-7195-424e-87b5-e9f7bd4f8313', 2, '/images/Sponsor/LOGO_infokuyy.id.PNG', 'infokuyy.id', 'https://www.instagram.com/infokuyy.id', 0),
('6938c85a-cbd0-4a38-a548-2469013c6942', 2, '/images/Sponsor/LOGO_umnjuice.png', 'UMN Juice', 'https://juice.umn.ac.id/', 0),
('6e73bad0-8ea8-4f26-bbaf-08758acee79d', 2, '/images/Sponsor/LOGO_magentaradio.PNG', 'Magenta Radio', 'https://www.instagram.com/magenta.radio', 0),
('84641464-ab57-49fc-ac12-9a4840de116c', 2, '/images/Sponsor/LOGO_infolombaevent.id.png', 'infolombaevent.id', 'https://www.instagram.com/infolombaevent.id/', 0),
('8da06b66-3623-4b75-a3ca-aaa7252328bb', 2, '/images/Sponsor/LOGO_erafmunj.png', 'Educational Radio', 'https://www.instagram.com/erafmunj', 0),
('8e013c6d-35b4-43d6-904c-1be6f09c5986', 1, '/public/images/Sponsor/1695107514065_1000042146.png', 'Mantappu', '', 0),
('8fe2c254-663f-4998-a846-bad376ef51da', 2, '/images/Sponsor/LOGO_radiountar.jpg', 'Radio Untar', 'https://www.instagram.com/radiountar', 0),
('91c5281a-849c-4dc0-98f4-cedc1fbfbb6a', 1, '/images/Sponsor/Logo Dennis Catering.jpg', 'Catering', 'https://www.instagram.com/denniscatering_', 0),
('9284934odjofijdof', 1, 'https://cdn.discordapp.com/attachments/1125453534062719016/1151057509247881286/anggalang_logo_putih.png', 'Anggalang', NULL, 0),
('943caf2b-ec36-4cf1-b69c-d7a1722eada4', 2, '/images/Sponsor/LOGO_imkomumn.jpg', 'IMKOM UMN', 'https://www.instagram.com/imkom_umn', 0),
('983094ksfjofi', 1, 'https://cdn.discordapp.com/attachments/1125453534062719016/1151367869859381288/Logo_Klinik-white.png', 'Klinik Derma Express', NULL, 0),
('a19b4358-4e5b-4018-bf6f-2aff9e80249d', 1, '/images/Sponsor/LOGO_REVO_PRINT_SHOP.png', 'Revo Print Shop', 'https://www.revoprintshop.com/', 0),
('b15a2a2b-3fbe-4a65-84d0-4000f05b74c7', 1, '/public/images/Sponsor/1695107489365_1000042145.png', 'Mikyal', '', 0),
('b2f1d440-f108-45a6-851e-cb34c888fd40', 2, '/images/Sponsor/LOGO_himsi.jpg', 'Siberian (HIMSI UMN)', 'https://himsi.umn.ac.id', 0),
('b7ceac00-89d9-4e59-b0a5-ce4b75227f2d', 2, '/images/Sponsor/LOGO_umnradio.png', 'UMN Radio', 'https://radio.umn.ac.id', 0),
('b8138be3-2c37-4f56-90c0-dadf5d8b553d', 2, '/images/Sponsor/LOGO_deoagency.jpg', 'Deo Agency', 'https://www.instagram.com/deoagency', 0),
('c01ff7c9-97fa-4521-aed8-295847a16a20', 1, '/images/Sponsor/Logo Libreath.png', 'Libreath', 'https://www.instagram.com/libreath.florist', 0),
('c46bdbf8-f69d-4c2b-b633-63bca7fa764e', 1, 'https://cdn.discordapp.com/attachments/1125453534062719016/1141058867829166170/Logo_MuA_Gareulis_copy.png', 'Gareulis', 'https://www.instagram.com/mua.gareulis', 0),
('ccbef9a1-e162-4e76-9ae4-4a24ff62d312', 2, '/images/Sponsor/LOGO_hmdkvumn.jpg', 'HMDKV UMN', 'https://www.instagram.com/hmdkv_umn', 0),
('dd89aae3-d45f-4b13-a5f6-c7f44d240107', 2, '/images/Sponsor/LOGO_bvoiceradio.png', 'BVoice Radio', 'https://www.instagram.com/bvoice_radio', 0),
('e161c7f3-20f3-4af1-a02e-6c9ed14bd48a', 1, '/images/Sponsor/LOGO_implora.jpg', 'Implora', '', 0),
('e298d631-4600-4faa-871e-f0946c41eb61', 2, '/images/Sponsor/LOGO_atmajayaradio.jpg', 'Atma Jaya Radio', '#', 0),
('e315cdd2-ad64-4f04-b94e-9e8951a72564', 2, '/images/Sponsor/LOGO_edaranevent.jpg', 'Edaran Event', 'https://www.instagram.com/edaranevent', 0),
('e8fe8ff4-0037-4797-9fb7-4877465448ed', 2, '/images/Sponsor/LOGO_event.list.jpg', 'event.lis', 'https://www.instagram.com/event.list', 0),
('ec1a2928-7493-4790-b9fd-9c5be8007605', 2, '/images/Sponsor/LOGO_kampusupdate.jpg', 'Kampus Update', 'https://www.instagram.com/kampusupdate', 0),
('f0ba16e6-eba2-4e80-8895-bc47a4eeca6d', 2, '/images/Sponsor/LOGO_kumpulan.event.jpg', 'Kumpulan Event', 'https://www.instagram.com/kumpulan.event', 0),
('f1fb004e-e629-407c-b433-cecd015a9898', 1, 'https://cdn.discordapp.com/attachments/1125453534062719016/1141058868105969745/logo-tiketbox.png', 'Tiketbox', 'https://tiketbox.com', 0),
('fb38adae-cd99-4d3a-8f76-7974c91fd13b', 2, '/images/Sponsor/LOGO_foxumn.jpg', 'Fox UMN', 'https://www.instagram.com/fox_umn', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
('569fe7a9-7566-421f-8e1a-363ee49da773', 'mrmsumn', 'koong.hiap@student.umn.ac.id', '$2a$12$OKTne8dm8X9GT0HWETIjL.LsMUwg62vavQZqLi8C8mM8xbeJ4op/q');

-- --------------------------------------------------------

--
-- Table structure for table `voting`
--

CREATE TABLE `voting` (
  `NIM` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Voters` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `awarding`
--
ALTER TABLE `awarding`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `finalis2022`
--
ALTER TABLE `finalis2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metanoia`
--
ALTER TABLE `metanoia`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `peserta_2023`
--
ALTER TABLE `peserta_2023`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peserta_candidate`
--
ALTER TABLE `peserta_candidate`
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `sponsor_medpar`
--
ALTER TABLE `sponsor_medpar`
  ADD PRIMARY KEY (`Sponsor_MedparID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_key` (`email`);

--
-- Indexes for table `voting`
--
ALTER TABLE `voting`
  ADD PRIMARY KEY (`NIM`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peserta_2023`
--
ALTER TABLE `peserta_2023`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


