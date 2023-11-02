-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 02 nov. 2023 à 19:30
-- Version du serveur : 5.7.39
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `thriftology`
--

-- --------------------------------------------------------

--
-- Structure de la table `Categories`
--

CREATE TABLE `Categories` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Categories`
--

INSERT INTO `Categories` (`ID`, `Nom`) VALUES
(1, 'Vêtements pour hommes'),
(2, 'Vêtements pour femmes'),
(3, 'Accessoires'),
(4, 'Chaussures'),
(5, 'Vêtements décontractés'),
(6, 'Vêtements de soirée');

-- --------------------------------------------------------

--
-- Structure de la table `Transactions`
--

CREATE TABLE `Transactions` (
  `ID` int(11) NOT NULL,
  `ID_Acheteur` int(11) DEFAULT NULL,
  `ID_Vetement` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `MotDePasse` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`ID`, `Nom`, `Email`, `MotDePasse`) VALUES
(1, 'PickleLover', 'picklelover@example.com', 'password123'),
(2, 'CatWhisperer', 'catwhisperer@example.com', 'password123'),
(3, 'CoffeeAddict', 'coffeeaddict@example.com', 'password123'),
(4, 'GamerGuru', 'gamerguru@example.com', 'password123'),
(5, 'SciFiGeek', 'scifigeek@email.com', 'starwars'),
(6, 'Fashionista', 'fashionista@email.com', 'trendy2023');

-- --------------------------------------------------------

--
-- Structure de la table `Vendeurs`
--

CREATE TABLE `Vendeurs` (
  `ID` int(11) NOT NULL,
  `NoteVendeur` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Vendeurs`
--

INSERT INTO `Vendeurs` (`ID`, `NoteVendeur`) VALUES
(2, 4.5),
(3, 3.8),
(4, 4.9),
(5, 4.2);

-- --------------------------------------------------------

--
-- Structure de la table `Vetements`
--

CREATE TABLE `Vetements` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Description` text,
  `Prix` float DEFAULT NULL,
  `ID_Vendeur` int(11) DEFAULT NULL,
  `ID_Categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Vetements`
--

INSERT INTO `Vetements` (`ID`, `Nom`, `Description`, `Prix`, `ID_Vendeur`, `ID_Categorie`) VALUES
(3, 'Chapeau de Cowboy', 'Rose poilu', 55, 4, NULL),
(4, 'Robe de Soirée', 'Une robe élégante pour les occasions spéciales.', 120, 3, NULL),
(5, 'T-shirt Geek', 'Un T-shirt avec des références geek.', 22, 4, NULL),
(6, 'Sweat à Capuche', 'Confortable et décontracté.', 45, 4, NULL),
(7, 'Chaussures de Sport', 'Pour le jogging ou la salle de sport.', 65, 5, NULL),
(8, 'Sac à Main', 'Un sac à main en cuir véritable.', 80, 5, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Acheteur` (`ID_Acheteur`),
  ADD KEY `ID_Vetement` (`ID_Vetement`);

--
-- Index pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `Vendeurs`
--
ALTER TABLE `Vendeurs`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `Vetements`
--
ALTER TABLE `Vetements`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Vendeur` (`ID_Vendeur`),
  ADD KEY `ID_Categorie` (`ID_Categorie`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Transactions`
--
ALTER TABLE `Transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Vetements`
--
ALTER TABLE `Vetements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Transactions`
--
ALTER TABLE `Transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`ID_Acheteur`) REFERENCES `Utilisateurs` (`ID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`ID_Vetement`) REFERENCES `Vetements` (`ID`);

--
-- Contraintes pour la table `Vendeurs`
--
ALTER TABLE `Vendeurs`
  ADD CONSTRAINT `vendeurs_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `Utilisateurs` (`ID`);

--
-- Contraintes pour la table `Vetements`
--
ALTER TABLE `Vetements`
  ADD CONSTRAINT `vetements_ibfk_1` FOREIGN KEY (`ID_Vendeur`) REFERENCES `Vendeurs` (`ID`),
  ADD CONSTRAINT `vetements_ibfk_2` FOREIGN KEY (`ID_Categorie`) REFERENCES `Categories` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
