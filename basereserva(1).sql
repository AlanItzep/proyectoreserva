-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2018 a las 20:04:31
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basereserva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idpersona` int(11) NOT NULL,
  `codigo_cliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idpersona`, `codigo_cliente`) VALUES
(4, 'bitch'),
(1, 'fac3kd'),
(8, 'facil3'),
(9, 'fdsf1'),
(5, 'nigga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo`
--

CREATE TABLE `consumo` (
  `idconsumo` int(11) NOT NULL,
  `idreserva` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(7,2) NOT NULL,
  `precio_venta` decimal(7,2) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `consumo`
--

INSERT INTO `consumo` (`idconsumo`, `idreserva`, `idproducto`, `cantidad`, `precio_venta`, `estado`) VALUES
(4, 3, 1, '2.00', '7.00', 'Aceptado'),
(6, 2, 3, '4.00', '1.00', 'Aceptado'),
(7, 2, 2, '5.00', '3.00', 'Aceptado'),
(8, 4, 1, '2.00', '7.00', 'Aceptado'),
(9, 4, 3, '5.00', '1.00', 'Aceptado'),
(10, 5, 3, '4.00', '1.00', 'Aceptado'),
(11, 5, 1, '3.00', '7.00', 'Aceptado'),
(12, 6, 1, '2.00', '7.00', 'Aceptado'),
(13, 6, 3, '1.00', '1.00', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `idhabitacion` int(11) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `piso` varchar(2) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `caracteristicas` varchar(512) DEFAULT NULL,
  `precio_diario` decimal(7,2) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `tipo_habitacion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`idhabitacion`, `numero`, `piso`, `descripcion`, `caracteristicas`, `precio_diario`, `estado`, `tipo_habitacion`) VALUES
(1, '579', '5', 'WiFi\nTelevision con Cable', 'Bano\nAgua caliente', '350.00', 'Disponible', 'Familiar'),
(2, '309', '3', 'Agua Caliente \nTelevision con cable \nPeliculas eroticas', 'Con ventana panoramica', '500.00', 'Disponible', 'Presidencial'),
(3, '610', '6', 'Cable\nWifi', 'Vista panoramica', '300.00', 'Disponible', 'Matrimonial'),
(4, '410', '4', 'Vista al mar', 'Cama doble\ntv cable	', '500.00', 'Disponible', 'Familiar'),
(5, '101', '1', 'Agua caliente\ncama grande\ndesayuno', 'Primer nivel', '150.00', 'Disponible', 'Individual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `idreserva` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `num_comprobante` varchar(20) NOT NULL,
  `iva` decimal(4,2) NOT NULL,
  `total_pago` decimal(7,2) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_pago` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `idreserva`, `tipo_comprobante`, `num_comprobante`, `iva`, `total_pago`, `fecha_emision`, `fecha_pago`) VALUES
(1, 4, 'Factura', '001-0012', '0.18', '119.00', '2018-03-09', '2018-03-09'),
(2, 6, 'Factura', '001-0012', '0.18', '1015.00', '2018-03-15', '2018-03-15'),
(3, 7, 'Factura', '0001-0001', '18.00', '100.00', '2018-04-02', '2018-04-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido_paterno` varchar(20) NOT NULL,
  `apellido_materno` varchar(20) NOT NULL,
  `tipo_documento` varchar(15) NOT NULL,
  `numero_documento` varchar(8) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nombre`, `apellido_paterno`, `apellido_materno`, `tipo_documento`, `numero_documento`, `direccion`, `telefono`, `email`) VALUES
(1, 'Jorge', 'De la Vega', 'Cervantes', 'Pasaporte', '12345678', 'Ciudad', '12345678', 'adhask@jotito.com'),
(4, 'Maria', 'Garcia', 'Panchita', 'DPI', '12345675', 'Calga', '12345673', 'sadfj@fsdf.com'),
(5, 'Beto', 'Chae', 'Chuc', 'Carnet', '75321', 'Pringalandia', '96943', 'sdfl@glds.com'),
(6, 'Ana', 'Diaz', 'Mundaca', 'DPI', '12132', 'Chiclayo', '899493', 'anads@go.com'),
(7, 'Luis', 'Arcila', 'Diaz', 'DPI', '2328921', 'Chiclayo', '5030589', 'puispd@go.com'),
(8, 'Alan', 'Itzep', 'Perez', 'Pasaporte', '243589', 'Guatemala', '42603042', 'alternativo61@hotmail.com'),
(9, 'Juan', 'Plata', 'Oro', 'DPI', '32183', 'Cochabamba', '678493', 'chinw@to.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `precio_venta` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `descripcion`, `unidad_medida`, `precio_venta`) VALUES
(1, 'PEPSI', 'Cola\nCerveceria nacional	', 'LB', '7.00'),
(2, 'Pan Frances', 'pequenos segmentos \nde 6 unidades de pan', 'UND', '3.00'),
(3, 'Tortrix', 'Bolsas de Snack', 'UND', '1.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `idhabitacion` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idtrabajador` int(11) NOT NULL,
  `tipo_reserva` varchar(20) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_ingresa` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `costo_alojamiento` decimal(7,2) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idreserva`, `idhabitacion`, `idcliente`, `idtrabajador`, `tipo_reserva`, `fecha_reserva`, `fecha_ingresa`, `fecha_salida`, `costo_alojamiento`, `estado`) VALUES
(2, 1, 4, 6, 'Alquiler', '2018-03-02', '2018-03-03', '2018-03-04', '150.00', 'Pagada'),
(3, 1, 1, 6, 'Alquiler', '2018-03-09', '2018-03-10', '2018-03-17', '600.00', 'Pagada'),
(4, 1, 4, 6, 'Alquiler', '2018-03-09', '2018-03-09', '2018-03-10', '100.00', 'Pagada'),
(5, 2, 9, 6, 'Alquiler', '2018-03-01', '2018-03-02', '2018-03-03', '1500.00', 'Alquiler'),
(6, 4, 8, 6, 'Alquiler', '2018-03-22', '2018-03-23', '2018-03-24', '1000.00', 'Pagada'),
(7, 3, 5, 6, 'Alquiler', '2018-04-01', '2018-04-01', '2018-04-02', '100.00', 'Pagada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `idpersona` int(11) NOT NULL,
  `sueldo` decimal(7,2) NOT NULL,
  `acceso` varchar(15) NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`idpersona`, `sueldo`, `acceso`, `login`, `password`, `estado`) VALUES
(6, '1500.00', 'Administrador', 'admin', 'admin123', 'A'),
(7, '1200.00', 'Digitador', 'digitador', 'digitador123', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `codigo_cliente_UNIQUE` (`codigo_cliente`);

--
-- Indices de la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`idconsumo`),
  ADD KEY `fk_consumo_producto_idx` (`idproducto`),
  ADD KEY `fk_consumo_reserva_idx` (`idreserva`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`idhabitacion`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `fk_pago_reserva_idx` (`idreserva`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `telefono_UNIQUE` (`telefono`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idreserva`),
  ADD KEY `fk_reserva_habitacion_idx` (`idhabitacion`),
  ADD KEY `fk_reserva_cliente_idx` (`idcliente`),
  ADD KEY `fk_reserva_trabajador_idx` (`idtrabajador`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consumo`
--
ALTER TABLE `consumo`
  MODIFY `idconsumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `idhabitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idreserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_persona_cliente` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD CONSTRAINT `fk_consumo_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consumo_reserva` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_reserva` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reserva_habitacion` FOREIGN KEY (`idhabitacion`) REFERENCES `habitacion` (`idhabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reserva_trabajador` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `fk_persona_trabajador` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
