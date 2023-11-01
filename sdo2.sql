-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 01 2023 г., 07:53
-- Версия сервера: 5.5.62
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sdo2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `login`, `password`) VALUES
(1, 'admin', 'P@ssw0rd');

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name_materials` varchar(255) NOT NULL,
  `materials` text NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id`, `name_materials`, `materials`, `role`) VALUES
(2, 'Биология', 'Biology', 'student'),
(3, 'Физика', 'Physics', 'student'),
(4, 'Химия', 'Chemistry', 'student'),
(5, 'Русский язык', 'Russian', 'student'),
(6, 'Математика', 'Mathematics', 'student');

-- --------------------------------------------------------

--
-- Структура таблицы `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `options`
--

INSERT INTO `options` (`id`, `item`, `class`, `options`) VALUES
(1, 'Russian', '5', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `pod_materials`
--

CREATE TABLE `pod_materials` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `pod_materials`
--

INSERT INTO `pod_materials` (`id`, `item`, `class`) VALUES
(78, 'Mathematics', '5'),
(79, 'Mathematics', '6'),
(80, 'Mathematics', '7'),
(81, 'Mathematics', '8'),
(82, 'Mathematics', '10'),
(86, 'Russian', '5'),
(87, 'Russian', '6'),
(88, 'Russian', '7'),
(89, 'Russian', '8'),
(90, 'Russian', '10'),
(93, 'Physics', '7'),
(94, 'Physics', '8'),
(95, 'Physics', '10'),
(96, 'Biology', '5'),
(97, 'Biology', '6'),
(98, 'Biology', '7'),
(99, 'Biology', '8'),
(100, 'Biology', '10'),
(101, 'Chemistry', '8'),
(102, 'Chemistry', '10');

-- --------------------------------------------------------

--
-- Структура таблицы `quest`
--

CREATE TABLE `quest` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `class` int(11) NOT NULL,
  `options` varchar(255) NOT NULL,
  `quest` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `quest`
--

INSERT INTO `quest` (`id`, `item`, `class`, `options`, `quest`, `answer`) VALUES
(9, 'Russian', 5, '2', '673354266420137750-card_icon.png', '2'),
(10, 'Mathematics', 5, '', '670146641361278606-card_icon2.png', '2'),
(11, 'Mathematics', 5, '', '565616377626935627-icon4.png', '3'),
(12, 'Mathematics', 5, '', '673354266420137750-card_icon.png', '2'),
(13, 'Mathematics', 5, '', '670146641361278606-card_icon2.png', '2'),
(14, 'Mathematics', 5, '', '565616377626935627-icon4.png', '3'),
(15, 'Mathematics', 5, '', '673354266420137750-card_icon.png', '2'),
(16, 'Mathematics', 5, '', '670146641361278606-card_icon2.png', '2'),
(17, 'Mathematics', 5, '', '565616377626935627-icon4.png', '3'),
(18, 'Mathematics', 5, '', '673354266420137750-card_icon.png', '2'),
(19, 'Mathematics', 5, '', '670146641361278606-card_icon2.png', '2'),
(20, 'Mathematics', 5, '', '670146641361278606-card_icon2.png', '2'),
(21, 'Mathematics', 5, '', '565616377626935627-icon4.png', '3'),
(22, 'Mathematics', 5, '', '673354266420137750-card_icon.png', '2'),
(23, 'Mathematics', 5, '', '670146641361278606-card_icon2.png', '2'),
(24, 'Russian', 5, '2', '53870368387034063-card_icon.png', '2');

-- --------------------------------------------------------

--
-- Структура таблицы `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `answer` longtext NOT NULL,
  `ball` varchar(255) NOT NULL,
  `mynicipal` varchar(255) NOT NULL,
  `school` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `result`
--

INSERT INTO `result` (`id`, `code`, `answer`, `ball`, `mynicipal`, `school`, `class`, `number`) VALUES
(14, 'd62924589957', '[1,1,0]', '2', 'Управление образованием администрации МО \"город Бугуруслан\"', '54', '3б', '3'),
(15, 'd62924589957', '[1,1,0]', '2', 'Оренбург', '54', '3б', '2'),
(16, 'd62924589957', '[1,1,0]', '2', 'Оренбург', '54', '3б', '1'),
(17, 'd32793953449', '[0,0,0]', '0', 'Оренбург', '54', '3б', '3'),
(18, 'd31803124299', '[0,0,0]', '0', 'Управление образованием администрации МО \"город Бугуруслан\"', 'МБОУ Лицей № 1', '10а', '1'),
(20, 'd57563996052', '[]', '0', 'Управление образованием администрации МО \"город Бугуруслан\"', 'МБОУ Лицей № 1', '10а', '1'),
(21, 'd40570347819', '[0,0,0]', '0', 'Управление образованием администрации МО \"город Бугуруслан\"', 'МБОУ Лицей № 1', '10а', '1'),
(22, 'd30943470278', '[1,1,0]', '2', 'Управление образованием администрации МО \"город Бугуруслан\"', 'МБОУ Лицей № 1', '10а', '1'),
(23, 'd34072527224', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', '0', 'Оренбург', '54', '3б', '3'),
(24, 'd45513496035', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', '0', 'Оренбург', '54', '3б', '3'),
(25, 'd61358702418', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', '0', 'Оренбург', '54', '3б', '3'),
(26, 'd56103733183', '[0]', '0', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mynicipal` varchar(255) NOT NULL,
  `school` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'student'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `mynicipal`, `school`, `class`, `number`, `role`) VALUES
(26, 'test', 'test', 'Оренбург', '54', '3б', '3', ''),
(27, 'a858234584', 'NjI0MTQ1NDc=', 'Управление образованием администрации МО \"город Бугуруслан\"', 'МБОУ Лицей № 1', '10а', '1', ''),
(446277, '123123', '123123', '', '', '', '', 'student');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pod_materials`
--
ALTER TABLE `pod_materials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `quest`
--
ALTER TABLE `quest`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `pod_materials`
--
ALTER TABLE `pod_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT для таблицы `quest`
--
ALTER TABLE `quest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446278;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
