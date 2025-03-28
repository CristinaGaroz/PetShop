-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2025 a las 10:32:26
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mascotas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombre`) VALUES
(1, 'alimento'),
(3, 'salud e higiene'),
(4, 'juguetes'),
(5, 'accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(11) NOT NULL,
  `pais` varchar(40) NOT NULL,
  `provincia` varchar(40) NOT NULL,
  `ciudad` varchar(40) NOT NULL,
  `cp` int(11) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `piso` varchar(50) DEFAULT NULL,
  `remitente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `pais`, `provincia`, `ciudad`, `cp`, `calle`, `numero`, `piso`, `remitente`) VALUES
(125, 'España', 'Cuenca', 'San Clemente', 45896, 'Plaza Mayor', 22, '2ºA', 'Pepe Martín Pozo'),
(126, 'España', 'Toledo', 'Bargas', 47582, 'Comercio', 22, '2ªA', 'Cristina Garoz Gómez'),
(127, 'España', 'Cuenca', 'Cuenca', 56840, 'Plaza Mayor', 33, '3ºA', 'Marcos León Flores'),
(128, 'España', 'Toledo', 'Los yébenes (Toledo)', 45470, 'RRE', 0, 'ERRE', 'ERT'),
(129, 'España', 'Toledo', 'Los yébenes (Toledo)', 45470, 'PAZ', 28, '1', 'Marta Pedraza Mira'),
(130, 'España', 'Toledo', 'Los yébenes (Toledo)', 45470, 'PAZ', 28, 'L', 'Juanito'),
(131, 'a', 'a', 'a', 45420, 'a', 20, 'a', 'a'),
(132, 'España', 'Toledo', 'Los yébenes (Toledo)', 45470, 'PAZ', 28, 'L', 'Cristina Garoz Gómez'),
(133, 'España', 'Toledo', 'Los yébenes (Toledo)', 45470, 'PAZ', 12, 'L', 'Cristina Garoz Gómez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `fecha`, `precio_total`, `usuario`) VALUES
(159, '0000-00-00', 46.93, 56),
(160, '0000-00-00', 46.93, 56),
(178, '0000-00-00', 4.99, 56),
(179, '0000-00-00', 11.78, 56),
(181, '0000-00-00', 65.10, 56),
(182, '0000-00-00', 65.10, 56),
(183, '0000-00-00', 30.35, 74),
(184, '0000-00-00', 30.35, 74),
(185, '0000-00-00', 4.99, 74),
(186, '0000-00-00', 127.95, 56),
(187, '0000-00-00', 127.95, 56),
(190, '0000-00-00', 56.07, 76),
(191, '0000-00-00', 56.07, 76);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoproducto`
--

CREATE TABLE `pedidoproducto` (
  `idPedidoProducto` int(11) NOT NULL,
  `pedido` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `unidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidoproducto`
--

INSERT INTO `pedidoproducto` (`idPedidoProducto`, `pedido`, `producto`, `unidades`) VALUES
(108, 160, 8, 1),
(109, 160, 91, 2),
(115, 178, 12, 1),
(117, 182, 3, 1),
(118, 182, 119, 1),
(119, 182, 71, 1),
(120, 184, 40, 1),
(121, 185, 12, 1),
(122, 187, 38, 2),
(123, 187, 25, 3),
(125, 191, 3, 1),
(126, 191, 75, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `Img` varchar(500) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `categoria` int(11) NOT NULL,
  `tipoAnimal` int(11) NOT NULL,
  `productoTop` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Img`, `nombre`, `descripcion`, `stock`, `precio`, `marca`, `categoria`, `tipoAnimal`, `productoTop`) VALUES
