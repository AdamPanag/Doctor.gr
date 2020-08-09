DROP TABLE specialties, areas;

CREATE TABLE `specialties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `doctors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `specialty` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `specialties` VALUES (1,'Pathologist'),(2,'Pediatrician'),(3,'Urologist');
INSERT INTO `areas` VALUES (1,'Chalandri'),(2,'Kifisia'),(3,'Ekali');

INSERT INTO `doctors` VALUES (1,'Kostas','Mitropoulos','kostmitrop','1234','kost@gmail.com','Urologist','Kifisia','Kifisia 35, Athens, Grece','+30 6998665969');