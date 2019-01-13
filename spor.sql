-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Oca 2019, 19:11:30
-- Sunucu sürümü: 5.7.17
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `spor`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gorevli`
--

CREATE TABLE `gorevli` (
  `gId` int(11) NOT NULL,
  `hakemId` int(11) DEFAULT NULL,
  `turnuvaId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `gorevli`
--

INSERT INTO `gorevli` (`gId`, `hakemId`, `turnuvaId`) VALUES
(1, 6, 4),
(2, 6, 1),
(3, 4, 2),
(4, 7, 3),
(5, 7, 6),
(11, 7, 8),
(13, 7, 9),
(12, 7, 8),
(14, 7, 10),
(40, 11, 10),
(16, 7, 21),
(21, 9, 21),
(22, 9, 21),
(23, 10, 21),
(24, 7, 21),
(25, 9, 23),
(26, 7, 23),
(27, 8, 23),
(29, 9, 25),
(31, 9, 27),
(32, 7, 27),
(33, 4, 27),
(34, 11, 27),
(35, 9, 27),
(36, 9, 10),
(37, 9, 28),
(38, 7, 28),
(39, 11, 28),
(41, 7, 31),
(42, 8, 31),
(44, 10, 31),
(45, 9, 33),
(49, 11, 33),
(47, 4, 33),
(48, 10, 33);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hakem`
--

CREATE TABLE `hakem` (
  `hakemId` int(11) NOT NULL,
  `hakemAd` varchar(50) DEFAULT NULL,
  `hakemSoyad` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `hakem`
--

INSERT INTO `hakem` (`hakemId`, `hakemAd`, `hakemSoyad`) VALUES
(4, ' veli', 'gungor'),
(10, ' yekta', 'kurtulus'),
(9, ' ahmet ', 'hakem'),
(8, ' nihat', 'kahveci'),
(11, ' fÄ±rat', 'duÃ§ar');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `il`
--

CREATE TABLE `il` (
  `ilId` int(11) NOT NULL,
  `ilAd` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `il`
--

INSERT INTO `il` (`ilId`, `ilAd`) VALUES
(1, 'ADANA'),
(2, 'ADIYAMAN'),
(3, 'AFYONKARAHİSAR'),
(4, 'AĞRI'),
(5, 'AKSARAY'),
(6, 'AMASYA'),
(7, 'ANKARA'),
(8, 'ANTALYA'),
(9, 'ARDAHAN'),
(10, 'ARTVİN'),
(11, 'AYDIN'),
(12, 'BALIKESİR'),
(13, 'BARTIN'),
(14, 'BATMAN'),
(15, 'BAYBURT'),
(16, 'BİLECİK'),
(17, 'BİNGÖL'),
(18, 'BİTLİS'),
(19, 'BOLU'),
(20, 'BURDUR'),
(21, 'BURSA'),
(22, 'ÇANAKKALE'),
(23, 'ÇANKIRI'),
(24, 'ÇORUM'),
(25, 'DENİZLİ'),
(26, 'DİYARBAKIR'),
(27, 'DÜZCE'),
(28, 'EDİRNE'),
(29, 'ELAZIĞ'),
(30, 'ERZİNCAN'),
(31, 'ERZURUM'),
(32, 'ESKİŞEHİR'),
(33, 'GAZİANTEP'),
(34, 'GİRESUN'),
(35, 'GÜMÜŞHANE'),
(36, 'HAKKARİ'),
(37, 'HATAY'),
(38, 'IĞDIR'),
(39, 'ISPARTA'),
(40, 'İSTANBUL'),
(41, 'İZMİR'),
(42, 'KAHRAMANMARAŞ'),
(43, 'KARABÜK'),
(44, 'KARAMAN'),
(45, 'KARS'),
(46, 'KASTAMONU'),
(47, 'KAYSERİ'),
(48, 'KIRIKKALE'),
(49, 'KIRKLARELİ'),
(50, 'KIRŞEHİR'),
(51, 'KİLİS'),
(52, 'KOCAELİ'),
(53, 'KONYA'),
(54, 'KÜTAHYA'),
(55, 'MALATYA'),
(56, 'MANİSA'),
(57, 'MARDİN'),
(58, 'MERSİN'),
(59, 'MUĞLA'),
(60, 'MUŞ'),
(61, 'NEVŞEHİR'),
(62, 'NİĞDE'),
(63, 'ORDU'),
(64, 'OSMANİYE'),
(65, 'RİZE'),
(66, 'SAKARYA'),
(67, 'SAMSUN'),
(68, 'SİİRT'),
(69, 'SİNOP'),
(70, 'SİVAS'),
(71, 'ŞANLIURFA'),
(72, 'ŞIRNAK'),
(73, 'TEKİRDAĞ'),
(74, 'TOKAT'),
(75, 'TRABZON'),
(76, 'TUNCELİ'),
(77, 'UŞAK'),
(78, 'VAN'),
(79, 'YALOVA'),
(80, 'YOZGAT'),
(81, 'ZONGULDAK');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilce`
--

