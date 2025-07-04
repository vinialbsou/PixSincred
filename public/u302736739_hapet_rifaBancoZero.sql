-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 19/12/2023 às 03:13
-- Versão do servidor: 10.6.15-MariaDB-cll-lve
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u302736739_hapet_rifa`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `auto_messages`
--

CREATE TABLE `auto_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identificador` varchar(191) NOT NULL,
  `descricao` varchar(191) NOT NULL,
  `destinatario` varchar(191) NOT NULL,
  `msg` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `auto_messages`
--

INSERT INTO `auto_messages` (`id`, `identificador`, `descricao`, `destinatario`, `msg`, `created_at`, `updated_at`) VALUES
(1, 'compra-admin', 'Compra Realizada', 'admin', 'Compra Realizada!  Ação: {sorteio} Cliente: {nome} Valor: R$ {total}', '2023-07-26 09:10:02', '2023-07-26 09:10:02'),
(2, 'compra-cliente', 'Compra Realizada', 'cliente', 'Olá *{nome}*, agradecemos a sua participação na ação : *{sorteio}*\r\n\r\n⚠️ ATENÇÃO! ⚠️⚠️ SEU PAGAMENTO ESTA *PENDENTE!*  \r\n\r\nCódigo do pedido: {id} \r\n\r\nValor total: R$ {total} \r\n\r\nPAGUE PELO SITE:\r\n\r\n{link}', '2023-07-26 09:10:02', '2023-08-28 18:27:30'),
(3, 'recebido-admin', 'Pagamento Confirmado', 'admin', 'Pagamento Confirmado  Ação: {sorteio} Cliente: {nome} Valor: R$ {total}', '2023-07-26 09:10:02', '2023-07-26 09:10:02'),
(4, 'recebido-cliente', 'Pagamento Confirmado', 'cliente', 'Tudo certo *{nome}*.  Pagamento confirmado, obrigado e boa sorte!', '2023-07-26 09:10:02', '2023-07-26 09:10:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras_automaticas`
--

CREATE TABLE `compras_automaticas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qtd` int(11) NOT NULL,
  `popular` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulting_environments`
--

CREATE TABLE `consulting_environments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `tema` varchar(191) NOT NULL DEFAULT 'light',
  `facebook` varchar(191) NOT NULL,
  `instagram` varchar(191) NOT NULL,
  `token_api_wpp` varchar(191) DEFAULT NULL,
  `key_pix` varchar(191) NOT NULL,
  `key_pix_public` longtext DEFAULT NULL,
  `paggue_client_secret` varchar(191) DEFAULT NULL,
  `paggue_client_key` varchar(191) DEFAULT NULL,
  `token_asaas` varchar(191) DEFAULT NULL,
  `pixel` longtext DEFAULT NULL,
  `verify_domain_fb` longtext DEFAULT NULL,
  `group_whats` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `consulting_environments`
--

