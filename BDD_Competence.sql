-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 22 mai 2024 à 11:23
-- Version du serveur : 10.5.21-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ucszhsva_competence`
--

-- --------------------------------------------------------

--
-- Structure de la table `acquerir`
--

CREATE TABLE `acquerir` (
  `IDENTIFIANT_ETUD` int(11) NOT NULL,
  `N_ITEM` char(255) NOT NULL,
  `ACQUISE` tinyint(1) DEFAULT NULL,
  `EN_COURS_ACQUISITION` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `acquerir`
--

INSERT INTO `acquerir` (`IDENTIFIANT_ETUD`, `N_ITEM`, `ACQUISE`, `EN_COURS_ACQUISITION`) VALUES
(2, 'B1.1.1', 0, 1),
(2, 'B1.1.2', 1, 0),
(2, 'B1.1.3', 1, 0),
(2, 'B1.1.4', 1, 0),
(2, 'B1.1.5', 1, 0),
(2, 'B1.1.6', 1, 0),
(2, 'B1.2.1', 1, 0),
(2, 'B1.2.2', 1, 0),
(2, 'B1.2.3', 1, 0),
(2, 'B1.3.1', 1, 0),
(2, 'B1.3.2', 1, 0),
(2, 'B1.3.3', 1, 0),
(2, 'B2.3.SISR-INFRA.2', 1, 0),
(12, 'B1.1.1', 0, 1),
(12, 'B1.1.2', 1, 0),
(12, 'B1.1.3', 0, 1),
(12, 'B1.3.3', 1, 0),
(12, 'B2.1.SISR-INFRA.6', 0, 1),
(9, 'B1.1.1', 1, 0),
(9, 'B1.1.3', 0, 1),
(11, 'B1.1.1', 1, 0),
(12, 'B3.5 B.6 SLAM', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `blocs`
--

CREATE TABLE `blocs` (
  `ID_NOM_BLOC` char(255) NOT NULL,
  `LIBEL_BLOC` char(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `blocs`
--

INSERT INTO `blocs` (`ID_NOM_BLOC`, `LIBEL_BLOC`) VALUES
('BLOC 1', 'Support et mise à disposition des services informatiques'),
('BLOC 2 SISR', 'Administration des systèmes et des réseaux'),
('BLOC 2 SLAM', 'Conception et développement d’applications'),
('BLOC 3', 'Cybersécurité des services informatiques');

-- --------------------------------------------------------

--
-- Structure de la table `ensemble_de_competence`
--

CREATE TABLE `ensemble_de_competence` (
  `ID_ENSEMBLE_COMPETENCE` char(255) NOT NULL,
  `ID_NOM_BLOC` char(255) NOT NULL,
  `LIBEL_ENSEMBLE_COMPETENCE` char(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `ensemble_de_competence`
--

INSERT INTO `ensemble_de_competence` (`ID_ENSEMBLE_COMPETENCE`, `ID_NOM_BLOC`, `LIBEL_ENSEMBLE_COMPETENCE`) VALUES
('B1.1', 'Bloc 1', 'Gérer le patrimoine informatique'),
('B1.2', 'Bloc 1', 'Répondre aux incidents et aux demandes d’assistance et d’évolution'),
('B1.3', 'Bloc 1', 'Développer la présence en ligne de l’organisation'),
('B1.4', 'Bloc 1', 'Travailler en mode projet'),
('B1.5', 'Bloc 1', 'Mettre à disposition des utilisateurs un service informatique (orienté utilisateurs)'),
('B1.6', 'Bloc 1', 'Organiser son développement professionnel'),
('B2.1.SISR-INFRA', 'Bloc 2 SISR', 'Concevoir une solution d\'infrastructure réseau'),
('B2.1.SLAM', 'Bloc 2 SLAM', 'Concevoir et développer une solution applicative'),
('B2.2.SISR-INFRA', 'Bloc 2 SISR', 'Installer, tester et déployer une solution d\'infrastructure réseau'),
('B2.2.SLAM', 'Bloc 2 SLAM', 'Assurer la maintenance corrective ou évolutive d’une solution applicative'),
('B2.3.SISR-INFRA', 'Bloc 2 SISR', 'Exploiter, dépanner et superviser une solution d\'infrastructure réseau'),
('B2.3.SLAM', 'Bloc 2 SLAM', 'Gérer les données'),
('B3.1', 'Bloc 3', 'Protéger les données à caractère personnel'),
('B3.2', 'Bloc 3', 'Préserver l\'identité numérique de l’organisation'),
('B3.3', 'Bloc 3', 'Sécuriser les équipements et les usages des utilisateurs'),
('B3.4', 'Bloc 3', 'Garantir la disponibilité, l’intégrité et la confidentialité des services informatiques et des données de l’organisation face à des cyberattaques'),
('B3.5 A SISR', 'Bloc 3', 'Assurer la cybersécurité d’une infrastructure réseau, d’un système, d’un service (option A)'),
('B3.5 B SLAM', 'Bloc 3', 'Assurer la cybersécurité d’une solution applicative et de son développement (option B)');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `IDENTIFIANT_ETUD` int(32) NOT NULL,
  `NOM_ETUD` varchar(255) DEFAULT NULL,
  `PRENOM_ETUD` varchar(255) DEFAULT NULL,
  `MOT_DE_PASSE_ETUD` varchar(255) DEFAULT NULL,
  `EMAIL_ETUD` varchar(255) NOT NULL,
  `TOKEN` varchar(255) DEFAULT NULL,
  `AVATAR` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`IDENTIFIANT_ETUD`, `NOM_ETUD`, `PRENOM_ETUD`, `MOT_DE_PASSE_ETUD`, `EMAIL_ETUD`, `TOKEN`, `AVATAR`) VALUES
(2, 'zanzi', 'ugo', '$2y$12$IStbHKWx7ZD97dqvcBltVuh.yUlwFeHUxILaRI7PFC.2l6ts.XTBu', 'ugo.zanzi@gmail.com', NULL, 'xavatar.png'),
(5, 'Jury', 'Jury', '$2y$12$vZLFUnIDzL0Rg3fcvATUQutT/UAPuleMcfyeqn9hTny6tLvmhB.MG', 'jury@sms-formation.fr', NULL, NULL),
(6, 'test', 'test', '$2y$12$EFLv.IHbVhxI6y7YjVB.fu4BIl2yhcePQ06XVQ9GlZNMsZ91M7vNG', 'test@test.fr', NULL, NULL),
(7, 'ZAEGEL', 'Guy', '$2y$12$qFNgvOyqL4We9HsCuPgpPuEes252LH4UfXemCpumRb4W8eSmuey3q', 'guy_zaegel@hotmail.fr', NULL, NULL),
(8, 'SMS', 'Sport', '$2y$12$3e8JHg9wA/WoE/W7k3gfyeFSg1kllkfRpsjUGZAl52TegtTWDp9TG', 'sport-management@hotmail.fr', NULL, NULL),
(9, 'SCHNELZAUER', 'Lucas', '$2y$12$1VArmO2enwe1RcryTwXwhO7DQjdKotwx9sxT6skibMb0oJ7FTNrUK', 'lucas.schnelzauer@outlook.fr', NULL, NULL),
(10, 'djelassi', 'lenny', '$2y$12$qh73kbDBbzdYEnmLjY1dreKk30KCAMfAU.wxv8vM6Xg0wqwHWVWMm', 'lennydjelassi@outlook.fr', NULL, NULL),
(11, 'Zekri', 'Mehdi', '$2y$12$TGunczIIzrf09DLiNYA2VOFhztL6R63mF1xoeipXVydb9ggaKijVS', 'mehdi_zekri@outlook.com', NULL, NULL),
(12, 'Thuillier', 'Clément', '$2y$10$krtH4ueKZQP/qsLzF43kjuFuAv2nC1kUhQyikoXrRyraW2Y/A6rr6', 'clement.thuillier@outlook.fr', '664db6e426bfa', NULL),
(13, 'Montenat De Fays', 'Chloé', '$2y$12$H2xt40VEFlGL7JtmLe8X8uz3KXQuO2uRuPXfDWcLnT6cm1WUeKAxO', 'chloemontenat.defays@outlook.fr', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `indicateur`
--

CREATE TABLE `indicateur` (
  `IDENTIFIANT_PROJ` int(11) NOT NULL,
  `N_ITEM` varchar(255) NOT NULL,
  `IDENTIFIANT_ETUD` int(11) NOT NULL,
  `LIBEL_ITEM` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `indicateur`
--

INSERT INTO `indicateur` (`IDENTIFIANT_PROJ`, `N_ITEM`, `IDENTIFIANT_ETUD`, `LIBEL_ITEM`) VALUES
(18, 'P1.2.1', 2, 'En utilisant les outils adaptés, les demandes d’as'),
(23, 'P1.1.7', 2, 'Les écarts par rapport aux règles d’utilisation des ressources numériques sont détectés et signalés.'),
(15, 'P1.1.7', 5, 'Les écarts par rapport aux règles d’utilisation des ressources numériques sont détectés et signalés.'),
(15, 'P1.2.6', 5, 'L’utilisation d’un logiciel de gestion de parc et d’incidents est maîtrisée.'),
(24, 'P1.2.3', 7, 'La méthode de diagnostic de résolution d’un incident est adéquate et efficiente.'),
(25, 'P1.6.3.3', 7, 'Renforcer de ses compétences.'),
(24, 'P2.3.3', 7, 'Les traitements pris en charge par les composants développés dans la base de données sont conformes aux demandes du cahier des charges.'),
(30, 'P1.2.2', 13, 'La réponse à une demande d’assistance est conforme à la procédure et adaptée à l’utilisateur.'),
(31, 'P1.4.1', 9, 'Les objectifs et les modalités d’organisation du projet sont explicités.'),
(31, 'P2.1.6.2', 9, 'Les tests d’intégration sont réalisés.'),
(32, 'P1.1.5', 10, 'Les sauvegardes sont réalisées dans les conditions prévues conformément au plan de sauvegarde.'),
(32, 'P1.1.1', 10, 'Le recensement du patrimoine informatique est exhaustif et réalisé au moyen d’un outil de gestion des actifs informatiques.'),
(27, 'P1.1.1', 11, 'Le recensement du patrimoine informatique est exhaustif et réalisé au moyen d’un outil de gestion des actifs informatiques.'),
(31, 'P3.3.3.1', 9, 'Les utilisateurs sont authentifiés.'),
(32, 'P1.1.6', 10, 'Les restaurations sont testées et opérationnelles.'),
(27, 'P1.1.6', 11, 'Les restaurations sont testées et opérationnelles.'),
(28, 'P1.6.3.3', 12, 'Renforcer de ses compétences.'),
(28, 'P2.1.6.1', 12, 'Le développement répond à l’expression des besoins fonctionnels et respecte les contraintes techniques figurant dans le cahier des charges.'),
(32, 'P1.3.5', 10, 'Le site Web a évolué conformément au besoin exprimé.'),
(32, 'P1.5.6', 10, 'Le service déployé est opérationnel et donne satisfaction à l’utilisateur.'),
(32, 'P3.5.9', 10, 'Les composants utilisés sont certifiés, sécurisés et actualisés.'),
(30, 'P1.2.4', 13, 'Une solution à l’incident est trouvée et mise en œuvre.'),
(32, 'P3.5.2', 10, 'Les préoccupations de sécurité sont prises en compte à toutes les étapes d’un développement informatique.'),
(32, 'P3.5.3', 10, 'Les bonnes pratiques de sécurité sont mises en œuvre à toutes les étapes d’un développement informatique.'),
(30, 'P1.6.3.3', 13, 'Renforcer de ses compétences.'),
(31, 'P1.4.6', 9, 'Le projet est documenté.'),
(31, 'P3.3.3.2', 9, 'Les habilitations sont configurées.');

-- --------------------------------------------------------

--
-- Structure de la table `item_competence`
--

CREATE TABLE `item_competence` (
  `N_ITEM` char(255) NOT NULL,
  `LIBEL_ENSEMBLE_COMPETENCE` char(255) NOT NULL,
  `LIBEL_ITEM` char(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `item_competence`
--

INSERT INTO `item_competence` (`N_ITEM`, `LIBEL_ENSEMBLE_COMPETENCE`, `LIBEL_ITEM`) VALUES
('B1.1.1', 'Recenser et identifier les ressources numériques', 'B1.1'),
('B1.1.2', 'Mettre en place et vérifier les niveaux d\'habilitation associés à un service', 'B1.1'),
('B1.1.3', 'Exploiter des référentiels  normes et standards adoptés par le prestataire informatique', 'B1.1'),
('B1.1.4', 'Gérer les sauvegardes', 'B1.1'),
('B1.1.5', 'Vérifier les conditions de la continuité d\'un service informatique', 'B1.1'),
('B1.1.6', 'Vérifier le respect des régles d\'utilisation des ressources numériques', 'B1.1'),
('B1.2.1', 'Traiter des demandes concernant les services réseau et système, applicatifs', 'B1.2'),
('B1.2.2', 'Traiter des demandes concernant les applications', 'B1.2'),
('B1.2.3', 'Collecter - suivre et orienter les demandes', 'B1.2'),
('B1.3.1', 'Participer à l\'évolution d\'un site Web exploitant les données de l\'organisation', 'B1.3'),
('B1.3.2', 'Référencer les services en ligne de l\'organisation et mesurer leur visibilité', 'B1.3'),
('B1.3.3', 'Participer à la valorisation de l\'image de l\'organisation sur les médias numériques en tenant compte du cadre juridique et des enjeux économiques', 'B1.3'),
('B1.4.1', 'Analyser les objectifs et les modalités d\'organisation d\'un projet', 'B1.4'),
('B1.4.2', 'Évaluer les indicateurs de suivi d\'un projet et analyser les écarts', 'B1.4'),
('B1.4.3', 'Planifier les activités', 'B1.4'),
('B1.5.1', 'Déployer un service', 'B1.5'),
('B1.5.2', 'Réaliser les tests d\'intégration et d\'acceptation d\'un service', 'B1.5'),
('B1.5.3', 'Accompagner les utilisateurs dans la mise en place d\'un service', 'B1.5'),
('B1.6.1', 'Gérer son identité professionnelle', 'B1.6'),
('B1.6.2', 'Développer son projet professionnel', 'B1.6'),
('B1.6.3', 'Mettre en place son environnement d\'apprentissage personnel', 'B1.6'),
('B1.6.4', 'Mettre en oeuvre des outils et stratégies de veille informationnelle', 'B1.6'),
('B2.1.SISR-INFRA.1', 'Analyser un besoin exprimé et son contexte juridique', 'B2.1.SISR-INFRA'),
('B2.1.SISR-INFRA.2', 'Étudier l\'impact d?une évolution d?un élément d?infrastructure sur le système informatique', 'B2.1.SISR-INFRA'),
('B2.1.SISR-INFRA.3', 'Maquetter et prototyper une solution d\'infrastructure', 'B2.1.SISR-INFRA'),
('B2.1.SISR-INFRA.4', 'Choisir les éléments nécessaires pour assurer la qualité et la disponibilité d\'un service', 'B2.1.SISR-INFRA'),
('B2.1.SISR-INFRA.5', 'Élaborer un dossier de choix d\'une solution d?infrastructure et rédiger les spécifications techniques', 'B2.1.SISR-INFRA'),
('B2.1.SISR-INFRA.6', 'Déterminer et préparer les tests nécessaires à la validation de la solution d?infrastructure retenue', 'B2.1.SISR-INFRA'),
('B2.1.SLAM.1', 'Analyser un besoin exprimé et son contexte juridique', 'B2.1.SLAM'),
('B2.1.SLAM.10', 'Intégrer en continu des versions d\'une solution applicative', 'B2.1.SLAM'),
('B2.1.SLAM.11', 'Evaluer la qualité d\'une solution applicative', 'B2.1.SLAM'),
('B2.1.SLAM.12', 'Utiliser des composants d\'accès aux données', 'B2.1.SLAM'),
('B2.1.SLAM.2', 'Modéliser une solution applicative', 'B2.1.SLAM'),
('B2.1.SLAM.3', 'Participer à la conception de l\'architecture d\'une solution applicative', 'B2.1.SLAM'),
('B2.1.SLAM.4', 'Exploiter les technologies Web et mobile pour mettre en oeuvre les échanges entre applications, y compris de mobilité', 'B2.1.SLAM'),
('B2.1.SLAM.5', 'Identifier, développer, utiliser ou adapter des composants logiciels', 'B2.1.SLAM'),
('B2.1.SLAM.6', 'Exploiter les ressources du cadre applicatif (framework)', 'B2.1.SLAM'),
('B2.1.SLAM.7', 'Exploiter les fonctionnalités d\'un environnement de développement et de tests', 'B2.1.SLAM'),
('B2.1.SLAM.8', 'Rédiger des documentations techniques et d’utilisation d\'une solution applicative', 'B2.1.SLAM'),
('B2.1.SLAM.9', 'Réaliser des tests nécessaires à la validation ou à la mise en production d\'éléments adaptés ou développés', 'B2.1.SLAM'),
('B2.2.SISR-INFRA.1', 'Installer et configurer des éléments d\'infrastructure', 'B2.2.SISR-INFRA'),
('B2.2.SISR-INFRA.2', 'Rédiger ou mettre à jour la documentation technique et utilisateur d?une solution d?infrastructure', 'B2.2.SISR-INFRA'),
('B2.2.SISR-INFRA.3', 'Tester l\'intégration et l\'acceptation d\'une solution d\'infrastructure', 'B2.2.SISR-INFRA'),
('B2.2.SISR-INFRA.4', 'Déployer une solution d?infrastructure', 'B2.2.SISR-INFRA'),
('B2.2.SISR-INFRA.5', 'Installer et configurer des éléments nécessaires pour assurer la continuité des services', 'B2.2.SISR-INFRA'),
('B2.2.SISR-INFRA.6', 'Installer et configurer des éléments nécessaires pour assurer la qualité de service', 'B2.2.SISR-INFRA'),
('B2.2.SLAM.1', 'Recueillir, analyser et mettre à jour les informations sur une version d\'une solution applicative', 'B2.2.SLAM'),
('B2.2.SLAM.2', 'Analyser et corriger un dysfonctionnement', 'B2.2.SLAM'),
('B2.2.SLAM.3', 'Elaborer et réaliser des tests des éléments mis à jour', 'B2.2.SLAM'),
('B2.2.SLAM.4', 'Mettre à jour la documentation technique et d’utilisation d\'une solution applicative', 'B2.2.SLAM'),
('B2.2.SLAM.5', 'Évaluer la qualité d\'une solution applicative', 'B2.2.SLAM'),
('B2.3.SISR-INFRA.1', 'Administrer sur site et à distance des éléments d\'une infrastructure', 'B2.3.SISR-INFRA'),
('B2.3.SISR-INFRA.2', 'Automatiser des tâches d\'administration', 'B2.3.SISR-INFRA'),
('B2.3.SISR-INFRA.3', 'Gérer des indicateurs et des fichiers d\'activité des éléments d\'une infrastructure', 'B2.3.SISR-INFRA'),
('B2.3.SISR-INFRA.4', 'Identifier- qualifier, évaluer et réagir face à un incident ou à un problème', 'B2.3.SISR-INFRA'),
('B2.3.SISR-INFRA.5', 'Évaluer  -maintenir et améliorer la qualité d?un service', 'B2.3.SISR-INFRA'),
('B2.3.SLAM.1', 'Exploiter des données à l\'aide d\'un langage de requêtes', 'B2.3.SLAM'),
('B2.3.SLAM.2', 'Concevoir ou adapter une base de données', 'B2.3.SLAM'),
('B2.3.SLAM.3', 'Développer des fonctionnalités applicatives au sein d\'un système de gestion de bases de données (relationnel ou non)', 'B2.3.SLAM'),
('B2.3.SLAM.4', 'Administrer et déployer une base de données', 'B2.3.SLAM'),
('B3.1.1', 'Recenser les traitements sur les données à caractère personnel au sein de l\'organisation', 'B3.1'),
('B3.1.2', 'Identifier les risques liés à la collecte, au traitement, au stockage et à la diffusion des données à caractère personnel', 'B3.1'),
('B3.1.3', 'Appliquer la réglementation en matière de collecte, de traitement et de conservation des données à caractère personnel', 'B3.1'),
('B3.1.4', 'Sensibiliser les utilisateurs à la protection des données à caractère personnel', 'B3.1'),
('B3.2.1', 'Protéger l\'identité numérique d\'une organisation', 'B3.2'),
('B3.2.2', 'Déployer les moyens appropriés de preuve électronique', 'B3.2'),
('B3.3.1', 'Informer les utilisateurs sur les risques associés à l\'utilisation d?une ressource numérique et promouvoir les bons usages à adopter', 'B3.3'),
('B3.3.2', 'Identifier les menaces et mettre en oeuvre les défenses appropriées', 'B3.3'),
('B3.3.3', 'Gérer les accès et les privilèges appropriés', 'B3.3'),
('B3.3.4', 'Vérifier l\'efficacité de la protection', 'B3.3'),
('B3.4.1', 'Caractériser les risques liés à l\'utilisation malveillante d\'un service informatique', 'B3.4'),
('B3.4.2', 'Recenser les conséquences d\'une perte de disponibilité, d\'intégrité ou de confidentialité', 'B3.4'),
('B3.4.3', 'Identifier les obligations légales qui s\'imposent en matière d\'archivage et de protection des données de l\'organisation', 'B3.4'),
('B3.4.4', 'Organiser la collecte et la conservation des preuves numériques', 'B3.4'),
('B3.4.5', 'Appliquer les procédures garantissant le respect des obligations légales', 'B3.4'),
('B3.5 A.1 SISR', 'Participer à la vérification des éléments contribuant à la sûreté d\'une infrastructure informatique', 'B3.5 A SISR'),
('B3.5 A.2 SISR', 'Prendre en compte la sécurité dans un projet de mise en oeuvre d\'une solution d\'infrastructure', 'B3.5 A SISR'),
('B3.5 A.3 SISR', 'Mettre en oeuvre et vérifier la conformité d\'une infrastructure à un référentiel, une norme ou un standard de sécurité', 'B3.5 A SISR'),
('B3.5 A.4 SISR', 'Prévenir les attaques', 'B3.5 A SISR'),
('B3.5 A.5 SISR', 'Détecter les actions malveillantes', 'B3.5 A SISR'),
('B3.5 A.6 SISR', 'Analyser les incidents de sécurité, proposer et mettre en oeuvre des contre-mesures', 'B3.5 A SISR'),
('B3.5 B.1 SLAM', 'Participer à la vérification des éléments contribuant à la qualité d\'un développement informatique', 'B3.5 B SLAM'),
('B3.5 B.2 SLAM', 'Prendre en compte la sécurité dans un projet de développement d\'une solution applicative', 'B3.5 B SLAM'),
('B3.5 B.3 SLAM', 'Mettre en oeuvre et vérifier la conformité d?une solution applicative et de son développement à un référentiel, une norme ou un standard de sécurité', 'B3.5 B SLAM'),
('B3.5 B.4 SLAM', 'Prévenir les attaques', 'B3.5 B SLAM'),
('B3.5 B.5 SLAM', 'Analyser les connexions (logs)', 'B3.5 B SLAM'),
('B3.5 B.6 SLAM', 'Analyser des incidents de sécurité, proposer et mettre en oeuvre des contre-mesures', 'B3.5 B SLAM');

-- --------------------------------------------------------

--
-- Structure de la table `item_indicateur`
--

CREATE TABLE `item_indicateur` (
  `N_ITEM` char(32) NOT NULL,
  `ID_ENSEMBLE_COMPETENCE` text NOT NULL,
  `LIBEL_ITEM` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `item_indicateur`
--

INSERT INTO `item_indicateur` (`N_ITEM`, `ID_ENSEMBLE_COMPETENCE`, `LIBEL_ITEM`) VALUES
('P1.1.1', 'B1.1', 'Le recensement du patrimoine informatique est exhaustif et réalisé au moyen d’un outil de gestion des actifs informatiques.'),
('P1.1.2', 'B1.1', 'Les référentiels, normes et standards sont mobilisés de façon pertinente.'),
('P1.1.3', 'B1.1', 'Les droits mis en place correspondent aux habilitations des acteurs.'),
('P1.1.4', 'B1.1', 'Les conditions de continuité et de reprise d’un service sont vérifiées et les manquements sont signalés.'),
('P1.1.5', 'B1.1', 'Les sauvegardes sont réalisées dans les conditions prévues conformément au plan de sauvegarde.'),
('P1.1.6', 'B1.1', 'Les restaurations sont testées et opérationnelles.'),
('P1.1.7', 'B1.1', 'Les écarts par rapport aux règles d’utilisation des ressources numériques sont détectés et signalés.'),
('P1.2.1', 'B1.2', 'En utilisant les outils adaptés, les demandes d’assistance ont été prises en compte, correctement diagnostiquées et leur traitement correspond aux attentes.'),
('P1.2.2', 'B1.2', 'La réponse à une demande d’assistance est conforme à la procédure et adaptée à l’utilisateur.'),
('P1.2.3', 'B1.2', 'La méthode de diagnostic de résolution d’un incident est adéquate et efficiente.'),
('P1.2.4', 'B1.2', 'Une solution à l’incident est trouvée et mise en œuvre.'),
('P1.2.5', 'B1.2', 'Le cycle de résolution des demandes respecte les normes et standards du prestataire informatique.'),
('P1.2.6', 'B1.2', 'L’utilisation d’un logiciel de gestion de parc et d’incidents est maîtrisée.'),
('P1.2.7', 'B1.2', 'Le compte rendu d’intervention est clair et explicite.'),
('P1.2.8', 'B1.2', 'La communication écrite et orale est adaptée à l’interlocuteur.'),
('P1.3.1', 'B1.3', 'L’image de l’organisation est conforme aux attentes et valorisée.'),
('P1.3.2', 'B1.3', 'Les enjeux économiques liés à l’image de l’organisation sont identifiés et les obligations juridiques sont respectées.'),
('P1.3.3', 'B1.3', 'Les mentions légales sont accessibles et conformes à la législation.'),
('P1.3.4', 'B1.3', 'La visibilité des services en ligne de l’organisation est satisfaisante.'),
('P1.3.5', 'B1.3', 'Le site Web a évolué conformément au besoin exprimé.'),
('P1.4.1', 'B1.4', 'Les objectifs et les modalités d’organisation du projet sont explicités.'),
('P1.4.2', 'B1.4', 'L’analyse des besoins et de l’existant est pertinente.'),
('P1.4.3', 'B1.4', ' Les activités personnelles sont planifiées selon une méthodologie donnée et les ressources humaines, matérielles et logicielles nécessaires sont mobilisées de manière efficace et pertinente.'),
('P1.4.4', 'B1.4', 'Le découpage en tâches est réaliste.'),
('P1.4.5', 'B1.4', 'Les livrables sont conformes.'),
('P1.4.6', 'B1.4', 'Le projet est documenté.'),
('P1.4.7', 'B1.4', 'Un compte rendu clair et concis est réalisé et les écarts sont justifiés.'),
('P1.4.8', 'B1.4', 'La communication écrite et orale est adaptée à l’interlocuteur.'),
('P1.5.1', 'B1.5', 'Des tests pertinents d’intégration et d’acceptation sont rédigés et effectués.'),
('P1.5.2', 'B1.5', 'Les outils de test sont utilisés de manière appropriée.'),
('P1.5.3', 'B1.5', 'Un rapport de test du service est produit.'),
('P1.5.4', 'B1.5', 'Un support d’information est disponible.'),
('P1.5.5', 'B1.5', 'Les modalités d’accompagnement sont définies.'),
('P1.5.6', 'B1.5', 'Le service déployé est opérationnel et donne satisfaction à l’utilisateur.'),
('P1.6.1', 'B1.6', 'Les besoins de formation sont identifiés pour assurer le support ou mettre à disposition un service.'),
('P1.6.2', 'B1.6', 'L’environnement d’apprentissage personnel est délimité et expliqué.'),
('P1.6.3.1', 'B1.6', 'Repérer les techniques et technologies émergentes du secteur informatique.'),
('P1.6.3.2', 'B1.6', 'Utiliser de manière approfondie des moyens de recherche d\'information.'),
('P1.6.3.3', 'B1.6', 'Renforcer de ses compétences.'),
('P1.6.4', 'B1.6', 'L’identité professionnelle est pertinente et visible sur un réseau social professionnel.'),
('P2.1.1.1', 'B2.1', 'La modélisation de l’application est conforme aux besoins.'),
('P2.1.1.2', 'B2.1', 'La maquette des éléments applicatifs de la solution respecte les fonctionnalités exprimées.'),
('P2.1.1.3', 'B2.1', 'Les spécifications de l’interface utilisateur répondent aux contraintes ergonomiques.'),
('P2.1.2', 'B2.1', 'Le choix des composants logiciels à utiliser et/ou à développer est pertinent.'),
('P2.1.3', 'B2.1', 'Les composants logiciels sont validés par les procédures de tests unitaires et fonctionnels.'),
('P2.1.4', 'B2.1', 'Un service Web est exploité pour échanger des données entre applications.'),
('P2.1.5', 'B2.1', 'Les données persistantes liées à la solution applicative sont exploitées à travers un langage de requête lié à la base de données qui peut être le langage de requête proposé par les échanges applicatifs des technologies Web, un langage de requête présent dans l’outil de correspondance objet-relationnel ou toute autre solution de persistance.'),
('P2.1.6.1', 'B2.1', 'Le développement répond à l’expression des besoins fonctionnels et respecte les contraintes techniques figurant dans le cahier des charges.'),
('P2.1.6.2', 'B2.1', 'Les tests d’intégration sont réalisés.'),
('P2.1.6.3', 'B2.1', 'Un outil collaboratif de gestion des itérations de développement et de versions est utilisé.'),
('P2.1.6.4', 'B2.1', 'Une documentation des versions vient appuyer l’intégration continue.'),
('P2.1.6.5', 'B2.1', 'Les composants logiciels sont documentés de manière à être réutilisés.'),
('P2.1.6.6', 'B2.1', 'Un document est rédigé pour chaque contexte d’utilisation de l’application et est adapté à chaque destinataire tant par son contenu que par sa présentation.'),
('P2.1.6.7', 'B2.1', 'Le développement tient compte des préoccupations de développement durable.'),
('P2.1.7', 'B2.1', 'L’application développée est opérationnelle conformément au cahier des charges et stable dans l’environnement de production.'),
('P2.2.1', 'B2.2', 'L’évolution de la solution applicative répond aux besoins exprimés dans le cahier des charges.'),
('P2.2.2', 'B2.2', 'La modélisation de l’application existante est mise à jour par les nouvelles fonctionnalités et/ou les nouveaux correctifs apportés.'),
('P2.2.3', 'B2.2', 'L’interface utilisateur est mise à jour en respectant les contraintes ergonomiques.'),
('P2.2.4', 'B2.2', 'Un outil collaboratif de gestion des versions est utilisé.'),
('P2.2.5', 'B2.2', 'Des composants logiciels sont adaptés pour améliorer la qualité de la solution applicative.'),
('P2.2.6', 'B2.2', 'Les composants logiciels adaptés et/ou corrigés sont validés par les procédures de tests unitaires et fonctionnels.'),
('P2.2.7', 'B2.2', 'Le dysfonctionnement de la solution existante est corrigé selon les procédures en vigueur et dans les délais.'),
('P2.2.8', 'B2.2', 'Les accès aux données persistantes à travers le langage de requête du système de gestion de base de données relationnel, le langage de requête proposé par les échanges applicatifs des technologies Web, le langage de requête de l’outil de correspondance objet-relationnel ou toute autre solution de persistance sont mis à jour.'),
('P2.2.9', 'B2.2', 'Les tests de non régression sont réalisés.'),
('P2.2.10', 'B2.2', 'Les composants logiciels sont documentés de manière à être réutilisés.'),
('P2.2.11', 'B2.2', 'La documentation technique et d’utilisateurs de la solution applicative sont mises à jour.'),
('P2.2.12', 'B2.2', 'L’application améliorée et/ou corrigée est opérationnelle et stable dans l’environnement de production.'),
('P2.3.1', 'B2.3', 'L’exploitation des données permet de construire l’information attendue.'),
('P2.3.2', 'B2.3', 'Les accès aux données sont contrôlés conformément aux habilitations définies par le cahier des charges.'),
('P2.3.3', 'B2.3', 'Les traitements pris en charge par les composants développés dans la base de données sont conformes aux demandes du cahier des charges.'),
('P2.3.4', 'B2.3', 'Les données sont modélisées conformément au besoin de la solution applicative.'),
('P2.3.5', 'B2.3', 'Le choix du type de base de données est pertinent.'),
('P2.3.6', 'B2.3', 'L’accessibilité des données est conforme à la qualité de service attendue.'),
('P2.3.7', 'B2.3', 'La base de données est sauvegardée selon la planification retenue.'),
('P2.3.8', 'B2.3', 'Des tests de restauration sont effectués.'),
('P2.3.9', 'B2.3', 'La base de données est opérationnelle et stable dans l’environnement de production.'),
('P3.1.1', 'B3.1', 'La collecte, le traitement et la conservation des données à caractère personnel sont effectués conformément à la réglementation en vigueur.'),
('P3.1.2', 'B3.1', 'La charte informatique contient des dispositions destinées à protéger les données à caractère personnel.'),
('P3.1.3', 'B3.1', 'Des supports de communication pertinents sont accessibles et adaptés aux utilisateurs.'),
('P3.1.4', 'B3.1', 'Le recensement des traitements des données à caractère personnel est exhaustif.'),
('P3.1.5', 'B3.1', 'Des moyens de protection sont mis en place pour garantir la confidentialité et l’intégrité des données à caractère personnel en tenant compte des risques identifiés.'),
('P3.2.1', 'B3.2', 'L’identité numérique de l’organisation est protégée en s’appuyant sur des moyens techniques et juridiques.'),
('P3.2.2', 'B3.2', 'La preuve électronique est déployée de manière sécurisée et dans le respect de la législation.'),
('P3.3.1', 'B3.3', 'Des supports de communication interne sont accessibles aux utilisateurs et adaptés à leurs destinataires.'),
('P3.3.2.1', 'B3.3', 'L’accès physique au terminal et à ses données est sécurisé.'),
('P3.3.2.2', 'B3.3', 'Les applications installées sont vérifiées par des procédures automatisées et des logiciels de sécurité.'),
('P3.3.2.3', 'B3.3', 'Les flux  réseaux sont identifiés et sécurisés.'),
('P3.3.3.1', 'B3.3', 'Les utilisateurs sont authentifiés.'),
('P3.3.3.2', 'B3.3', 'Les habilitations sont configurées.'),
('P3.3.3.3', 'B3.3', 'L’accès aux données est contrôlé.'),
('P3.3.3.4', 'B3.3', 'Les privilèges sont restreints.'),
('P3.3.4', 'B3.3', 'L’efficacité de la protection mise en œuvre est évaluée.'),
('P3.4.1', 'B3.4', 'Les risques associés à l’utilisation malveillante d’un service informatique sont caractérisés.'),
('P3.4.2', 'B3.4', 'Les conséquences des actes malveillants sur un service informatique sont identifiées.'),
('P3.4.3', 'B3.4', 'Les obligations légales en matière d’archivage et de protection des données sont identifiées et respectées.'),
('P3.4.4', 'B3.4', 'Les preuves numériques sont conservées de manière sécurisée et dans le respect de la législation.'),
('P3.4.5.1', 'B3.4', 'Un schéma présentant la segmentation du réseau est disponible.'),
('P3.4.5.2', 'B3.4', 'Les principes de mise en œuvre des  contrôles des connexions aux réseaux sont validés.'),
('P3.4.5.3', 'B3.4', 'L\'authentification et la confidentialité des échanges sont vérifiées.'),
('P3.4.5.4', 'B3.4', 'La sécurité de l\'administration est prise en compte.'),
('P3.4.5.5', 'B3.4', 'Les accès physiques et logiques à un serveur ou à un service sont vérifiés en fonction des habilitations et des privilèges définis.'),
('P3.4.5.6', 'B3.4', 'Les accès aux données sont contrôlés à chaque étape d’une transaction.'),
('P3.4.5.7', 'B3.4', 'Les systèmes et les applications sont actualisés en fonction des alertes de sécurité.'),
('P3.4.5.8', 'B3.4', 'Les vulnérabilités connues sont contrôlées'),
('P3.5.1', 'B3.5', 'Le respect des bonnes pratiques de développement informatique est vérifié (les structures de données sont normalisées, les accès aux données sont optimisés, le code est modulaire et robuste, les tests sont effectués).'),
('P3.5.2', 'B3.5', 'Les préoccupations de sécurité sont prises en compte à toutes les étapes d’un développement informatique.'),
('P3.5.3', 'B3.5', 'Les bonnes pratiques de sécurité sont mises en œuvre à toutes les étapes d’un développement informatique.'),
('P3.5.4', 'B3.5', 'Des tests de sécurité sont prévus et mis en œuvre.'),
('P3.5.5', 'B3.5', 'Les traitements sur les données à caractère personnel sont déclarés et respectent la réglementation.'),
('P3.5.6', 'B3.5', 'Le système d’authentification est conforme aux règles de sécurité.'),
('P3.5.7', 'B3.5', 'L’accès aux données respecte les règles de sécurité.'),
('P3.5.8', 'B3.5', 'Les échanges de données entre applications sont protégés.'),
('P3.5.9', 'B3.5', 'Les composants utilisés sont certifiés, sécurisés et actualisés.'),
('P3.5.10', 'B3.5', 'Les contre-mesures mises en place corrigent et préviennent les incidents de sécurité.'),
('P3.5.11', 'B3.5', 'Les contre-mesures sont documentées de manière à en assurer le suivi.'),
('P3.5.12', 'B3.5', 'La communication écrite et orale est adaptée à l’interlocuteur.');

-- --------------------------------------------------------

--
-- Structure de la table `maitriser`
--

CREATE TABLE `maitriser` (
  `N_ITEM` char(32) NOT NULL,
  `IDENTIFIANT_ETUD` char(32) NOT NULL,
  `MAITRISE` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `maitriser`
--

INSERT INTO `maitriser` (`N_ITEM`, `IDENTIFIANT_ETUD`, `MAITRISE`) VALUES
('S1.1.1', '2', 1),
('S1.1.2', '2', 1),
('S1.1.3', '2', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mobiliser`
--