CREATE TABLE `ilce` (
  `ilceId` int(11) NOT NULL,
  `ilId` int(11) DEFAULT NULL,
  `ilceAd` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ilce`
--

INSERT INTO `ilce` (`ilceId`, `ilId`, `ilceAd`) VALUES
(1, 1, 'ALADAĞ'),
(2, 1, 'CEYHAN'),
(3, 1, 'ÇUKUROVA'),
(4, 1, 'FEKE'),
(5, 1, 'İMAMOĞLU'),
(6, 1, 'KARAİSALI'),
(7, 1, 'KARATAŞ'),
(8, 1, 'KOZAN'),
(9, 1, 'POZANTI'),
(10, 1, 'SAİMBEYLİ'),
(11, 1, 'SARIÇAM'),
(12, 1, 'SEYHAN'),
(13, 1, 'TUFANBEYLİ'),
(14, 1, 'YUMURTALIK'),
(15, 1, 'YÜREĞİR'),
(16, 2, 'BESNİ'),
(17, 2, 'ÇELİKHAN'),
(18, 2, 'GERGER'),
(19, 2, 'GÖLBAŞI'),
(20, 2, 'KAHTA'),
(21, 2, 'MERKEZ'),
(22, 2, 'SAMSAT'),
(23, 2, 'SİNCİK'),
(24, 2, 'TUT'),
(25, 3, 'BAŞMAKÇI'),
(26, 3, 'BAYAT'),
(27, 3, 'BOLVADİN'),
(28, 3, 'ÇAY'),
(29, 3, 'ÇOBANLAR'),
(30, 3, 'DAZKIRI'),
(31, 3, 'DİNAR'),
(32, 3, 'EMİRDAĞ'),
(33, 3, 'EVCİLER'),
(34, 3, 'HOCALAR'),
(35, 3, 'İHSANİYE'),
(36, 3, 'İSCEHİSAR'),
(37, 3, 'KIZILÖREN'),
(38, 3, 'MERKEZ'),
(39, 3, 'SANDIKLI'),
(40, 3, 'SİNANPAŞA'),
(41, 3, 'SULTANDAĞI'),
(42, 3, 'ŞUHUT'),
(43, 4, 'DİYADİN'),
(44, 4, 'DOĞUBAYAZIT'),
(45, 4, 'ELEŞKİRT'),
(46, 4, 'HAMUR'),
(47, 4, 'MERKEZ'),
(48, 4, 'PATNOS'),
(49, 4, 'TAŞLIÇAY'),
(50, 4, 'TUTAK'),
(51, 5, 'AĞAÇÖREN'),
(52, 5, 'ESKİL'),
(53, 5, 'GÜLAĞAÇ'),
(54, 5, 'GÜZELYURT'),
(55, 5, 'MERKEZ'),
(56, 5, 'ORTAKÖY'),
(57, 5, 'SARIYAHŞİ'),
(58, 5, 'SULTANHANI'),
(59, 6, 'GÖYNÜCEK'),
(60, 6, 'GÜMÜŞHACIKÖY'),
(61, 6, 'HAMAMÖZÜ'),
(62, 6, 'MERKEZ'),
(63, 6, 'MERZİFON'),
(64, 6, 'SULUOVA'),
(65, 6, 'TAŞOVA'),
(66, 7, 'AKYURT'),
(67, 7, 'ALTINDAĞ'),
(68, 7, 'AYAŞ'),
(69, 7, 'BALA'),
(70, 7, 'BEYPAZARI'),
(71, 7, 'ÇAMLIDERE'),
(72, 7, 'ÇANKAYA'),
(73, 7, 'ÇUBUK'),
(74, 7, 'ELMADAĞ'),
(75, 7, 'ETİMESGUT'),
(76, 7, 'EVREN'),
(77, 7, 'GÖLBAŞI'),
(78, 7, 'GÜDÜL'),
(79, 7, 'HAYMANA'),
(80, 7, 'KAHRAMANKAZAN'),
(81, 7, 'KALECİK'),
(82, 7, 'KEÇİÖREN'),
(83, 7, 'KIZILCAHAMAM'),
(84, 7, 'MAMAK'),
(85, 7, 'NALLIHAN'),
(86, 7, 'POLATLI'),
(87, 7, 'PURSAKLAR'),
(88, 7, 'SİNCAN'),
(89, 7, 'ŞEREFLİKOÇHİSAR'),
(90, 7, 'YENİMAHALLE'),
(91, 8, 'AKSEKİ'),
(92, 8, 'AKSU'),
(93, 8, 'ALANYA'),
(94, 8, 'DEMRE'),
(95, 8, 'DÖŞEMEALTI'),
(96, 8, 'ELMALI'),
(97, 8, 'FİNİKE'),
(98, 8, 'GAZİPAŞA'),
(99, 8, 'GÜNDOĞMUŞ'),
(100, 8, 'İBRADI'),
(101, 8, 'KAŞ'),
(102, 8, 'KEMER'),
(103, 8, 'KEPEZ'),
(104, 8, 'KONYAALTI'),
(105, 8, 'KORKUTELİ'),
(106, 8, 'KUMLUCA'),
(107, 8, 'MANAVGAT'),
(108, 8, 'MURATPAŞA'),
(109, 8, 'SERİK'),
(110, 9, 'ÇILDIR'),
(111, 9, 'DAMAL'),
(112, 9, 'GÖLE'),
(113, 9, 'HANAK'),
(114, 9, 'MERKEZ'),
(115, 9, 'POSOF'),
(116, 10, 'ARDANUÇ'),
(117, 10, 'ARHAVİ'),
(118, 10, 'BORÇKA'),
(119, 10, 'HOPA'),
(120, 10, 'KEMALPAŞA'),
(121, 10, 'MERKEZ'),
(122, 10, 'MURGUL'),
(123, 10, 'ŞAVŞAT'),
(124, 10, 'YUSUFELİ'),
(125, 11, 'BOZDOĞAN'),
(126, 11, 'BUHARKENT'),
(127, 11, 'ÇİNE'),
(128, 11, 'DİDİM'),
(129, 11, 'EFELER'),
(130, 11, 'GERMENCİK'),
(131, 11, 'İNCİRLİOVA'),
(132, 11, 'KARACASU'),
(133, 11, 'KARPUZLU'),
(134, 11, 'KOÇARLI'),
(135, 11, 'KÖŞK'),
(136, 11, 'KUŞADASI'),
(137, 11, 'KUYUCAK'),
(138, 11, 'NAZİLLİ'),
(139, 11, 'SÖKE'),
(140, 11, 'SULTANHİSAR'),
(141, 11, 'YENİPAZAR'),
(142, 12, 'ALTIEYLÜL'),
(143, 12, 'AYVALIK'),
(144, 12, 'BALYA'),
(145, 12, 'BANDIRMA'),
(146, 12, 'BİGADİÇ'),
(147, 12, 'BURHANİYE'),
(148, 12, 'DURSUNBEY'),
(149, 12, 'EDREMİT'),
(150, 12, 'ERDEK'),
(151, 12, 'GÖMEÇ'),
(152, 12, 'GÖNEN'),
(153, 12, 'HAVRAN'),
(154, 12, 'İVRİNDİ'),
(155, 12, 'KARESİ'),
(156, 12, 'KEPSUT'),
(157, 12, 'MANYAS'),
(158, 12, 'MARMARA'),
(159, 12, 'SAVAŞTEPE'),
(160, 12, 'SINDIRGI'),
(161, 12, 'SUSURLUK'),
(162, 13, 'AMASRA'),
(163, 13, 'KURUCAŞİLE'),
(164, 13, 'MERKEZ'),
(165, 13, 'ULUS'),
(166, 14, 'BEŞİRİ'),
(167, 14, 'GERCÜŞ'),
(168, 14, 'HASANKEYF'),
(169, 14, 'KOZLUK'),
(170, 14, 'MERKEZ'),
(171, 14, 'SASON'),
(172, 15, 'AYDINTEPE'),
(173, 15, 'DEMİRÖZÜ'),
(174, 15, 'MERKEZ'),
(175, 16, 'BOZÜYÜK'),
(176, 16, 'GÖLPAZARI'),
(177, 16, 'İNHİSAR'),
(178, 16, 'MERKEZ'),
(179, 16, 'OSMANELİ'),
(180, 16, 'PAZARYERİ'),
(181, 16, 'SÖĞÜT'),
(182, 16, 'YENİPAZAR'),
(183, 17, 'ADAKLI'),
(184, 17, 'GENÇ'),
(185, 17, 'KARLIOVA'),
(186, 17, 'KİĞI'),
(187, 17, 'MERKEZ'),
(188, 17, 'SOLHAN'),
(189, 17, 'YAYLADERE'),
(190, 17, 'YEDİSU'),
(191, 18, 'ADİLCEVAZ'),
(192, 18, 'AHLAT'),
(193, 18, 'GÜROYMAK'),
(194, 18, 'HİZAN'),
(195, 18, 'MERKEZ'),
(196, 18, 'MUTKİ'),
(197, 18, 'TATVAN'),
(198, 19, 'DÖRTDİVAN'),
(199, 19, 'GEREDE'),
(200, 19, 'GÖYNÜK'),
(201, 19, 'KIBRISCIK'),
(202, 19, 'MENGEN'),
(203, 19, 'MERKEZ'),
(204, 19, 'MUDURNU'),
(205, 19, 'SEBEN'),
(206, 19, 'YENİÇAĞA'),
(207, 20, 'AĞLASUN'),
(208, 20, 'ALTINYAYLA'),
(209, 20, 'BUCAK'),
(210, 20, 'ÇAVDIR'),
(211, 20, 'ÇELTİKÇİ'),
(212, 20, 'GÖLHİSAR'),
(213, 20, 'KARAMANLI'),
(214, 20, 'KEMER'),
(215, 20, 'MERKEZ'),
(216, 20, 'TEFENNİ'),
(217, 20, 'YEŞİLOVA'),
(218, 21, 'BÜYÜKORHAN'),
(219, 21, 'GEMLİK'),
(220, 21, 'GÜRSU'),
(221, 21, 'HARMANCIK'),
(222, 21, 'İNEGÖL'),
(223, 21, 'İZNİK'),
(224, 21, 'KARACABEY'),
(225, 21, 'KELES'),
(226, 21, 'KESTEL'),
(227, 21, 'MUDANYA'),
(228, 21, 'MUSTAFAKEMALPAŞA'),
(229, 21, 'NİLÜFER'),
(230, 21, 'ORHANELİ'),
(231, 21, 'ORHANGAZİ'),
(232, 21, 'OSMANGAZİ'),
(233, 21, 'YENİŞEHİR'),
(234, 21, 'YILDIRIM'),
(235, 22, 'AYVACIK'),
(236, 22, 'BAYRAMİÇ'),
(237, 22, 'BİGA'),
(238, 22, 'BOZCAADA'),
(239, 22, 'ÇAN'),
(240, 22, 'ECEABAT'),
(241, 22, 'EZİNE'),
(242, 22, 'GELİBOLU'),
(243, 22, 'GÖKÇEADA'),
(244, 22, 'LAPSEKİ'),
(245, 22, 'MERKEZ'),
(246, 22, 'YENİCE'),
(247, 23, 'ATKARACALAR'),
(248, 23, 'BAYRAMÖREN'),
(249, 23, 'ÇERKEŞ'),
(250, 23, 'ELDİVAN'),
(251, 23, 'ILGAZ'),
(252, 23, 'KIZILIRMAK'),
(253, 23, 'KORGUN'),
(254, 23, 'KURŞUNLU'),
(255, 23, 'MERKEZ'),
(256, 23, 'ORTA'),
(257, 23, 'ŞABANÖZÜ'),
(258, 23, 'YAPRAKLI'),
(259, 24, 'ALACA'),
(260, 24, 'BAYAT'),
(261, 24, 'BOĞAZKALE'),
(262, 24, 'DODURGA'),
(263, 24, 'İSKİLİP'),
(264, 24, 'KARGI'),
(265, 24, 'LAÇİN'),
(266, 24, 'MECİTÖZÜ'),
(267, 24, 'MERKEZ'),
(268, 24, 'OĞUZLAR'),
(269, 24, 'ORTAKÖY'),
(270, 24, 'OSMANCIK'),
(271, 24, 'SUNGURLU'),
(272, 24, 'UĞURLUDAĞ'),
(273, 25, 'ACIPAYAM'),
(274, 25, 'BABADAĞ'),
(275, 25, 'BAKLAN'),
(276, 25, 'BEKİLLİ'),
(277, 25, 'BEYAĞAÇ'),
(278, 25, 'BOZKURT'),
(279, 25, 'BULDAN'),
(280, 25, 'ÇAL'),
(281, 25, 'ÇAMELİ'),
(282, 25, 'ÇARDAK'),
(283, 25, 'ÇİVRİL'),
(284, 25, 'GÜNEY'),
(285, 25, 'HONAZ'),
(286, 25, 'KALE'),
(287, 25, 'MERKEZEFENDİ'),
(288, 25, 'PAMUKKALE'),
(289, 25, 'SARAYKÖY'),
(290, 25, 'SERİNHİSAR'),
(291, 25, 'TAVAS'),
(292, 26, 'BAĞLAR'),
(293, 26, 'BİSMİL'),
(294, 26, 'ÇERMİK'),
(295, 26, 'ÇINAR'),
(296, 26, 'ÇÜNGÜŞ'),
(297, 26, 'DİCLE'),
(298, 26, 'EĞİL'),
(299, 26, 'ERGANİ'),
(300, 26, 'HANİ'),
(301, 26, 'HAZRO'),
(302, 26, 'KAYAPINAR'),
(303, 26, 'KOCAKÖY'),
(304, 26, 'KULP'),
(305, 26, 'LİCE'),
(306, 26, 'SİLVAN'),
(307, 26, 'SUR'),
(308, 26, 'YENİŞEHİR'),
(309, 27, 'AKÇAKOCA'),
(310, 27, 'CUMAYERİ'),
(311, 27, 'ÇİLİMLİ'),
(312, 27, 'GÖLYAKA'),
(313, 27, 'GÜMÜŞOVA'),
(314, 27, 'KAYNAŞLI'),
(315, 27, 'MERKEZ'),
(316, 27, 'YIĞILCA'),
(317, 28, 'ENEZ'),
(318, 28, 'HAVSA'),
(319, 28, 'İPSALA'),
(320, 28, 'KEŞAN'),
(321, 28, 'LALAPAŞA'),
(322, 28, 'MERİÇ'),
(323, 28, 'MERKEZ'),
(324, 28, 'SÜLOĞLU'),
(325, 28, 'UZUNKÖPRÜ'),
(326, 29, 'AĞIN'),
(327, 29, 'ALACAKAYA'),
(328, 29, 'ARICAK'),
(329, 29, 'BASKİL'),
(330, 29, 'KARAKOÇAN'),
(331, 29, 'KEBAN'),
(332, 29, 'KOVANCILAR'),
(333, 29, 'MADEN'),
(334, 29, 'MERKEZ'),
(335, 29, 'PALU'),
(336, 29, 'SİVRİCE'),
(337, 30, 'ÇAYIRLI'),
(338, 30, 'İLİÇ'),
(339, 30, 'KEMAH'),
(340, 30, 'KEMALİYE'),
(341, 30, 'MERKEZ'),
(342, 30, 'OTLUKBELİ'),
(343, 30, 'REFAHİYE'),
(344, 30, 'TERCAN'),
(345, 30, 'ÜZÜMLÜ'),
(346, 31, 'AŞKALE'),
(347, 31, 'AZİZİYE'),
(348, 31, 'ÇAT'),
(349, 31, 'HINIS'),
(350, 31, 'HORASAN'),
(351, 31, 'İSPİR'),
(352, 31, 'KARAÇOBAN'),
(353, 31, 'KARAYAZI'),
(354, 31, 'KÖPRÜKÖY'),
(355, 31, 'NARMAN'),
(356, 31, 'OLTU'),
(357, 31, 'OLUR'),
(358, 31, 'PALANDÖKEN'),
(359, 31, 'PASİNLER'),
(360, 31, 'PAZARYOLU'),
(361, 31, 'ŞENKAYA'),
(362, 31, 'TEKMAN'),
(363, 31, 'TORTUM'),
(364, 31, 'UZUNDERE'),
(365, 31, 'YAKUTİYE'),
(366, 32, 'ALPU'),
(367, 32, 'BEYLİKOVA'),
(368, 32, 'ÇİFTELER'),
(369, 32, 'GÜNYÜZÜ'),
(370, 32, 'HAN'),
(371, 32, 'İNÖNÜ'),
(372, 32, 'MAHMUDİYE'),
(373, 32, 'MİHALGAZİ'),
(374, 32, 'MİHALIÇÇIK'),
(375, 32, 'ODUNPAZARI'),
(376, 32, 'SARICAKAYA'),
(377, 32, 'SEYİTGAZİ'),
(378, 32, 'SİVRİHİSAR'),
(379, 32, 'TEPEBAŞI'),
(380, 33, 'ARABAN'),
(381, 33, 'İSLAHİYE'),
(382, 33, 'KARKAMIŞ'),
(383, 33, 'NİZİP'),
(384, 33, 'NURDAĞI'),
(385, 33, 'OĞUZELİ'),
(386, 33, 'ŞAHİNBEY'),
(387, 33, 'ŞEHİTKAMİL'),
(388, 33, 'YAVUZELİ'),
(389, 34, 'ALUCRA'),
(390, 34, 'BULANCAK'),
(391, 34, 'ÇAMOLUK'),
(392, 34, 'ÇANAKÇI'),
(393, 34, 'DERELİ'),
(394, 34, 'DOĞANKENT'),
(395, 34, 'ESPİYE'),
(396, 34, 'EYNESİL'),
(397, 34, 'GÖRELE'),
(398, 34, 'GÜCE'),
(399, 34, 'KEŞAP'),
(400, 34, 'MERKEZ'),
(401, 34, 'PİRAZİZ'),
(402, 34, 'ŞEBİNKARAHİSAR'),
(403, 34, 'TİREBOLU'),
(404, 34, 'YAĞLIDERE'),
(405, 35, 'KELKİT'),
(406, 35, 'KÖSE'),
(407, 35, 'KÜRTÜN'),
(408, 35, 'MERKEZ'),
(409, 35, 'ŞİRAN'),
(410, 35, 'TORUL'),
(411, 36, 'ÇUKURCA'),
(412, 36, 'MERKEZ'),
(413, 36, 'ŞEMDİNLİ'),
(414, 36, 'YÜKSEKOVA'),
(415, 37, 'ALTINÖZÜ'),
(416, 37, 'ANTAKYA'),
(417, 37, 'ARSUZ'),
(418, 37, 'BELEN'),
(419, 37, 'DEFNE'),
(420, 37, 'DÖRTYOL'),
(421, 37, 'ERZİN'),
(422, 37, 'HASSA'),
(423, 37, 'İSKENDERUN'),
(424, 37, 'KIRIKHAN'),
(425, 37, 'KUMLU'),
(426, 37, 'PAYAS'),
(427, 37, 'REYHANLI'),
(428, 37, 'SAMANDAĞ'),
(429, 37, 'YAYLADAĞI'),
(430, 38, 'ARALIK'),
(431, 38, 'KARAKOYUNLU'),
(432, 38, 'MERKEZ'),
(433, 38, 'TUZLUCA'),
(434, 39, 'AKSU'),
(435, 39, 'ATABEY'),
(436, 39, 'EĞİRDİR'),
(437, 39, 'GELENDOST'),
(438, 39, 'GÖNEN'),
(439, 39, 'KEÇİBORLU'),
(440, 39, 'MERKEZ'),
(441, 39, 'SENİRKENT'),
(442, 39, 'SÜTÇÜLER'),
(443, 39, 'ŞARKİKARAAĞAÇ'),
(444, 39, 'ULUBORLU'),
(445, 39, 'YALVAÇ'),
(446, 39, 'YENİŞARBADEMLİ'),
(447, 40, 'ADALAR'),
(448, 40, 'ARNAVUTKÖY'),
(449, 40, 'ATAŞEHİR'),
(450, 40, 'AVCILAR'),
(451, 40, 'BAĞCILAR'),
(452, 40, 'BAHÇELİEVLER'),
(453, 40, 'BAKIRKÖY'),
(454, 40, 'BAŞAKŞEHİR'),
(455, 40, 'BAYRAMPAŞA'),
(456, 40, 'BEŞİKTAŞ'),
(457, 40, 'BEYKOZ'),
(458, 40, 'BEYLİKDÜZÜ'),
(459, 40, 'BEYOĞLU'),
(460, 40, 'BÜYÜKÇEKMECE'),
(461, 40, 'ÇATALCA'),
(462, 40, 'ÇEKMEKÖY'),
(463, 40, 'ESENLER'),
(464, 40, 'ESENYURT'),
(465, 40, 'EYÜPSULTAN'),
(466, 40, 'FATİH'),
(467, 40, 'GAZİOSMANPAŞA'),
(468, 40, 'GÜNGÖREN'),
(469, 40, 'KADIKÖY'),
(470, 40, 'KAĞITHANE'),
(471, 40, 'KARTAL'),
(472, 40, 'KÜÇÜKÇEKMECE'),
(473, 40, 'MALTEPE'),
(474, 40, 'PENDİK'),
(475, 40, 'SANCAKTEPE'),
(476, 40, 'SARIYER'),
(477, 40, 'SİLİVRİ'),
(478, 40, 'SULTANBEYLİ'),
(479, 40, 'SULTANGAZİ'),
(480, 40, 'ŞİLE'),
(481, 40, 'ŞİŞLİ'),
(482, 40, 'TUZLA'),
(483, 40, 'ÜMRANİYE'),
(484, 40, 'ÜSKÜDAR'),
(485, 40, 'ZEYTİNBURNU'),
(486, 41, 'ALİAĞA'),
(487, 41, 'BALÇOVA'),
(488, 41, 'BAYINDIR'),
(489, 41, 'BAYRAKLI'),
(490, 41, 'BERGAMA'),
(491, 41, 'BEYDAĞ'),
(492, 41, 'BORNOVA'),
(493, 41, 'BUCA'),
(494, 41, 'ÇEŞME'),
(495, 41, 'ÇİĞLİ'),
(496, 41, 'DİKİLİ'),
(497, 41, 'FOÇA'),
(498, 41, 'GAZİEMİR'),
(499, 41, 'GÜZELBAHÇE'),
(500, 41, 'KARABAĞLAR'),
(501, 41, 'KARABURUN'),
(502, 41, 'KARŞIYAKA'),
(503, 41, 'KEMALPAŞA'),
(504, 41, 'KINIK'),
(505, 41, 'KİRAZ'),
(506, 41, 'KONAK'),
(507, 41, 'MENDERES'),
(508, 41, 'MENEMEN'),
(509, 41, 'NARLIDERE'),
(510, 41, 'ÖDEMİŞ'),
(511, 41, 'SEFERİHİSAR'),
(512, 41, 'SELÇUK'),
(513, 41, 'TİRE'),
(514, 41, 'TORBALI'),
(515, 41, 'URLA'),
(516, 42, 'AFŞİN'),
(517, 42, 'ANDIRIN'),
(518, 42, 'ÇAĞLAYANCERİT'),
(519, 42, 'DULKADİROĞLU'),
(520, 42, 'EKİNÖZÜ'),
(521, 42, 'ELBİSTAN'),
(522, 42, 'GÖKSUN'),
(523, 42, 'NURHAK'),
(524, 42, 'ONİKİŞUBAT'),
(525, 42, 'PAZARCIK'),
(526, 42, 'TÜRKOĞLU'),
(527, 43, 'EFLANİ'),
(528, 43, 'ESKİPAZAR'),
(529, 43, 'MERKEZ'),
(530, 43, 'OVACIK'),
(531, 43, 'SAFRANBOLU'),
(532, 43, 'YENİCE'),
(533, 44, 'AYRANCI'),
(534, 44, 'BAŞYAYLA'),
(535, 44, 'ERMENEK'),
(536, 44, 'KAZIMKARABEKİR'),
(537, 44, 'MERKEZ'),
(538, 44, 'SARIVELİLER'),
(539, 45, 'AKYAKA'),
(540, 45, 'ARPAÇAY'),
(541, 45, 'DİGOR'),
(542, 45, 'KAĞIZMAN'),
(543, 45, 'MERKEZ'),
(544, 45, 'SARIKAMIŞ'),
(545, 45, 'SELİM'),
(546, 45, 'SUSUZ'),
(547, 46, 'ABANA'),
(548, 46, 'AĞLI'),
(549, 46, 'ARAÇ'),
(550, 46, 'AZDAVAY'),
(551, 46, 'BOZKURT'),
(552, 46, 'CİDE'),
(553, 46, 'ÇATALZEYTİN'),
(554, 46, 'DADAY'),
(555, 46, 'DEVREKANİ'),
(556, 46, 'DOĞANYURT'),
(557, 46, 'HANÖNÜ'),
(558, 46, 'İHSANGAZİ'),
(559, 46, 'İNEBOLU'),
(560, 46, 'KÜRE'),
(561, 46, 'MERKEZ'),
(562, 46, 'PINARBAŞI'),
(563, 46, 'SEYDİLER'),
(564, 46, 'ŞENPAZAR'),
(565, 46, 'TAŞKÖPRÜ'),
(566, 46, 'TOSYA'),
(567, 47, 'AKKIŞLA'),
(568, 47, 'BÜNYAN'),
(569, 47, 'DEVELİ'),
(570, 47, 'FELAHİYE'),
(571, 47, 'HACILAR'),
(572, 47, 'İNCESU'),
(573, 47, 'KOCASİNAN'),
(574, 47, 'MELİKGAZİ'),
(575, 47, 'ÖZVATAN'),
(576, 47, 'PINARBAŞI'),
(577, 47, 'SARIOĞLAN'),
(578, 47, 'SARIZ'),
(579, 47, 'TALAS'),
(580, 47, 'TOMARZA'),
(581, 47, 'YAHYALI'),
(582, 47, 'YEŞİLHİSAR'),
(583, 48, 'BAHŞİLİ'),
(584, 48, 'BALIŞEYH'),
(585, 48, 'ÇELEBİ'),
(586, 48, 'DELİCE'),
(587, 48, 'KARAKEÇİLİ'),
(588, 48, 'KESKİN'),
(589, 48, 'MERKEZ'),
(590, 48, 'SULAKYURT'),
(591, 48, 'YAHŞİHAN'),
(592, 49, 'BABAESKİ'),
(593, 49, 'DEMİRKÖY'),
(594, 49, 'KOFÇAZ'),
(595, 49, 'LÜLEBURGAZ'),
(596, 49, 'MERKEZ'),
(597, 49, 'PEHLİVANKÖY'),
(598, 49, 'PINARHİSAR'),
(599, 49, 'VİZE'),
(600, 50, 'AKÇAKENT'),
(601, 50, 'AKPINAR'),
(602, 50, 'BOZTEPE'),
(603, 50, 'ÇİÇEKDAĞI'),
(604, 50, 'KAMAN'),
(605, 50, 'MERKEZ'),
(606, 50, 'MUCUR'),
(607, 51, 'ELBEYLİ'),
(608, 51, 'MERKEZ'),
(609, 51, 'MUSABEYLİ'),
(610, 51, 'POLATELİ'),
(611, 52, 'BAŞİSKELE'),
(612, 52, 'ÇAYIROVA'),
(613, 52, 'DARICA'),
(614, 52, 'DERİNCE'),
(615, 52, 'DİLOVASI'),
(616, 52, 'GEBZE'),
(617, 52, 'GÖLCÜK'),
(618, 52, 'İZMİT'),
(619, 52, 'KANDIRA'),
(620, 52, 'KARAMÜRSEL'),
(621, 52, 'KARTEPE'),
(622, 52, 'KÖRFEZ'),
(623, 53, 'AHIRLI'),
(624, 53, 'AKÖREN'),
(625, 53, 'AKŞEHİR'),
(626, 53, 'ALTINEKİN'),
(627, 53, 'BEYŞEHİR'),
(628, 53, 'BOZKIR'),
(629, 53, 'CİHANBEYLİ'),
(630, 53, 'ÇELTİK'),
(631, 53, 'ÇUMRA'),
(632, 53, 'DERBENT'),
(633, 53, 'DEREBUCAK'),
(634, 53, 'DOĞANHİSAR'),
(635, 53, 'EMİRGAZİ'),
(636, 53, 'EREĞLİ'),
(637, 53, 'GÜNEYSINIR'),
(638, 53, 'HADİM'),
(639, 53, 'HALKAPINAR'),
(640, 53, 'HÜYÜK'),
(641, 53, 'ILGIN'),
(642, 53, 'KADINHANI'),
(643, 53, 'KARAPINAR'),
(644, 53, 'KARATAY'),
(645, 53, 'KULU'),
(646, 53, 'MERAM'),
(647, 53, 'SARAYÖNÜ'),
(648, 53, 'SELÇUKLU'),
(649, 53, 'SEYDİŞEHİR'),
(650, 53, 'TAŞKENT'),
(651, 53, 'TUZLUKÇU'),
(652, 53, 'YALIHÜYÜK'),
(653, 53, 'YUNAK'),
(654, 54, 'ALTINTAŞ'),
(655, 54, 'ASLANAPA'),
(656, 54, 'ÇAVDARHİSAR'),
(657, 54, 'DOMANİÇ'),
(658, 54, 'DUMLUPINAR'),
(659, 54, 'EMET'),
(660, 54, 'GEDİZ'),
(661, 54, 'HİSARCIK'),
(662, 54, 'MERKEZ'),
(663, 54, 'PAZARLAR'),
(664, 54, 'SİMAV'),
(665, 54, 'ŞAPHANE'),
(666, 54, 'TAVŞANLI'),
(667, 55, 'AKÇADAĞ'),
(668, 55, 'ARAPGİR'),
(669, 55, 'ARGUVAN'),
(670, 55, 'BATTALGAZİ'),
(671, 55, 'DARENDE'),
(672, 55, 'DOĞANŞEHİR'),
(673, 55, 'DOĞANYOL'),
(674, 55, 'HEKİMHAN'),
(675, 55, 'KALE'),
(676, 55, 'KULUNCAK'),
(677, 55, 'PÜTÜRGE'),
(678, 55, 'YAZIHAN'),
(679, 55, 'YEŞİLYURT'),
(680, 56, 'AHMETLİ'),
(681, 56, 'AKHİSAR'),
(682, 56, 'ALAŞEHİR'),
(683, 56, 'DEMİRCİ'),
(684, 56, 'GÖLMARMARA'),
(685, 56, 'GÖRDES'),
(686, 56, 'KIRKAĞAÇ'),
(687, 56, 'KÖPRÜBAŞI'),
(688, 56, 'KULA'),
(689, 56, 'SALİHLİ'),
(690, 56, 'SARIGÖL'),
(691, 56, 'SARUHANLI'),
(692, 56, 'SELENDİ'),
(693, 56, 'SOMA'),
(694, 56, 'ŞEHZADELER'),
(695, 56, 'TURGUTLU'),
(696, 56, 'YUNUSEMRE'),
(697, 57, 'ARTUKLU'),
(698, 57, 'DARGEÇİT'),
(699, 57, 'DERİK'),
(700, 57, 'KIZILTEPE'),
(701, 57, 'MAZIDAĞI'),
(702, 57, 'MİDYAT'),
(703, 57, 'NUSAYBİN'),
(704, 57, 'ÖMERLİ'),
(705, 57, 'SAVUR'),
(706, 57, 'YEŞİLLİ'),
(707, 58, 'AKDENİZ'),
(708, 58, 'ANAMUR'),
(709, 58, 'AYDINCIK'),
(710, 58, 'BOZYAZI'),
(711, 58, 'ÇAMLIYAYLA'),
(712, 58, 'ERDEMLİ'),
(713, 58, 'GÜLNAR'),
(714, 58, 'MEZİTLİ'),
(715, 58, 'MUT'),
(716, 58, 'SİLİFKE'),
(717, 58, 'TARSUS'),
(718, 58, 'TOROSLAR'),
(719, 58, 'YENİŞEHİR'),
(720, 59, 'BODRUM'),
(721, 59, 'DALAMAN'),
(722, 59, 'DATÇA'),
(723, 59, 'FETHİYE'),
(724, 59, 'KAVAKLIDERE'),
(725, 59, 'KÖYCEĞİZ'),
(726, 59, 'MARMARİS'),
(727, 59, 'MENTEŞE'),
(728, 59, 'MİLAS'),
(729, 59, 'ORTACA'),
(730, 59, 'SEYDİKEMER'),
(731, 59, 'ULA'),
(732, 59, 'YATAĞAN'),
(733, 60, 'BULANIK'),
(734, 60, 'HASKÖY'),
(735, 60, 'KORKUT'),
(736, 60, 'MALAZGİRT'),
(737, 60, 'MERKEZ'),
(738, 60, 'VARTO'),
(739, 61, 'ACIGÖL'),
(740, 61, 'AVANOS'),
(741, 61, 'DERİNKUYU'),
(742, 61, 'GÜLŞEHİR'),
(743, 61, 'HACIBEKTAŞ'),
(744, 61, 'KOZAKLI'),
(745, 61, 'MERKEZ'),
(746, 61, 'ÜRGÜP'),
(747, 62, 'ALTUNHİSAR'),
(748, 62, 'BOR'),
(749, 62, 'ÇAMARDI'),
(750, 62, 'ÇİFTLİK'),
(751, 62, 'MERKEZ'),
(752, 62, 'ULUKIŞLA'),
(753, 63, 'AKKUŞ'),
(754, 63, 'ALTINORDU'),
(755, 63, 'AYBASTI'),
(756, 63, 'ÇAMAŞ'),
(757, 63, 'ÇATALPINAR'),
(758, 63, 'ÇAYBAŞI'),
(759, 63, 'FATSA'),
(760, 63, 'GÖLKÖY'),
(761, 63, 'GÜLYALI'),
(762, 63, 'GÜRGENTEPE'),
(763, 63, 'İKİZCE'),
(764, 63, 'KABADÜZ'),
(765, 63, 'KABATAŞ'),
(766, 63, 'KORGAN'),
(767, 63, 'KUMRU'),
(768, 63, 'MESUDİYE'),
(769, 63, 'PERŞEMBE'),
(770, 63, 'ULUBEY'),
(771, 63, 'ÜNYE'),
(772, 64, 'BAHÇE'),
(773, 64, 'DÜZİÇİ'),
(774, 64, 'HASANBEYLİ'),
(775, 64, 'KADİRLİ'),
(776, 64, 'MERKEZ'),
(777, 64, 'SUMBAS'),
(778, 64, 'TOPRAKKALE'),
(779, 65, 'ARDEŞEN'),
(780, 65, 'ÇAMLIHEMŞİN'),
(781, 65, 'ÇAYELİ'),
(782, 65, 'DEREPAZARI'),
(783, 65, 'FINDIKLI'),
(784, 65, 'GÜNEYSU'),
(785, 65, 'HEMŞİN'),
(786, 65, 'İKİZDERE'),
(787, 65, 'İYİDERE'),
(788, 65, 'KALKANDERE'),
(789, 65, 'MERKEZ'),
(790, 65, 'PAZAR'),
(791, 66, 'ADAPAZARI'),
(792, 66, 'AKYAZI'),
(793, 66, 'ARİFİYE'),
(794, 66, 'ERENLER'),
(795, 66, 'FERİZLİ'),
(796, 66, 'GEYVE'),
(797, 66, 'HENDEK'),
(798, 66, 'KARAPÜRÇEK'),
(799, 66, 'KARASU'),
(800, 66, 'KAYNARCA'),
(801, 66, 'KOCAALİ'),
(802, 66, 'PAMUKOVA'),
(803, 66, 'SAPANCA'),
(804, 66, 'SERDİVAN'),
(805, 66, 'SÖĞÜTLÜ'),
(806, 66, 'TARAKLI'),
(807, 67, '19 MAYIS'),
(808, 67, 'ALAÇAM'),
(809, 67, 'ASARCIK'),
(810, 67, 'ATAKUM'),
(811, 67, 'AYVACIK'),
(812, 67, 'BAFRA'),
(813, 67, 'CANİK'),
(814, 67, 'ÇARŞAMBA'),
(815, 67, 'HAVZA'),
(816, 67, 'İLKADIM'),
(817, 67, 'KAVAK'),
(818, 67, 'LADİK'),
(819, 67, 'SALIPAZARI'),
(820, 67, 'TEKKEKÖY'),
(821, 67, 'TERME'),
(822, 67, 'VEZİRKÖPRÜ'),
(823, 67, 'YAKAKENT'),
(824, 68, 'BAYKAN'),
(825, 68, 'ERUH'),
(826, 68, 'KURTALAN'),
(827, 68, 'MERKEZ'),
(828, 68, 'PERVARİ'),
(829, 68, 'ŞİRVAN'),
(830, 68, 'TİLLO'),
(831, 69, 'AYANCIK'),
(832, 69, 'BOYABAT'),
(833, 69, 'DİKMEN'),
(834, 69, 'DURAĞAN'),
(835, 69, 'ERFELEK'),
(836, 69, 'GERZE'),
(837, 69, 'MERKEZ'),
(838, 69, 'SARAYDÜZÜ'),
(839, 69, 'TÜRKELİ'),
(840, 70, 'AKINCILAR'),
(841, 70, 'ALTINYAYLA'),
(842, 70, 'DİVRİĞİ'),
(843, 70, 'DOĞANŞAR'),
(844, 70, 'GEMEREK'),
(845, 70, 'GÖLOVA'),
(846, 70, 'GÜRÜN'),
(847, 70, 'HAFİK'),
(848, 70, 'İMRANLI'),
(849, 70, 'KANGAL'),
(850, 70, 'KOYULHİSAR'),
(851, 70, 'MERKEZ'),
(852, 70, 'SUŞEHRİ'),
(853, 70, 'ŞARKIŞLA'),
(854, 70, 'ULAŞ'),
(855, 70, 'YILDIZELİ'),
(856, 70, 'ZARA'),
(857, 71, 'AKÇAKALE'),
(858, 71, 'BİRECİK'),
(859, 71, 'BOZOVA'),
(860, 71, 'CEYLANPINAR'),
(861, 71, 'EYYÜBİYE'),
(862, 71, 'HALFETİ'),
(863, 71, 'HALİLİYE'),
(864, 71, 'HARRAN'),
(865, 71, 'HİLVAN'),
(866, 71, 'KARAKÖPRÜ'),
(867, 71, 'SİVEREK'),
(868, 71, 'SURUÇ'),
(869, 71, 'VİRANŞEHİR'),
(870, 72, 'BEYTÜŞŞEBAP'),
(871, 72, 'CİZRE'),
(872, 72, 'GÜÇLÜKONAK'),
(873, 72, 'İDİL'),
(874, 72, 'MERKEZ'),
(875, 72, 'SİLOPİ'),
(876, 72, 'ULUDERE'),
(877, 73, 'ÇERKEZKÖY'),
(878, 73, 'ÇORLU'),
(879, 73, 'ERGENE'),
(880, 73, 'HAYRABOLU'),
(881, 73, 'KAPAKLI'),
(882, 73, 'MALKARA'),
(883, 73, 'MARMARAEREĞLİSİ'),
(884, 73, 'MURATLI'),
(885, 73, 'SARAY'),
(886, 73, 'SÜLEYMANPAŞA'),
(887, 73, 'ŞARKÖY'),
(888, 74, 'ALMUS'),
(889, 74, 'ARTOVA'),
(890, 74, 'BAŞÇİFTLİK'),
(891, 74, 'ERBAA'),
(892, 74, 'MERKEZ'),
(893, 74, 'NİKSAR'),
(894, 74, 'PAZAR'),
(895, 74, 'REŞADİYE'),
(896, 74, 'SULUSARAY'),
(897, 74, 'TURHAL'),
(898, 74, 'YEŞİLYURT'),
(899, 74, 'ZİLE'),
(900, 75, 'AKÇAABAT'),
(901, 75, 'ARAKLI'),
(902, 75, 'ARSİN'),
(903, 75, 'BEŞİKDÜZÜ'),
(904, 75, 'ÇARŞIBAŞI'),
(905, 75, 'ÇAYKARA'),
(906, 75, 'DERNEKPAZARI'),
(907, 75, 'DÜZKÖY'),
(908, 75, 'HAYRAT'),
(909, 75, 'KÖPRÜBAŞI'),
(910, 75, 'MAÇKA'),
(911, 75, 'OF'),
(912, 75, 'ORTAHİSAR'),
(913, 75, 'SÜRMENE'),
(914, 75, 'ŞALPAZARI'),
(915, 75, 'TONYA'),
(916, 75, 'VAKFIKEBİR'),
(917, 75, 'YOMRA'),
(918, 76, 'ÇEMİŞGEZEK'),
(919, 76, 'HOZAT'),
(920, 76, 'MAZGİRT'),
(921, 76, 'MERKEZ'),
(922, 76, 'NAZIMİYE'),
(923, 76, 'OVACIK'),
(924, 76, 'PERTEK'),
(925, 76, 'PÜLÜMÜR'),
(926, 77, 'BANAZ'),
(927, 77, 'EŞME'),
(928, 77, 'KARAHALLI'),
(929, 77, 'MERKEZ'),
(930, 77, 'SİVASLI'),
(931, 77, 'ULUBEY'),
(932, 78, 'BAHÇESARAY'),
(933, 78, 'BAŞKALE'),
(934, 78, 'ÇALDIRAN'),
(935, 78, 'ÇATAK'),
(936, 78, 'EDREMİT'),
(937, 78, 'ERCİŞ'),
(938, 78, 'GEVAŞ'),
(939, 78, 'GÜRPINAR'),
(940, 78, 'İPEKYOLU'),
(941, 78, 'MURADİYE'),
(942, 78, 'ÖZALP'),
(943, 78, 'SARAY'),
(944, 78, 'TUŞBA'),
(945, 79, 'ALTINOVA'),
(946, 79, 'ARMUTLU'),
(947, 79, 'ÇINARCIK'),
(948, 79, 'ÇİFTLİKKÖY'),
(949, 79, 'MERKEZ'),
(950, 79, 'TERMAL'),
(951, 80, 'AKDAĞMADENİ'),
(952, 80, 'AYDINCIK'),
(953, 80, 'BOĞAZLIYAN'),
(954, 80, 'ÇANDIR'),
(955, 80, 'ÇAYIRALAN'),
(956, 80, 'ÇEKEREK'),
(957, 80, 'KADIŞEHRİ'),
(958, 80, 'MERKEZ'),
(959, 80, 'SARAYKENT'),
(960, 80, 'SARIKAYA'),
(961, 80, 'SORGUN'),
(962, 80, 'ŞEFAATLİ'),
(963, 80, 'YENİFAKILI'),
(964, 80, 'YERKÖY'),
(965, 81, 'ALAPLI'),
(966, 81, 'ÇAYCUMA'),
(967, 81, 'DEVREK'),
(968, 81, 'EREĞLİ'),
(969, 81, 'GÖKÇEBEY'),
(970, 81, 'KİLİMLİ'),
(971, 81, 'KOZLU'),
(972, 81, 'MERKEZ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islem`
--

CREATE TABLE `islem` (
  `islemId` int(11) NOT NULL,
  `turnuvaId` int(11) DEFAULT NULL,
  `TCNo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `islem`
--

INSERT INTO `islem` (`islemId`, `turnuvaId`, `TCNo`) VALUES
(19, 31, 1887145),
(20, 31, 66),
(15, 31, 76),
(30, 33, 889),
(17, 31, 2221),
(16, 31, 34547),
(29, 31, 5557),
(28, 31, 123456),
(27, 31, 8555),
(25, 31, 889),
(26, 31, 15642),
(31, 33, 15642),
(32, 33, 777),
(33, 33, 76),
(34, 33, 34547),
(35, 33, 2221),
(36, 33, 66),
(37, 33, 1887145),
(38, 33, 54546),
(39, 33, 9982254),
(40, 33, 2314),
(41, 33, 54895),
(42, 33, 4862);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kulup`
--

CREATE TABLE `kulup` (
  `kulupId` int(11) NOT NULL,
  `kulupAd` varchar(70) DEFAULT NULL,
  `kullaniciAd` varchar(30) NOT NULL,
  `kulupSifre` varchar(50) DEFAULT NULL,
  `kulupMail` varchar(30) NOT NULL,
  `ilceId` int(11) NOT NULL,
  `aktif` bit(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kulup`
--

INSERT INTO `kulup` (`kulupId`, `kulupAd`, `kullaniciAd`, `kulupSifre`, `kulupMail`, `ilceId`, `aktif`) VALUES
(24, 'tugaycan', 'tugaycan', '10n0066', 'mustafakostek@gmail.com', 69, b'1'),
(25, 'sdfdfsd', 'asd', 'asd', 'dfdf', 4, b'1'),
(26, 'sdfdfsd', 'xyz', 'abc', 'dfdf', 4, b'1'),
(33, 'besik beyli', 'mkostek', '10n0066', 'eliteboymusti@yandex.com.tr', 62, b'1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kusak`
--

CREATE TABLE `kusak` (
  `kusakId` int(11) NOT NULL,
  `kusakAd` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kusak`
--

INSERT INTO `kusak` (`kusakId`, `kusakAd`) VALUES
(1, 'beyaz'),
(2, 'sarı'),
(3, 'turuncu'),
(4, 'yeşil'),
(5, 'mavi'),
(6, 'kahverengi'),
(7, 'siyah');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mac`
--

CREATE TABLE `mac` (
  `macId` int(11) NOT NULL,
  `turnuvaId` int(11) NOT NULL,
  `sporcuId` int(11) NOT NULL,
  `sporcuIdi` int(11) DEFAULT NULL,
  `sonuc` tinyint(1) DEFAULT NULL,
  `flag` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `mac`
--

INSERT INTO `mac` (`macId`, `turnuvaId`, `sporcuId`, `sporcuIdi`, `sonuc`, `flag`) VALUES
(128, 33, 76, 9982254, 0, 0),
(129, 33, 889, 15642, 1, 0),
(130, 33, 1887145, 34547, 0, 0),
(131, 33, 54546, 4862, 1, 0),
(132, 33, 54895, 777, 1, 0),
(133, 33, 2314, NULL, 0, 0),
(134, 33, 66, NULL, 1, 0),
(135, 33, 2221, NULL, 1, 0),
(136, 33, 76, 15642, 1, 1),
(137, 33, 1887145, 4862, 0, 1),
(138, 33, 777, 2314, 0, 1),
(139, 33, 66, 2221, 1, 1),
(140, 33, 15642, 1887145, 1, 2),
(141, 33, 777, 2221, 0, 2),
(142, 33, 1887145, 777, 0, 3),
(143, 33, 1887145, 1887145, 0, 4),
(144, 33, 1887145, 1887145, 2, 5),
(145, 31, 889, 34547, 0, 0),
(146, 31, 1887145, 66, 1, 0),
(147, 31, 123456, NULL, 0, 0),
(148, 31, 8555, NULL, 0, 0),
(149, 31, 5557, NULL, 0, 0),
(150, 31, 76, NULL, 0, 0),
(151, 31, 2221, NULL, 0, 0),
(152, 31, 15642, NULL, 0, 0),
(153, 31, 889, 66, 1, 1),
(154, 31, 123456, 8555, 0, 1),
(155, 31, 5557, 76, 0, 1),
(156, 31, 2221, 15642, 0, 1),
(157, 31, 66, 123456, 1, 2),
(158, 31, 5557, 2221, 0, 2),
(159, 31, 123456, 5557, 1, 3),
(160, 31, 5557, 5557, 2, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sporcu`
--

CREATE TABLE `sporcu` (
  `TCNo` decimal(11,0) NOT NULL,
  `lisansResim` varchar(50) DEFAULT NULL,
  `sporcuAdSoyad` varchar(60) DEFAULT NULL,
  `kilo` int(11) DEFAULT NULL,
  `dTarih` date DEFAULT NULL,
  `kulupId` int(11) DEFAULT NULL,
  `kusakId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `sporcu`
--

INSERT INTO `sporcu` (`TCNo`, `lisansResim`, `sporcuAdSoyad`, `kilo`, `dTarih`, `kulupId`, `kusakId`) VALUES
('18878813936', 'resim/18878813936.jpg', 'mustafa kÃ¶ste', 29, '2019-01-01', 30, 3),
('555555', 'resim/indir.jpg', 'mustafa kÃ¶stek', 13, '2003-05-07', 30, 4),
('177845', 'resim/indir.jpg', 'mustafa balcÄ±', 19, '2019-01-12', 30, 5),
('88452436', 'resim/HPIM0346.JPG', 'uÄ±ufdhd sdfsdq', 20, '2019-01-05', 30, 5),
('8454', 'resim/8454.jpg', 'sonuncu', 19, '2019-03-14', 30, 3),
('1', '', 'mustafa balcÄ±', 60, '2019-01-11', 30, 5),
('76', 'resim/76.jpg', 'gurhan can', 63, '1997-07-07', 24, 3),
('34547', 'resim/34547.jpg', 'demirhan atik', 70, '2019-01-11', 24, 3),
('2221', 'resim/2221.jpg', 'weqdqwd', 10, '2019-01-11', 24, 1),
('66', 'resim/66.jpg', 'dsdsd', 47, '2019-01-11', 24, 3),
('1887145', 'resim/1887145.jpg', 'verhat', 59, '2019-01-07', 24, 6),
('15642', 'resim/15642.jpg', 'abuzer', 10, '2003-05-05', 25, 1),
('889', 'resim/889.jpg', 'haydar', 58, '2018-11-05', 25, 5),
('777', 'resim/777.jpg', 'niyazi', 23, '2005-05-05', 25, 3),
('8555', 'resim/8555.jpg', 'tuncay', 15, '2019-01-12', 26, 5),
('5557', 'resim/5557.jpg', 'vahit', 67, '2019-01-05', 26, 7),
('123456', 'resim/123456.jpg', 'samet', 17, '2003-05-05', 26, 4),
('54546', 'resim/54546.jpg', 'hayrican', 10, '2019-01-11', 33, 1),
('9982254', 'resim/9982254.jpg', 'mert', 17, '2003-05-05', 33, 1),
('4862', 'resim/4862.jpg', 'gÃ¼l', 38, '2011-01-01', 33, 3),
('2314', 'resim/0002314.jpg', 'feyzi', 10, '2003-05-05', 33, 1),
('54895', 'resim/54895.jpg', 'kadir', 28, '2012-02-02', 33, 5),
('59478', 'resim/59478.jpg', 'yeliz kÃ¶stek', 58, '2001-01-01', 33, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `turnuva`
--

CREATE TABLE `turnuva` (
  `turnuvaId` int(11) NOT NULL,
  `tar` date DEFAULT NULL,
  `sonBasTar` date DEFAULT NULL,
  `yoneticiId` int(11) DEFAULT NULL,
  `ilceId` int(11) DEFAULT NULL,
  `orgBaskan` varchar(50) DEFAULT NULL,
  `reglaman` text,
  `yetkiliKisi` varchar(50) DEFAULT NULL,
  `iletisim` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `turnuva`
--

INSERT INTO `turnuva` (`turnuvaId`, `tar`, `sonBasTar`, `yoneticiId`, `ilceId`, `orgBaskan`, `reglaman`, `yetkiliKisi`, `iletisim`) VALUES
(3, '2019-01-09', '2019-01-08', NULL, 748, 'sdsd', 'hhs', 'mustafa', '5549889655'),
(5, '2019-01-09', '2019-01-08', NULL, 759, 'ahmet reis', 'baya iyi', 'yetkili', '0222222222'),
(6, '2019-01-13', '2019-01-10', NULL, 759, 'ahmet reis', 'baya iyi', 'yetkili', '0222222222'),
(10, '2019-01-14', '2019-01-11', NULL, 754, 'ahmet reis', 'ÅŸeytan ayrÄ±ntÄ±da gizlidir', 'mustafa', '9Ä±098043985'),
(28, '2019-01-14', '2019-01-10', NULL, 796, 'hacÄ± bÄ±ttÄ±lÄ±', 'At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies. \r\n', 'hayri bey', '055549935366'),
(29, '2019-01-10', '2019-01-09', NULL, 972, 'seydi ali reis', 'At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies. \r\n', 'hÄ±yar bey', '05547789877'),
(31, '2019-01-14', '2019-01-11', NULL, 754, 'seydi ali reis', 'At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies. \r\ni', 'yetki', '0222222222'),
(22, '2019-01-19', '2019-01-03', NULL, 827, 'ahmet reis fgfg', 'bu zamanda yapÄ±lacak', 'hayri velet', '02665874745'),
(23, '2019-01-19', '2019-01-03', NULL, 827, 'ahmet reis fgfg', 'bu zamanda yapÄ±lacak', 'hayri velet', '02665874745'),
(24, '2019-01-01', '2019-01-01', NULL, 602, '000000', '8888888888888', 'hayri veleti', '000000000000'),
(25, '2019-01-01', '2019-01-01', NULL, 602, '000000', '8888888888888', 'hayri veleti', '000000000000'),
(26, '2019-01-01', '2019-01-01', NULL, 602, '000000', '8888888888888', 'hayri veleti', '7777777777777'),
(27, '2019-01-09', '2019-01-03', NULL, 775, '555555555', '5555555555', '5555555', '888888888888'),
(33, '2019-01-18', '2019-01-14', NULL, 917, 'Tugaycan KÃ¶stek', 'Lorem Ipsum Nedir ve Ne Anlama Gelir?\r\nÅžimdilerde dijital dÃ¼nyada sÄ±kÃ§a karÅŸÄ±mÄ±za Ã§Ä±kan Lorem Ipsum aslÄ±nda Ã§ok Ã¶ncelere dayanÄ±yor ve yÄ±llardan beridir matbaa iÃ§erisinde de kullanÄ±lÄ±yor. Lorem Ipsum en basit haliyle yapÄ±lan yazÄ±lÄ± Ã§alÄ±ÅŸmalarda yazÄ±nÄ±n nasÄ±l gÃ¶rÃ¼neceÄŸini anlayabilmemiz iÃ§in kullandÄ±ÄŸÄ±mÄ±z taslak bir metindir. Peki, gerek matbaada gerekse de dijital dÃ¼nyada sÃ¼rekli olarak kullanÄ±lan bu metnin tarihi nedir ve ne anlama gelir?&#039;\r\n\r\nLorem Ipsum&#039;un Tarihi\r\nLorem Ipsum yaklaÅŸÄ±k 500 yÄ±l Ã¶nce bir matbaacÄ±nÄ±n baskÄ±lar iÃ§in hazÄ±rladÄ±ÄŸÄ± font model kitabÄ±nda kullanÄ±lmÄ±ÅŸtÄ±r. YÄ±llar geÃ§tikÃ§e kullanÄ±m alanlarÄ± da kullanan kiÅŸi sayÄ±sÄ± da artarak devam etmiÅŸtir. Kullanan insanlar uzun yÄ±llar bunun anlamsÄ±z kelimelerden oluÅŸan bir metin olduÄŸunu dÃ¼ÅŸÃ¼ndÃ¼ler. Ancak sonradan edinilen bulgular aslÄ±nda gerÃ§eÄŸin Ã§ok farklÄ± olduÄŸunu ortaya koydu.\r\n\r\nLorem Ipsum&#039;un tarihi milattan Ã¶nce 45 (MÃ–.43) yÄ±lÄ±na kadar dayanÄ±yor. O tarihlerde Ã‡iÃ§ero tarafÄ±ndan yazÄ±lan &quot;Ä°yi ve KÃ¶tÃ¼nÃ¼n UÃ§ SÄ±nÄ±rlarÄ±&quot; kitabÄ±nÄ±n 1.30.32 paragrafÄ±nda geÃ§tiÄŸi sonradan Ã¶ÄŸrenilmiÅŸtir. Kitap aynÄ± zamanda 1500&#039;lÃ¼ yÄ±llarda Avrupa&#039;da RÃ¶nesans dÃ¶nemi ile popÃ¼ler olmuÅŸ, aynÄ± dÃ¶nemde Lorem Ipsum&#039;u ilk kullanan matbaacÄ±ya da muhtemelen bu vesileyle ulaÅŸmÄ±ÅŸ.  \r\n\r\nYÄ±llardÄ±r kullanÄ±lan Lorem Ipsum taslaÄŸÄ±;\r\n&quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\r\n\r\nLorem Ipsum AnlamÄ± Nedir?\r\nYazÄ±nÄ±n bir bÃ¼tÃ¼n olarak anlamÄ± bulunmamaktadÄ±r. Ancak Ã‡iÃ§ero&#039;dan alÄ±nan kÄ±sÄ±m ve anlamÄ± ÅŸÃ¶yle;\r\n\r\n&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;\r\n\r\n&quot;AcÄ±yÄ± seven, arayan ve ona sahip olmak isteyen hiÃ§ kimse yoktur. Nedeni basit. Ã‡Ã¼nkÃ¼ o acÄ±dÄ±r...&quot;\r\n\r\nYazÄ±nÄ±n geri kalan kÄ±smÄ± ise latin harflerinden ilk bakÄ±ÅŸta anlamlÄ± bir yazÄ± gibi gÃ¶rÃ¼nebilecek ÅŸekilde rasgele yazÄ±lmÄ±ÅŸtÄ±r.  \r\n\r\nLorem Ipsum Neden KullanÄ±lÄ±r?\r\nYapÄ±lan araÅŸtÄ±rmalar gÃ¶steriyor ki, insanlar bir baskÄ± Ã¼rÃ¼nÃ¼nÃ¼ ya da dijital tasarÄ±mÄ± deÄŸerlendirirken kendilerini yazÄ±ya ve onun anlamÄ±na kaptÄ±rmadan objektif deÄŸerlendirme yapamÄ±yorlar. Bu nedenle Lorem Ipsum insanlarÄ±n tasarÄ±ma daha iyi odaklanmalarÄ± ve aynÄ± zamanda anlamlÄ± bir yazÄ± formuna Ã§ok benzer bir Ã¶rnekle birlikte tasarÄ±mÄ± gÃ¶rebilmeleri iÃ§in kullanÄ±lÄ±r.  \r\n\r\nBu kullanÄ±mÄ±n yÄ±llarca sÃ¼regelen bir gelenek olduÄŸunu sÃ¶yleyebiliriz. GÃ¼nÃ¼mÃ¼zde hala birÃ§ok insan tarafÄ±ndan aktif olarak kullanÄ±ldÄ±ÄŸÄ±nÄ± da dÃ¼ÅŸÃ¼nÃ¼rsek, matbaa, online ve tasarÄ±m dÃ¼nyasÄ±nda kullanÄ±lmamasÄ± iÃ§in hiÃ§bir sebep yok.\r\n\r\nÃ–rnek olarak oluÅŸturulmuÅŸ 2 paragraf uzunluÄŸundaki Lorem Ipsum Ã¶rneÄŸini de buraya bÄ±rakalÄ±m. Belki de arkasÄ±nda yatan baÅŸka gizemleri de siz Ã§Ã¶zebilirsiniz.\r\n\r\nNOT: YazÄ± fontu seÃ§erken dikkat edilmesi gerekenler hakkÄ±ndaki ÅŸu yazÄ±mÄ±za da gÃ¶z atabilirsiniz.\r\n\r\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque quis facilisis velit. Nunc justo lorem, feugiat molestie faucibus ac, consequat nec magna. Praesent convallis tortor et tortor dapibus, a tincidunt felis finibus. Quisque purus nisl, malesuada id lacinia nec, sollicitudin ut eros. Mauris mollis mauris in felis viverra, eget pulvinar lorem porta. Sed id ullamcorper massa, eget tempus libero. Proin eu rhoncus mauris. Mauris ac pharetra turpis.\r\n\r\nOrci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse mattis, enim ut sodales bibendum, purus tellus aliquam felis, vel placerat lectus massa vitae justo. Curabitur pellentesque a quam vel aliquam. In ornare ultricies nunc, nec eleifend est fringilla nec. Cras vestibulum eros ultricies fringilla laoreet. Suspendisse sodales odio risus, et ultricies leo elementum consequat. Fusce metus enim, tristique eu velit eleifend, fringilla tristique purus. Mauris pharetra posuere mauris, id auctor nunc eleifend eget. Maecenas in justo sit amet est volutpat lobortis vitae id nisl. Praesent in quam ut massa fermentum tempus. In porttitor magna et justo ullamcorper consectetur. Nullam in ante a elit maximus eleifend. Nunc neque sem, dapibus a viverra ac, sodales volutpat tortor.&quot;', 'Mustafa Bey', '2665874577');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetici`
--

CREATE TABLE `yonetici` (
  `yoneticiId` int(11) NOT NULL,
  `yonetAd` varchar(50) DEFAULT NULL,
  `yonetSoyad` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `kullaniciad` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `yonetici`
--

INSERT INTO `yonetici` (`yoneticiId`, `yonetAd`, `yonetSoyad`, `pass`, `kullaniciad`) VALUES
(1, 'birim', 'yoneticisi', '12345', 'admin');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `gorevli`
--
ALTER TABLE `gorevli`
  ADD PRIMARY KEY (`gId`),
  ADD KEY `hakemId` (`hakemId`),
  ADD KEY `turnuvaId` (`turnuvaId`);

--
-- Tablo için indeksler `hakem`
--
ALTER TABLE `hakem`
  ADD PRIMARY KEY (`hakemId`);

--
-- Tablo için indeksler `il`
--
ALTER TABLE `il`
  ADD PRIMARY KEY (`ilId`);

--
-- Tablo için indeksler `ilce`
--
ALTER TABLE `ilce`
  ADD PRIMARY KEY (`ilceId`),
  ADD KEY `ilNo` (`ilId`);

--
-- Tablo için indeksler `islem`
--
ALTER TABLE `islem`
  ADD PRIMARY KEY (`islemId`),
  ADD KEY `turnuvaId` (`turnuvaId`),
  ADD KEY `TCNo` (`TCNo`);

--
-- Tablo için indeksler `kulup`
--
ALTER TABLE `kulup`
  ADD PRIMARY KEY (`kulupId`);

--
-- Tablo için indeksler `kusak`
--
ALTER TABLE `kusak`
  ADD PRIMARY KEY (`kusakId`);

--
-- Tablo için indeksler `mac`
--
ALTER TABLE `mac`
  ADD PRIMARY KEY (`macId`);

--
-- Tablo için indeksler `sporcu`
--
ALTER TABLE `sporcu`
  ADD PRIMARY KEY (`TCNo`),
  ADD KEY `kulupId` (`kulupId`),
  ADD KEY `kusakId` (`kusakId`);

--
-- Tablo için indeksler `turnuva`
--
ALTER TABLE `turnuva`
  ADD PRIMARY KEY (`turnuvaId`),
  ADD KEY `yoneticiId` (`yoneticiId`),
  ADD KEY `ilceId` (`ilceId`);

--
-- Tablo için indeksler `yonetici`
--
ALTER TABLE `yonetici`
  ADD PRIMARY KEY (`yoneticiId`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `gorevli`
--
ALTER TABLE `gorevli`
  MODIFY `gId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- Tablo için AUTO_INCREMENT değeri `hakem`
--
ALTER TABLE `hakem`
  MODIFY `hakemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Tablo için AUTO_INCREMENT değeri `ilce`
--
ALTER TABLE `ilce`
  MODIFY `ilceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=973;
--
-- Tablo için AUTO_INCREMENT değeri `islem`
--
ALTER TABLE `islem`
  MODIFY `islemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- Tablo için AUTO_INCREMENT değeri `kulup`
--
ALTER TABLE `kulup`
  MODIFY `kulupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- Tablo için AUTO_INCREMENT değeri `kusak`
--
ALTER TABLE `kusak`
  MODIFY `kusakId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Tablo için AUTO_INCREMENT değeri `mac`
--
ALTER TABLE `mac`
  MODIFY `macId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- Tablo için AUTO_INCREMENT değeri `turnuva`
--
ALTER TABLE `turnuva`
  MODIFY `turnuvaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- Tablo için AUTO_INCREMENT değeri `yonetici`
--
ALTER TABLE `yonetici`
  MODIFY `yoneticiId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
