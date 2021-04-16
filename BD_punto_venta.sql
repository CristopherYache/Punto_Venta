-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: tarea_bd_2
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `genero` bit(1) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'cristopher','yache','3241434','','324535','criss23@gmail.com','2020-02-23 00:00:00'),(2,'Daniel','Hermandez','23454234','','423544','Dnls@gmail.com','2021-02-13 00:00:00'),(3,'Allan','Gomez','425242324','','5442343','allang@gmail.com','2018-04-12 00:00:00'),(4,'Myra','yache','2344234135','','42342144','Myache@gmail.com','2020-02-22 00:00:00'),(5,'Melissa','Gomez','42352463','','53424624','Meliss@gmail.com','2020-04-21 00:00:00');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compras` (
  `id_compras` int NOT NULL AUTO_INCREMENT,
  `no_orden_compra` int DEFAULT NULL,
  `id_proveerdores` int DEFAULT NULL,
  `fecha_orden` date DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_compras`),
  KEY `id_proveedores_proveedores_compras_idx` (`id_proveerdores`),
  CONSTRAINT `id_proveedores_proveedores_compras` FOREIGN KEY (`id_proveerdores`) REFERENCES `proveedores` (`id_proveedores`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,1,'2020-01-10','2020-01-15 00:00:00'),(2,2,2,'2020-03-14','2020-03-19 00:00:00'),(3,3,3,'2020-04-17','2020-04-23 00:00:00'),(4,4,4,'2020-06-01','2020-07-22 00:00:00'),(5,5,5,'2021-03-17','2021-04-25 00:00:00');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compras_detalle` (
  `id_compras_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_compras` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_costo_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_compras_detalle`),
  KEY `id_compras_compras_compras_detalle_idx` (`id_compras`),
  KEY `id_producto_productos_compras_detalle_idx` (`id_producto`),
  CONSTRAINT `id_compras_compras_compras_detalle` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id_compras`) ON UPDATE CASCADE,
  CONSTRAINT `id_producto_productos_compras_detalle` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
INSERT INTO `compras_detalle` VALUES (1,1,1,32,1900.00),(2,2,2,32,1900.00),(3,3,3,22,2900.00),(4,4,4,15,900.00),(5,5,5,20,100.00);
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `dpi` varchar(15) DEFAULT NULL,
  `genero` bit(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_inicio_laborales` date DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `id_puestos` smallint DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puestos_puestos_empleados_idx` (`id_puestos`),
  CONSTRAINT `id_puestos_puestos_empleados` FOREIGN KEY (`id_puestos`) REFERENCES `puestos` (`id_puestos`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan','Galeno','Antigua','32452143','52342523','','1998-02-21','1999-01-01','2000-02-02 00:00:00',1),(2,'David','Lopez','Jocotenango','4235234','534234123','','2002-04-03','2019-04-23','2020-02-02 00:00:00',2),(3,'Roberto','Monzon','Jocotenango','42342345','423423423','','2002-05-23','2019-05-04','2020-03-23 00:00:00',3),(4,'Ronald','Dleon','Jocotenango','42356323','642374234','','2002-01-12','2019-04-12','2020-01-12 00:00:00',4),(5,'Angel','Gaytan','Antigua','65362432','644323653','','2002-06-23','2020-02-21','2020-03-14 00:00:00',4);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marcas` (
  `id_marcas` smallint NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_marcas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'LG'),(2,'SAMNSUNG'),(3,'Apple'),(4,'Xiaomi'),(5,'ZTE');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) DEFAULT NULL,
  `id_marca` smallint DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `precio_costo` decimal(8,2) DEFAULT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_marca_marcas_productos_idx` (`id_marca`),
  CONSTRAINT `id_marca_marcas_productos` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marcas`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Celuñar',1,'Telefono inteligente','jpg',1900.00,3200.00,32,'2021-02-12 00:00:00'),(2,'TV',2,'Televisor inteligente','jpg',2900.00,5200.00,22,'2020-02-02 00:00:00'),(3,'Audifonos',3,'Audifonos inalambricos','jpg',900.00,1100.00,15,'2020-04-12 00:00:00'),(4,'Bateria de telefono',4,'bateria de telefono','jpg',100.00,1200.00,20,'2020-05-23 00:00:00'),(5,'Telefono',5,'Telefono inteligente','jpg',400.00,900.00,10,'2021-06-21 00:00:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proveedores` (
  `id_proveedores` int NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(45) DEFAULT NULL,
  `nit` varchar(12) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_proveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Carlos','42354523','Antigua','32423423'),(2,'Pedro','42362341','Escuintla','35324231'),(3,'Juan','3423542134','Escuintla','12345678'),(4,'Luis','5324123454','Alotenango','87654321'),(5,'DAvid','5342342652','Guatemala','64535234');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `puestos` (
  `id_puestos` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_puestos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Jefe'),(2,'Gerente'),(3,'Desarrollador'),(4,'Programador'),(5,'Vendedor');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `nofactura` int DEFAULT NULL,
  `serie` char(1) DEFAULT NULL,
  `fechafactura` date DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `int_cliente_clientes_Ventas_idx` (`id_cliente`),
  KEY `id_empleado_empleados_Ventas_idx` (`id_empleado`),
  CONSTRAINT `id_empleado_empleados_Ventas` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON UPDATE CASCADE,
  CONSTRAINT `int_cliente_clientes_Ventas` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,3423,'1','2021-03-12','2021-03-14 00:00:00',1,1),(2,2312,'2','2021-02-02','2021-04-14 00:00:00',2,2),(3,321,'3','2021-04-21','2021-04-28 00:00:00',3,3),(4,5342,'4','2021-05-03','2021-05-20 00:00:00',4,4),(5,6534,'5','2021-07-01','2021-09-02 00:00:00',5,5);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ventas_detalle` (
  `id_ventas_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_ventas_detalle`),
  KEY `id_venta_ventas_ventas_detalle_idx` (`id_venta`),
  KEY `id_producto_productos_ventas_detalle_idx` (`id_producto`),
  CONSTRAINT `id_producto_productos_ventas_detalle` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE,
  CONSTRAINT `id_venta_ventas_ventas_detalle` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (1,1,1,'23',1900.00),(2,2,2,'13',2900.00),(3,3,3,'21',900.00),(4,4,4,'34',100.00),(5,5,5,'31',400.00);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-15 23:27:38