CREATE TABLE `mobiliser` (
  `IDENTIFIANT_PROJ` int(11) NOT NULL,
  `N_ITEM` varchar(255) NOT NULL,
  `IDENTIFIANT_ETUD` int(11) NOT NULL,
  `LIBEL_ITEM` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `mobiliser`
--

INSERT INTO `mobiliser` (`IDENTIFIANT_PROJ`, `N_ITEM`, `IDENTIFIANT_ETUD`, `LIBEL_ITEM`) VALUES
(18, 'S1.1.6', 2, 'Typologie et techniques de sauvegarde et de restauration'),
(15, 'S1.1.9', 5, 'Normes et standards : enjeux techniques et économiques'),
(15, 'S1.1.13', 5, 'Obligations légales en matière de conservation et d’archivage des données'),
(24, 'S1.2.3', 7, 'Base de connaissances d’un centre d’assistance (helpdesk)'),
(25, 'S1.1.8', 7, 'Typologie des acteurs de l’industrie informatique'),
(24, 'S3.5.1', 7, 'Développement informatique : méthodes, normes, standards et bonnes pratiques.'),
(28, 'S1.2.4', 12, 'Prise de contrôle d’un poste de travail'),
(28, 'S1.4.1', 12, 'Planification de projet : approche prédictive et séquentielle, approche agile.'),
(30, 'S1.1.2', 13, 'Système informatique'),
(27, 'S1.1.2', 11, 'Système informatique'),
(27, 'S1.1.6', 11, 'Typologie et techniques de sauvegarde et de restauration'),
(27, 'S3.0.10', 11, 'Sécurité des applications Web : risques, menaces et protocoles.'),
(27, 'S3.5.1', 11, 'Développement informatique : méthodes, normes, standards et bonnes pratiques.'),
(28, 'S3.5.1', 12, 'Développement informatique : méthodes, normes, standards et bonnes pratiques.'),
(31, 'S1.3.9', 9, 'Mentions légales et conditions générales d’utilisation d’un site Web  '),
(31, 'S3.0.12', 9, 'Les données à caractère personnel : définition, réglementation, rôle de la CNIL.');

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `IDENTIFIANT_ETUD` char(32) NOT NULL,
  `N_ITEM` char(32) NOT NULL,
  `POSSEDE` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `posseder`
--

INSERT INTO `posseder` (`IDENTIFIANT_ETUD`, `N_ITEM`, `POSSEDE`) VALUES
('2', 'P1.1.1', 1),
('2', 'P1.1.2', 1),
('2', 'P1.1.3', 1),
('2', 'P1.1.4', 1),
('2', 'P2.1.6.4', 1),
('2', 'P2.1.6.5', 1),
('2', 'P2.1.6.6', 1),
('2', 'P1.1.5', 1),
('2', 'P1.1.6', 1),
('2', 'P1.1.7', 1),
('2', 'P1.2.1', 1),
('2', 'P1.2.2', 1),
('2', 'P1.2.3', 1),
('2', 'P1.2.4', 1),
('2', 'P1.2.5', 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `ID` int(11) NOT NULL,
  `IDENTIFIANT_ETUD` int(11) NOT NULL,
  `LIBELLE` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `DATE_CREATED` date DEFAULT NULL,
  `DATE_MODIFY` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`ID`, `IDENTIFIANT_ETUD`, `LIBELLE`, `URL`, `DATE_CREATED`, `DATE_MODIFY`) VALUES
(18, 2, 'Site internet', 'asci16.sms-formation.fr', '2022-04-01', '2022-06-01'),
(21, 2, 'test', '', '2022-06-01', NULL),
(22, 2, 'Challenge 1iere année', '', '2022-06-01', '2022-07-01'),
(15, 5, 'Projet Jury', '', '0000-00-00', '0000-00-00'),
(23, 2, 'Challenge 2ieme année', 'https://asci16.sms-formation.fr/Challenge-SLAM-2022/index.php', '2022-08-23', '2022-08-23'),
(24, 7, 'uPgRADE', 'SMS-FORMATION.ORG', '2023-08-30', '2023-11-14'),
(25, 7, 'Test solution logicielle', '', '2023-11-08', '2023-11-08'),
(26, 8, 'test-sms', 'sms-formation.org', '2023-11-08', NULL),
(27, 11, 'Site Web SIO', 'https://mzekri.asci-asso.fr/', '2023-11-15', '2023-11-15'),
(28, 12, 'Jeu de balle', '', '2023-11-15', '2023-11-15'),
(29, 10, 'siteperso', 'rien', '2023-11-15', NULL),
(30, 13, 'site de bus citeline', 'https://lucia-domo.fr/chloe/menu.html', '2023-11-15', '2023-11-15'),
(31, 9, 'Création d\'un site web pour l\'association de Golf de Nancy-Aingeray', 'https://schnelzauer.asci-asso.fr/wordpress/', '2023-11-15', '2023-11-15'),
(32, 10, 'siteperso', 'djelassi.asci-asso.fr', '2023-11-15', '2023-11-15');

-- --------------------------------------------------------

--
-- Structure de la table `savoir`
--

CREATE TABLE `savoir` (
  `N_ITEM` char(32) NOT NULL,
  `ID_ENSEMBLE_COMPETENCE` varchar(32) NOT NULL,
  `LIBEL_ITEM` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `savoir`
--

INSERT INTO `savoir` (`N_ITEM`, `ID_ENSEMBLE_COMPETENCE`, `LIBEL_ITEM`) VALUES
('S1.1.1', 'B1.1', 'Patrimoine informatique : définition, outils de gestion'),
('S1.1.2', 'B1.1', 'Systèmes informatiques'),
('S1.1.3', 'B1.1', 'Système d’exploitation : gestion des utilisateurs, habilitations et droits d’accès'),
('S1.1.4', 'B1.1', 'Disponibilité d’un service informatique : enjeux techniques, économiques et juridiques'),
('S1.1.5', 'B1.1', 'Plans de continuité et de reprise d’activité'),
('S1.1.6', 'B1.1', 'Typologie et techniques de sauvegarde et de restauration'),
('S1.1.7', 'B1.1', 'Typologie des supports de sauvegarde'),
('S1.1.8', 'B1.1', 'Typologie des acteurs de l’industrie informatique'),
('S1.1.9', 'B1.1', 'Normes et standards : enjeux techniques et économiques'),
('S1.1.10', 'B1.1', 'Typologie des licences logicielles, modalités de tarification'),
('S1.1.11', 'B1.1', 'Gestion des actifs informatiques : méthodes, enjeux techniques, financiers, organisationnels et juridiques pour l’organisation'),
('S1.1.12', 'B1.1', 'Contrat de prestation de service informatique et autres contrats liés à la gestion du patrimoine informatique'),
('S1.1.13', 'B1.1', 'Obligations légales en matière de conservation et d’archivage des données'),
('S1.1.14', 'B1.1', 'Charte informatique et sa valeur juridique'),
('S1.1.15', 'B1.1', 'Responsabilités du salarié utilisateur des ressources informatiques'),
('S1.2.1', 'B1.2', 'Outils et méthodes de gestion des incidents'),
('S1.2.2', 'B1.2', 'Méthodologie de repérage de la cause d’un incident, d’une panne'),
('S1.2.3', 'B1.2', 'Base de connaissances d’un centre d’assistance (helpdesk)'),
('S1.2.4', 'B1.2', 'Prise de contrôle d’un poste de travail'),
('S1.2.5', 'B1.2', 'Normes et standards concernant la gestion des configurations et la gestion d’incidents'),
('S1.2.6', 'B1.2', 'Méthodes et outils de diagnostic'),
('S1.2.7', 'B1.2', 'Bases du réseau : modèles de référence, médias d’interconnexion, protocoles de base et services associés, adressage, nommage, routage, principaux composants matériels, notion de périmètres réseau'),
('S1.2.8', 'B1.2', 'Principaux composants matériels des équipements utilisateur et des serveurs'),
('S1.2.9', 'B1.2', 'Système d’exploitation : logiciels des équipements utilisateur et des serveurs, fonctionnalités des systèmes d’exploitation des équipements utilisateur et serveurs, virtualisation'),
('S1.2.10', 'B1.2', 'Bases de la programmation : structures de données et de contrôle, procédures, fonctions, utilisation d’objets'),
('S1.2.11', 'B1.2', 'Langage de commande d’un système d’exploitation : commandes usuelles et script'),
('S1.2.12', 'B1.2', 'Entente de niveau de service et contrat d’assistance : obligations et responsabilités'),
('S1.3.1', 'B1.3', 'Référencement et mesure d’audience d’un service en ligne'),
('S1.3.2', 'B1.3', 'Conventions d’écriture électronique'),
('S1.3.3', 'B1.3', 'Charte graphique'),
('S1.3.4', 'B1.3', 'Bases de la programmation Web : langage de présentation et de mise en forme, langage d’accès aux données, langage de contrôle'),
('S1.3.5', 'B1.3', 'Langage d’interrogation de données'),
('S1.3.6', 'B1.3', 'Système de gestion de contenus : fonctionnalités et paramétrage'),
('S1.3.7', 'B1.3', 'E-réputation d’une organisation : modalités de construction, atteintes, protection juridique et enjeux économiques  '),
('S1.3.8', 'B1.3', 'Responsabilité de l’éditeur et de l’hébergeur du site Web'),
('S1.3.9', 'B1.3', 'Mentions légales et conditions générales d’utilisation d’un site Web  '),
('S1.3.10', 'B1.3', 'Réglementation en matière de collecte, de traitement et de conservation des données à caractère personnel'),
('S1.3.11', 'B1.3', 'Droit d’utilisation des contenus externes'),
('S1.3.12', 'B1.3', 'Nom de domaine : formalisme, organismes d’attribution et de gestion, conflits et résolution'),
('S1.4.1', 'B1.4', 'Planification de projet : approche prédictive et séquentielle, approche agile.'),
('S1.4.2', 'B1.4', 'Outil de gestion de projet : fonctionnalités et paramétrage'),
('S1.5.1', 'B1.5', 'Service informatique : prestations, moyens techniques, rôles des parties prenantes'),
('S1.5.2', 'B1.5', 'Principes d’architecture d\'un service'),
('S1.5.3', 'B1.5', 'Services et protocoles réseaux standard et de base'),
('S1.5.4', 'B1.5', 'Techniques et outils de déploiement des services informatiques'),
('S1.5.5', 'B1.5', 'Techniques et outils de test des services informatiques'),
('S1.6.1', 'B1.6', 'Gestion des relations professionnelles : identité numérique professionnelle, techniques de rédaction de curriculum vitae et de lettre de motivation, présence sur les réseaux sociaux professionnels (outils, atouts et risques)'),
('S1.6.2', 'B1.6', 'Veille informationnelle et curation : sources d’information, stratégies et outils.'),
('S1.6.3', 'B1.6', 'Panorama des métiers de l’informatique'),
('S2.0.1', 'B2.1,B2.2', 'Méthodes, normes et standards associés au processus de conception et de développement d’une solution applicative'),
('S2.0.2', 'B2.1,B2.2', 'Architectures applicatives : concepts de base et typologies'),
('S2.0.3', 'B2.1,B2.2', 'Techniques et outils d’analyse et de rétro-conception Typologie et techniques des cycles de production d’un service et acteurs associés'),
('S2.0.4', 'B2.1,B2.2', 'Composition du coût d’une solution applicative  '),
('S2.0.5', 'B2.1,B2.2', 'Interfaces homme-machine : principes ergonomiques,  techniques de conception, d’évaluation et de validation.'),
('S2.0.6', 'B2.1,B2.2', 'Concepts de la programmation objet : classe, objet, abstraction, interface, héritage, polymorphisme, annotations, patrons de conception, interface de programmation d’applications'),
('S2.0.7', 'B2.1,B2.2', 'Concepts de la programmation événementielle : techniques de gestion des événements et exploitation de bibliothèques de composants graphiques'),
('S2.0.8', 'B2.1,B2.2', 'Programmation au sein d’un cadre applicatif (framework) : structure, outil d’aide au développement et de gestion des dépendances, techniques d’injection des dépendances'),
('S2.0.9', 'B2.1,B2.2', 'Architectures et techniques d’interopérabilité entre applications.'),
('S2.0.10', 'B2.1,B2.2', 'Caractéristiques des formats de données : structurées ou non'),
('S2.0.11', 'B2.1,B2.2', 'Persistance et couche d’accès aux données'),
('S2.0.12', 'B2.1,B2.2', 'Techniques et outils de documentation.'),
('S2.0.13', 'B2.1,B2.2', 'Techniques de gestion des erreurs et des exceptions'),
('S2.0.14', 'B2.1,B2.2', 'Fonctionnalités d’un outil de gestion de projets.'),
('S2.0.15', 'B2.1,B2.2', 'Concepts et techniques de développement agile'),
('S2.0.16', 'B2.1,B2.2', 'Fonctionnalités avancées d’un environnement de développement.'),
('S2.0.17', 'B2.1,B2.2', 'Techniques de gestion de versions  '),
('S2.0.18', 'B2.1,B2.2', 'Techniques et outils d’intégration continue'),
('S2.0.19', 'B2.1,B2.2', 'Techniques et outils de tests et d’intégration de composants logiciels'),
('S2.0.20', 'B2.1,B2.2', 'Contraintes éthiques et environnementales dans la conception d\'une solution applicative'),
('S2.0.21', 'B2.1,B2.2', 'Cahier des charges et ses enjeux juridiques'),
('S2.0.22', 'B2.1,B2.2', 'Contrat de développement et de maintenance applicative (formation, exécution, inexécution) et ses clauses spécifiques'),
('S2.0.23', 'B2.1,B2.2', 'Réglementation en matière de collecte, de traitement et de conservation des données à caractère personnel'),
('S2.0.24', 'B2.1,B2.2', 'Responsabilité civile et pénale du concepteur de solutions applicatives'),
('S2.0.25', 'B2.1,B2.2', 'Protection juridique des productions de solutions applicatives : droit d’auteur, modes de protection indirects et conditions de brevetabilité  '),
('S2.0.26', 'B2.1,B2.2', 'Typologie des licences logicielles et droits des utilisateurs'),
('S2.3.1', 'B2.3', 'Typologie des bases de données'),
('S2.3.2', 'B2.3', 'Caractéristiques des formats de données structurées ou non'),
('S2.3.3', 'B2.3', 'Principaux concepts des systèmes de gestion de bases de données : structure et implémentation des données, architecture et infrastructure de stockage, contrainte d’intégrité, de confidentialité et de sécurité des données, propriétés de cohérence, de disponibilité et de distribution des données.'),
('S2.3.4', 'B2.3', 'Langage de définition des données, des contraintes et de contrôle des données.'),
('S2.3.5', 'B2.3', 'Langage et outils de manipulation et d’interrogation d’une base de données'),
('S2.3.6', 'B2.3', 'Langage d’automatisation des actions dans une base de données'),
('S2.3.7', 'B2.3', 'Techniques et outils avancés intégrés au système de gestion de base de données : transactions, gestion des erreurs, mesure de performances, méthodes et techniques d’optimisation des données et de leur accès, méthodes et techniques de disponibilité et d’intégrité des données.'),
('S2.3.8', 'B2.3', 'Modèles de référence de représentation des données. Méthodes et outils de modélisation des données.'),
('S2.3.9', 'B2.3', 'Réglementation en matière de collecte, de traitement et de conservation des données à caractère personnel.'),
('S2.3.10', 'B2.3', 'Protection juridique des bases de données par le droit d’auteur et le droit du producteur.'),
('S2.3.11', 'B2.3', 'Responsabilité civile et pénale du concepteur de bases de données'),
('S3.0.1', 'B3.1,B3.2,B3.3,B3.4', 'Typologie des risques et leurs impacts.'),
('S3.0.2', 'B3.1,B3.2,B3.3,B3.4', 'Principes de la sécurité : disponibilité, intégrité, confidentialité, preuve.'),
('S3.0.3', 'B3.1,B3.2,B3.3,B3.4', 'Sécurité et sûreté : périmètre respectif.'),
('S3.0.4', 'B3.1,B3.2,B3.3,B3.4', 'Sécurité des terminaux utilisateurs et de leurs données : principes et outils.'),
('S3.0.5', 'B3.1,B3.2,B3.3,B3.4', 'Authentification, privilèges et habilitations des utilisateurs : principes et techniques.'),
('S3.0.6', 'B3.1,B3.2,B3.3,B3.4', 'Gestion des droits d’accès aux données : principes et techniques.'),
('S3.0.7', 'B3.1,B3.2,B3.3,B3.4', 'Sécurité des communications numériques : rôle des protocoles, segmentation, administration, restriction physique et logique.'),
('S3.0.8', 'B3.1,B3.2,B3.3,B3.4', 'Protection et archivage des données : principes et techniques.'),
('S3.0.9', 'B3.1,B3.2,B3.3,B3.4', 'Chiffrement, authentification et preuve : principes et techniques.'),
('S3.0.10', 'B3.1,B3.2,B3.3,B3.4', 'Sécurité des applications Web : risques, menaces et protocoles.'),
('S3.0.11', 'B3.1,B3.2,B3.3,B3.4', 'Outils de contrôle de la sécurité : plans de secours, traçabilité et audit technique.'),
('S3.0.12', 'B3.1,B3.2,B3.3,B3.4', 'Les données à caractère personnel : définition, réglementation, rôle de la CNIL.'),
('S3.0.13', 'B3.1,B3.2,B3.3,B3.4', 'L’identité numérique de l’organisation : risques et protection juridique.'),
('S3.0.14', 'B3.1,B3.2,B3.3,B3.4', 'Droit de la preuve électronique.'),
('S3.0.15', 'B3.1,B3.2,B3.3,B3.4', 'La sécurité des équipements personnels des utilisateurs et de leurs usages : prise en compte des nouvelles modalités de travail, rôle de la charte informatique.'),
('S3.0.16', 'B3.1,B3.2,B3.3,B3.4', 'Les risques des cyberattaques pour l’organisation : économique, juridique, atteinte à l’identité de l’entreprise.'),
('S3.0.17', 'B3.1,B3.2,B3.3,B3.4', 'Obligations légales de notification en cas de faille de sécurité.'),
('S3.0.18', 'B3.1,B3.2,B3.3,B3.4', 'Réglementation en matière de lutte contre la fraude informatique : infractions, sanctions.'),
('S3.0.19', 'B3.1,B3.2,B3.3,B3.4', 'Les organisations de lutte contre la cybercriminalité.'),
('S3.5.1', 'B3.5', 'Développement informatique : méthodes, normes, standards et bonnes pratiques.'),
('S3.5.2', 'B3.5', 'Aspects réglementaires du développement applicatif : protection de la vie privée dès la conception, protection des données par défaut, sécurité par défaut, droit des individus.'),
('S3.5.3', 'B3.5', 'Sécurité du développement d’application : gestion de projet, architectures logicielles, rôle des protocoles, authentification, habilitations et privilèges des utilisateurs, confidentialité des échanges, tests de sécurité, audit de code.'),
('S3.5.4', 'B3.5', 'Vulnérabilités et contre-mesures sur les problèmes courants de développement.'),
('S3.5.5', 'B3.5', 'Environnements de production et de développement : fonctionnalités de sécurité, techniques d’isolation des applicatifs.'),
('S3.5.6', 'B3.5', 'Responsabilité du concepteur de solutions applicatives.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acquerir`
--
ALTER TABLE `acquerir`
  ADD PRIMARY KEY (`IDENTIFIANT_ETUD`,`N_ITEM`),
  ADD KEY `I_FK_ACQUERIR_ETUDIANT` (`IDENTIFIANT_ETUD`),
  ADD KEY `I_FK_ACQUERIR_ITEM_COMPETENCE` (`N_ITEM`);

--
-- Index pour la table `blocs`
--
ALTER TABLE `blocs`
  ADD PRIMARY KEY (`ID_NOM_BLOC`);

--
-- Index pour la table `ensemble_de_competence`
--
ALTER TABLE `ensemble_de_competence`
  ADD PRIMARY KEY (`ID_ENSEMBLE_COMPETENCE`),
  ADD KEY `I_FK_ENSEMBLE_DE_COMPETENCE_BLOCS` (`ID_NOM_BLOC`),
  ADD KEY `I_FK_ENSEMBLE_DE_COMPETENCES_BLOCS` (`LIBEL_ENSEMBLE_COMPETENCE`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`IDENTIFIANT_ETUD`);

--
-- Index pour la table `indicateur`
--
ALTER TABLE `indicateur`
  ADD PRIMARY KEY (`IDENTIFIANT_PROJ`,`N_ITEM`,`IDENTIFIANT_ETUD`),
  ADD KEY `IDENTIFIANT_PROJ` (`IDENTIFIANT_PROJ`),
  ADD KEY `N_ITEM` (`N_ITEM`),
  ADD KEY `IDENTIFIANT_ETUD` (`IDENTIFIANT_ETUD`);

--
-- Index pour la table `item_competence`
--
ALTER TABLE `item_competence`
  ADD PRIMARY KEY (`N_ITEM`),
  ADD KEY `I_FK_ITEM_COMPETENCE_ENSEMBLE_DE_COMPETENCE` (`LIBEL_ENSEMBLE_COMPETENCE`),
  ADD KEY `I_FK_ITEM_COMPETENCES_ENSEMBLE_DE_COMPETENCES` (`LIBEL_ENSEMBLE_COMPETENCE`);

--
-- Index pour la table `item_indicateur`
--
ALTER TABLE `item_indicateur`
  ADD PRIMARY KEY (`N_ITEM`);

--
-- Index pour la table `maitriser`
--
ALTER TABLE `maitriser`
  ADD PRIMARY KEY (`N_ITEM`,`IDENTIFIANT_ETUD`),
  ADD KEY `I_FK_MAITRISER_SAVOIR` (`N_ITEM`),
  ADD KEY `I_FK_MAITRISER_ETUDIANT` (`IDENTIFIANT_ETUD`);

--
-- Index pour la table `mobiliser`
--
ALTER TABLE `mobiliser`
  ADD PRIMARY KEY (`IDENTIFIANT_PROJ`,`N_ITEM`),
  ADD KEY `IDENTIFIANT_PROJ` (`IDENTIFIANT_PROJ`),
  ADD KEY `N_ITEM` (`N_ITEM`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`IDENTIFIANT_ETUD`,`N_ITEM`),
  ADD KEY `I_FK_POSSEDER_ETUDIANT` (`IDENTIFIANT_ETUD`),
  ADD KEY `I_FK_POSSEDER_ITEM_INDICATEUR` (`N_ITEM`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDENTIFIANT_ETUD` (`IDENTIFIANT_ETUD`);

--
-- Index pour la table `savoir`
--
ALTER TABLE `savoir`
  ADD PRIMARY KEY (`N_ITEM`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `IDENTIFIANT_ETUD` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
