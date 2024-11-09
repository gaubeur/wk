-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.40 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para wk
CREATE DATABASE IF NOT EXISTS `wk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wk`;

-- Copiando estrutura para tabela wk.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `cli_codigo` int NOT NULL,
  `cli_nome` varchar(255) NOT NULL,
  `cli_cidade` varchar(255) DEFAULT NULL,
  `cli_uf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cli_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wk.clientes: ~0 rows (aproximadamente)
INSERT INTO `clientes` (`cli_codigo`, `cli_nome`, `cli_cidade`, `cli_uf`) VALUES
	(1, 'Nome do Cliente', 'Cidade', 'UF'),
	(2, 'Nome do Cliente', 'Cidade', 'UF'),
	(3, 'Nome do Cliente', 'Cidade', 'UF'),
	(4, 'Nome do Cliente', 'Cidade', 'UF'),
	(5, 'Nome do Cliente', 'Cidade', 'UF'),
	(6, 'Nome do Cliente', 'Cidade', 'UF'),
	(7, 'Nome do Cliente', 'Cidade', 'UF'),
	(8, 'Nome do Cliente', 'Cidade', 'UF'),
	(9, 'Nome do Cliente', 'Cidade', 'UF'),
	(10, 'Nome do Cliente', 'Cidade', 'UF'),
	(11, 'Nome do Cliente', 'Cidade', 'UF'),
	(12, 'Nome do Cliente', 'Cidade', 'UF'),
	(13, 'Nome do Cliente', 'Cidade', 'UF'),
	(14, 'Nome do Cliente', 'Cidade', 'UF'),
	(15, 'Nome do Cliente', 'Cidade', 'UF'),
	(16, 'Nome do Cliente', 'Cidade', 'UF'),
	(17, 'Nome do Cliente', 'Cidade', 'UF'),
	(18, 'Nome do Cliente', 'Cidade', 'UF'),
	(19, 'Nome do Cliente', 'Cidade', 'UF'),
	(20, 'Nome do Cliente', 'Cidade', 'UF'),
	(21, 'Nome do Cliente', 'Cidade', 'UF'),
	(22, 'Nome do Cliente', 'Cidade', 'UF'),
	(23, 'Nome do Cliente', 'Cidade', 'UF'),
	(24, 'Nome do Cliente', 'Cidade', 'UF'),
	(25, 'Nome do Cliente', 'Cidade', 'UF'),
	(26, 'Nome do Cliente', 'Cidade', 'UF'),
	(27, 'Nome do Cliente', 'Cidade', 'UF'),
	(28, 'Nome do Cliente', 'Cidade', 'UF'),
	(29, 'Nome do Cliente', 'Cidade', 'UF'),
	(30, 'Nome do Cliente', 'Cidade', 'UF'),
	(31, 'Nome do Cliente', 'Cidade', 'UF'),
	(32, 'Nome do Cliente', 'Cidade', 'UF'),
	(33, 'Nome do Cliente', 'Cidade', 'UF'),
	(34, 'Nome do Cliente', 'Cidade', 'UF'),
	(35, 'Nome do Cliente', 'Cidade', 'UF'),
	(36, 'Nome do Cliente', 'Cidade', 'UF'),
	(37, 'Nome do Cliente', 'Cidade', 'UF'),
	(38, 'Nome do Cliente', 'Cidade', 'UF'),
	(39, 'Nome do Cliente', 'Cidade', 'UF'),
	(40, 'Nome do Cliente', 'Cidade', 'UF'),
	(41, 'Nome do Cliente', 'Cidade', 'UF'),
	(42, 'Nome do Cliente', 'Cidade', 'UF'),
	(43, 'Nome do Cliente', 'Cidade', 'UF'),
	(44, 'Nome do Cliente', 'Cidade', 'UF'),
	(45, 'Nome do Cliente', 'Cidade', 'UF'),
	(46, 'Nome do Cliente', 'Cidade', 'UF'),
	(47, 'Nome do Cliente', 'Cidade', 'UF'),
	(48, 'Nome do Cliente', 'Cidade', 'UF'),
	(49, 'Nome do Cliente', 'Cidade', 'UF'),
	(50, 'Nome do Cliente', 'Cidade', 'UF');

-- Copiando estrutura para tabela wk.pedidosdadosgerais
CREATE TABLE IF NOT EXISTS `pedidosdadosgerais` (
  `ped_codigo` int NOT NULL AUTO_INCREMENT,
  `ped_dataemissao` date NOT NULL,
  `ped_clicodigo` int NOT NULL,
  `ped_vlrtotal` float NOT NULL,
  PRIMARY KEY (`ped_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wk.pedidosdadosgerais: ~0 rows (aproximadamente)
