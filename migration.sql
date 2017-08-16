-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 18 2017 г., 21:03
-- Версия сервера: 5.5.53
-- Версия PHP: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `angular_test`
--

CREATE DATABASE angular_test;

USE angular_test;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(30) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `status` enum('active','inactive','','') NOT NULL DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `status`) VALUES
(1, 'Denis Konin', '123password', 'konyaka@gmail.com', 'active'),
(2, 'Max Mironenko', 'kukareku12813', 'max.mironenko3@gmail.com', 'inactive'),
(3, 'Kolya Maiba', 'MaibaBazarvr', 'MaibaBazarvr@gmail.com', 'active'),
(4, 'Denis Natalin', 'kljhlk123jhlkj', 'denchik@mail.ru', 'active'),
(5, 'Valera Pidmogiloy', 'PidmogiloyValerchik', 'Pidmogiloy@gmail.com', 'inactive'),
(6, 'Alina Kobila', 'Alina12813', 'Kobila@gmail.com', 'inactive'),
(7, 'Ulia Vasilchuk', 'Vasilchukuliaha', 'Vasilchuk@gmail.com', 'active'),
(8, 'Abdu Al', 'Abdu12813', 'Abdu@gmail.com', 'inactive'),
(9, 'Vlad Shira', 'terminator1488', 'terminator1488@mail.ru', 'inactive'),
(10, 'Natasha Sergeieva', 'Sergeieva666', 'Sergeieva@gmail.com', 'inactive'),
(13, 'Kuzin Sima', '123456789', 'simon@mail.ua', 'active'),
(14, 'Natalia Torgonskaya', 'Nataliaadadada', 'Nataliakaya@kukaru.com', 'active'),
(16, 'Nick Gupal', 'gumanoid1342', 'nickgup@gmail.com', 'inactive');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
