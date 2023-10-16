-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 16 2023 г., 21:49
-- Версия сервера: 5.5.62
-- Версия PHP: 7.1.33

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
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name_materials` varchar(255) NOT NULL,
  `materials` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id`, `name_materials`, `materials`) VALUES
(1, 'Зарница', 'Zarnitsa'),
(2, 'Биология', 'Biology'),
(3, 'Физика', 'Physics'),
(4, 'Химия', 'Chemistry'),
(5, 'Русский язык', 'Russian'),
(6, 'Математика', 'Mathematics');

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
(78, 'Mathematics', '5');

-- --------------------------------------------------------

--
-- Структура таблицы `quest`
--

CREATE TABLE `quest` (
  `id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `class` int(11) NOT NULL,
  `quest` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `quest`
--

INSERT INTO `quest` (`id`, `item`, `class`, `quest`, `answer`) VALUES
(1, 'Mathematics', 5, 'https://puzzleit.ru/files/puzzles/203/202512/_original.jpg', '2'),
(2, 'Mathematics', 5, 'https://i.pinimg.com/originals/4d/19/e8/4d19e85cb8f19e1aa9c4f21bed32070a.jpg', '1'),
(3, 'Mathematics', 6, 'https://i.pinimg.com/originals/4d/19/e8/4d19e85cb8f19e1aa9c4f21bed32070a.jpg', '1'),
(4, 'Mathematics', 5, 'https://i.pinimg.com/originals/4d/19/e8/4d19e85cb8f19e1aa9c4f21bed32070a.jpg', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `answer` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `result`
--

INSERT INTO `result` (`id`, `code`, `answer`) VALUES
(1, 'd15311891323', '[1,1]'),
(2, 'd58715744419', '[1,0]'),
(3, 'd19997586505', '[1,0]'),
(4, 'd79259902960', '[1,0,0]'),
(5, 'd88377819879', '[0,0,0]');

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
  `number` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `mynicipal`, `school`, `class`, `number`) VALUES
(26, 'test', 'test', 'Оренубрг', '54', '3б', '3');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
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
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `pod_materials`
--
ALTER TABLE `pod_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT для таблицы `quest`
--
ALTER TABLE `quest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
