-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: punto_de_venta
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'galletas'),(2,'refrescos'),(3,'enlatado'),(4,'cereales'),(5,'snacks'),(6,'Pienso');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cstate`
--

DROP TABLE IF EXISTS `cstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cstate`
--

LOCK TABLES `cstate` WRITE;
/*!40000 ALTER TABLE `cstate` DISABLE KEYS */;
INSERT INTO `cstate` VALUES (1,'active'),(2,'inactive'),(3,'removed');
/*!40000 ALTER TABLE `cstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_entrada`
--

DROP TABLE IF EXISTS `detalle_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_entrada` (
  `detalle_entrada_id` int(11) NOT NULL AUTO_INCREMENT,
  `entrada_id` int(11) NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`detalle_entrada_id`),
  KEY `entrada_id_fk_detalle_entrada_idx` (`entrada_id`),
  KEY `producto_id_fl_detalle_entrada_idx` (`producto_id`),
  CONSTRAINT `entrada_id_fk_detalle_entrada` FOREIGN KEY (`entrada_id`) REFERENCES `entrada` (`entrada_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_id_fk` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_entrada`
--

LOCK TABLES `detalle_entrada` WRITE;
/*!40000 ALTER TABLE `detalle_entrada` DISABLE KEYS */;
INSERT INTO `detalle_entrada` VALUES (1,21,13.00,10,3),(2,22,13.00,10,3),(3,22,19.20,6,1),(4,23,13.00,10,3),(5,23,19.20,6,1),(6,25,13.00,10,3),(7,25,19.20,6,1),(8,26,13.00,10,3),(9,26,19.20,6,1),(10,27,13.00,10,3),(11,27,19.20,6,1),(12,28,13.00,10,3),(13,28,19.20,6,1),(14,29,13.00,10,3),(15,29,19.20,6,1),(16,30,13.00,10,3),(17,30,19.20,6,1),(20,32,13.00,10,3),(21,32,19.20,6,1),(24,34,13.00,10,3),(25,34,19.20,6,1);
/*!40000 ALTER TABLE `detalle_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_perdida`
--

DROP TABLE IF EXISTS `detalle_perdida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_perdida` (
  `detalle_perdida_id` int(11) NOT NULL AUTO_INCREMENT,
  `perdida_id` int(11) NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`detalle_perdida_id`),
  KEY `perdida_id_fk_idx` (`perdida_id`),
  KEY `producto_id_perdida_idx` (`producto_id`),
  CONSTRAINT `perdida_id_fk` FOREIGN KEY (`perdida_id`) REFERENCES `perdida` (`perdida_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `producto_id_perdida` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_perdida`
--

LOCK TABLES `detalle_perdida` WRITE;
/*!40000 ALTER TABLE `detalle_perdida` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_perdida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `detalle_venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`detalle_venta_id`),
  KEY `venta_id_fk_idx` (`venta_id`),
  KEY `producto_id_fk_venta_idx` (`producto_id`),
  CONSTRAINT `producto_id_fk_venta` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `venta_id_fk` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `empleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `tipo_empleado_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`empleado_id`),
  KEY `persona_id_fk_idx` (`persona_id`),
  KEY `tipo_empleado_id_idx` (`tipo_empleado_id`),
  CONSTRAINT `persona_id_fk` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`person_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tipo_empleado_id` FOREIGN KEY (`tipo_empleado_id`) REFERENCES `tipo_empleado` (`tipo_empleado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,3,'2020-11-10 19:42:38');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada` (
  `entrada_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`entrada_id`),
  KEY `state_id_fk _idx` (`estado_id`),
  KEY `proveedor_id_fk_entrada_idx` (`proveedor_id`),
  KEY `empleado_id_fk_entrada_idx` (`empleado_id`),
  CONSTRAINT `empleado_id_fk_entrada` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedor_id_fk_entrada` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk ` FOREIGN KEY (`estado_id`) REFERENCES `cstate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,'2020-11-12 16:21:58',0.00,1,1,2),(2,'2020-11-12 16:27:47',0.00,1,1,2),(3,'2020-11-12 16:29:01',0.00,1,1,2),(4,'2020-11-12 16:29:52',0.00,1,1,2),(5,'2020-11-12 16:30:31',0.00,1,1,2),(6,'2020-11-12 16:31:33',0.00,1,1,2),(7,'2020-11-12 16:35:25',0.00,1,1,2),(8,'2020-11-12 16:36:55',0.00,1,1,2),(9,'2020-11-12 16:37:26',0.00,1,1,2),(10,'2020-11-12 16:39:49',0.00,1,1,2),(11,'2020-11-12 16:41:02',0.00,1,1,2),(12,'2020-11-12 16:41:48',0.00,1,1,2),(13,'2020-11-12 16:44:36',0.00,1,1,2),(14,'2020-11-12 16:47:17',0.00,1,1,2),(15,'2020-11-12 16:49:58',0.00,1,1,2),(16,'2020-11-12 16:58:01',0.00,1,1,2),(17,'2020-11-12 16:58:24',0.00,1,1,2),(18,'2020-11-12 17:04:47',0.00,1,1,2),(19,'2020-11-12 17:10:13',0.00,1,1,2),(20,'2020-11-12 17:10:48',0.00,1,1,2),(21,'2020-11-12 17:20:13',0.00,1,1,2),(22,'2020-11-12 17:30:09',0.00,1,1,2),(23,'2020-11-12 17:37:02',245.20,1,1,2),(24,'2020-11-12 19:00:10',245.20,1,1,2),(25,'2020-11-12 19:02:47',245.20,1,1,2),(26,'2020-11-12 19:05:43',245.20,1,1,2),(27,'2020-11-12 19:09:28',245.20,1,1,2),(28,'2020-11-12 19:18:22',245.20,1,1,2),(29,'2020-11-12 19:35:06',245.20,2,1,2),(30,'2020-11-12 19:35:06',245.20,2,1,2),(32,'2020-11-12 19:35:06',245.20,2,1,2),(34,'2020-11-12 19:36:06',245.20,1,1,2);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perdida`
--

DROP TABLE IF EXISTS `perdida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perdida` (
  `perdida_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `estado_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`perdida_id`),
  KEY `state_id_fk_perdida_idx` (`estado_id`),
  KEY `empleado_id_fk_perdida_idx` (`empleado_id`),
  CONSTRAINT `empleado_id_fk_perdida` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_perdida` FOREIGN KEY (`estado_id`) REFERENCES `cstate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perdida`
--

LOCK TABLES `perdida` WRITE;
/*!40000 ALTER TABLE `perdida` DISABLE KEYS */;
/*!40000 ALTER TABLE `perdida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `curp` varchar(18) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `genero` varchar(1) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`person_id`,`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'SARM770826MZSNMR76','María de Guadalupe','Sanchez','Ramos','Monllao No. 641','525559224303','juagustin20@yopmail.com','M','2000-11-05'),(2,'MECA770826MTLDRR24','Arturo','Cruz','Medina','Avenida Risaralda No. 868, 27055, Veracruz, Mexico','520503222794','impablo12@yopmail.com','M','1975-09-14'),(3,'SOGJ770826MNTTZR54','Jorge Luis','Soto','Guzman','SAN BUENAVENTURA S/N SN, LA VENTA','525559726929','DanDDavis@superrito.com','M','1991-02-01'),(4,'FEPM770826HQTRRR45','Margarita','Fernandez','Perez','Bulevar Ambel No. 395','123456789012','jytijerin24@yopmail.com','F','1986-06-20');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `codigo_de_barras` varchar(45) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `fecha_de_creación` datetime DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `state_idx` (`estado_id`),
  KEY `barcode_idx` (`codigo_de_barras`),
  KEY `categoria_id_fk_idx` (`categoria_id`),
  CONSTRAINT `categoria_id_fk` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `state` FOREIGN KEY (`estado_id`) REFERENCES `cstate` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Kelloggs CORN FLAKES 150g','7501008101049',1,'2020-11-11 08:39:20',19.20,23.00,77,4),(2,'Pringles Extra Hot 40g','038000159596',1,'2020-11-11 08:39:20',18.10,20.00,10,5),(3,'Ciel Mineralizada 600ml','7501055308248',1,'2020-11-11 09:12:50',13.00,15.00,150,2),(4,'Ciel Mineralizada 600ml','7501055308248',1,'2020-11-11 09:12:50',13.00,15.00,20,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) DEFAULT NULL,
  `organizacion` varchar(45) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `persona_id_fk_proveedor_idx` (`persona_id`),
  CONSTRAINT `persona_id_fk_proveedor` FOREIGN KEY (`persona_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2,2,'Ciel',2,'2020-11-11 20:00:05'),(3,3,'Pringles',1,'2020-11-14 07:22:30');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empleado`
--

DROP TABLE IF EXISTS `tipo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_empleado` (
  `tipo_empleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_de_empleado` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empleado`
--

LOCK TABLES `tipo_empleado` WRITE;
/*!40000 ALTER TABLE `tipo_empleado` DISABLE KEYS */;
INSERT INTO `tipo_empleado` VALUES (1,'administrador'),(2,'moderador'),(3,'cajero');
/*!40000 ALTER TABLE `tipo_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `state_id_fk_idx` (`estado_id`),
  KEY `empleado_id_fk_idx` (`empleado_id`),
  CONSTRAINT `empleado_id_fk-vent` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `state_id_fk-vent` FOREIGN KEY (`estado_id`) REFERENCES `cstate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-20 16:14:46
