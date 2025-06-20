-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2025 a las 09:09:47
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
-- Base de datos: `amor_natural`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jabones`
--

CREATE TABLE `jabones` (
  `id_jabon` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jabones`
--

INSERT INTO `jabones` (`id_jabon`, `nombre`, `descripcion`, `precio`, `stock`) VALUES
(1, 'Lavanda Relajante', 'Jabón artesanal con extracto de lavanda para calmar y relajar la piel.', 45.00, 20),
(2, 'Menta Refrescante', 'Jabón natural con aceite esencial de menta, ideal para piel grasa.', 40.00, 15),
(3, 'Cítricos Energizantes', 'Jabón con aroma de naranja y limón, proporciona energía y frescura.', 42.00, 25),
(4, 'Carbón Activado Detox', 'Limpieza profunda con carbón activado, elimina impurezas.', 50.00, 6),
(5, 'Avena y Miel', 'Jabón suave para piel sensible con propiedades nutritivas.', 38.00, 22),
(6, 'Rosa Mosqueta', 'Regenerador natural con extracto de rosa mosqueta para piel seca.', 55.00, 12),
(7, 'Aloe Vera Hidratante', 'Hidratación profunda con aloe vera puro.', 44.00, 17),
(8, 'Coco Tropical', 'Jabón con aceite de coco natural, aroma exótico y relajante.', 46.00, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id_orden` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_jabon` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id_orden`, `id_usuario`, `id_jabon`, `cantidad`, `fecha`) VALUES
(1, 1, 4, 12, '2025-06-19 01:04:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `correo`, `contraseña`) VALUES
(1, 'montes.eduardo.cb37@gmail.com', '$2y$10$8pTkG1FQmRPJCvuxO/94LecQo5bQf1uluzmKsccqkNPBjejEcnp5O');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `jabones`
--
ALTER TABLE `jabones`
  ADD PRIMARY KEY (`id_jabon`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_jabon` (`id_jabon`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `jabones`
--
ALTER TABLE `jabones`
  MODIFY `id_jabon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`id_jabon`) REFERENCES `jabones` (`id_jabon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
