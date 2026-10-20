-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2026 a las 02:37:32
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
-- Base de datos: `brandon_urban`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(26, 'Camisetas', 'Camisetas para hombre y mujer, básicas, estampadas y personalizadas'),
(27, 'Pantalones', 'Jeans, pantalones casuales, joggers y pantalones formales'),
(28, 'Zapatos', 'Calzado deportivo, casual y formal para todas las edades'),
(29, 'Gorras', 'Gorras deportivas, urbanas y estampadas'),
(30, 'Accesorios', 'Cinturones, gafas, bufandas y complementos de moda'),
(31, 'Chaquetas', 'Chaquetas, abrigos y prendas para clima frío'),
(32, 'Vestidos y Faldas', 'Vestidos y faldas casuales, elegantes y para ocasiones especiales'),
(33, 'Ropa Deportiva', 'Conjuntos deportivos y prendas para entrenar'),
(34, 'Bolsos y Mochilas', 'Bolsos, carteras y mochilas para diferentes ocasiones'),
(35, 'Ropa Infantil', 'Prendas de vestir para bebés, niños y niñas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` enum('Pendiente','Completada','Cancelada') NOT NULL DEFAULT 'Pendiente',
  `id_proveedor` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_compra`, `fecha`, `estado`, `id_proveedor`, `id_empleado`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`, `total`) VALUES
(2, '2026-09-29', '', 3, 3, 4, 1, 40000.00, 40000.00, 40000.00),
(3, '2026-10-01', '', 2, 5, 1, 1, 5000.00, 5000.00, 5000.00),
(6, '2026-10-14', 'Pendiente', 9, 3, 8, 30, 200000.00, 6000000.00, 6000000.00),
(7, '2026-10-14', 'Pendiente', 8, 3, 11, 49, 200000.00, 9800000.00, 9800000.00),
(8, '2026-10-14', 'Pendiente', 6, 3, 6, 25, 70000.00, 1750000.00, 1750000.00),
(9, '2026-10-14', 'Pendiente', 5, 3, 7, 79, 320000.00, 25280000.00, 25280000.00),
(10, '2026-10-14', 'Pendiente', 7, 3, 10, 34, 48000.00, 1632000.00, 1632000.00),
(11, '2026-10-14', 'Pendiente', 6, 3, 9, 58, 30000.00, 1740000.00, 1740000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tipo_documento` varchar(5) NOT NULL DEFAULT 'CC',
  `documento` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` enum('Administrador','Empleado') NOT NULL DEFAULT 'Empleado',
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `telefono`, `email`, `tipo_documento`, `documento`, `username`, `password`, `rol`, `estado`, `fecha_registro`) VALUES
(2, 'Juan Pérez', '3000000002', 'juan@tienda.com', 'CC', '1010000002', 'juan', '1234', 'Empleado', 'Activo', '2026-09-28 23:48:21'),
(3, 'Brandon', '3001234567', 'brandon@correo.com', 'CC', '1234567890', 'brandon', '1234', 'Administrador', 'Activo', '2026-09-29 00:42:59'),
(4, 'Hitler', '32149575976', 'hitleralemanianazi@gmail.com', 'CC', '60392749874', 'hitler', '1939', 'Empleado', 'Activo', '2026-09-29 00:58:18'),
(5, 'Fray Perez ', '3178906058', 'FRAY@GMAIL.COM', 'CC', '1090419746', 'yo', '1234', 'Administrador', 'Activo', '2026-10-01 13:02:02'),
(6, 'Carlos Torres', '32134568769', 'carlostorres@gmail.com', 'TI', '1090419734', 'carlos', '1234', 'Empleado', 'Activo', '2026-10-14 00:49:18'),
(7, 'Johan suarez', '123456789087', 'johan@gmail.com', 'CC', '13224356478', 'johan', '1234', 'Empleado', 'Activo', '2026-10-14 00:50:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `talla` varchar(10) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `precio_venta` decimal(10,2) NOT NULL DEFAULT 0.00,
  `id_categoria` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `talla`, `color`, `stock`, `precio_venta`, `id_categoria`, `imagen`) VALUES
