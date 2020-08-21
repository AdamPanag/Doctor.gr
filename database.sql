DROP TABLE specialties, areas;
DROP TABLE patients;
DROP TABLE doctors;
DROP TABLE bookings;

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
  `specialty` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `patients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ssn` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `doctorId` varchar(255) NOT NULL,
  `patientId` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `hour` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


INSERT INTO `specialties` VALUES (1,'Pathologist'),(2,'Pediatrician'),(3,'Urologist');
INSERT INTO `areas` VALUES (1,'Chalandri'),(2,'Kifisia'),(3,'Ekali');

INSERT INTO `doctors` VALUES (1,'Kostas','Mitropoulos','kostmitrop','1234','Urologist','+30 6998665969','kost@gmail.com','Kifisia 35, Athens, Greece','Kifisia');
INSERT INTO `doctors` VALUES (2,'Kostas','Mitropoulos','kostmitrop','kostas','Urologist','+30 6998665969','kost@gmail.com','Kifisia 35, Athens, Greece','Kifisia');

INSERT INTO `patients` VALUES (1,'Giorgos','Papadopoulos','giorgospap','5678','123456789', 'giorgos@gmail.com');
