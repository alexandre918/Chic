-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.4.13-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para db_filmes
CREATE DATABASE IF NOT EXISTS `db_filmes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_filmes`;

-- Copiando estrutura para tabela db_filmes.filme
CREATE TABLE IF NOT EXISTS `filme` (
  `idfilme` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sinopse` text DEFAULT NULL,
  `foto` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`idfilme`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela db_filmes.filme: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
REPLACE INTO `filme` (`idfilme`, `nome`, `sinopse`, `foto`) VALUES
	(1, 'Batman o retorno', '<p>\n	Uma sinopse do filme.</p>\n', '009f5-batman.jpg');
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;

-- Copiando estrutura para tabela db_filmes.genero
CREATE TABLE IF NOT EXISTS `genero` (
  `idgenero` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela db_filmes.genero: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
REPLACE INTO `genero` (`idgenero`, `nome`) VALUES
	(1, 'Suspense'),
	(2, 'Comédia'),
	(3, 'Terror'),
	(4, 'Aventura');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;

-- Copiando estrutura para tabela db_filmes.genero_has_filme
CREATE TABLE IF NOT EXISTS `genero_has_filme` (
  `genero_idgenero` int(11) NOT NULL,
  `filme_idfilme` int(11) NOT NULL,
  PRIMARY KEY (`genero_idgenero`,`filme_idfilme`),
  KEY `fk_genero_has_filme_filme1_idx` (`filme_idfilme`),
  KEY `fk_genero_has_filme_genero_idx` (`genero_idgenero`),
  CONSTRAINT `fk_genero_has_filme_filme1` FOREIGN KEY (`filme_idfilme`) REFERENCES `filme` (`idfilme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_genero_has_filme_genero` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela db_filmes.genero_has_filme: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `genero_has_filme` DISABLE KEYS */;
/*!40000 ALTER TABLE `genero_has_filme` ENABLE KEYS */;

-- Copiando estrutura para tabela db_filmes.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela db_filmes.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` (`idusuario`, `login`, `senha`) VALUES
	(1, 'admin', '1234'),
	(2, 'ivan.pereira', 'abc000');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
