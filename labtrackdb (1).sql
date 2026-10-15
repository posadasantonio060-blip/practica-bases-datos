-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2026 a las 02:13:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `labtrackdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `carrera` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_alumno`, `nombre`, `matricula`, `carrera`) VALUES
(1, 'Juan Perez', '2026001', 'Sistemas Computacionales'),
(2, 'Maria Lopez', '2026002', 'Ingenieria Industrial'),
(3, 'Carlos Ramirez', '2026003', 'Sistemas Computacionales'),
(4, 'Ana Torres', '2026004', 'Administracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_lab`
--

CREATE TABLE `equipo_lab` (
  `id_equipo` int(11) NOT NULL,
  `num_inventario` varchar(30) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(80) DEFAULT NULL,
  `estado` varchar(30) DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equipo_lab`
--

INSERT INTO `equipo_lab` (`id_equipo`, `num_inventario`, `tipo`, `marca`, `modelo`, `estado`) VALUES
(1, 'LAB-001', 'Laptop', 'Dell', 'Latitude 5420', 'Disponible'),
(2, 'LAB-002', 'Desktop', 'HP', 'ProDesk 400', 'Disponible'),
(3, 'LAB-003', 'Laptop', 'Lenovo', 'ThinkPad X1', 'Disponible'),
(4, 'LAB-004', 'Proyector', 'Epson', 'PowerLite X49', 'Disponible'),
(5, 'LAB-005', 'Laptop', 'Apple', 'MacBook Pro', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT 0.00,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`id_mantenimiento`, `fecha`, `descripcion`, `costo`, `id_equipo`) VALUES
(1, '2026-09-15', 'Limpieza general y revision', 150.00, 1),
(2, '2026-09-20', 'Cambio de teclado', 350.00, 2),
(3, '2026-10-02', 'Actualizacion de software', 0.00, 3),
(4, '2026-10-08', 'Revision de proyector', 200.00, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `fecha_prestamo`, `fecha_devolucion`, `id_equipo`, `id_alumno`) VALUES
(1, '2026-10-01', '2026-10-03', 1, 1),
(2, '2026-10-04', '2026-10-06', 2, 2),
(3, '2026-10-07', NULL, 3, 3),
(4, '2026-10-09', NULL, 4, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Indices de la tabla `equipo_lab`
--
ALTER TABLE `equipo_lab`
  ADD PRIMARY KEY (`id_equipo`),
  ADD UNIQUE KEY `num_inventario` (`num_inventario`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_alumno` (`id_alumno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `equipo_lab`
--
ALTER TABLE `equipo_lab`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo_lab` (`id_equipo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo_lab` (`id_equipo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
