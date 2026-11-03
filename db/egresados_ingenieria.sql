/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: egresados_ingenieria
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calidad_incidencia`
--

DROP TABLE IF EXISTS `calidad_incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calidad_incidencia` (
  `incidencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_regla` varchar(10) NOT NULL,
  `egresado_id` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `severidad` varchar(20) NOT NULL,
  `estado` varchar(20) DEFAULT 'abierta',
  `detectado_en` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`incidencia_id`),
  KEY `fk_incidencia_egresado` (`egresado_id`),
  CONSTRAINT `fk_incidencia_egresado` FOREIGN KEY (`egresado_id`) REFERENCES `egresado` (`egresado_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calidad_incidencia`
--

LOCK TABLES `calidad_incidencia` WRITE;
/*!40000 ALTER TABLE `calidad_incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `calidad_incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_area_desempeno`
--

DROP TABLE IF EXISTS `cat_area_desempeno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_area_desempeno` (
  `area_desempeno_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`area_desempeno_id`),
  UNIQUE KEY `nombre_area` (`nombre_area`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_area_desempeno`
--

LOCK TABLES `cat_area_desempeno` WRITE;
/*!40000 ALTER TABLE `cat_area_desempeno` DISABLE KEYS */;
INSERT INTO `cat_area_desempeno` VALUES
(1,'Desarrollo de Software',NULL),
(2,'Gestión de Datos y Analítica',NULL),
(3,'Automatización y Robótica',NULL),
(4,'Consultoría Empresarial',NULL);
/*!40000 ALTER TABLE `cat_area_desempeno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_cargo_alias`
--

DROP TABLE IF EXISTS `cat_cargo_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_cargo_alias` (
  `alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_normalizado_id` int(11) NOT NULL,
  `alias_texto` varchar(100) NOT NULL,
  PRIMARY KEY (`alias_id`),
  UNIQUE KEY `alias_texto` (`alias_texto`),
  KEY `fk_cargo_alias` (`cargo_normalizado_id`),
  CONSTRAINT `fk_cargo_alias` FOREIGN KEY (`cargo_normalizado_id`) REFERENCES `cat_cargo_normalizado` (`cargo_normalizado_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_cargo_alias`
--

LOCK TABLES `cat_cargo_alias` WRITE;
/*!40000 ALTER TABLE `cat_cargo_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_cargo_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_cargo_normalizado`
--

DROP TABLE IF EXISTS `cat_cargo_normalizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_cargo_normalizado` (
  `cargo_normalizado_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cargo_base` varchar(100) NOT NULL,
  PRIMARY KEY (`cargo_normalizado_id`),
  UNIQUE KEY `nombre_cargo_base` (`nombre_cargo_base`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_cargo_normalizado`
--

LOCK TABLES `cat_cargo_normalizado` WRITE;
/*!40000 ALTER TABLE `cat_cargo_normalizado` DISABLE KEYS */;
INSERT INTO `cat_cargo_normalizado` VALUES
(2,'Científico de Datos'),
(5,'Consultor Senior'),
(1,'Ingeniero de Software'),
(3,'Ingeniero Mecatrónico'),
(4,'Líder Técnico / Tech Lead');
/*!40000 ALTER TABLE `cat_cargo_normalizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_fuente`
--

DROP TABLE IF EXISTS `cat_fuente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_fuente` (
  `fuente_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_fuente` varchar(100) NOT NULL,
  `confianza_base` int(11) DEFAULT NULL CHECK (`confianza_base` between 0 and 100),
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`fuente_id`),
  UNIQUE KEY `nombre_fuente` (`nombre_fuente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_fuente`
--

LOCK TABLES `cat_fuente` WRITE;
/*!40000 ALTER TABLE `cat_fuente` DISABLE KEYS */;
INSERT INTO `cat_fuente` VALUES
(1,'Registro Institucional de Grados',90,'Base de datos oficial de graduados de la Universidad'),
(2,'Formulario de Autoactualización',95,'Datos actualizados directamente por el egresado'),
(3,'Exportación Datos LinkedIn',90,'Archivo ZIP de datos descargado por el egresado'),
(4,'Captura Manual Pública',60,'Búsqueda manual en perfiles públicos');
/*!40000 ALTER TABLE `cat_fuente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_institucion`
--

DROP TABLE IF EXISTS `cat_institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_institucion` (
  `institucion_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_institucion` varchar(150) NOT NULL,
  `es_propia` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`institucion_id`),
  UNIQUE KEY `nombre_institucion` (`nombre_institucion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_institucion`
--

LOCK TABLES `cat_institucion` WRITE;
/*!40000 ALTER TABLE `cat_institucion` DISABLE KEYS */;
INSERT INTO `cat_institucion` VALUES
(1,'Universidad Nacional de Colombia',1),
(2,'Universidad de los Andes',0),
(3,'Politécnico Grancolombiano',0);
/*!40000 ALTER TABLE `cat_institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_institucion_alias`
--

DROP TABLE IF EXISTS `cat_institucion_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_institucion_alias` (
  `alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `institucion_id` int(11) NOT NULL,
  `alias_texto` varchar(150) NOT NULL,
  PRIMARY KEY (`alias_id`),
  UNIQUE KEY `alias_texto` (`alias_texto`),
  KEY `fk_inst_alias` (`institucion_id`),
  CONSTRAINT `fk_inst_alias` FOREIGN KEY (`institucion_id`) REFERENCES `cat_institucion` (`institucion_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_institucion_alias`
--

LOCK TABLES `cat_institucion_alias` WRITE;
/*!40000 ALTER TABLE `cat_institucion_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_institucion_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_nivel_jerarquico`
--

DROP TABLE IF EXISTS `cat_nivel_jerarquico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_nivel_jerarquico` (
  `nivel_jerarquico_id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` int(11) NOT NULL,
  `nombre_nivel` varchar(50) NOT NULL,
  PRIMARY KEY (`nivel_jerarquico_id`),
  UNIQUE KEY `nivel` (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_nivel_jerarquico`
--

LOCK TABLES `cat_nivel_jerarquico` WRITE;
/*!40000 ALTER TABLE `cat_nivel_jerarquico` DISABLE KEYS */;
INSERT INTO `cat_nivel_jerarquico` VALUES
(1,1,'Junior / Operativo'),
(2,2,'Mid-Level / Profesional'),
(3,3,'Senior / Especialista'),
(4,4,'Líder / Coordinador'),
(5,5,'Gerencia / Dirección');
/*!40000 ALTER TABLE `cat_nivel_jerarquico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_programa`
--

DROP TABLE IF EXISTS `cat_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_programa` (
  `programa_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_snies` varchar(20) NOT NULL,
  `nombre_programa` varchar(150) NOT NULL,
  `es_facultad` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`programa_id`),
  UNIQUE KEY `codigo_snies` (`codigo_snies`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_programa`
--

LOCK TABLES `cat_programa` WRITE;
/*!40000 ALTER TABLE `cat_programa` DISABLE KEYS */;
INSERT INTO `cat_programa` VALUES
(1,'101','Ingeniería de Sistemas y Computación',1),
(2,'102','Ingeniería Mecatrónica',1),
(3,'103','Ingeniería Industrial',1),
(4,'999','Maestría en Ingeniería de Sistemas',0);
/*!40000 ALTER TABLE `cat_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_programa_alias`
--

DROP TABLE IF EXISTS `cat_programa_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_programa_alias` (
  `alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `programa_id` int(11) NOT NULL,
  `alias_texto` varchar(150) NOT NULL,
  PRIMARY KEY (`alias_id`),
  UNIQUE KEY `alias_texto` (`alias_texto`),
  KEY `fk_prog_alias` (`programa_id`),
  CONSTRAINT `fk_prog_alias` FOREIGN KEY (`programa_id`) REFERENCES `cat_programa` (`programa_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_programa_alias`
--

LOCK TABLES `cat_programa_alias` WRITE;
/*!40000 ALTER TABLE `cat_programa_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_programa_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_sector_ciiu`
--

DROP TABLE IF EXISTS `cat_sector_ciiu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_sector_ciiu` (
  `sector_ciiu_id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ciiu` varchar(10) NOT NULL,
  `seccion` varchar(5) NOT NULL,
  `descripcion_seccion` varchar(255) NOT NULL,
  `division` varchar(5) NOT NULL,
  `descripcion_division` varchar(255) NOT NULL,
  PRIMARY KEY (`sector_ciiu_id`),
  UNIQUE KEY `codigo_ciiu` (`codigo_ciiu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_sector_ciiu`
--

LOCK TABLES `cat_sector_ciiu` WRITE;
/*!40000 ALTER TABLE `cat_sector_ciiu` DISABLE KEYS */;
INSERT INTO `cat_sector_ciiu` VALUES
(1,'6201','J','Información y comunicaciones','62','Desarrollo de software y consultoría'),
(2,'6411','K','Actividades financieras y de seguros','64','Servicios financieros y banca'),
(3,'2811','C','Industria manufacturera','28','Fabricación de maquinaria de uso general');
/*!40000 ALTER TABLE `cat_sector_ciiu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_ubicacion`
--

DROP TABLE IF EXISTS `cat_ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_ubicacion` (
  `ubicacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  `codigo_iso_pais` char(2) NOT NULL,
  `departamento_o_estado` varchar(100) DEFAULT NULL,
  `municipio_o_ciudad` varchar(100) DEFAULT NULL,
  `codigo_divipola` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ubicacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_ubicacion`
--

LOCK TABLES `cat_ubicacion` WRITE;
/*!40000 ALTER TABLE `cat_ubicacion` DISABLE KEYS */;
INSERT INTO `cat_ubicacion` VALUES
(1,'Colombia','CO','Bogotá D.C.','Bogotá','11001'),
(2,'Colombia','CO','Antioquia','Medellín','05001'),
(3,'Alemania','DE','Baviera','Múnich','DE-MU');
/*!40000 ALTER TABLE `cat_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consentimiento`
--

DROP TABLE IF EXISTS `consentimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consentimiento` (
  `consentimiento_id` int(11) NOT NULL AUTO_INCREMENT,
  `egresado_id` int(11) NOT NULL,
  `otorgado` tinyint(1) NOT NULL,
  `fecha_otorgamiento` datetime DEFAULT current_timestamp(),
  `canal_recoleccion` varchar(50) NOT NULL,
  `version_politica` varchar(20) NOT NULL,
  `finalidad` text NOT NULL,
  PRIMARY KEY (`consentimiento_id`),
  KEY `fk_consentimiento_egresado` (`egresado_id`),
  CONSTRAINT `fk_consentimiento_egresado` FOREIGN KEY (`egresado_id`) REFERENCES `egresado` (`egresado_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consentimiento`
--

LOCK TABLES `consentimiento` WRITE;
/*!40000 ALTER TABLE `consentimiento` DISABLE KEYS */;
INSERT INTO `consentimiento` VALUES
(1,1,1,'2026-11-03 02:46:00','Formulario Web','v1.0','Seguimiento institucional de egresados'),
(2,2,1,'2026-11-03 02:46:00','Formulario Web','v1.0','Seguimiento institucional de egresados'),
(3,3,1,'2026-11-03 02:46:00','Carga Archivo ZIP','v1.0','Seguimiento institucional de egresados'),
(4,4,1,'2026-11-03 02:46:00','Formulario Web','v1.0','Seguimiento institucional de egresados');
/*!40000 ALTER TABLE `consentimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresado`
--

DROP TABLE IF EXISTS `egresado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `egresado` (
  `egresado_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_publico` char(36) NOT NULL,
  `documento_hash` varchar(64) DEFAULT NULL,
  `linkedin_slug` varchar(100) DEFAULT NULL,
  `estado_registro` varchar(30) DEFAULT 'activo',
  `fusionado_en_id` int(11) DEFAULT NULL,
  `creado_en` datetime DEFAULT current_timestamp(),
  `actualizado_en` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`egresado_id`),
  UNIQUE KEY `uuid_publico` (`uuid_publico`),
  UNIQUE KEY `documento_hash` (`documento_hash`),
  UNIQUE KEY `linkedin_slug` (`linkedin_slug`),
  KEY `fk_egresado_fusion` (`fusionado_en_id`),
  CONSTRAINT `fk_egresado_fusion` FOREIGN KEY (`fusionado_en_id`) REFERENCES `egresado` (`egresado_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresado`
--

LOCK TABLES `egresado` WRITE;
/*!40000 ALTER TABLE `egresado` DISABLE KEYS */;
INSERT INTO `egresado` VALUES
(1,'04c539ca-d755-11f1-b56e-b469218dbada','hash_doc_001','juliana-parra-dev','activo',NULL,'2026-11-03 02:46:00','2026-11-03 02:46:00'),
(2,'04c53d9d-d755-11f1-b56e-b469218dbada','hash_doc_002','nicolas-martinez-data','activo',NULL,'2026-11-03 02:46:00','2026-11-03 02:46:00'),
(3,'04c53e73-d755-11f1-b56e-b469218dbada','hash_doc_003','carlos-rodriguez-mec','activo',NULL,'2026-11-03 02:46:00','2026-11-03 02:46:00'),
(4,'04c53ec8-d755-11f1-b56e-b469218dbada','hash_doc_004','andrea-gomez-lead','activo',NULL,'2026-11-03 02:46:00','2026-11-03 02:46:00'),
(5,'04c53f19-d755-11f1-b56e-b469218dbada','hash_doc_005','mateo-silva-consultant','activo',NULL,'2026-11-03 02:46:00','2026-11-03 02:46:00'),
(6,'04c53f69-d755-11f1-b56e-b469218dbada','hash_doc_006','laura-torres-ing','activo',NULL,'2026-11-03 02:46:00','2026-11-03 02:46:00'),
(7,'04c53fae-d755-11f1-b56e-b469218dbada','hash_doc_007','carlos-rodriguez-andes','activo',NULL,'2026-11-03 02:46:00','2026-11-03 02:46:00'),
(8,'04c53ffb-d755-11f1-b56e-b469218dbada','hash_doc_008','j-parra-dup','fusionado',1,'2026-11-03 02:46:00','2026-11-03 02:46:00');
/*!40000 ALTER TABLE `egresado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_oficial` varchar(150) NOT NULL,
  `nombre_normalizado` varchar(150) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `sector_ciiu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  UNIQUE KEY `nombre_normalizado` (`nombre_normalizado`),
  UNIQUE KEY `nit` (`nit`),
  KEY `fk_empresa_sector` (`sector_ciiu_id`),
  CONSTRAINT `fk_empresa_sector` FOREIGN KEY (`sector_ciiu_id`) REFERENCES `cat_sector_ciiu` (`sector_ciiu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES
(1,'Globant Colombia S.A.S.','globant','900123456',1),
(2,'Bancolombia S.A.','bancolombia','890903938',2),
(3,'Rappi S.A.S.','rappi','900843936',1),
(4,'Siemens AG','siemens','860002134',3);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencia_laboral` (
  `experiencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `egresado_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `cargo_original` varchar(150) NOT NULL,
  `cargo_estandar_id` int(11) DEFAULT NULL,
  `area_desempeno_id` int(11) DEFAULT NULL,
  `nivel_jerarquico_id` int(11) DEFAULT NULL,
  `tipo_vinculacion` varchar(50) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `precision_inicio` varchar(10) DEFAULT 'Y-m',
  `es_actual` tinyint(1) NOT NULL DEFAULT 0,
  `ubicacion_id` int(11) DEFAULT NULL,
  `fuente_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `nivel_confianza` int(11) DEFAULT NULL CHECK (`nivel_confianza` between 0 and 100),
  `estado_verificacion` varchar(30) DEFAULT 'sin_verificar',
  `creado_en` datetime DEFAULT current_timestamp(),
  `actualizado_en` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`experiencia_id`),
  UNIQUE KEY `uq_experiencia` (`egresado_id`,`empresa_id`,`cargo_original`,`fecha_inicio`),
  KEY `fk_exp_empresa` (`empresa_id`),
  KEY `fk_exp_cargo` (`cargo_estandar_id`),
  KEY `fk_exp_area` (`area_desempeno_id`),
  KEY `fk_exp_nivel` (`nivel_jerarquico_id`),
  KEY `fk_exp_ubicacion` (`ubicacion_id`),
  KEY `fk_exp_fuente` (`fuente_id`),
  KEY `fk_exp_lote` (`lote_id`),
  CONSTRAINT `fk_exp_area` FOREIGN KEY (`area_desempeno_id`) REFERENCES `cat_area_desempeno` (`area_desempeno_id`),
  CONSTRAINT `fk_exp_cargo` FOREIGN KEY (`cargo_estandar_id`) REFERENCES `cat_cargo_normalizado` (`cargo_normalizado_id`),
  CONSTRAINT `fk_exp_egresado` FOREIGN KEY (`egresado_id`) REFERENCES `egresado` (`egresado_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_exp_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  CONSTRAINT `fk_exp_fuente` FOREIGN KEY (`fuente_id`) REFERENCES `cat_fuente` (`fuente_id`),
  CONSTRAINT `fk_exp_lote` FOREIGN KEY (`lote_id`) REFERENCES `lote_carga` (`lote_id`),
  CONSTRAINT `fk_exp_nivel` FOREIGN KEY (`nivel_jerarquico_id`) REFERENCES `cat_nivel_jerarquico` (`nivel_jerarquico_id`),
  CONSTRAINT `fk_exp_ubicacion` FOREIGN KEY (`ubicacion_id`) REFERENCES `cat_ubicacion` (`ubicacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci WITH SYSTEM VERSIONING;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencia_laboral`
--

LOCK TABLES `experiencia_laboral` WRITE;
/*!40000 ALTER TABLE `experiencia_laboral` DISABLE KEYS */;
INSERT INTO `experiencia_laboral` VALUES
(1,1,1,'Backend Developer (Go/Python)',1,1,2,'Empleado Tiempo Completo','2024-06-01',NULL,'Y-m',1,1,2,1,95,'verificado_egresado','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(2,2,2,'Data Scientist',2,2,3,'Empleado Tiempo Completo','2023-08-01',NULL,'Y-m',1,2,2,1,95,'verificado_egresado','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(3,3,4,'Automation Engineer',3,3,3,'Empleado Tiempo Completo','2023-01-15',NULL,'Y-m',1,3,3,1,90,'verificado_egresado','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(4,4,3,'Tech Lead',4,1,4,'Empleado Tiempo Completo','2023-03-01',NULL,'Y-m',1,1,2,1,95,'verificado_egresado','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(5,5,1,'Senior Business Consultant',5,4,3,'Empleado Tiempo Completo','2022-02-01',NULL,'Y-m',1,1,4,1,60,'sin_verificar','2026-11-03 02:46:00','2026-11-03 02:46:00');
/*!40000 ALTER TABLE `experiencia_laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formacion_academica`
--

DROP TABLE IF EXISTS `formacion_academica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `formacion_academica` (
  `formacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `egresado_id` int(11) NOT NULL,
  `programa_id` int(11) DEFAULT NULL,
  `institucion_id` int(11) DEFAULT NULL,
  `texto_original_programa` varchar(200) DEFAULT NULL,
  `anio_grado` int(11) DEFAULT NULL CHECK (`anio_grado` between 1950 and 2100),
  `nivel_formacion` varchar(50) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `nivel_confianza` int(11) DEFAULT NULL CHECK (`nivel_confianza` between 0 and 100),
  `estado_verificacion` varchar(30) DEFAULT 'sin_verificar',
  `creado_en` datetime DEFAULT current_timestamp(),
  `actualizado_en` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`formacion_id`),
  KEY `fk_formacion_egresado` (`egresado_id`),
  KEY `fk_formacion_programa` (`programa_id`),
  KEY `fk_formacion_institucion` (`institucion_id`),
  KEY `fk_formacion_fuente` (`fuente_id`),
  KEY `fk_formacion_lote` (`lote_id`),
  CONSTRAINT `fk_formacion_egresado` FOREIGN KEY (`egresado_id`) REFERENCES `egresado` (`egresado_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_formacion_fuente` FOREIGN KEY (`fuente_id`) REFERENCES `cat_fuente` (`fuente_id`),
  CONSTRAINT `fk_formacion_institucion` FOREIGN KEY (`institucion_id`) REFERENCES `cat_institucion` (`institucion_id`),
  CONSTRAINT `fk_formacion_lote` FOREIGN KEY (`lote_id`) REFERENCES `lote_carga` (`lote_id`),
  CONSTRAINT `fk_formacion_programa` FOREIGN KEY (`programa_id`) REFERENCES `cat_programa` (`programa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci WITH SYSTEM VERSIONING;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formacion_academica`
--

LOCK TABLES `formacion_academica` WRITE;
/*!40000 ALTER TABLE `formacion_academica` DISABLE KEYS */;
INSERT INTO `formacion_academica` VALUES
(1,1,1,1,'Ingeniería de Sistemas y Computación',2024,'Pregrado',1,1,90,'verificado_institucional','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(2,2,1,1,'Ing. de Sistemas',2023,'Pregrado',1,1,90,'verificado_institucional','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(3,3,2,1,'Ingeniería Mecatrónica',2022,'Pregrado',1,1,90,'verificado_institucional','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(4,4,1,1,'Ingeniería de Sistemas',2020,'Pregrado',1,1,90,'verificado_institucional','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(5,4,4,1,'Maestría en Ingeniería de Sistemas',2023,'Posgrado',2,1,95,'verificado_egresado','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(6,5,3,1,'Ingeniería Industrial',2021,'Pregrado',1,1,90,'verificado_institucional','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(7,6,1,1,'Ingeniería de Sistemas',2025,'Pregrado',1,1,90,'verificado_institucional','2026-11-03 02:46:00','2026-11-03 02:46:00'),
(8,7,1,2,'Ingeniería de Sistemas',2022,'Pregrado',4,1,60,'sin_verificar','2026-11-03 02:46:00','2026-11-03 02:46:00');
/*!40000 ALTER TABLE `formacion_academica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_exclusion`
--

DROP TABLE IF EXISTS `lista_exclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_exclusion` (
  `exclusion_id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_hash` varchar(64) DEFAULT NULL,
  `linkedin_slug` varchar(100) DEFAULT NULL,
  `motivo` varchar(255) NOT NULL,
  `registrado_en` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`exclusion_id`),
  UNIQUE KEY `documento_hash` (`documento_hash`),
  UNIQUE KEY `linkedin_slug` (`linkedin_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_exclusion`
--

LOCK TABLES `lista_exclusion` WRITE;
/*!40000 ALTER TABLE `lista_exclusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_exclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote_carga`
--

DROP TABLE IF EXISTS `lote_carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote_carga` (
  `lote_id` int(11) NOT NULL AUTO_INCREMENT,
  `fuente_id` int(11) NOT NULL,
  `archivo_hash` char(64) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `registros_leidos` int(11) DEFAULT 0,
  `registros_insertados` int(11) DEFAULT 0,
  `registros_actualizados` int(11) DEFAULT 0,
  `estado` varchar(30) DEFAULT 'procesando',
  `creado_en` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`lote_id`),
  UNIQUE KEY `archivo_hash` (`archivo_hash`),
  KEY `fk_lote_fuente` (`fuente_id`),
  CONSTRAINT `fk_lote_fuente` FOREIGN KEY (`fuente_id`) REFERENCES `cat_fuente` (`fuente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote_carga`
--

LOCK TABLES `lote_carga` WRITE;
/*!40000 ALTER TABLE `lote_carga` DISABLE KEYS */;
INSERT INTO `lote_carga` VALUES
(1,1,'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','carga_inicial_2026.csv',8,8,0,'completado','2026-11-03 02:46:00');
/*!40000 ALTER TABLE `lote_carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_candidato`
--

DROP TABLE IF EXISTS `match_candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_candidato` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `staging_id` int(11) NOT NULL,
  `egresado_id` int(11) NOT NULL,
  `puntaje_total` decimal(5,2) NOT NULL,
  `puntaje_nombre` decimal(5,2) DEFAULT NULL,
  `puntaje_programa` decimal(5,2) DEFAULT NULL,
  `puntaje_anio` decimal(5,2) DEFAULT NULL,
  `puntaje_institucion` decimal(5,2) DEFAULT NULL,
  `estado_decision` varchar(30) DEFAULT 'pendiente_revision',
  PRIMARY KEY (`match_id`),
  KEY `fk_match_staging` (`staging_id`),
  KEY `fk_match_egresado` (`egresado_id`),
  CONSTRAINT `fk_match_egresado` FOREIGN KEY (`egresado_id`) REFERENCES `egresado` (`egresado_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_match_staging` FOREIGN KEY (`staging_id`) REFERENCES `staging_perfil` (`staging_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_candidato`
--

LOCK TABLES `match_candidato` WRITE;
/*!40000 ALTER TABLE `match_candidato` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging_perfil`
--

DROP TABLE IF EXISTS `staging_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_perfil` (
  `staging_id` int(11) NOT NULL AUTO_INCREMENT,
  `lote_id` int(11) NOT NULL,
  `fila_numero` int(11) NOT NULL,
  `payload_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload_json`)),
  `hash_fila` char(64) NOT NULL,
  `purgar_despues` datetime NOT NULL,
  `procesado` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`staging_id`),
  KEY `fk_staging_lote` (`lote_id`),
  CONSTRAINT `fk_staging_lote` FOREIGN KEY (`lote_id`) REFERENCES `lote_carga` (`lote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_perfil`
--

LOCK TABLES `staging_perfil` WRITE;
/*!40000 ALTER TABLE `staging_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_perfil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-03  3:21:20
