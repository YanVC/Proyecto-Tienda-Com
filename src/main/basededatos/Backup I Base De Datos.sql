-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_com
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idcargo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Admin',1),(2,'Cliente',1),(3,'Usuario',1);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` int NOT NULL,
  `idsexo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `idcliente_sexo_idx` (`idsexo`),
  CONSTRAINT `idcliente_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (123,1,'Johan','312020202020','johanvanegas@gmail.com','Quibdo',1,'2023-10-09',''),(322,1,'djwojwdo','1122121','1211','ewew',1,'2023-10-04','Nit'),(999,2,'joj','oj','ojo','ojoj',1,'2023-10-04','Tarjeta de Identidad'),(2334,3,'jajdwwdopj','oo','joj','fefee',1,'2023-10-10','Tarjeta de Identidad'),(21112,2,'1','1','121','232',1,'2023-10-04','Cedula'),(77474,2,'JOOOOOOOOOOOOOO','jawdpojowjpoawd','32332','1',0,'2023-10-03','Seleccionar:');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_com_prod`
--

DROP TABLE IF EXISTS `fact_com_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_com_prod` (
  `idfact_com_prod` int NOT NULL AUTO_INCREMENT,
  `idfact_com` int NOT NULL,
  `idpro` int NOT NULL,
  `cantidad_com` int NOT NULL,
  `pre_uni` int NOT NULL,
  `pre_total` int NOT NULL,
  PRIMARY KEY (`idfact_com_prod`),
  KEY `idproducto_idx` (`idpro`),
  KEY `idfact_comp_idx` (`idfact_com`),
  CONSTRAINT `idfact_comp` FOREIGN KEY (`idfact_com`) REFERENCES `fact_comp` (`idfact_comp`),
  CONSTRAINT `idpro` FOREIGN KEY (`idpro`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_com_prod`
--

