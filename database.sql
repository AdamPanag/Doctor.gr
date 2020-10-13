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


INSERT INTO `specialties` VALUES (1,'Pathologist'),(2,'Cardiologist'),(3,'Dermatologist'), (4,'Pediatrician'), (5,'Neurologist'), (6,'Ophthalmologist'), (7,'Psychiatrist'), (8,'Urologist'),  (9,'General Surgeon'),  (10,'Plastic Surgeon');
INSERT INTO `areas` VALUES (1,'Koukaki'),(2,'Gazi'),(3,'Kolonaki'), (4,'Pangrati'), (5,'Kypseli'), (6,'Ampelokipi'), (7,'Piraeus'), (8,'Glyfada'), (9,'Chalandri'), (10,'Kifisia'), (11,'Galatsi'), (12,'Peristeri');
