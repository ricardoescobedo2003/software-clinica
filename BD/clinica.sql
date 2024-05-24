-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: clinica
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `cita_id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `recepcionista_id` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` text,
  PRIMARY KEY (`cita_id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `recepcionista_id` (`recepcionista_id`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`paciente_id`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctores` (`doctor_id`),
  CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`recepcionista_id`) REFERENCES `recepcionistas` (`recepcionista_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `consulta_id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `motivo` text,
  `diagnostico` text,
  PRIMARY KEY (`consulta_id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`paciente_id`),
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctores` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctores`
--

DROP TABLE IF EXISTS `doctores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctores` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `especialidad` varchar(255) NOT NULL,
  `numero_licencia` varchar(255) DEFAULT NULL,
  `telefono_movil` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `direccion` text,
  `anios_experiencia` int DEFAULT NULL,
  `educacion` text,
  `afiliaciones` text,
  `idiomas` text,
  `horario_trabajo` text,
  `disponibilidad` text,
  `salario` decimal(10,2) DEFAULT NULL,
  `tipo_contrato` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `supervisores` text,
  `subordinados` text,
  `historial_consultas` text,
  `prescripciones_realizadas` text,
  `evaluaciones_comentarios` text,
  `usuario` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `permisos_roles` text,
  `actividades_recientes` text,
  `notas_adicionales` text,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `numero_licencia` (`numero_licencia`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctores`
--

LOCK TABLES `doctores` WRITE;
/*!40000 ALTER TABLE `doctores` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `paciente_id` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `direccion` text,
  `numero_seguro_social` varchar(50) DEFAULT NULL,
  `historial_medico` text,
  `alergias` text,
  `medicamentos_actuales` text,
  `historial_consultas` text,
  `historial_prescripciones` text,
  `notas_comentarios` text,
  `fecha_registro` date DEFAULT NULL,
  `contacto_emergencia` varchar(255) DEFAULT NULL,
  `relacion_contacto_emergencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`paciente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescripciones`
--

DROP TABLE IF EXISTS `prescripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescripciones` (
  `prescripcion_id` int NOT NULL AUTO_INCREMENT,
  `consulta_id` int DEFAULT NULL,
  `medicamento` varchar(255) DEFAULT NULL,
  `dosis` varchar(255) DEFAULT NULL,
  `duracion` varchar(255) DEFAULT NULL,
  `instrucciones` text,
  PRIMARY KEY (`prescripcion_id`),
  KEY `consulta_id` (`consulta_id`),
  CONSTRAINT `prescripciones_ibfk_1` FOREIGN KEY (`consulta_id`) REFERENCES `consultas` (`consulta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescripciones`
--

LOCK TABLES `prescripciones` WRITE;
/*!40000 ALTER TABLE `prescripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcionistas`
--

DROP TABLE IF EXISTS `recepcionistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcionistas` (
  `recepcionista_id` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `direccion` text,
  `fecha_contratacion` date DEFAULT NULL,
  `horario_trabajo` text,
  `salario` decimal(10,2) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `permisos_roles` text,
  `actividades_recientes` text,
  `notas_comentarios` text,
  PRIMARY KEY (`recepcionista_id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionistas`
--

LOCK TABLES `recepcionistas` WRITE;
/*!40000 ALTER TABLE `recepcionistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcionistas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 21:00:21