INSERT INTO `pedidosdadosgerais` (`ped_codigo`, `ped_dataemissao`, `ped_clicodigo`, `ped_vlrtotal`) VALUES
	(1, '2024-11-09', 1, 10),
	(2, '2024-11-09', 1, 20);

-- Copiando estrutura para tabela wk.pedidosprodutos
CREATE TABLE IF NOT EXISTS `pedidosprodutos` (
  `pedprod_codigo` int NOT NULL AUTO_INCREMENT,
  `pedprod_pedcodigo` int NOT NULL,
  `pedprod_prdcodigo` int NOT NULL,
  `pedprod_quantidade` float NOT NULL,
  `pedprod_vlrunitario` float NOT NULL,
  `pedprod_vlrtotal` float NOT NULL,
  PRIMARY KEY (`pedprod_codigo`),
  KEY `fk_pedidos` (`pedprod_pedcodigo`),
  CONSTRAINT `fk_pedidos` FOREIGN KEY (`pedprod_pedcodigo`) REFERENCES `pedidosdadosgerais` (`ped_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wk.pedidosprodutos: ~0 rows (aproximadamente)
INSERT INTO `pedidosprodutos` (`pedprod_codigo`, `pedprod_pedcodigo`, `pedprod_prdcodigo`, `pedprod_quantidade`, `pedprod_vlrunitario`, `pedprod_vlrtotal`) VALUES
	(1, 1, 1, 1, 10, 10),
	(2, 2, 1, 1, 20, 20);

-- Copiando estrutura para tabela wk.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `prd_codigo` int NOT NULL,
  `prd_descricao` varchar(255) NOT NULL,
  `prd_precovenda` float DEFAULT NULL,
  PRIMARY KEY (`prd_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wk.produtos: ~50 rows (aproximadamente)
INSERT INTO `produtos` (`prd_codigo`, `prd_descricao`, `prd_precovenda`) VALUES
	(1, 'Nome do Produto', 1),
	(2, 'Nome do Produto', 2),
	(3, 'Nome do Produto', 3),
	(4, 'Nome do Produto', 4),
	(5, 'Nome do Produto', 5),
	(6, 'Nome do Produto', 6),
	(7, 'Nome do Produto', 7),
	(8, 'Nome do Produto', 8),
	(9, 'Nome do Produto', 9),
	(10, 'Nome do Produto', 10),
	(11, 'Nome do Produto', 11),
	(12, 'Nome do Produto', 12),
	(13, 'Nome do Produto', 13),
	(14, 'Nome do Produto', 14),
	(15, 'Nome do Produto', 15),
	(16, 'Nome do Produto', 16),
	(17, 'Nome do Produto', 17),
	(18, 'Nome do Produto', 18),
	(19, 'Nome do Produto', 19),
	(20, 'Nome do Produto', 20),
	(21, 'Nome do Produto', 21),
	(22, 'Nome do Produto', 22),
	(23, 'Nome do Produto', 23),
	(24, 'Nome do Produto', 24),
	(25, 'Nome do Produto', 25),
	(26, 'Nome do Produto', 26),
	(27, 'Nome do Produto', 27),
	(28, 'Nome do Produto', 28),
	(29, 'Nome do Produto', 29),
	(30, 'Nome do Produto', 30),
	(31, 'Nome do Produto', 31),
	(32, 'Nome do Produto', 32),
	(33, 'Nome do Produto', 33),
	(34, 'Nome do Produto', 34),
	(35, 'Nome do Produto', 35),
	(36, 'Nome do Produto', 36),
	(37, 'Nome do Produto', 37),
	(38, 'Nome do Produto', 38),
	(39, 'Nome do Produto', 39),
	(40, 'Nome do Produto', 40),
	(41, 'Nome do Produto', 41),
	(42, 'Nome do Produto', 42),
	(43, 'Nome do Produto', 43),
	(44, 'Nome do Produto', 44),
	(45, 'Nome do Produto', 45),
	(46, 'Nome do Produto', 46),
	(47, 'Nome do Produto', 47),
	(48, 'Nome do Produto', 48),
	(49, 'Nome do Produto', 49),
	(50, 'Nome do Produto', 50);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