LOCK TABLES `fact_com_prod` WRITE;
/*!40000 ALTER TABLE `fact_com_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_com_prod` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Automatizacion_Total_Compra` BEFORE INSERT ON `fact_com_prod` FOR EACH ROW BEGIN
set new.pre_total = new.cantidad_com * new.pre_uni;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Automatizacion_Cantidad_Precio` AFTER INSERT ON `fact_com_prod` FOR EACH ROW BEGIN
update producto inner join fact_com_prod on fact_com_prod.idpro = producto.idproducto set cantidad = cantidad + new.cantidad_com, precio = new.pre_uni+ (new.pre_uni*0.20) where idpro = producto.idproducto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fact_comp`
--

DROP TABLE IF EXISTS `fact_comp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_comp` (
  `idfact_comp` int NOT NULL AUTO_INCREMENT,
  `idProveedor` int NOT NULL,
  `idusu` int NOT NULL,
  `fecha` date NOT NULL,
  `total_comp` int NOT NULL,
  `descuento` float NOT NULL,
  `tipodepago` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idfact_comp`),
  KEY `idProveedor_idx` (`idProveedor`),
  KEY `idusuario_idx` (`idusu`),
  CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusu` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_comp`
--

LOCK TABLES `fact_comp` WRITE;
/*!40000 ALTER TABLE `fact_comp` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_comp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `tipopago` varchar(45) NOT NULL,
  `impuesto` float NOT NULL,
  `totalfactura` float NOT NULL,
  `cedula` int NOT NULL,
  `idusuario` int NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `cedula_idx` (`cedula`),
  KEY `idusuario_idx` (`idusuario`),
  CONSTRAINT `cedula` FOREIGN KEY (`cedula`) REFERENCES `cliente` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mostrar_cargo`
--

DROP TABLE IF EXISTS `mostrar_cargo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cargo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cargo` AS SELECT 
 1 AS `idcargo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_cliente`
--

DROP TABLE IF EXISTS `mostrar_cliente`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cliente` AS SELECT 
 1 AS `Cedula`,
 1 AS `Genero`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `Direccion`,
 1 AS `FechaDeNacimiento`,
 1 AS `TipoDeDocumento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_producto`
--

DROP TABLE IF EXISTS `mostrar_producto`;
/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_producto` AS SELECT 
 1 AS `Identificador`,
 1 AS `NombreDelProducto`,
 1 AS `DescripcionDelProducto`,
 1 AS `Existencias`,
 1 AS `ImagenDelProducto`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_proveedor`
--

DROP TABLE IF EXISTS `mostrar_proveedor`;
/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_proveedor` AS SELECT 
 1 AS `Identificacion`,
 1 AS `Genero`,
 1 AS `TipoDeDocumento`,
 1 AS `Nombre`,
 1 AS `Correo`,
 1 AS `Telefono`,
 1 AS `Direccion`,
 1 AS `TipoDePersona`,
 1 AS `FechaDeNacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_sexo`
--

DROP TABLE IF EXISTS `mostrar_sexo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_sexo` AS SELECT 
 1 AS `idsexo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_usuario`
--

DROP TABLE IF EXISTS `mostrar_usuario`;
/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_usuario` AS SELECT 
 1 AS `Identificador`,
 1 AS `Genero`,
 1 AS `Cargo`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `Direccion`,
 1 AS `FechaDeNacimiento`,
 1 AS `TipoDeDocumento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `imagen` longblob,
  `precio` float NOT NULL,
  `condicion` tinyint NOT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Mouse','Funciona',74,NULL,24000,1,''),(2,'TV','nose',39,NULL,24000,1,''),(3,'PC','ei',20,NULL,90000,1,''),(4,'Laptop','membe',84,NULL,24000,1,''),(5,'Celular','bemba',30,NULL,2000,1,''),(6,'Bomba','idk',40,NULL,24000,0,''),(14,'1q3','123',0,NULL,0,1,NULL),(15,'BOMBANUCLEAR','BEMBARAYO',0,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n�\�\0C\0�\�\0C��\0\0h\0h\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0=\0\0\0\0\0\0\0!1	Q�\n\"Aaq�2���\��\�#RrB�����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0 \0\0\0\0\0\0\0\0\0\0\0\01Q�!q�����\�\0\0\0?\0��)�&ȏ�r���MK\�\��}�ף���\�Q\�>\�.�\���9\�\�\���:�(w(d@��m@SH\��\0\�?}U0\�:\�3��:�\�ϗ�]I�\�\�\��x�:I\�#�\��\0�?}C�K?p��\0�g��\�MU)J �\�\��\�\�\�2u<�7r�����(y{�\0����\��\�\�ش�k��{,��\�Z\�u<<\�I�$���.����\�U�Mc\"\ngT�6���p)Ja\�>��/��\"\�P���\0\0z\�ÿ\��\0^�\�\�f�W�\��ܺB���\�({`ڕ�jhH&6\�ިzF��k\�\�bf���=F�t\�$�sX\�\�AB�@\�m\�\��2N$�gFZ�\�ԀQ���>w�#P\�J��p���Y\�p\�\�ϐ\�\�<S��[s\�	\�c�0=@|C\\���\�՘7	#���\\W\��\�G\�*\�u\�R%�7K<1�9�����P��\���\�.�ە5\Z\�}yG1D�D\�3E�즖�U�z!W*�E�tL�g \�Q�\�4�\"��q0��\0ox�P�\�ƭ��-\n�ʮ�y�\n��\� s\�N��\�\�F�p{�\�u�ݕc~.Mot-�E���l�\�w(�\�B\�M8�n1,��H�+��Hx�޼m����P�*�.\\տ�-�N6ۛ\�|\�~RI7$��m��ʎ-���!Y��9S\0�$\�Q)\�Ծ\�3\�y��k ^@ͼ��\�1��>�L\�\�VQ\0����#\�\�\�=1��s�51�\��R\�M�!\0\0��\0t��\�<\��\�G\����\�)p�~?��\0`\0ݨ\�\�&wk\�\�\�iݟ��\�E\�>��i�\�%�?x�n�n��JF�bdĦT\�K�\�\� >\�4\�p�u\�\�\�T\nҔ\�8\�Uyq�8���\�C�R3QU=C�\����醋���ҘpC\�\��v\�	P]��\�9�*\�S\�u\�h\�uM\�\�5\�o)\�1\�|�b������L\n\'\�VJ\�EBa6_���\�O~�.u�\�(M�v}\�:�p�\"ǯ~*�iYS�\�������٫�<ۋ)\�Ӕ�H@-\�U\�\�4Ѥ���؈6ZE���\\�\�g/K\�eJ\�Jb�\�\���@B�3�F\��\�	O����*�懆X�T\�:�\\\�\�\�zK�\�\�Y\���Ȉ�w$IA\�P�Z��\�9DAD�N�\Z�E?�ݚE�8��\�:\�&�@Dy5\��Δ��m��}�mo\�}�J\���\� pW�\�Z���t\�\�S6���\�84�B�TZ\�\"@\�S��!��;=\��\�U���M�l\�B\�\�\�*\'EɮM\�\\�\�V\��(��^i�*��\0V�\r���*\��?}S\�z�qdGa\���g�\0\0\0Z��]\�[��<c���||>�:h\�+�`-���\�q\�\�\�9@�Z4D�\���j��y����!\�?\��\�堁>����\rU\�\0��?\�t�2rbc�JI�A�tsG/�9T�7dŚ*9x\�u� D�j\�%WUC��c\�^\�#ov\�[\�7�^�\�6�j��$\��\�OP\nᑮQ\\����Y4\�\�J�\�\nV�E�T*�\"C������9�=\�\�`\�=���z\�\�´v����t\ZhDZ�t\�~@��x�ȁ@���\�C��9\�]�G�oѤ\�\��\Zn.��\�+\�*��T+�\�8�WZ\�v\�5�\�\nm�\�:\� t��T��3T-ͼ{�ѷ�\�H3��wAy\����T�]%\�&%\�\�JR�\�H��Vl>�m4��H�B�\\2\�1>�j流�{p\�\�ղl\�V�\�얻�t�P*g*\�Z��}�H	�GRoBŠ�Y\�\�Ɍ9Z�>Ej*��0�R�9c\"�\�P�9j���@��\�\���lp��Q\�Z\nf���\�\�9�%�R\�\�[t�\�\"���\�\�I\�5��\�D���0���\�,D�*$#���䧡j)\�-/M�Dp\nROU(8�g\�\0\0d\�`\�/\�\0\0���/(�IQU��\�Jk\�\\/\�u\�`�����=US\nf8�@q\�%\��\�>_�\�MLn�_O~:��K���!Hje\�T)NC\0\�r��r�R��)�!\�@� !\�@CF�\\��ޒ�\\\� D�1\� \"\0�\0�\0��h2�y����<��ξz\�\�\�\�u}\�?��m\Z4h5�t[���A�5����R1\��Ad	�\�C)#PNGS�P��)\\6R^fZbQ�V�\�Y \n\�\�,�F�M���/iM�\�	��V�\�\�NT�ꈄ���9\�i�*jJ��~\�f\�z�I9�\�(8���\�pw��i�YS5T\�~v\���e��d�;)+wZ�nWmAu#\�af#\\�?Uғ�����)�Dє��fn񳴻�	:`\�\�7뷁\�3\�y�+�p\"l勸���\�\�}J\�\�\�,�QG�\�d�ռiQ������\�h٨D)�Qu,�g������B\�ѓۍ��\���\�f4����\�D�J��n]H�ٛ\�xZ\�\��sh\�\�\�x�\�ws�\�r*�) �zbp��wKhl/g�UE\\z=�\�\r\�L#f)\�#C�ZN��\�5�\�,%ն)؊�!ʱH�\Z���\\聛�\�\�\�.\�G���\���oS��\�\�N\�jZ��cj�zU�Y����a\"a\�Ц\���j�^S��\�\�,\�\�<�fL��uu%iih��﹥Ӷ��Ϫ�\�\�Xji\�e��\�\�I[�Q\�2�(�\�_SO\�4\�*\�Gp�4L\�iH\�M�G}�\�.L��h���t=?gҧ�r�ʙp\�=Fn\�i+ \��,�A��+�	�\n�\n\�;jCT\��j\�ʆ�z6mmjv&��\0N�w4��ky;��,�3h�-�|�CkXB6�M��j1�mLP/$�8��V@#��Q6��㟬\�M.Y[Ͷ�i��Z~��t�\�m\����B\�7M\�c\�N5�d\nb\�\�C,�S1�\�ފ]عU�\�7m*�\�z���mߦiS2�WHQ4\�EF)X\�CD�M�n\�d�����1^�{\�.\�\�hf\�\n�r�M\�\�<_�|�\�R\�c�\�\�O.��<\�]3�Ê�\�!\�s�tH\��\0w\�F��E\�s\�8��\��X�(�9$��p\0�\��΍N?O?\�u}\�?��~�^C��\���thԼe�p8dp?�|s�\0\�8\rj\�\�\�\�\���\�\�\�ɸ+[B�R�+���#\\̐R\�XşI�\�!\�PQ�a\�\�@\0GA���r�y����`����O,0ƛE�OJ7av\�G\���~\�ەd\�V��$\r4w\�\�l\�\�Q��\�\��\0�;rޕ����\�\�\�Kwl,tJ�t���3�ƦE\�a��Fˀ`\�:R\�B��\0�A\�\�bn��3\�ѐ�\�}.��c\0\�DUt�f\�1�\�O\�!I]\�LvIn*��\�\�\�&�;\�ڶ���\�;�*\�CL�E��LR7�B�������#\�Ļm6��\�$\��\�EM�~\��\�\�-y�-\�>�X\�H[v��B��Z.z\r�$f\�DxD%��Å{�16\�/\��ێ\�\�\�(\�\�\�;����-*�m�SB��d\�O,�\�	IS��lt��\�\�4{\�]�\�\������W��\�P\��}#UHۈJ��eJN� ���2\�~E��\�[;�M\�\�\"dܘ{�!\�2��\�&�DP�6{r%\�AM\�\�\� �GGv�ȡj����l\�\�,a��gL!²\�1L,z�6r\�\�\�j>��\�\�\�\�\�غx�:\�N�|��\"�B�\�\�Me�A�\�*�TL\�SLG�D7k����n�\�[3�[��e[\"\�Bj\"��%*J�a��UI��\naø\����;\�+���M\�WA�p\�\"<�0?��\���Ρ�xϷw�R\�0�Zܫ\�g^3�M�-�������H�HP\�\�\\ZNb%eS�����e��d\nR�[�C��3�\�\�\�J�\�4eyf\���2�\�;J���TPF�!\'��OT�-V`U�?��Ö.ەF��l\�&�@�5\�2.)id��*o�\�P@\�PR\08�xC�|dq\�Jb��F����$S�:W�l	���Kݤ\0<g\�7�!\�\"\��h0�\��#n��ej\�\�tU�-)J-O�3H��<��\�YQFRt\�+ɽ��l���\��������n��R�ڰj�\�C�\�\�q\�_�U\�\�,�\�W��48�&\��E^\n� �*�\�!�=G)�\�60ʹ:� �T�\�\�A�\r�[}\�\�����^!\�\�Y��䌔{\r-/Ṉ�i\�ȩ6\"ͤ!&��H7�v��~\�\�5�@\�k�=yh\�d\��\0��u�P\�,\�R*�%0�08%)i<�xG�\�8�\�t	��;�\�otM,�ݺ����\\W:\�\�\'G�J\� ���\�j\�\�\"�\0LV(\�\�1\�%��^���oOT\�E��%$U0�Vޛ��+\�\�J\'����(\�s�\�b �2ʨ �	C\Ztk\��\�m\�\��\0��\�����\n�Y\�+&@\�R�\�DTQ@\0�2\��\" \06K�j�\�v�[�c�]�ѷ�\r���d\�Y\�^� \�\�n\�:�hQ��q^F\���!�v�\�\�3�da5r�\�e\�\�\�Tܼ��\�SRu�\����%E0�m��\�\�]*-R�\0\'\0\�I\�h~��g�K\�r-M׹E\����w���\�A��HhjH�t#�*Q\0BJ&,��#��\ZL�wtݞwvb\n\�vsC\�U�`z���\�\�X�\�\�\�\�\�%dz~\"y����\�PP��>!8�\�-�\�\�/\�؞�Gm\�@�Jj��B��\�H2F8��	F	:��\�2)!V\�+�%1߁\�Jb�\�9\Z��\��\�\�Z��f\�?V���Y\"�M�fT��7E�(D9;B\�\�sPğ�\�~�G\�\�v���n)(k����I=Rqg���9$-T\�t�]L�p��\"���m����\rl]����|���\�tXQpN15;�\�Ȥle��������	r�y��[M�z0\�Z�	\Z�\�=pHRY\�\\���PC1�i�A@$ <$�BH�Ϸ\�c�1��$\rKR.\�\�Y�\��\�\�nEW3�����$��qw!M\Zje\�\�P\�c)=Q��1�\�(qiTldj.\�œD) �4K�&SX�\�-Qj��L�-A�\�i��\�J�8\�K���VOc[U\�\�[H�]fh�}i���(8�\0h\�w�jݫx�Pq\�\�\�p|B<\�lPA���dRn�e��	�HP\�\nD�)(\0R����k�V,\r$�|�\�5ut\�\�RZB��D���Uq\0:��/����g 9���*D\�Ӕ6˵��\�۷�[p�tͩ�\�|����v5&�\�L��M\�OT2*\n�\�ӄ�n��\�\�\����\"\�j�H�a�{��A��Q��\�3�\��\�A�n���Ȏ=I|�3�\�0c \�\�C�A�5� 4\�\�Wk�@�\�厼�h21\� d���`<�<t\�<3\�\�9�\�s\�T��́�î�\Z��lB\�\"�v\�\�!)D�˧�\0:j\�{Bђ���\n	�\'I����w=\Z4�kkVJ�w���JI�\�\�nb8u�YQ+Ü\�;\�g8\�WD��t��x�b�t\0T\�\Z�����\�a(\0`\nRC�\0-\Z4-�!#Jn�tA0\�b&�\0�\�\08Ǘ-xV���ș\�<���\0\�z|<4h\�|���\�p\�]\r�aa~#�\�\�:�[�A\�\�1\��\0���?�>?��\Z\n\�\�*\rA�\�q\��\���\��:�}5\�V\�\�I .B��U�q�W��2 n���  \r\Z4�\�\�\�hɠJn=\��Ma\"ep@)\�Hl\�xy�0\�f�\Z�\�',0,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg'),(16,'SAPO','BEMBARAYO',0,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n�\�\0C\0�\�\0C��\0\0h\0h\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0=\0\0\0\0\0\0\0!1	Q�\n\"Aaq�2���\��\�#RrB�����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0 \0\0\0\0\0\0\0\0\0\0\0\01Q�!q�����\�\0\0\0?\0��)�&ȏ�r���MK\�\��}�ף���\�Q\�>\�.�\���9\�\�\���:�(w(d@��m@SH\��\0\�?}U0\�:\�3��:�\�ϗ�]I�\�\�\��x�:I\�#�\��\0�?}C�K?p��\0�g��\�MU)J �\�\��\�\�\�2u<�7r�����(y{�\0����\��\�\�ش�k��{,��\�Z\�u<<\�I�$���.����\�U�Mc\"\ngT�6���p)Ja\�>��/��\"\�P���\0\0z\�ÿ\��\0^�\�\�f�W�\��ܺB���\�({`ڕ�jhH&6\�ިzF��k\�\�bf���=F�t\�$�sX\�\�AB�@\�m\�\��2N$�gFZ�\�ԀQ���>w�#P\�J��p���Y\�p\�\�ϐ\�\�<S��[s\�	\�c�0=@|C\\���\�՘7	#���\\W\��\�G\�*\�u\�R%�7K<1�9�����P��\���\�.�ە5\Z\�}yG1D�D\�3E�즖�U�z!W*�E�tL�g \�Q�\�4�\"��q0��\0ox�P�\�ƭ��-\n�ʮ�y�\n��\� s\�N��\�\�F�p{�\�u�ݕc~.Mot-�E���l�\�w(�\�B\�M8�n1,��H�+��Hx�޼m����P�*�.\\տ�-�N6ۛ\�|\�~RI7$��m��ʎ-���!Y��9S\0�$\�Q)\�Ծ\�3\�y��k ^@ͼ��\�1��>�L\�\�VQ\0����#\�\�\�=1��s�51�\��R\�M�!\0\0��\0t��\�<\��\�G\����\�)p�~?��\0`\0ݨ\�\�&wk\�\�\�iݟ��\�E\�>��i�\�%�?x�n�n��JF�bdĦT\�K�\�\� >\�4\�p�u\�\�\�T\nҔ\�8\�Uyq�8���\�C�R3QU=C�\����醋���ҘpC\�\��v\�	P]��\�9�*\�S\�u\�h\�uM\�\�5\�o)\�1\�|�b������L\n\'\�VJ\�EBa6_���\�O~�.u�\�(M�v}\�:�p�\"ǯ~*�iYS�\�������٫�<ۋ)\�Ӕ�H@-\�U\�\�4Ѥ���؈6ZE���\\�\�g/K\�eJ\�Jb�\�\���@B�3�F\��\�	O����*�懆X�T\�:�\\\�\�\�zK�\�\�Y\���Ȉ�w$IA\�P�Z��\�9DAD�N�\Z�E?�ݚE�8��\�:\�&�@Dy5\��Δ��m��}�mo\�}�J\���\� pW�\�Z���t\�\�S6���\�84�B�TZ\�\"@\�S��!��;=\��\�U���M�l\�B\�\�\�*\'EɮM\�\\�\�V\��(��^i�*��\0V�\r���*\��?}S\�z�qdGa\���g�\0\0\0Z��]\�[��<c���||>�:h\�+�`-���\�q\�\�\�9@�Z4D�\���j��y����!\�?\��\�堁>����\rU\�\0��?\�t�2rbc�JI�A�tsG/�9T�7dŚ*9x\�u� D�j\�%WUC��c\�^\�#ov\�[\�7�^�\�6�j��$\��\�OP\nᑮQ\\����Y4\�\�J�\�\nV�E�T*�\"C������9�=\�\�`\�=���z\�\�´v����t\ZhDZ�t\�~@��x�ȁ@���\�C��9\�]�G�oѤ\�\��\Zn.��\�+\�*��T+�\�8�WZ\�v\�5�\�\nm�\�:\� t��T��3T-ͼ{�ѷ�\�H3��wAy\����T�]%\�&%\�\�JR�\�H��Vl>�m4��H�B�\\2\�1>�j流�{p\�\�ղl\�V�\�얻�t�P*g*\�Z��}�H	�GRoBŠ�Y\�\�Ɍ9Z�>Ej*��0�R�9c\"�\�P�9j���@��\�\���lp��Q\�Z\nf���\�\�9�%�R\�\�[t�\�\"���\�\�I\�5��\�D���0���\�,D�*$#���䧡j)\�-/M�Dp\nROU(8�g\�\0\0d\�`\�/\�\0\0���/(�IQU��\�Jk\�\\/\�u\�`�����=US\nf8�@q\�%\��\�>_�\�MLn�_O~:��K���!Hje\�T)NC\0\�r��r�R��)�!\�@� !\�@CF�\\��ޒ�\\\� D�1\� \"\0�\0�\0��h2�y����<��ξz\�\�\�\�u}\�?��m\Z4h5�t[���A�5����R1\��Ad	�\�C)#PNGS�P��)\\6R^fZbQ�V�\�Y \n\�\�,�F�M���/iM�\�	��V�\�\�NT�ꈄ���9\�i�*jJ��~\�f\�z�I9�\�(8���\�pw��i�YS5T\�~v\���e��d�;)+wZ�nWmAu#\�af#\\�?Uғ�����)�Dє��fn񳴻�	:`\�\�7뷁\�3\�y�+�p\"l勸���\�\�}J\�\�\�,�QG�\�d�ռiQ������\�h٨D)�Qu,�g������B\�ѓۍ��\���\�f4����\�D�J��n]H�ٛ\�xZ\�\��sh\�\�\�x�\�ws�\�r*�) �zbp��wKhl/g�UE\\z=�\�\r\�L#f)\�#C�ZN��\�5�\�,%ն)؊�!ʱH�\Z���\\聛�\�\�\�.\�G���\���oS��\�\�N\�jZ��cj�zU�Y����a\"a\�Ц\���j�^S��\�\�,\�\�<�fL��uu%iih��﹥Ӷ��Ϫ�\�\�Xji\�e��\�\�I[�Q\�2�(�\�_SO\�4\�*\�Gp�4L\�iH\�M�G}�\�.L��h���t=?gҧ�r�ʙp\�=Fn\�i+ \��,�A��+�	�\n�\n\�;jCT\��j\�ʆ�z6mmjv&��\0N�w4��ky;��,�3h�-�|�CkXB6�M��j1�mLP/$�8��V@#��Q6��㟬\�M.Y[Ͷ�i��Z~��t�\�m\����B\�7M\�c\�N5�d\nb\�\�C,�S1�\�ފ]عU�\�7m*�\�z���mߦiS2�WHQ4\�EF)X\�CD�M�n\�d�����1^�{\�.\�\�hf\�\n�r�M\�\�<_�|�\�R\�c�\�\�O.��<\�]3�Ê�\�!\�s�tH\��\0w\�F��E\�s\�8��\��X�(�9$��p\0�\��΍N?O?\�u}\�?��~�^C��\���thԼe�p8dp?�|s�\0\�8\rj\�\�\�\�\���\�\�\�ɸ+[B�R�+���#\\̐R\�XşI�\�!\�PQ�a\�\�@\0GA���r�y����`����O,0ƛE�OJ7av\�G\���~\�ەd\�V��$\r4w\�\�l\�\�Q��\�\��\0�;rޕ����\�\�\�Kwl,tJ�t���3�ƦE\�a��Fˀ`\�:R\�B��\0�A\�\�bn��3\�ѐ�\�}.��c\0\�DUt�f\�1�\�O\�!I]\�LvIn*��\�\�\�&�;\�ڶ���\�;�*\�CL�E��LR7�B�������#\�Ļm6��\�$\��\�EM�~\��\�\�-y�-\�>�X\�H[v��B��Z.z\r�$f\�DxD%��Å{�16\�/\��ێ\�\�\�(\�\�\�;����-*�m�SB��d\�O,�\�	IS��lt��\�\�4{\�]�\�\������W��\�P\��}#UHۈJ��eJN� ���2\�~E��\�[;�M\�\�\"dܘ{�!\�2��\�&�DP�6{r%\�AM\�\�\� �GGv�ȡj����l\�\�,a��gL!²\�1L,z�6r\�\�\�j>��\�\�\�\�\�غx�:\�N�|��\"�B�\�\�Me�A�\�*�TL\�SLG�D7k����n�\�[3�[��e[\"\�Bj\"��%*J�a��UI��\naø\����;\�+���M\�WA�p\�\"<�0?��\���Ρ�xϷw�R\�0�Zܫ\�g^3�M�-�������H�HP\�\�\\ZNb%eS�����e��d\nR�[�C��3�\�\�\�J�\�4eyf\���2�\�;J���TPF�!\'��OT�-V`U�?��Ö.ەF��l\�&�@�5\�2.)id��*o�\�P@\�PR\08�xC�|dq\�Jb��F����$S�:W�l	���Kݤ\0<g\�7�!\�\"\��h0�\��#n��ej\�\�tU�-)J-O�3H��<��\�YQFRt\�+ɽ��l���\��������n��R�ڰj�\�C�\�\�q\�_�U\�\�,�\�W��48�&\��E^\n� �*�\�!�=G)�\�60ʹ:� �T�\�\�A�\r�[}\�\�����^!\�\�Y��䌔{\r-/Ṉ�i\�ȩ6\"ͤ!&��H7�v��~\�\�5�@\�k�=yh\�d\��\0��u�P\�,\�R*�%0�08%)i<�xG�\�8�\�t	��;�\�otM,�ݺ����\\W:\�\�\'G�J\� ���\�j\�\�\"�\0LV(\�\�1\�%��^���oOT\�E��%$U0�Vޛ��+\�\�J\'����(\�s�\�b �2ʨ �	C\Ztk\��\�m\�\��\0��\�����\n�Y\�+&@\�R�\�DTQ@\0�2\��\" \06K�j�\�v�[�c�]�ѷ�\r���d\�Y\�^� \�\�n\�:�hQ��q^F\���!�v�\�\�3�da5r�\�e\�\�\�Tܼ��\�SRu�\����%E0�m��\�\�]*-R�\0\'\0\�I\�h~��g�K\�r-M׹E\����w���\�A��HhjH�t#�*Q\0BJ&,��#��\ZL�wtݞwvb\n\�vsC\�U�`z���\�\�X�\�\�\�\�\�%dz~\"y����\�PP��>!8�\�-�\�\�/\�؞�Gm\�@�Jj��B��\�H2F8��	F	:��\�2)!V\�+�%1߁\�Jb�\�9\Z��\��\�\�Z��f\�?V���Y\"�M�fT��7E�(D9;B\�\�sPğ�\�~�G\�\�v���n)(k����I=Rqg���9$-T\�t�]L�p��\"���m����\rl]����|���\�tXQpN15;�\�Ȥle��������	r�y��[M�z0\�Z�	\Z�\�=pHRY\�\\���PC1�i�A@$ <$�BH�Ϸ\�c�1��$\rKR.\�\�Y�\��\�\�nEW3�����$��qw!M\Zje\�\�P\�c)=Q��1�\�(qiTldj.\�œD) �4K�&SX�\�-Qj��L�-A�\�i��\�J�8\�K���VOc[U\�\�[H�]fh�}i���(8�\0h\�w�jݫx�Pq\�\�\�p|B<\�lPA���dRn�e��	�HP\�\nD�)(\0R����k�V,\r$�|�\�5ut\�\�RZB��D���Uq\0:��/����g 9���*D\�Ӕ6˵��\�۷�[p�tͩ�\�|����v5&�\�L��M\�OT2*\n�\�ӄ�n��\�\�\����\"\�j�H�a�{��A��Q��\�3�\��\�A�n���Ȏ=I|�3�\�0c \�\�C�A�5� 4\�\�Wk�@�\�厼�h21\� d���`<�<t\�<3\�\�9�\�s\�T��́�î�\Z��lB\�\"�v\�\�!)D�˧�\0:j\�{Bђ���\n	�\'I����w=\Z4�kkVJ�w���JI�\�\�nb8u�YQ+Ü\�;\�g8\�WD��t��x�b�t\0T\�\Z�����\�a(\0`\nRC�\0-\Z4-�!#Jn�tA0\�b&�\0�\�\08Ǘ-xV���ș\�<���\0\�z|<4h\�|���\�p\�]\r�aa~#�\�\�:�[�A\�\�1\��\0���?�>?��\Z\n\�\�*\rA�\�q\��\���\��:�}5\�V\�\�I .B��U�q�W��2 n���  \r\Z4�\�\�\�hɠJn=\��Ma\"ep@)\�Hl\�xy�0\�f�\Z�\�',0,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_factura`
--

DROP TABLE IF EXISTS `producto_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_factura` (
  `idproducto_factura` int NOT NULL AUTO_INCREMENT,
  `idproducto` int NOT NULL,
  `idfactura` int NOT NULL,
  `cantidad` int NOT NULL,
  `descuento` float NOT NULL,
  `totalventas` float unsigned NOT NULL,
  PRIMARY KEY (`idproducto_factura`),
  KEY `idproducto_idx` (`idproducto`),
  KEY `idfactura_idx` (`idfactura`),
  CONSTRAINT `idfactura` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idproducto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_factura`
--

LOCK TABLES `producto_factura` WRITE;
/*!40000 ALTER TABLE `producto_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `idsexo` int NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `tipodepersona` varchar(45) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `idproveedor_sexo_idx` (`idsexo`),
  CONSTRAINT `idproveedor_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (7,1,'Cedula','123','123','123','123','Juridica','2023-10-18',0),(8,1,'Cedula','wendy','12121','12121','joejao','Natural','2023-10-09',0),(9,1,'Pasaporte','djaodjwoaw','12121','12121','joejao','Juridica','2023-10-09',0),(10,1,'bobo','CALLATEWE','o','22','o','21','2003-12-10',1),(11,1,'Cedula','hoihihio','cdcd','hihi','oohio','Natural','2023-10-11',1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `idsexo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idsexo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino',1),(2,'Femenino',1),(3,'Otros',1);
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `idsexo` int NOT NULL,
  `idcargo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `login` varchar(200) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idusario_sexo_idx` (`idsexo`),
  KEY `idusuario_cargo_idx` (`idcargo`),
  CONSTRAINT `idusuario_cargo` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,1,'sas','as','asas','as',1,'123','123','2005-12-19',''),(3,2,3,'bemba','123','bembarayo@gmail.com','La Tierra',0,'123','123','2023-10-10','Pasaporte'),(12,1,3,'121','12121','21','121',1,'121','123','2023-10-11','Cedula'),(366,3,1,'JOJOJOJOJOJOJ','hiohihoiiohiohoiiohioh','iohiohiohiohhiddhofed','12333',1,'123','1233','2023-10-03','Tarjeta de Identidad'),(2902,1,1,'BEMBARAYO2.0','jwio','jijio','oadwaw',1,'adwaadwa','adwa','2023-10-17','Tarjeta de Identidad'),(12345,1,3,'12121','182109281','09281209180','2121',0,'12121','12123','2023-10-11','Cedula'),(98292,2,1,'BEMBA RAYO','3u091813','boladecarne','jojo',0,'23','3232','2023-10-31','Tarjeta de Identidad'),(123333,1,1,'JOEJOAJOE','12131','1213','12121',0,'123','123','2021-07-06','Cedula');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tienda_com'
--
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Cliente`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int)
BEGIN
update cliente set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo where cedula = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Producto`(in idproduc int, in nombe varchar(45), in descripcin varchar(45), in image longblob, in route varchar(500))
BEGIN
update producto set nombre = nombe, descripcion = descripcin, imagen = image, ruta = route where idproducto = idproduc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Provedor`(in idpro int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int, in tipoofperson varchar(45))
BEGIN
update proveedor set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, tipodepersona = tipoofperson where idProveedor = idpro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Usuario`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date,in clav varchar(200), in sexo int, in cargo int)
BEGIN
update usuario set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, idcargo = cargo, clave = clav where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistroActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistroActualizar`(in idusu int)
BEGIN
select * from usuario where idusuario = idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Cliente`(in idcli int)
BEGIN
select * from cliente where idcli = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Producto`(in valor int)
BEGIN
select * from producto where valor = idproducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Provedor`(in idpro int)
BEGIN
select * from proveedor where idpro = idproveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Usuario`(in idusu int)
BEGIN
select * from usuario where idusuario = idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Cliente`(in ced int)
BEGIN
update cliente set condicion = '0' where cedula = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Producto`(in idproduto int)
BEGIN
update producto set condicion = '0' where idproducto = idproduto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Provedor`(in ced int)
BEGIN
update proveedor set condicion = '0' where idProveedor = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Usuario`(in ced int)
BEGIN
update usuario set condicion = '0' where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Cliente`(in valor varchar(45))
BEGIN
select * from mostrar_cliente where Cedula like concat('%',valor,'%') || Genero like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Producto`(in valor varchar(45))
BEGIN
select * from mostrar_producto where Identificador like concat('%',valor,'%') || NombreDelProducto like concat('%',valor,'%') || DescripcionDelProducto like concat('%',valor,'%') || Precio like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Provedor`(in valor varchar(50))
BEGIN
select * from mostrar_provedor where Identificador like concat('%',valor,'%') || Genero like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || TipoDePersona like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Usuario`(in valor varchar(45))
BEGIN
select * from mostrar_usuario where Identificador like concat('%',valor,'%') || Genero like concat('%',valor,'%') || Cargo like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion Factura_Compra`(in idProve int, in idusuario int, in descuent float, in typeofpayment varchar(45))
BEGIN
insert into fact_comp (idProveedor, idusu, fecha, total_comp, descuento, tipodepago, condicion) values (idProve, idusuario, current_date(), '0', descuent, typeofpayment, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Cliente`(in cedulaID int, in idsex int, in persons_name varchar(45), in phone_number varchar(15), in gmail varchar(45), in direzion varchar(45), in dateofbirth date, in tipodedoc varchar(45))
BEGIN
insert into cliente values (cedulaID, idsex, persons_name, phone_number, gmail, direzion, '1', dateofbirth, tipodedoc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura`(in tipodepago varchar(45), in CC int, in iduser int)
BEGIN
insert into factura (fecha, tipopago, totalfactura, cedula, idusuario, condicion) values (current_date(),tipodepago, '1', CC, iduser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra`(in idProve int, in idusuario int, in descuent float, in typeofpayment varchar(45))
BEGIN
insert into fact_comp (idProveedor, idusu, fecha, total_comp, descuento, tipodepago, condicion) values (idProve, idusuario, current_date(), '0', descuent, typeofpayment, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura_Compra_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra_Producto`(in idfactura_com int, in idprodu int, in cantidad_compr int, in precio_unitario int)
BEGIN
insert into fact_com_prod (idfact_com, idpro, cantidad_com, pre_uni, pre_total) values (idfactura_com, idprodu, cantidad_compr, precio_unitario, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Producto`(in namez varchar(45), in descr varchar(45), in image longblob, in route varchar(500))
BEGIN
insert into producto(nombre, descripcion, cantidad, imagen, precio, condicion, ruta) values (namez,descr,'0',image,'0','1', route);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Producto_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Producto_Factura`(in producto_id int, in factura_id int, in stock int, in discount float)
BEGIN
insert into producto_factura (idproducto, idfactura, cantidad, descuento, totalventas) values (producto_id, factura_id, stock, discount, '0'); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Proveedor`(in idsex int, in typeofdocument varchar(45), in namez varchar(45), in gmail varchar(45), in phone_number varchar(45), in direction varchar(45), in typeofperson varchar(45), in dateofbirth date)
BEGIN
insert into proveedor (idsexo, tipodedocumento, nombre, correo, telefono, direccion, tipodepersona, fechadenacimiento, condicion) values (idsex, typeofdocument, namez, gmail, phone_number, direction, typeofperson, dateofbirth, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Usuario`(in iduser int, in idsex int, in idcarg int, in namez varchar(45), in phone varchar(45), in gmail varchar(45), in direction varchar(45), in loyin varchar(200), in contra varchar(200), in dateofbirth date, in tipodedoc varchar(45))
BEGIN
insert into usuario  values (iduser, idsex, idcarg, namez, phone, gmail, direction, "1", loyin, contra, dateofbirth, tipodedoc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in log varchar(200), in pass varchar(200))
BEGIN
select login, clave from usuario where login = log && clave = pass && condicion = '1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `mostrar_cargo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cargo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cargo` AS select `cargo`.`idcargo` AS `idcargo`,`cargo`.`nombre` AS `nombre` from `cargo` where (`cargo`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_cliente`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cliente` AS select `cliente`.`cedula` AS `Cedula`,`sexo`.`nombre` AS `Genero`,`cliente`.`nombre` AS `Nombre`,`cliente`.`telefono` AS `Telefono`,`cliente`.`correo` AS `Correo`,`cliente`.`direccion` AS `Direccion`,`cliente`.`fechadenacimiento` AS `FechaDeNacimiento`,`cliente`.`tipodedocumento` AS `TipoDeDocumento` from (`cliente` join `sexo` on((`cliente`.`idsexo` = `sexo`.`idsexo`))) where (`cliente`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_producto`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_producto` AS select `producto`.`idproducto` AS `Identificador`,`producto`.`nombre` AS `NombreDelProducto`,`producto`.`descripcion` AS `DescripcionDelProducto`,`producto`.`cantidad` AS `Existencias`,`producto`.`imagen` AS `ImagenDelProducto`,`producto`.`precio` AS `Precio` from `producto` where (`producto`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_proveedor` AS select `proveedor`.`idProveedor` AS `Identificacion`,`sexo`.`nombre` AS `Genero`,`proveedor`.`tipodedocumento` AS `TipoDeDocumento`,`proveedor`.`nombre` AS `Nombre`,`proveedor`.`correo` AS `Correo`,`proveedor`.`telefono` AS `Telefono`,`proveedor`.`direccion` AS `Direccion`,`proveedor`.`tipodepersona` AS `TipoDePersona`,`proveedor`.`fechadenacimiento` AS `FechaDeNacimiento` from (`proveedor` join `sexo` on((`proveedor`.`idsexo` = `sexo`.`idsexo`))) where (`proveedor`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_sexo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_sexo` AS select `sexo`.`idsexo` AS `idsexo`,`sexo`.`nombre` AS `nombre` from `sexo` where (`sexo`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_usuario`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_usuario` AS select `usuario`.`idusuario` AS `Identificador`,`sexo`.`nombre` AS `Genero`,`cargo`.`nombre` AS `Cargo`,`usuario`.`nombre` AS `Nombre`,`usuario`.`telefono` AS `Telefono`,`usuario`.`correo` AS `Correo`,`usuario`.`direccion` AS `Direccion`,`usuario`.`fechadenacimiento` AS `FechaDeNacimiento`,`usuario`.`tipodedocumento` AS `TipoDeDocumento` from ((`usuario` join `sexo` on((`sexo`.`idsexo` = `usuario`.`idsexo`))) join `cargo` on((`usuario`.`idcargo` = `cargo`.`idcargo`))) where (`usuario`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14 11:59:14
