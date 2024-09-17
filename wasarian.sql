-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Set-2024 às 13:48
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `wasarian`
--
CREATE DATABASE IF NOT EXISTS `wasarian` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wasarian`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `metas`
--

CREATE TABLE `metas` (
  `id_meta` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `agua_meta` float DEFAULT NULL,
  `agua_consumida` float DEFAULT NULL,
  `caloria_meta` float DEFAULT NULL,
  `caloria_consumida` float DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `metas`
--

INSERT INTO `metas` (`id_meta`, `id_usuario`, `agua_meta`, `agua_consumida`, `caloria_meta`, `caloria_consumida`, `createdAt`, `updatedAt`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, '2024-09-10 22:48:47', '2024-09-10 22:48:47'),
(2, NULL, NULL, 2, NULL, NULL, '2024-09-11 18:48:18', '2024-09-11 18:48:18'),
(3, NULL, NULL, 5, NULL, NULL, '2024-09-12 20:41:41', '2024-09-12 20:41:41'),
(4, NULL, NULL, 1, NULL, NULL, '2024-09-12 20:47:57', '2024-09-12 20:47:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `registro_atividade`
--

CREATE TABLE `registro_atividade` (
  `id_usuario` int(11) DEFAULT NULL,
  `tempo_atv` time DEFAULT NULL,
  `data` date DEFAULT NULL,
  `duracao` time DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `registro_refeicoes`
--

CREATE TABLE `registro_refeicoes` (
  `id_meta` int(11) DEFAULT NULL,
  `tipo_refeicao` varchar(255) DEFAULT NULL,
  `caloria` float DEFAULT NULL,
  `data` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `dt_nasc` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sexo` varchar(15) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `senha`, `dt_nasc`, `email`, `sexo`, `createdAt`, `updatedAt`) VALUES
(1, 'joao lucas', '$2b$10$GXl0c3oxfQ4UpG.jxdyPu.4BP5tflfv2uYA/1Y6P62n.e.mV/lRE.', '2024-09-14', 'a', 'masculino', '2024-09-14 14:05:17', '2024-09-14 14:04:50'),
(2, 'a', '$2b$10$//sxbXRvbJZ7VIjlMJ8nfuVlwgw0LJ0a716BOQnH88VtbtHDWHFcS', '2024-09-14', 'a@a.com', 'masculino', '2024-09-14 14:24:04', '2024-09-14 14:24:04');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id_meta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices para tabela `registro_atividade`
--
ALTER TABLE `registro_atividade`
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices para tabela `registro_refeicoes`
--
ALTER TABLE `registro_refeicoes`
  ADD KEY `id_meta` (`id_meta`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `metas`
--
ALTER TABLE `metas`
  MODIFY `id_meta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `metas`
--
ALTER TABLE `metas`
  ADD CONSTRAINT `metas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `registro_atividade`
--
ALTER TABLE `registro_atividade`
  ADD CONSTRAINT `registro_atividade_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `registro_refeicoes`
--
ALTER TABLE `registro_refeicoes`
  ADD CONSTRAINT `registro_refeicoes_ibfk_1` FOREIGN KEY (`id_meta`) REFERENCES `metas` (`id_meta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