(1, '../IMG/perro/alimento/royalCanin/01perro1.png', 'MINI ADULT PIENSO PARA PERROS', 'Pienso para perros de edad adulta y tamaño pequeño o mini, indicado a partir de 10 meses de edad.', 0, 17.75, 'royalCanin', 1, 1, 1),
(2, '../IMG/perro/alimento/royalCanin/01perro2.png', 'MEDIUM ADULT PIENSO PARA PERROS', 'Pienso para perros con problemas digestivos medianos de edad adulta, fácil de digerir y con ingredientes que ayudan a fortalecer las defensas.', 99, 29.09, 'royalCanin', 1, 1, NULL),
(3, '../IMG/perro/alimento/royalCanin/01perro3.png', 'POMERANIAN ADULT PIENSO PARA PERROS', 'El pequeño Pomerania es un perro fuerte y con carácter, no obstante, se caracteriza por tener unas necesidades muy particulares. ', 130, 23.10, 'royalCanin', 1, 1, 2),
(4, '../IMG/perro/alimento/royalCanin/01perro4.png', 'URINARY CARE MINI PIENSO PARA PERROS', 'Urinary Care Mini es un pienso para perros adultos de raza pequeña (hasta 10 kg) que mejora la salud del tracto urinario . ', 135, 33.39, 'royalCanin', 1, 1, 0),
(5, '../IMG/perro/alimento/advance/02perro1.png', 'ADVANCE ACTIVE DEFENSE ME', 'Pienso con pollo y arroz para perros adultos de razas medianas entre 10 y 30 kg de peso.', 100, 19.99, 'advance', 1, 1, NULL),
(6, '../IMG/perro/alimento/advance/02perro2.png', 'ADVANCE SENIOR MINI +8 PO', 'Pienso para perros seniors de razas minis, recomendado a partir de los 8 años de edad.', 48, 14.19, 'advance', 1, 1, NULL),
(7, '../IMG/perro/alimento/advance/02perro3.png', 'ADVANCE GALLETAS APPETITE', 'Advance Appetite Control Snack para todo tipo de perros son saludables y deliciosas galletas de alta calidad ideales para el cuidado de la salud de tu perro', 24, 3.29, 'advance', 1, 1, NULL),
(8, '../IMG/perro/alimento/advance/02perro4.png', 'ADVANCE PALITOS ARTICULAR', 'El suplemento nutricional para perros Advance Articular Forte es un complemento que protege las articulaciones de las mascotas y les ayuda a frenar su desgaste', 9, 30.95, 'advance', 1, 1, NULL),
(9, '../IMG/perro/alimento/criadores/03perro1.png', 'CRIADORES ADULTO GRAIN FR', 'Criadores Grain Free con salmón fresco es un alimento completo y equilibrado para perros adultos de razas medianas y grandes.', 38, 30.52, 'criadores', 1, 1, 0),
(10, '../IMG/perro/alimento/criadores/03perro2.png', 'CRIADORES ADULTO GRAIN FR', 'Pienso sin cereales de pescado para perros de más de 10 kg en edad adulta que necesitan un pienso libre de gluten y que refuerce su salud digestiva.', 106, 60.29, 'criadores', 1, 1, 0),
(11, '../IMG/perro/alimento/criadores/03perro3.png', 'CRIADORES SNACKS DENTALES', 'Snack dental para perros grandes, tiene sabor a pollo y es fácil de digerir, su tamaño y consistencia hacen que limpie los dientes y encías de la mascota a medida que lo va masticando, previene la aparición de sarro.', 95, 9.99, 'criadores', 1, 1, NULL),
(12, '../IMG/perro/alimento/criadores/03perro4.png', 'CRIADORES SALCHICHA GRAIN', 'La salchicha Criadores Grain Free es un alimento completo para perros adultos que podrás ofrecer como plato único o como un delicioso premio saludable. ', 34, 4.99, 'criadores', 1, 1, NULL),
(13, '../IMG/perro/salud/yes/03perro1.png', 'PEINE ANTIPULGAS PARA PERROS', 'Con el Peine quitapulgas Yes!pH , tienes una efectiva herramienta para combatir las infestaciones de parásitos externos, especialmente las pulgas y sus liendres', 2, 3.99, 'yes!ph', 3, 1, NULL),
(14, '../IMG/perro/salud/yes/03perro2.png', ' PROTECTOR SOLAR EN CREMA PARA PERROS', 'Yes!pH Protector solar crema para perros es un producto que protege la piel de tu peludo en los meses de más calor para que no se dañe por el sol.', 33, 19.99, 'yes!ph ', 3, 1, 2),
(15, '../IMG/perro/salud/yes/03perro3.png', 'TOALLITAS HÚMEDAS LIMPIADORAS', 'Las toallitas limpiadoras para mascotas Yes!pH son ideales para limpiar las partes más delicadas , como los ojos y los oídos , para conseguir una buena higiene diaria.', 26, 3.69, 'yes!ph ', 3, 1, NULL),
(16, '../IMG/perro/salud/yes/03perro4.png', 'PINZAS QUITA GARRAPATAS PARA PERROS', 'Las Pinzas para garrapatas Yes!pH son una herramienta pensada para facilitar el trabajo de quitar los parásitos de la piel y el manto de tu mascota, de una forma fácil, segura y muy efectiva, minimizando posibles enfermedades cutáneas o reacciones alérgicas.', 105, 1.99, 'yes!ph ', 3, 1, NULL),
(17, '../IMG/perro/salud/ibanez/02perro1.png', 'DISPENSADOR BOLSAS SILICONA ROJO PARA PERROS', 'Dispensador bolsas silicona rojo para perros, práctico y resistente, ideal para paseos y mantener la higiene de tu mascota.', 100, 5.99, 'ibanez', 3, 1, NULL),
(18, '../IMG/perro/salud/ibanez/02perro2.png', 'VENDA ELASTICA COHESIVA ROJA PARA MASCOTAS', 'Ideal para las razas de perros de orejas caídas.', 37, 3.02, 'ibanez', 3, 1, NULL),
(19, '../IMG/perro/salud/ibanez/02perro3.png', 'DREAM TIJERA MICRODENTADA PARA PELUQUERÍA CANINA', 'La tijera Ibañez Dream es perfecta para cortes precisos en la peluquería canina gracias a su diseño microdentado.', 34, 86.24, 'ibanez', 3, 1, NULL),
(20, '../IMG/perro/salud/ibanez/02perro4.png', 'ELIMINADOR DE SARRO IBÁÑEZ BLANC', 'Preparado nutricional específico para perros que evita la aparición de sarro y facilita la eliminación progresiva del ya existente', 16, 18.62, 'ibanez', 3, 1, 0),
(21, '../IMG/perro/salud/menforsan/01perro1.png', 'GEL PROTECTOR DE ALMOHADILLAS PARA PERROS', 'Gel protector de almohadillas para perros y gatos, es fácil de aplicar, hidrata y repara las grietas y resequedades de las patas, es inodoro e incoloro y no irrita la piel, elaborado a base de aloe vera, de rápida absorción.', 52, 11.99, 'menforsan', 3, 1, NULL),
(22, '../IMG/perro/salud/menforsan/01perro2.png', 'COLONIA PARA PERROS DE FRESA', 'Colonia libre de alcohol y con pH neutro. Es ideal después del baño ya que proporciona una acción prolongada desodorante para perros.', 14, 5.99, 'menfonsan', 3, 1, NULL),
(23, '../IMG/perro/salud/menforsan/01perro3.png', 'ANTIOLOR CELO PARA PERROS HEMBRAS', 'Este producto es un potente enmascarador natural de las feromonas de las hembras en celo, que aplicado mediante una pulverización en la zona próxima a la cola antes del paseo.', 11, 5.15, 'menfonsan', 3, 1, NULL),
(24, '../IMG/perro/salud/menforsan/01perro4.png', 'LIMPIADOR DE OJOS PARA PERROS', 'Se trata de una solución acuosa completamente natural, sin componentes agresivos, y de uso frecuente para limpiar manchas secas y legañas en el exterior de los ojos de todo tipo de perros.', 22, 6.39, 'menforsan', 3, 1, 0),
(25, '../IMG/perro/juguetes/flamingo/01perro1.png', 'JUGUETE INTERACTIVO PARA PERROS', 'Lanzador de pelota de tenis con recompensa. Mantiene a tu perro entretenido durante horas y estimula el instinto de recuperación.', 27, 21.99, 'flamingo', 4, 1, 2),
(26, '../IMG/perro/juguetes/flamingo/01perro2.png', 'ALFOMBRA OLFATIVA PARA PERROS', 'Alfombra olfativa para perros recomendada como juego de entrenamiento para esconder la comida o las golosinas de tu mascota.', 60, 25.99, 'flamingo', 4, 1, NULL),
(27, '../IMG/perro/juguetes/flamingo/01perro3.png', 'BAZOOKA LANZADOR DE PELOTAS PARA PERROS', 'El lanzador de pelotas de tenis Bazooka es un fantástico juguete para los dueños de perros a los que les gustan los juegos de lanzar y recoger y, sobre todo, las pelotas.', 24, 17.99, 'flamingo', 4, 1, NULL),
(28, '../IMG/perro/juguetes/flamingo/01perro4.png', 'MORDEDOR DE HELADO PARA PERROS', 'El helado de agua mordedor es un juguete estupendo para los meses más calurosos. Además de ser divertido y ayudar a fortalecer los dientes y la mandíbula.', 127, 9.49, 'flamingo', 4, 1, NULL),
(29, '../IMG/perro/juguetes/sumervibes/02perro1.png', 'PISCINA PARA PERROS', 'Esta divertida piscina TK-Pet plegable para perros, ideal para todo tipo de razas, está fabricada con un plástico de gran calidad y muy resistente para asegurar una mayor durabilidad.\r\nTalla M: Diámetro 120cm, altura 30cm.', 203, 29.99, 'sumer vibes', 4, 1, 1),
(30, '../IMG/perro/juguetes/sumervibes/02perro2.png', 'FLIP FLOP CHANCLETA CON CUERDA ROSA Y AZUL JUGUETE PARA PERROS', 'Chancla de peluche y cuerda.', 89, 5.95, 'sumer vibes', 4, 1, NULL),
(31, '../IMG/perro/juguetes/sumervibes/02perro3.png', 'LANZADOR DE FRISBEE PARA PERROS', 'Lanzador de frisbee para perros, permite lanzar el disco a varios metros de distancia, es ligero y fácil de usar, tiene asa ergonómica, materiales resistentes y duraderos, es fácil de limpiar.', 64, 5.99, 'sumer vibes', 4, 1, NULL),
(32, '../IMG/perro/juguetes/sumervibes/02perro4.png', 'OCEAN CUERDA FLOTANTE CON PELOTA PARA PERROS', 'Juguete de cuerda flotante con pelota de goma para perros, adecuado para llevar a la playa o piscina, de color llamativo, fabricado con nylon redondo muy resistente, tiene nudos y es ideal para jugar al tira y encoge con la mascota.', 23, 3.99, 'sumer vibes', 4, 1, NULL),
(33, '../IMG/perro/juguetes/kong/03perro1.png', 'HUESO PARA CACHORROS', 'Su cachorro que esté en fase de dentición se sentirá encantado con el hueso para cachorros de KONG. está hecho con la goma especial para cachorros y tiene huecos donde esconder recompensas.', 17, 9.29, 'kong', 4, 1, NULL),
(34, '../IMG/perro/juguetes/kong/03perro2.png', 'FRISBEE PARA PERROS', 'El Frisbee para perros adultos es el mejor disco volador de goma flexible, con agarre suave y vuelo preciso lo hace ideal para que juegues con tu compañero.', 72, 13.82, 'kong', 4, 1, NULL),
(35, '../IMG/perro/juguetes/kong/03perro3.png', 'ANIMALES DE PELUCHE PARA PERROS', 'Si a tu perro le gustan los peluches, regálale este juguete. Se convertirá en un compañero amoroso y cálido, tanto dentro como fuera de casa.\r\nTu mascota pasará su tiempo de ocio entretenido con el tira y afloja, haciéndolo sonar una y otra vez, sin descanso, o simplemente paseándolo de un lado a otro.', 10, 11.99, 'kong', 4, 1, NULL),
(36, '../IMG/perro/juguetes/kong/03perro4.png', 'PORTAGOLOSINAS SUAVE PARA CACHORROS', 'Se trata de un juguete pensado para perros de dos a nueve meses y se convertirá en el amigo favorito de tu mascota. Su divertida forma de botar hará que tu cachorro se sienta como un auténtico cazador. Puppy KONG es un artículo fabricado con caucho.', 43, 13.19, 'kong', 4, 1, NULL),
(37, '../IMG/gato/alimento/royalCanin/01gato1.png', 'PIENSO PARA GATO ADULTO PERSA', 'Pienso para gatos Persa adultos, indicado a partir del año de edad y formulado especialmente para cubrir las necesidades de esta raza de gatos.\r\n2kg.', 83, 25.99, 'royalCanin', 1, 3, NULL),
(38, '../IMG/gato/alimento/royalCanin/01gato2.png', 'MOTHER & BABYCAT PIENSO PARA GATOS', 'Comida para gatas gestantes y gatitos en crecimiento. Es importante reciban un aporte nutricional adecuado para así garantizar un óptimo estado de salud para ambos.\r\n2kg.', 115, 30.99, 'royalCanin', 1, 3, NULL),
(39, '../IMG/gato/alimento/royalCanin/01gato3.png', 'AGEING 12+ PIENSO PARA GATOS', 'Producto de alta calidad para la dieta diaria de gatos adultos de más de 12 años.\r\n2kg.', 12, 24.89, 'royalCanin', 1, 3, NULL),
(40, '../IMG/gato/alimento/royalCanin/01gato4.png', 'ADULT SPHYNX PIENSO PARA GATOS', 'Pienso para gatos adultos de raza esfinge o sphynx. Su receta con un alto valor calórico, aceites de pescado y biotina les ayuda a mantener el calor corporal. \r\n5kg.', 8, 30.35, 'royalCanin', 1, 3, 0),
(41, '../IMG/gato/alimento/advance/02gato1.png', 'STERILIZED HAIRBALL PAVO Y CEBADA PIENSO PARA GATOS', 'Pienso para gatos esterilizados que pueden sufrir un aumento de peso. También ayuda a reducir la formación de bolas de pelo.\r\n2kg', 96, 18.09, 'advance', 1, 3, NULL),
(42, '../IMG/gato/alimento/advance/02gato2.png', 'POLLO Y ARROZ PIENSO PARA GATITOS.', 'Alimento completo y equilibrado para gatitos de 2 a 12 meses, y para gatas gestantes y lactantes.\r\n3kg.', 48, 30.25, 'advance', 1, 3, NULL),
(43, '../IMG/gato/alimento/advance/02gato3.png', 'BOCADITOS CON POLLO SOBRE EN SALSA PARA GATOS', 'Bocaditos con Pollo Sobre en salsa para gatos adultos de todas las razas, alta palatabilidad, aporta hidratación adicional, mejora la salud de la piel.\r\n58g', 50, 1.25, 'advance', 1, 3, NULL),
(44, '../IMG/gato/alimento/advance/02gato4.png', 'VETERINARY DIETS URINARY SOBRE PARA GATOS', 'Alimento húmedo para gatos con problemas urinarios.\r\n85g', 14, 1.45, 'advance', 1, 3, 3),
(45, '../IMG/gato/alimento/criadores/03gato1.png', 'DIETETIC ADULTO URINARY PIENSO PARA GATOS', 'La Comida para gatos tracto urinario Criadores Dietetic Urinary es un pienso seco con una receta que mejora la salud renal, eliminando los cálculos.\r\n2.5 kg', 95, 18.95, 'criadores', 1, 3, NULL),
(46, '../IMG/gato/alimento/criadores/03gato2.png', 'PERSA Y PELO LARGO PIENSO PARA GATOS', 'El pienso Criadores Razas Persa y pelo largo es un alimento completo y equilibrado con una fórmula especial para el cuidado del pelaje y el control de las bolas de pelo.', 124, 19.95, 'criadores', 1, 3, NULL),
(47, '../IMG/gato/alimento/criadores/03gato3.png', 'ADULTO GRAIN FREE POLLO PIENSO PARA GATOS', 'El pienso seco y completo Criadores Grain Free con pollo está especialmente pensado para gatos adultos, a partir de los 12 meses de edad. ', 62, 19.95, 'criadores', 1, 3, 1),
(48, '../IMG/gato/alimento/criadores/03gato4.png', 'KITTEN POLLO Y ARROZ PIENSO PARA GATOS', 'Pienso para gatitos a partir de los 2 meses de edad con una receta Criadores Kitten a base de pollo, arroz y verduras para crecer fuerte.', 34, 17.95, 'criadores', 1, 3, NULL),
(49, '../IMG/gato/salud/beaphar/01gato1.png', 'SNACKS DENTALES PARA GATOS', 'Dental Bits son bocaditos crujientes y recompensas deliciosas para la limpieza dental que aseguran un aliento fresco y dientes limpios.', 39, 2.59, 'beaphar', 3, 3, 3),
(50, '../IMG/gato/salud/beaphar/01gato2.png', ' CHAMPÚ EXTRA SUAVE PARA GATOS', 'Champú para gatos, es extra suave, con aceite de macadamia y aloe vera, protege y humecta la piel, limpia y suaviza el pelaje, tiene pH neutro y es libre de parabenos y siliconas.', 12, 6.99, 'beaphar', 3, 3, NULL),
(51, '../IMG/gato/salud/beaphar/01gato3.png', 'PIPETAS RELAJANTES PARA GATOS', 'Pipetas calmantes que reducen el estrés y los comportamientos no deseados para gatos.', 63, 19.79, 'beaphar', 3, 3, NULL),
(52, '../IMG/gato/salud/beaphar/01gato4.png', 'MULTIVITAMÍNICO EN PASTA PARA GATOS', 'Pasta multivitaminas sin azúcares añadidos y con taurina para gatos a partir de las 6 semanas de edad.Fomenta la vitalidad, mejora la digestión y proporciona un pelaje suave, fuerte y brillante.', 36, 8.69, 'beaphar', 3, 3, NULL),
(53, '../IMG/gato/salud/inodorina/02gato1.png', 'CHAMPÚ EN SECO LECHE Y VAINILLA PARA GATOS', 'El champú en seco Inodorina Leche y Vainilla permite limpiar el pelaje de perros y gatos sin mojarlo . ', 10, 7.29, 'inodorina', 3, 3, NULL),
(54, '../IMG/gato/salud/inodorina/02gato2.png', 'TOALLITAS HÚMEDAS PARA GATOS', 'Las toallitas Inodorina Funcionales para gatos están especialmente diseñadas para la limpieza diaria de tu felino. ', 30, 4.09, 'inodorina', 3, 3, NULL),
(55, '../IMG/gato/salud/inodorina/02gato3.png', 'SPRAY BRILLO FILTRO UV PARA GATOS', 'El spray Brillo Inodorina con Filtro UV es un producto para perros y gatos que facilita el cepillado y mejora el aspecto del manto. ', 11, 9.49, 'inodorina', 3, 3, NULL),
(56, '../IMG/gato/salud/inodorina/02gato4.png', 'GREEN TOALLITAS HÚMEDAS PARA GATOS DE PELO LARGO', 'Las toallitas húmedas con hierba gatera y lino para una excelente limpieza de tu felino.', 17, 4.49, 'inodorina', 3, 3, NULL),
(57, '../IMG/gato/salud/artero/03gato1.png', 'CORTANUDOS 9 HOJAS LARGAS PARA GATOS', 'Cortanudos con 9 hojas largas con filo ondulado para gatos. Adecuado para eliminar los nudos y enredos del pelaje desde distintos ángulos y en las zonas más difíciles.', 32, 16.05, 'artero', 3, 3, NULL),
(58, '../IMG/gato/salud/artero/03gato2.png', 'INTENSIFICADOR CAPILAR PARA GATOS BLANCOS', 'Blanqueador intenso para gatos de pelo blanco.', 85, 47.95, 'artero', 3, 3, NULL),
(59, '../IMG/gato/salud/artero/03gato3.png', 'CARDA PÚA MANTEQUILLA PARA GATOS', 'Apta para mantener el pelo de perros y gatos libre de nudos, suelto y con volumen. Gracias a sus púas adaptables, separa las hebras de pelo sin dañar la piel de las mascotas.', 28, 10.15, 'artero', 3, 3, 3),
(60, '../IMG/gato/salud/artero/03gato4.png', 'CHAMPÚ SECO PARA GATOS', 'Champú para lavado en seco. Perfecto para todas las razas , de cualquier tipo de pelo y color. ', 17, 19.29, 'artero', 3, 3, NULL),
(61, '../IMG/gato/juguetes/flamingo/01gato1.png', 'INFINITY JUEGO INTERACTIVO CON RASCADOR PARA GATOS', 'Flamingo juguete rascador para gatos', 35, 14.55, 'flamingo', 4, 3, 3),
(62, '../IMG/gato/juguetes/flamingo/01gato2.png', 'HAPPY CAÑA CON MARIQUITA PARA GATOS', 'La caña con mariquita de peluche Happy Bug es ideal para fomentar y promover la interacción entre dueño y mascota. ', 74, 3.09, 'flamingo', 4, 3, NULL),
(63, '../IMG/gato/juguetes/flamingo/01gato3.png', 'TÚNEL CON REDECILLA VERDE PARA GATOS', 'El túnel verde con redecilla para gatos es un juguete muy atractivo con el que los felinos podrán pasar largas horas de juego', 155, 21.19, 'flamingo', 4, 3, NULL),
(64, '../IMG/gato/juguetes/flamingo/01gato4.png', 'LÁSER RATÓN PARA GATOS', 'El láser ratón para gatos es el juguete perfecto para entretener a tu felino mientras que al mismo tiempo realiza ejercicio para mantenerse en forma y saludable. ', 166, 2.99, 'flamingo', 4, 3, NULL),
(65, '../IMG/gato/juguetes/kong/02gato1.png', 'CASA DE JUGUETE PARA GATOS', 'Con esta increíble casa de juguete los gatos pueden jugar en su interior, ayudándoles a salir del aburrimiento. Incluye accesorio colgante. ', 135, 22.50, 'kong', 4, 3, NULL),
(66, '../IMG/gato/juguetes/kong/02gato2.png', 'PELOTA CON COLA DE PLUMAS PARA GATOS', 'Promueve el ejercicio saludable y satisfacen los deseos instintivos de los gatos de perseguir, cazar y capturar. ', 154, 4.85, 'kong', 4, 3, NULL),
(67, '../IMG/gato/juguetes/kong/02gato3.png', 'CATBANA JUGUETE PARA GATOS', 'Catbana juguete para gatos de todas las razas y edades, tiene sombrilla de playa acolchada y con flecos, tiene poste rascador.', 67, 42.00, 'kong', 4, 3, NULL),
(68, '../IMG/gato/juguetes/kong/02gato4.png', 'BOLA DISPENSADORA DE PREMIOS PARA GATOS', 'Bola dispensadora de premios para gatos, puede llenarse con golosinas o pienso, es resistente y duradera, ofrece estimulación intelectual, es fácil de limpiar, no tóxica.', 106, 5.89, 'kong', 4, 3, NULL),
(69, '../IMG/gato/juguetes/trixie/03gato1.png', 'CEPILLO MASAJEADOR GRIS PARA GATOS', 'Trixie te trae un arco masajeador para que coloques en el espacio de tu gato, de esta forma tu gato contará con una alternativa de cepillar su pelaje de manera voluntaria', 168, 22.90, 'trixie', 4, 3, NULL),
(70, '../IMG/gato/juguetes/trixie/03gato2.png', 'JUEGO INTERACTIVO PORTAGOLOSINAS TURN AROUND PARA MASCOTAS', 'Conseguir los premios será todo un desafío de diversión. La mente y el estómago de tu sabueso estarán muy activos', 152, 27.14, 'trixie', 4, 3, NULL),
(71, '../IMG/gato/juguetes/trixie/03gato3.png', 'TABLERO DE JUEGOS PARA GATOS COLOR BLANCO', 'Este tablero de juego para gatos de Trixie está pensado para brindaros la máxima diversión y estímulo tanto a tu gato como a ti, además despertarás su instinto de caza.', 144, 29.05, 'trixie', 4, 3, NULL),
(72, '../IMG/gato/juguetes/trixie/03gato4.png', 'JUGUETE RATÓN FIELTRO CON MOVIMIENTO PARA GATOS', 'Trixie Juguete Ratón Fieltro con Movimiento para Gatos, ideal para estimular el instinto cazador de tu mascota.', 96, 6.48, 'trixie', 4, 3, NULL),
(73, '../IMG/pez/01pez1.png', 'ALIMENTO PARA PECES', 'Esta mezcla de alimento para peces es ideal para acuarios que tienen una población mixta , ya que permite alimentar tanto a peces pequeños como a los más grandes.', 155, 16.52, 'MENFORSAN', 1, 4, NULL),
(74, '../IMG/pez/01pez2.png', 'ESCAMAS PARA PECES TROPICALES', 'Las escamas para peces tropicales Vivanimals son un alimento completo y equilibrad o elaborado con una mezcla de ingredientes seleccionados.', 145, 7.99, 'VIVANIMALS', 1, 4, NULL),
(75, '../IMG/pez/01pez3.png', 'TRATAMIENTO DESINFECTANTE PARA PECES', 'Previene y combate más de 18 enfermedades como: infecciones bacterianas de la mucosa, levantamiento de escamas, micosas primarias y secundarias, parásitos de la piel y las branquias, infecciones parasitarias, protección de la mucosa y muchas más.', 11, 10.99, 'ESHA LABS', 3, 4, 1),
(76, '../IMG/pez/01pez4.png', 'ACONDICIONADOR DE AGUA PARA ACUARIOS', 'Tratamiento para acuarios de agua dulce y marina indispensable para eliminar el cloro y cloramina del agua del grifo, anular los efectos de los metales pesados y prepararla para recibir los peces.', 63, 6.70, 'PRODAC', 3, 4, NULL),
(77, '../IMG/pez/01pez5.png', 'ACUARIO DE CRISTAL CON CUBIERTA Y LUCES LED', 'Tanque con filtro incorporado de algodón de alta eficiencia. Ubicado en la parte superior puede filtrar impurezas finas y purificar la calidad del agua.', 6, 50.10, 'NOBLEZA', 5, 4, NULL),
(78, '../IMG/pez/01pez6.png', 'BOMBA FLUVAL SEA CP4 PARA ACUARIOS', 'Las bombas de recirculación Fluval Sea es de ingeniería y fabricación Europea para acuarios de agua dulce o agua salada las cuales imitan las corrientes naturales de arrecife.', 23, 41.23, 'FLUVAL', 5, 4, NULL),
(79, '../IMG/pez/01pez7.png', 'GRANITO DE HAWAI PARA ACUARIOS', 'Aquasand presenta esta grava para acuarios, hecha de granito totalmente natural, con un tamaño medio y colores mezclados entre blanco y negro, que le dan un toque elegante y natural al hábitat de tus peces.', 32, 20.95, 'MENFORSAN', 5, 4, NULL),
(80, '../IMG/pez/01pez8.png', 'ACUARIO ROMA NEGRO CON LED BLUETOOTH PARA PECES', 'Acuario para amantes de lo sencillo, que siempre es un acierto\r\nLa gama de Acuarios Roma de Fluval ofrecen algo diferente para los apasionados de los acuarios con su diseño contemporáneo además de sus líneas limpias y sencillas. Porque ya se sabe que a veces menos, es más.', 14, 258.64, 'FLUVAL', 5, 4, NULL),
(81, '../IMG/pajaro/01pajaro1.png', 'PIENSO PARA NIFAS', 'Mezcla de semillas enriquecidas con vitaminas, minerales y oligoelementos adecuada para la alimentación diaria de ninfas y otros loritos australianos.', 124, 6.10, 'VERSELE-LAGA', 1, 5, NULL),
(82, '../IMG/pajaro/01pajaro2.png', 'PIENSO NATURAL PARA LOROS', 'Este alimento alto en energía está preparado para especies que en su entorno natural comen una cantidad importante de semillas de plantas oleaginosas .', 123, 12.99, 'PSITTACUS', 1, 5, 0),
(83, '../IMG/pajaro/01pajaro3.png', 'SPRAY INSECTICIDA PARA AVES', 'Spray insecticida perfumado para el tratamiento de las infestaciones de parásitos externos en todo tipo de aves de jaula (canarios, jilgueros, periquitos, loros). Indicado para eliminar y prevenir los piojillos, pulgones y garrapatillas que causan síntomas como inquietud, abandono de nidales, pérdida de plumas por picaje y adelgazamiento progresivo.', 35, 5.69, 'menforsan\r\n', 3, 5, NULL),
(84, '../IMG/pajaro/01pajaro4.png', 'ARENA ABSORBENTE PARA PÁJAROS', 'Este producto es un lecho de arena suave y absorbente para el suelo de la jaula de tus aves. Los granos neutralizan los malos olores y absorben la humedad. Es un producto higiénico y de larga duración.', 40, 4.99, 'sanibird\r\n', 3, 5, NULL),
(85, '../IMG/pajaro/01pajaro5.png', 'PARQUE DE JUEGO PARA PERIQUITOS', 'Completo parque de juegos para periquitos, agapornis y cotorras de pequeño tamaño. Este juguete es perfecto para entretener y fomentar el ejercicio y la diversión de nuestros pájaros.', 68, 16.79, 'flamingo\r\n', 4, 5, NULL),
(86, '../IMG/pajaro/01pajaro6.png', 'COLUMPIO MADERA PARA LOROS', 'Columpio fabricado en madera natural y cuerda. La base del columpio es una rama de madera de la que salen lateralmente dos cuerdas adornadas con abalorios.', 48, 7.99, 'karlie\r\n', 4, 5, NULL),
(87, '../IMG/pajaro/01pajaro7.png', 'JAULA CON PERCHAS BANDEJA EXTRAÍBLE PARA PÁJAROS', 'Jaula para pájaros con amplio espacio interior.', 9, 121.36, 'pawhut\r\n', 5, 5, 1),
(88, '../IMG/pajaro/01pajaro8.png', 'JAULA RECTANGULAR UNIVERSAL PARA PÁJAROS', 'La jaula para pájaros Voltregà universal rectangular ofrece un diseño es funcional a la vez que moderno e incluye todos los accesorios necesarios.', 47, 37.95, 'voltrega\r\n', 5, 5, NULL),
(89, '../IMG/roedor/01roedor1.png', 'PIENSO PARA CONEJOS ADULTO', 'El pienso para conejo adulto Vivanimals es un alimento completo que incorpora vitaminas y minerales esenciales para la salud de tu mascota.', 62, 13.99, 'vivanimals\r\n', 1, 6, 1),
(90, '../IMG/roedor/01roedor2.png', 'BARRITAS DE FRUTAS PARA ROEDORES', 'Fruta y semillas. Son los dos ingredientes principales de estas barritas de fruta elaboradas con una doble capa de alimento. Además, Small Life las hornea tres veces para facilitar la digestión de tu mascota. Déjale una en las barras de la jaula para que la picotee cuando le apetezca.', 64, 2.99, 'small life\r\n\r\n', 1, 6, NULL),
(91, '../IMG/roedor/01roedor3.png', 'TIJERAS PARA ROEDORES', 'La nueva marca para pequeños animales viene con un diversos productos para el cuidado que se merece tu pequeño animal de compañía. ', 84, 7.99, 'small life\r\n', 3, 6, NULL),
(92, '../IMG/roedor/01roedor4.png', 'SPRAY TRANQUILIZANTE PARA CONEJOS', 'Spray calmante con copia de feromona apaciguadora para conejos. Ideal para aplicar en zonas específicas de la casa donde tu mascota muestra signos de estrés para ayudar a reducir los problemas de comportamiento y estrés.', 51, 16.19, 'beaphar\r\n', 3, 6, NULL),
(93, '../IMG/roedor/01roedor5.png', 'KIT DE INICIACIÓN PARA HÁMSTERS', '¿Te fascinan los hámsters y quieres tener uno pero no tienes ni idea de lo que debes comprar? ¿O quizá estás buscando el regalo perfecto para esa personita especial y crees que le encantaría tener un hámster y le quieres facilitartodo lo que necesitará? ¡Tenemos la solución! El kit de iniciación para hámsters incluye todo lo que precisan estos roedores y de máxima calidad. Genial, ¿verdad?', 91, 39.99, 'small life\r\n', 5, 6, NULL),
(94, '../IMG/roedor/01roedor6.png', 'ROLLER BOLA PARA HENO DE ROEDORES', 'Esta henera cumple varias funciones como la de alimentar de forma controlada al roedor. Durante este proceso, el pequeño roedor disfrutará al tratar de sacar el heno por los pequeños orificios que posee esta rueda.', 37, 12.39, 'small life\r\n', 4, 6, NULL),
(95, '../IMG/roedor/01roedor7.png', 'MODULAR CASETA PARA CONEJOS', 'Caseta para criar conejos. Su tamaño y forma la convierten en una manera muy económica y práctica para disfrutar de un nido para conejos en tu granja o en tu jardín.', 29, 267.45, 'tk pet\r\n', 5, 6, NULL),
(96, '../IMG/roedor/01roedor8.png', 'ZANAHORIA DE MADERA PARA ROER', 'Los dientes de los pequeños roedores no paran de crecer, de modo que hay que ofrecerles algo que les ayude a roerlos, como la zanahoria de juguete de Small Life.', 49, 4.99, 'small life\r\n', 4, 6, NULL),
(97, '../IMG/perro/accesorios/arquivet/03perro1.png', 'CAMA PLEGABLE MY HOME COLOR MARRÓN', 'Caseta plegable, podrás colocarla en cualquier lugar de tu casa sin tener que andar pensando en piezas y tornillos.', 47, 43.50, 'arquivet', 5, 1, 2),
(98, '../IMG/perro/accesorios/arquivet/03perro2.png', 'CAMA HUESOS Y HUELLAS PARA PERROS COLOR AZUL', 'Cama acolchada para perros, ideal para que tu mascota tenga largas y placenteras siestas. La cama tiene forma cuadrada y tiene un relleno mullido y compacto que apenas se deforma.\r\n50cm x 45cm x 17cm. ', 43, 32.75, 'arquivet', 5, 1, NULL),
(99, '../IMG/perro/accesorios/arquivet/03perro3.png', 'BEBEDERO BEIGE PARA MASCOTAS', 'Cuando necesites salir por algunas horas o un par de días lejos de casa y debas dejar a tu mascota, esta tolva de Outech te ayudará a almacenar y dispensar el agua.\r\n4L', 63, 15.99, 'arquivet', 5, 1, NULL),
(100, '../IMG/perro/accesorios/arquivet/03perro4.png', 'BEBEDERO DE VIAJE COLOR ROJO', 'Especial para viajes.\r\n0.75L', 161, 10.36, 'arquivet', 5, 1, 2),
(102, '../IMG/perro/accesorios/flamingo/02perro1.png', 'CORREA CANICROSS NEGRA PARA PERROS', 'Correa canicross con cordón elástico para perros. Brinda una óptima amortiguación durante el jogging, el cinturón es ajustable e incluye mosquetón metálico altamente seguro, perfecta para paseos deportivos.', 36, 48.99, 'flamingo', 5, 1, NULL),
(103, '../IMG/perro/accesorios/flamingo/02perro2.png', 'BOLSO TRANSPORTÍN ROJO PARA MASCOTAS', 'Bolso transportín de nylon resistente para perros pequeños y gatos. Cuenta con malla en todos sus laterales para una gran ventilación de aire, puerta de cremallera superior y dos asas, corta y larga, para llevar con amplia comodidad.', 93, 26.95, 'flamingo', 5, 1, NULL),
(104, '../IMG/perro/accesorios/flamingo/02perro3.png', 'MPERMEABLE AMARILLO PARA PERROS', 'Impermeable amarillo con capucha para perros de todas las razas y tamaños.\r\nT-50 50cm.', 31, 18.36, 'flamingo', 5, 1, NULL),
(105, '../IMG/perro/accesorios/flamingo/02perro4.png', 'BOZAL FLEXIBLE DE SILICONA PARA PERROS COLOR NEGRO', 'Bozal flexible de silicona, nylon y neopreno para perros. Impide morder pero permite al perro jadear, beber y tomar golosinas de forma cómoda.\r\n7cm x 23cm x 34-48cm', 92, 14.95, 'flamingo', 5, 1, 2),
(106, '../IMG/perro/accesorios/vidaXL/01perro1.png', 'CASETA BLANCA CON TECHO A DOS AGUAS PARA PERROS', 'Esta duradera caseta para perros es un lugar excelente y cómodo para que tu perro se relaje y se proteja de la lluvia, el viento y el frío.\r\n95.5cm x 68cm x 66cm.', 11, 126.50, 'vida XL', 5, 1, NULL),
(107, '../IMG/perro/accesorios/vidaXL/01perro2.png', 'CORRALITO DE ACERO PARA PERROS', '¡Mantén a tus amigos peludos en un espacio cerrado seguro y cómodo con esta corralito para perros!\r\n200 x 200 x 100.', 82, 168.23, 'vida XL', 5, 1, NULL),
(108, '../IMG/perro/accesorios/vidaXL/01perro3.png', 'COMEDERO DOBLE ELEVADO PARA PERROS ', 'Comedero doble para mascotas.\r\nLa alimentación es vital en tus mascotas, y crearles hábitos de educación a la hora de comer también, por eso te presentamos este magnífico comedero en el que podrás poner el agua y el pienso de tu mascota juntos para facilitarle la acción de comer y beber, y además crearás una rutina ya que comerán en el mismo lugar siempre.', 96, 32.55, 'vida XL', 5, 1, NULL),
(109, '../IMG/perro/accesorios/vidaXL/01perro4.png', 'COCHECITO PARA MASCOTAS', 'Coche plegable de nylon Oxford y estructura metálica para gatos y perros de hasta 15kg. Cuenta con múltiples cremalleras para cerrar completamente, ideal para los días de lluvia, posee diferentes bolsillos y mallas para la correcta circulación de aire.', 55, 105.30, 'vida XL', 5, 1, 0),
(110, '../IMG/gato/accesorios/vidaXL/01gato1.png', 'RASCADOR CON POSTES DE SISAL GRIS CLARO 82 CM PARA GATOS', '¡Mantén entretenidos a tus adorables gatos sin parar con este rascador para gatos todo en uno!', 33, 38.90, 'vida XL', 5, 3, 3),
(111, '../IMG/gato/accesorios/vidaXL/01gato2.png', 'RASCADOR ONDULADO DE CARTÓN PARA GATOS', 'Es un Rascador ligero con forma ondulada, simulando una tabla de surf, hecho con varias capaz de cartón corrugado , lo que lo hace fuerte y resistente.', 18, 15.05, 'vida XL', 5, 3, NULL),
(112, '../IMG/gato/accesorios/vidaXL/01gato3.png', 'CAMA REDONDA MARRÓN PARA GATOS', '¡Regala a tus peluditos un poco de lujo con esta cama para gatos! ¡Se trata de un lugar excelente para que los gatos se relajen y descansen! \r\n40cm x 40cm x 35 cm.', 44, 29.99, 'vida XL', 5, 3, NULL),
(113, '../IMG/gato/accesorios/vidaXL/01gato4.png', 'COMEDERO AUTOMÁTICO CON MICROCHIP', 'Este fenomenal accesorio cuenta con un microchip que se registra con tan solo un botón y quedará registrado permanentemente, de esta forma, solo el que lo traiga consigo, podrá hacer que la tapa se levante y se alimentará cómoda y tranquilamente.', 12, 164.75, 'vida XL', 5, 3, NULL),
(114, '../IMG/gato/accesorios/flamingo/02gato1.png', 'COLLAR ELÁSTICO AZUL PARA GATOS', 'El collar elástico para gatos azul es una de las mejores opciones para los felinos. Su tejido se adapta a la perfección al cuello sin presionar. ', 162, 2.65, 'flamingo', 5, 3, NULL),
(115, '../IMG/gato/accesorios/flamingo/02gato2.png', 'COMEDERO Y BEBEDERO PARA GATOS', 'Práctico cuenco doble función para gatos, elaborado con cerámica de buena calidad.', 152, 4.99, 'flamingo', 5, 3, NULL),
(116, '../IMG/gato/accesorios/flamingo/02gato3.png', 'CUEVA CON PATAS PARA GATOS', 'La casa alta para gatos con patas de madera es un estupendo accesorio para el descanso. Un lugar acogedor donde tu felino podrá esconderse.', 54, 38.99, 'flamingo', 5, 3, NULL),
(117, '../IMG/gato/accesorios/flamingo/02gato4.png', 'BEBEDERO FUENTE VERDE PARA PERROS Y GATOS', 'La fuente para gatos Bellagio te permite ofrecer agua fresca y limpia a tu mascota durante todo el día. ¡Para que no tengas que preocuparte por nada!', 14, 30.19, 'flamingo', 5, 3, NULL),
(118, '../IMG/gato/accesorios/arquivet/03gato1.png', 'TRANSPORTIN AVIOR COLOR GRIS', 'Transportín para gatos con un diseño muy novedoso y práctico.', 37, 30.15, 'arquivet', 5, 3, NULL),
(119, '../IMG/gato/accesorios/arquivet/03gato2.png', 'CORREA Y PETRAL CLASSIC PARA GATOS COLOR ROJO', 'Para pasear a tu gatito de forma segura y poder crear recuerdos juntos.', 82, 12.95, 'arquivet', 5, 3, 3),
(120, '../IMG/gato/accesorios/arquivet/03gato3.png', 'CAMA REDONDA SUAVE ROSA PARA MASCOTAS', 'Después de un largo día de juegos y actividades tu fiel amigo necesita recuperar energía, y no hay mejor lugar que está cama redonda muy suave y cómoda.', 61, 34.85, 'arquivet', 5, 3, NULL),
(121, '../IMG/gato/accesorios/arquivet/03gato4.png', 'COMEDERO/BEBEDERO DE SILICONA PLEGABLE COLOR AZUL', 'Este comedero o bebedero de silicona para tu mascota es muy cómodo y fácil de transportar.', 201, 4.81, 'arquivet', 5, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoanimal`
--

CREATE TABLE `tipoanimal` (
  `idTipoAnimal` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoanimal`
--

INSERT INTO `tipoanimal` (`idTipoAnimal`, `nombre`) VALUES
(1, 'perros'),
(3, 'gatos'),
(4, 'peces'),
(5, 'pajaros'),
(6, 'roedores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `clave` varchar(20) NOT NULL,
  `rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `correo`, `telefono`, `saldo`, `clave`, `rol`) VALUES
(56, 'lucas', 'paginasdeinternet30@gmail.com', NULL, 1183.95, '1234', '[\"ROLE_ADMIN\"]'),
(74, 'Juanes', 'Juan@gmail.com', NULL, 464.66, '1234', '[\"ROLE_ADMIN\"]'),
(76, 'cristina', 'cristinabrcjs@gmail.com', NULL, 943.93, '1234', '[\"ROLE_ADMIN\"]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariodireccion`
--

CREATE TABLE `usuariodireccion` (
  `idUserDir` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `direccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuariodireccion`
--

INSERT INTO `usuariodireccion` (`idUserDir`, `usuario`, `direccion`) VALUES
(119, 56, 125),
(125, 56, 131),
(124, 74, 130),
(127, 76, 133);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD PRIMARY KEY (`idPedidoProducto`),
  ADD KEY `pedido` (`pedido`,`producto`),
  ADD KEY `producto` (`producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `categoria` (`categoria`,`tipoAnimal`),
  ADD KEY `tipoAnimal` (`tipoAnimal`);

--
-- Indices de la tabla `tipoanimal`
--
ALTER TABLE `tipoanimal`
  ADD PRIMARY KEY (`idTipoAnimal`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `usuariodireccion`
--
ALTER TABLE `usuariodireccion`
  ADD PRIMARY KEY (`idUserDir`),
  ADD KEY `usuario` (`usuario`,`direccion`),
  ADD KEY `direccion` (`direccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT de la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  MODIFY `idPedidoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `tipoanimal`
--
ALTER TABLE `tipoanimal`
  MODIFY `idTipoAnimal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `usuariodireccion`
--
ALTER TABLE `usuariodireccion`
  MODIFY `idUserDir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD CONSTRAINT `pedidoproducto_ibfk_1` FOREIGN KEY (`pedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidoproducto_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tipoAnimal`) REFERENCES `tipoanimal` (`idTipoAnimal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariodireccion`
--
ALTER TABLE `usuariodireccion`
  ADD CONSTRAINT `usuariodireccion_ibfk_1` FOREIGN KEY (`direccion`) REFERENCES `direccion` (`idDireccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuariodireccion_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