(1, 'Camiseta Básica', 'M', 'Blanco', 10, 35000.00, 26, NULL),
(2, 'Jean Clásico', '32', 'Azul', 30, 80000.00, 27, NULL),
(3, 'Tenis Deportivo', '42', 'Negro', 20, 120000.00, 28, NULL),
(4, 'Gorra Lv', '7', 'blanco', 16, 30.00, 29, NULL),
(5, 'Anillo leuvre', '3', 'oro, dorado', 50, 1000000.00, 30, NULL),
(6, 'Levi\'s 501', '28', 'gris', 75, 1500000.00, 27, NULL),
(7, 'loropiana', '35', 'cafe', 116, 330000.00, 28, NULL),
(8, 'Fit H&M', 'XS, S, M, ', 'negro', 105, 39900.00, 26, NULL),
(9, 'Cargo Bershka Baggy Fit', '34 a 44 ', 'negro, gris, aumado', 105, 299000.00, 27, NULL),
(10, 'Polo Ralph Lauren Slim Fit', 'S, M, L, X', 'azul marino, vinotinto, beige', 114, 560000.00, 26, NULL),
(11, 'Gucci Bowling Shirt', '44 a 56', 'verde marino', 119, 3220000.00, 26, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nit`, `nombre`, `telefono`, `direccion`) VALUES
(1, '900111222', 'Textiles S.A.S', '3001112222', 'Calle 10 #20-30'),
(2, '900333444', 'Distribuidora Moda', '3003334444', 'Carrera 5 #10-15'),
(3, '9098767', 'Tripe Alianza D.C', '30183739744', 'Berlin Alemania'),
(4, '1234567890', 'Cordinadora sas', '1234567890', 'calñle 273y44 byvbgfb'),
(5, '123456789', 'Kikluxe', '32123456789', 'cxaonesuburgbru874'),
(6, '9040374945', 'Confetex de Colombia', '31274976065', 'cañleee iuegr rugr tt'),
(7, '10930478565940', 'Edicartiendaoficial', '328659576585', 'caplla ekyr iue8749874buhhr r'),
(8, '17826497405485', 'DistriUrban ', '365875085973', 'calle uy663874v yg4g7t4'),
(9, '15648765950', 'Alibaba', '31297407569', 'cañll china'),
(10, '2648674977655', 'Faire', '3265448766484', 'cakjeybr uvr uhheyvg4r  '),
(11, '125484875975', 'Tasha Apparel', '31729730844', 'vdjfb fibg gnibut tibt t'),
(12, '19027390845985', 'FashionGo ', '3648764936389', 'callle india'),
(13, '1908038494', ' IndiaMART ', '3176383649455', 'calle indonesia'),
(14, '156387484764', 'OrangeShine ', '318639738372', 'calle japon'),
(15, '1638644864864', 'Wholesale7', '3252416438', 'callae colom'),
(16, '18376397384', 'Trendsi ', '3122415422', 'calle diaz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fecha`, `id_empleado`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`, `total`) VALUES
(1, '2026-09-28', 2, 2, 1, 40000.00, 40000.00, 40000.00),
(2, '2026-09-28', 2, 1, 1, 50000.00, 50000.00, 50000.00),
(4, '2026-10-01', 3, 2, 1, 50000.00, 50000.00, 50000.00),
(5, '2026-10-01', 2, 1, 1, 60000.00, 60000.00, 60000.00),
(6, '2026-10-01', 3, 5, 1, 1200000.00, 1200000.00, 1200000.00),
(7, '2026-10-01', 2, 5, 1, 1000000.00, 1000000.00, 1000000.00),
(8, '2026-10-01', 2, 1, 2, 50000.00, 100000.00, 100000.00),
(9, '2026-10-02', 2, 1, 1, 50000.00, 50000.00, 50000.00),
(10, '2026-10-14', 3, 9, 2, 2000000.00, 4000000.00, 4000000.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `fk_compra_proveedor` (`id_proveedor`),
  ADD KEY `fk_compra_empleado` (`id_empleado`),
  ADD KEY `fk_compra_producto` (`id_producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `nit` (`nit`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_venta_empleado` (`id_empleado`),
  ADD KEY `fk_venta_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `fk_compra_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `fk_compra_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `fk_venta_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