INSERT INTO `consulting_environments` (`id`, `name`, `tema`, `facebook`, `instagram`, `token_api_wpp`, `key_pix`, `key_pix_public`, `paggue_client_secret`, `paggue_client_key`, `token_asaas`, `pixel`, `verify_domain_fb`, `group_whats`, `logo`, `footer`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'chancevaliosa', 'light', '#', '', NULL, 'APP_USR-7220489277866949-021802-e7ca0bcf4c971b14644b9db3cb01ae72-169684606', NULL, NULL, NULL, NULL, NULL, NULL, '', '1702943418.png', 'Marquinhos do paredão resultado pela loteria federal 🍀', 1, NULL, '2023-11-29 22:55:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(191) NOT NULL,
  `telephone` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `cpf` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `drop_participants`
--

CREATE TABLE `drop_participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `telephone` varchar(191) NOT NULL,
  `raffles_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `drop_payment_pix`
--

CREATE TABLE `drop_payment_pix` (
  `id` int(10) UNSIGNED NOT NULL,
  `key_pix` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ganhos_afiliados`
--

CREATE TABLE `ganhos_afiliados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `participante_id` int(10) UNSIGNED DEFAULT NULL,
  `solicitacao_id` int(10) UNSIGNED DEFAULT NULL,
  `afiliado_id` int(10) UNSIGNED DEFAULT NULL,
  `valor` double(8,2) NOT NULL,
  `pago` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2022_02_13_175251_create_products_table', 1),
(4, '2022_02_13_204521_create_raffles_table', 1),
(5, '2022_02_17_141954_create_products_images_table', 1),
(6, '2022_02_17_161330_create_participant_table', 1),
(7, '2022_02_18_012225_create_product_description_table', 1),
(8, '2022_02_19_024705_create_consulting_environments_table', 1),
(9, '2022_02_23_132922_create_messages_table', 1),
(10, '2022_03_04_234043_table_drop_participants_table', 1),
(11, '2022_03_06_201602_create_payment_pix_table', 1),
(12, '2022_03_19_164423_table_column_product_description_table', 1),
(13, '2022_05_15_183244_create_drop_payment_pix_table', 1),
(14, '2022_05_15_223125_create_column_participant_id_drop_participant_table', 1),
(15, '2022_05_18_103947_create_column_subname_products_table', 1),
(16, '2022_05_18_191053_create_column_winner_products_table', 1),
(17, '2022_05_20_185141_create_column_pix_copia_e_cola_payment_pix_table', 1),
(18, '2022_06_13_133444_create_column_visible_products_table', 1),
(19, '2022_06_27_211903_create_column_draw_prediction_products_table', 1),
(20, '2022_08_02_210010_create_column_product_products_table', 1),
(21, '2022_08_02_233232_create_order_table', 1),
(22, '2022_08_03_025849_create_column_slug_products_table', 1),
(23, '2023_01_12_160159_create_column_pixel_consulting_environments_table', 1),
(24, '2023_01_12_160938_create_column_verify_domain_consulting_environments_table', 1),
(25, '2023_01_13_123531_create_column_key_pix_public_consulting_environments_table', 1),
(26, '2023_03_30_160851_create_participant_id_on_raffles', 1),
(27, '2023_03_31_124645_create_promocaos_table', 1),
(28, '2023_04_05_202735_update_products_add_expiracao', 1),
(29, '2023_04_11_105801_add_qtd_ranking', 1),
(30, '2023_04_13_122729_update_products_add_parcial', 1),
(31, '2023_04_17_213126_update_environment_add_footer', 1),
(32, '2023_04_18_104740_create_premios_table', 1),
(33, '2023_04_20_104539_update_participante_add_valor', 1),
(34, '2023_04_24_081311_create_whatsapp_mensagems_table', 1),
(35, '2023_05_03_221447_update_products_add_gateway', 1),
(36, '2023_05_03_222357_update_environment_add_token_assas', 1),
(37, '2023_05_16_085820_update_products_add_zeros', 1),
(38, '2023_05_23_075958_update_profile_add_paggue_credentials', 1),
(39, '2023_05_26_114056_update_promocao_add_porcentagem', 1),
(40, '2023_05_29_091005_update_environment_add_tema', 1),
(41, '2023_05_29_162948_update_premios_add_foto_ganhador', 1),
(42, '2023_06_02_214004_create_videos_table', 1),
(43, '2023_06_03_131425_create_sessions_web_table', 1),
(44, '2023_06_03_211045_update_participante_add_numbers', 1),
(45, '2023_06_23_205332_update_prod_add_numbers', 2),
(46, '2023_06_27_210541_update_users_add_afiliados', 3),
(47, '2023_06_28_193815_udpate_products_add_percent_afiliado', 3),
(48, '2023_06_28_195202_create_rifa_afiliados_table', 3),
(49, '2023_06_28_195423_create_ganhos_afiliados_table', 3),
(50, '2023_07_04_082630_update_participante_add_conferido', 3),
(51, '2023_07_07_141710_update_premio_add_participant', 4),
(52, '2023_07_09_163713_update_ganho_afiliado_add_afiliado_id', 5),
(53, '2023_07_09_165706_create_solicitacao_afiliados_table', 5),
(54, '2023_07_09_170121_update_ganhos_add_solicitacao_id', 5),
(55, '2023_07_25_145450_create_auto_messages_table', 6),
(56, '2023_07_25_152323_update_environment_add_token_api_whats', 6),
(57, '2023_08_04_155407_create_compra_automaticas_table', 7),
(58, '2023_08_11_140318_create_customers_table', 7),
(59, '2023_08_11_140510_update_participantes_add_customer_id', 7),
(60, '2023_08_24_154938_update_participan_add_confirmacao_msg', 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `key_pix` varchar(191) NOT NULL,
  `valor` double(8,2) NOT NULL,
  `participant_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dados` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `participant`
--

CREATE TABLE `participant` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `telephone` varchar(191) NOT NULL,
  `conferido` tinyint(1) NOT NULL DEFAULT 1,
  `msg_pago_enviada` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(191) NOT NULL,
  `cpf` varchar(191) NOT NULL,
  `raffles_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `valor` double(8,2) NOT NULL DEFAULT 0.00,
  `numbers` longtext DEFAULT NULL,
  `pagos` int(11) NOT NULL DEFAULT 0,
  `reservados` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_pix`
--

CREATE TABLE `payment_pix` (
  `id` int(10) UNSIGNED NOT NULL,
  `key_pix` varchar(191) NOT NULL,
  `full_pix` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `premios`
--

CREATE TABLE `premios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `participant_id` int(10) UNSIGNED DEFAULT NULL,
  `ordem` int(11) NOT NULL,
  `descricao` varchar(191) DEFAULT NULL,
  `ganhador` varchar(191) DEFAULT NULL,
  `foto` varchar(191) DEFAULT NULL,
  `telefone` varchar(191) DEFAULT NULL,
  `cota` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subname` varchar(191) DEFAULT NULL,
  `parcial` tinyint(1) NOT NULL DEFAULT 0,
  `expiracao` int(11) NOT NULL DEFAULT 5,
  `qtd_ranking` int(11) NOT NULL DEFAULT 0,
  `qtd_zeros` int(11) DEFAULT NULL,
  `product` varchar(191) DEFAULT NULL,
  `slug` longtext DEFAULT NULL,
  `price` varchar(191) NOT NULL,
  `ganho_afiliado` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL,
  `qtd` int(11) DEFAULT NULL,
  `numbers` longtext DEFAULT NULL,
  `processado` int(11) NOT NULL DEFAULT 0,
  `type_raffles` varchar(191) NOT NULL,
  `favoritar` tinyint(1) NOT NULL,
  `modo_de_jogo` varchar(191) NOT NULL,
  `minimo` int(11) NOT NULL,
  `maximo` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `draw_prediction` datetime DEFAULT NULL,
  `draw_date` datetime DEFAULT NULL,
  `winner` longtext DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `gateway` varchar(191) NOT NULL DEFAULT 'mp',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `products_images`
--

CREATE TABLE `products_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `product_description`
--

CREATE TABLE `product_description` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `video` varchar(191) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `promocoes`
--

CREATE TABLE `promocoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qtdNumeros` int(11) NOT NULL DEFAULT 0,
  `ordem` int(11) NOT NULL,
  `desconto` double(8,2) NOT NULL DEFAULT 0.00,
  `valor` double(8,2) NOT NULL DEFAULT 0.00,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `raffles`
--

CREATE TABLE `raffles` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `participant_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rifa_afiliados`
--

CREATE TABLE `rifa_afiliados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `afiliado_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao_afiliados`
--

CREATE TABLE `solicitacao_afiliados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `afiliado_id` int(10) UNSIGNED DEFAULT NULL,
  `pago` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `telephone` varchar(191) NOT NULL,
  `status` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `afiliado` tinyint(1) NOT NULL DEFAULT 0,
  `pix` varchar(191) DEFAULT NULL,
  `cpf` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `telephone`, `status`, `email`, `password`, `afiliado`, `pix`, `cpf`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'chancevaliosa', '5512997889791', 1, 'ronaldolcarvalho@gmail.com', '$2y$10$pPdo9Zo1Xr3ZUCywilHYseSobml2Ni4TNVGjgJMik/.Fa2I9v6LC.', 0, NULL, NULL, NULL, '2023-06-15 14:55:25', '2023-09-29 20:53:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `link` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `whatsapp_mensagems`
--

CREATE TABLE `whatsapp_mensagems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(191) NOT NULL DEFAULT '',
  `msg` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `whatsapp_mensagems`
--

INSERT INTO `whatsapp_mensagems` (`id`, `titulo`, `msg`, `created_at`, `updated_at`) VALUES
(1, 'Cobrar com link', 'Olá {nome}: agradecemos a sua participação na ação: {sorteio}<br />\r\n<br />\r\n⚠ *ATENÇÃO!* 🚨🚨<br />\r\nSEU PAGAMENTO ESTA *PENDENTE!*<br />\r\n<br />\r\n📢 *AVISO:* Temos tempo de tolerância.<br />\r\n<br />\r\n*Código do pedido:* {id} <br />\r\n<br />\r\n*Status:* PENDENTE<br />\r\n*Valor total:* R$ {total}<br />\r\n<br />\r\n*SUA(s) COTAS(s):* {cotas}<br />\r\n<br />\r\n*PAGUE PELO SITE:* {link}', '2023-06-15 18:53:22', '2023-08-28 18:08:54'),
(2, 'Recibo Pagos', 'Tudo certo {nome}: O primeiro passo você ja deu. Recebemos seu pagamento. Agora é só aguardar o sorteio e torcer para ser o próximo ganhador!!<br />\r\n*SUA(s) COTAS(s):* {cotas}', '2023-06-15 18:53:22', '2023-08-04 15:46:24'),
(3, '', '', '2023-06-15 18:53:22', '2023-11-29 22:55:36'),
(4, '', '', '2023-06-15 18:53:22', '2023-11-29 22:55:36'),
(5, '', '', '2023-06-15 18:53:22', '2023-11-29 22:55:36'),
(6, '', '', '2023-06-15 18:53:22', '2023-11-29 22:55:36');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `auto_messages`
--
ALTER TABLE `auto_messages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `compras_automaticas`
--
ALTER TABLE `compras_automaticas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_automaticas_product_id_foreign` (`product_id`);

--
-- Índices de tabela `consulting_environments`
--
ALTER TABLE `consulting_environments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consulting_environments_user_id_foreign` (`user_id`);

--
-- Índices de tabela `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `drop_participants`
--
ALTER TABLE `drop_participants`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `drop_payment_pix`
--
ALTER TABLE `drop_payment_pix`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ganhos_afiliados`
--
ALTER TABLE `ganhos_afiliados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ganhos_afiliados_product_id_foreign` (`product_id`),
  ADD KEY `ganhos_afiliados_participante_id_foreign` (`participante_id`),
  ADD KEY `ganhos_afiliados_afiliado_id_foreign` (`afiliado_id`);

--
-- Índices de tabela `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_participant_id_foreign` (`participant_id`);

--
-- Índices de tabela `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participant_raffles_id_foreign` (`raffles_id`),
  ADD KEY `participant_product_id_foreign` (`product_id`),
  ADD KEY `participant_customer_id_foreign` (`customer_id`);

--
-- Índices de tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices de tabela `payment_pix`
--
ALTER TABLE `payment_pix`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `premios`
--
ALTER TABLE `premios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `premios_product_id_foreign` (`product_id`),
  ADD KEY `premios_participant_id_foreign` (`participant_id`);

--
-- Índices de tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Índices de tabela `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_images_product_id_foreign` (`product_id`);

--
-- Índices de tabela `product_description`
--
ALTER TABLE `product_description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_description_product_id_foreign` (`product_id`);

--
-- Índices de tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promocoes_product_id_foreign` (`product_id`);

--
-- Índices de tabela `raffles`
--
ALTER TABLE `raffles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raffles_product_id_foreign` (`product_id`),
  ADD KEY `raffles_participant_id_foreign` (`participant_id`);

--
-- Índices de tabela `rifa_afiliados`
--
ALTER TABLE `rifa_afiliados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rifa_afiliados_product_id_foreign` (`product_id`),
  ADD KEY `rifa_afiliados_afiliado_id_foreign` (`afiliado_id`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Índices de tabela `solicitacao_afiliados`
--
ALTER TABLE `solicitacao_afiliados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solicitacao_afiliados_afiliado_id_foreign` (`afiliado_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices de tabela `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `whatsapp_mensagems`
--
ALTER TABLE `whatsapp_mensagems`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `auto_messages`
--
ALTER TABLE `auto_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `compras_automaticas`
--
ALTER TABLE `compras_automaticas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT de tabela `consulting_environments`
--
ALTER TABLE `consulting_environments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de tabela `drop_participants`
--
ALTER TABLE `drop_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `drop_payment_pix`
--
ALTER TABLE `drop_payment_pix`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ganhos_afiliados`
--
ALTER TABLE `ganhos_afiliados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de tabela `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de tabela `payment_pix`
--
ALTER TABLE `payment_pix`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=657;

--
-- AUTO_INCREMENT de tabela `premios`
--
ALTER TABLE `premios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=851;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de tabela `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `product_description`
--
ALTER TABLE `product_description`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de tabela `promocoes`
--
ALTER TABLE `promocoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT de tabela `raffles`
--
ALTER TABLE `raffles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1326;

--
-- AUTO_INCREMENT de tabela `rifa_afiliados`
--
ALTER TABLE `rifa_afiliados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `solicitacao_afiliados`
--
ALTER TABLE `solicitacao_afiliados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `whatsapp_mensagems`
--
ALTER TABLE `whatsapp_mensagems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `compras_automaticas`
--
ALTER TABLE `compras_automaticas`
  ADD CONSTRAINT `compras_automaticas_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `consulting_environments`
--
ALTER TABLE `consulting_environments`
  ADD CONSTRAINT `consulting_environments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `ganhos_afiliados`
--
ALTER TABLE `ganhos_afiliados`
  ADD CONSTRAINT `ganhos_afiliados_afiliado_id_foreign` FOREIGN KEY (`afiliado_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ganhos_afiliados_participante_id_foreign` FOREIGN KEY (`participante_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ganhos_afiliados_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participant_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `participant_raffles_id_foreign` FOREIGN KEY (`raffles_id`) REFERENCES `raffles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `premios`
--
ALTER TABLE `premios`
  ADD CONSTRAINT `premios_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `premios_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `products_images`
--
ALTER TABLE `products_images`
  ADD CONSTRAINT `products_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `product_description`
--
ALTER TABLE `product_description`
  ADD CONSTRAINT `product_description_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `promocoes`
--
ALTER TABLE `promocoes`
  ADD CONSTRAINT `promocoes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `raffles`
--
ALTER TABLE `raffles`
  ADD CONSTRAINT `raffles_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `raffles_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `rifa_afiliados`
--
ALTER TABLE `rifa_afiliados`
  ADD CONSTRAINT `rifa_afiliados_afiliado_id_foreign` FOREIGN KEY (`afiliado_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rifa_afiliados_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `solicitacao_afiliados`
--
ALTER TABLE `solicitacao_afiliados`
  ADD CONSTRAINT `solicitacao_afiliados_afiliado_id_foreign` FOREIGN KEY (`afiliado_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
