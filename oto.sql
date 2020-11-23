-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 23 nov. 2020 à 10:58
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `oto`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `num_commande` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_employe` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  PRIMARY KEY (`num_commande`),
  KEY `id_client` (`id_client`),
  KEY `id_employe` (`id_employe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id_employe` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_employe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ligne_de_commande`
--

DROP TABLE IF EXISTS `ligne_de_commande`;
CREATE TABLE IF NOT EXISTS `ligne_de_commande` (
  `id_vehicule` int(11) DEFAULT NULL,
  `num_commande` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `quantité` int(11) DEFAULT NULL,
  `prixHt` int(11) DEFAULT NULL,
  `tauxTva` int(11) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  KEY `id_vehicule` (`id_vehicule`),
  KEY `num_commande` (`num_commande`),
  KEY `id_service` (`id_service`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id_marque` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
  `id_model` int(11) NOT NULL,
  `id_marque` int(11) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `carburant` varchar(50) DEFAULT NULL,
  `chevaux_fiscaux` int(5) DEFAULT NULL,
  `categorie` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_model`),
  KEY `id_marque` (`id_marque`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id_service` int(11) NOT NULL,
  `moteur` varchar(50) DEFAULT NULL,
  `suspension` varchar(50) DEFAULT NULL,
  `frein` varchar(50) DEFAULT NULL,
  `prix` int(10) DEFAULT NULL,
  `date_service` datetime DEFAULT NULL,
  `electronique` varchar(50) DEFAULT NULL,
  `pose_accesoires` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `id_vehicule` int(11) NOT NULL,
  `id_model` int(11) DEFAULT NULL,
  `nbre_porte` int(11) DEFAULT NULL,
  `couleur` varchar(30) DEFAULT NULL,
  `occasion` int(11) DEFAULT NULL,
  `neuf` int(11) DEFAULT NULL,
  `année` datetime DEFAULT NULL,
  PRIMARY KEY (`id_vehicule`),
  KEY `id_model` (`id_model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
