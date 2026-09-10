#
# TABLE STRUCTURE FOR: ambulance_call
#

DROP TABLE IF EXISTS `ambulance_call`;

CREATE TABLE `ambulance_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `contact_no` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(20) DEFAULT NULL,
  `driver` varchar(100) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int(11) NOT NULL,
  `call_from` varchar(200) NOT NULL,
  `call_to` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `ambulance_call` (`id`, `bill_no`, `patient_name`, `contact_no`, `address`, `vehicle_no`, `vehicle_model`, `driver`, `amount`, `date`, `created_at`, `generated_by`, `call_from`, `call_to`) VALUES (2, '2', '7', NULL, NULL, '1', NULL, 'Depanshu', '500.00', '2020-11-30 13:35:00', '2020-11-30 08:05:54', 1, '', '');
INSERT INTO `ambulance_call` (`id`, `bill_no`, `patient_name`, `contact_no`, `address`, `vehicle_no`, `vehicle_model`, `driver`, `amount`, `date`, `created_at`, `generated_by`, `call_from`, `call_to`) VALUES (3, '3', '3', NULL, NULL, '1', NULL, 'Depanshu', '600.00', '2020-12-05 17:35:00', '2020-12-04 12:05:57', 1, '', '');
INSERT INTO `ambulance_call` (`id`, `bill_no`, `patient_name`, `contact_no`, `address`, `vehicle_no`, `vehicle_model`, `driver`, `amount`, `date`, `created_at`, `generated_by`, `call_from`, `call_to`) VALUES (4, '4', '20', NULL, NULL, '1', NULL, 'Depanshu', '1000.00', '2020-12-13 17:36:00', '2020-12-04 12:06:17', 3, '', '');


#
# TABLE STRUCTURE FOR: appoint_priority
#

DROP TABLE IF EXISTS `appoint_priority`;

CREATE TABLE `appoint_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appoint_priority` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES (1, 'Normal', '0000-00-00 00:00:00');
INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES (2, 'Urgent', '0000-00-00 00:00:00');
INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES (3, 'Very Urgent', '0000-00-00 00:00:00');
INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES (4, 'Low', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: appointment
#

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `appointment_no` varchar(100) NOT NULL,
  `date` datetime DEFAULT NULL,
  `priority` varchar(100) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `specialist` varchar(100) NOT NULL,
  `doctor` varchar(50) DEFAULT NULL,
  `amount` varchar(200) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `appointment_status` varchar(11) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_opd` varchar(200) NOT NULL,
  `is_ipd` varchar(200) NOT NULL,
  `live_consult` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (1, 7, '', '2020-11-17 14:25:00', '1', 'Patient ', 'Male', 'Patient@gmail.com', '89898988', '', '2', '', 'The Message field is required.', 'pending', 'Offline', '2020-11-17 08:56:03', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (2, 0, '', '2020-11-27 15:51:00', '2', 'shivu', 'Female', '', '8956895868', '', '2', '', 'hjhgjghghjghjgjgjg', 'pending', 'Offline', '2020-11-24 10:22:36', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (3, 0, '', '2020-11-25 17:01:00', '1', 'subh', 'Male', '', '9565895686', '', '2', '', 'test', 'pending', 'Offline', '2020-11-24 11:31:55', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (4, 8, 'APPNO4', '2020-11-28 17:02:00', '1', 'aaaaa', '', 'demo@gmail.com', '08982022467', '', '2', '', 'na', 'approved', 'Offline', '2020-11-28 11:37:36', 'yes', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (5, 10, 'APPNO5', '2020-11-28 17:07:00', '1', 'test bg', 'Male', '', '7412589632', '', '2', '', 'appointment ', 'approved', 'Offline', '2020-11-28 11:42:21', '', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (6, 0, 'APPNO6', '2020-11-28 17:09:00', '1', 'test save button', 'Male', '', '789654130', '', '2', '', 'na', 'approved', 'Offline', '2020-11-28 11:44:23', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (7, 10, '', '2020-11-28 16:57:00', '1', 'test bg', 'Female', 'srishti@gmail.com', '123456789', '', '2', '', 'testing by preeti', 'pending', 'Offline', '2020-11-28 11:54:18', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (8, 11, 'APPNO8', '2020-11-28 17:34:00', '1', 'test report', 'Male', '', '7896541230', '', '2', '', 'naa', 'approved', 'Offline', '2020-11-28 12:09:15', '', 'yes', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (9, 0, 'APPNO9', '2020-11-28 18:18:00', '1', 'garima', 'Male', 'garimarock01@gmail.com', '7896541235', '', '2', '', 'naaa', 'approved', 'Offline', '2020-11-28 12:54:09', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (10, 11, 'APPNO10', '2020-11-28 18:21:00', '1', 'test report', 'Male', '', '7896541230', '', '2', '', 'nnn', 'approved', 'Offline', '2020-11-28 12:56:24', '', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (11, 0, 'APPNO11', '2020-11-28 18:29:00', '1', 'live consultation ', 'Male', 'na', '7879654212', '', '2', '', 'naa', 'approved', 'Offline', '2020-11-28 13:04:30', '', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (12, 16, 'APPNO12', '2020-11-28 18:30:00', '1', 'test ', 'Male', 'fff', '7896541230', '', '2', '', 'naa', 'approved', 'Offline', '2020-11-28 13:05:42', '', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (13, 0, '', '2020-12-01 18:31:00', '1', 'ffff', 'Male', '', '741258963', '', '2', '', 'na', 'cancel', 'Offline', '2020-11-28 13:06:01', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (14, 16, 'APPNO14', '2020-11-30 17:01:00', '1', 'test', 'Male', 'fff', '789654', '', '2', '', 'na', 'approved', 'Offline', '2020-11-30 11:36:10', 'yes', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (15, 18, 'APPNO15', '2020-11-30 17:02:00', '1', 'save test', 'Male', '', '789654123', '', '2', '', 'naa', 'approved', 'Offline', '2020-11-30 11:37:51', '', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (16, 0, 'APPNO16', '2020-11-30 17:03:00', '1', 'ttttttttttttttttttt', 'Female', '', '896566', '', '2', '', 'naaa', 'approved', 'Offline', '2020-11-30 11:38:14', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (17, 22, 'APPNO17', '2020-11-30 17:03:00', '1', 'saveeeee', 'Male', '', '789654123', '', '2', '', 'naaa', 'approved', 'Offline', '2020-11-30 11:38:37', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (18, 0, 'APPNO18', '2020-11-30 17:04:00', '1', 'gg', 'Male', '', '122', '', '2', '', 'g', 'approved', 'Offline', '2020-11-30 11:39:08', '', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (19, 16, '', '2020-11-30 17:09:00', '1', 'test', 'Male', 'fff', '789654', '', '2', '', 'naa', 'pending', 'Offline', '2020-11-30 11:43:50', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (20, 0, 'APPNO20', '2020-11-30 17:10:00', '1', 'test', 'Female', '', '45665', '', '2', '', 'na', 'approved', 'Offline', '2020-11-30 11:45:30', '', '', 'No');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (21, 17, 'APPNO21', '2020-12-01 17:36:00', '1', 'ginni test', '', '', '8744669960', '', '2', '', 'na', 'approved', 'Offline', '2020-11-30 12:12:58', 'yes', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (22, 19, 'APPNO22', '2020-11-30 17:44:00', '1', 'garima marko', 'Female', 'garimarock01@gmail.com', '8451236975665', '', '2', '', 'naa', 'approved', 'Offline', '2020-11-30 12:19:42', '', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (23, 20, 'APPNO23', '2020-12-02 11:34:00', '1', 'Rashmi', 'Female', '', '8745123690', '', '2', '', 'Naa', 'approved', 'Offline', '2020-12-02 06:10:44', '', '', 'Yes');
INSERT INTO `appointment` (`id`, `patient_id`, `appointment_no`, `date`, `priority`, `patient_name`, `gender`, `email`, `mobileno`, `specialist`, `doctor`, `amount`, `message`, `appointment_status`, `source`, `created_at`, `is_opd`, `is_ipd`, `live_consult`) VALUES (24, 28, 'APPNO24', '2020-12-05 16:52:00', '1', 'rahul', 'Male', 'rahul@gmail.com.', '789654130', '', '2', '', 'NAA', 'approved', 'Offline', '2020-12-05 11:28:01', '', '', 'Yes');


#
# TABLE STRUCTURE FOR: bed
#

DROP TABLE IF EXISTS `bed`;

CREATE TABLE `bed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bed_type_id` int(11) NOT NULL,
  `bed_group_id` int(100) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (1, 'A1', 1, 1, 'no');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (2, 'A2', 1, 1, 'no');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (3, 'A3', 1, 1, 'yes');
INSERT INTO `bed` (`id`, `name`, `bed_type_id`, `bed_group_id`, `is_active`) VALUES (4, 'A4', 1, 1, 'yes');


#
# TABLE STRUCTURE FOR: bed_group
#

DROP TABLE IF EXISTS `bed_group`;

CREATE TABLE `bed_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (1, 'G1', '', '1', 0);
INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (2, 'F1', '', '2', 0);
INSERT INTO `bed_group` (`id`, `name`, `description`, `floor`, `is_active`) VALUES (3, 'S1', '', '3', 0);


#
# TABLE STRUCTURE FOR: bed_type
#

DROP TABLE IF EXISTS `bed_type`;

CREATE TABLE `bed_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `bed_type` (`id`, `name`) VALUES (1, 'Single');
INSERT INTO `bed_type` (`id`, `name`) VALUES (2, 'Normal');


#
# TABLE STRUCTURE FOR: birth_report
#

DROP TABLE IF EXISTS `birth_report`;

CREATE TABLE `birth_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(200) NOT NULL,
  `opd_ipd_no` varchar(200) NOT NULL,
  `child_name` varchar(200) NOT NULL,
  `child_pic` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `birth_date` datetime NOT NULL,
  `weight` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `father_pic` varchar(200) NOT NULL,
  `birth_report` mediumtext NOT NULL,
  `document` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `birth_report` (`id`, `ref_no`, `opd_ipd_no`, `child_name`, `child_pic`, `gender`, `birth_date`, `weight`, `mother_name`, `contact`, `mother_pic`, `father_name`, `father_pic`, `birth_report`, `document`, `address`, `is_active`, `created_at`) VALUES (1, '', '', 'subh', '', 'Male', '2020-11-19 17:59:00', '4', '2', '9586598659', '', '', '', '', '', 'Bhopal', 'yes', '2020-11-18 12:30:08');
INSERT INTO `birth_report` (`id`, `ref_no`, `opd_ipd_no`, `child_name`, `child_pic`, `gender`, `birth_date`, `weight`, `mother_name`, `contact`, `mother_pic`, `father_name`, `father_pic`, `birth_report`, `document`, `address`, `is_active`, `created_at`) VALUES (2, 'BR20202', '', 'hghgg', 'uploads/patient_images/no_image.png', 'Male', '2020-12-03 13:14:00', '520', '19', '12365485', 'uploads/patient_images/no_image.png', 'bbbb', 'uploads/patient_images/no_image.png', 'bbbb', '', 'fdgdfg', 'yes', '2020-12-02 07:49:39');


#
# TABLE STRUCTURE FOR: blood_bank_status
#

DROP TABLE IF EXISTS `blood_bank_status`;

CREATE TABLE `blood_bank_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(3) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ceated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (1, 'A+', '0', '2018-08-18 11:40:07');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (2, 'B+', '0', '2018-08-18 12:10:55');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (3, 'A-', '0', '2018-08-18 12:11:24');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (4, 'B-', '0', '2018-08-18 12:11:44');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (5, 'O+', '0', '2018-08-18 12:12:06');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (6, 'O-', '0', '2018-08-18 12:12:20');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (7, 'AB+', '0', '2018-08-18 12:12:36');
INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES (8, 'AB-', '0', '2018-08-18 12:13:18');


#
# TABLE STRUCTURE FOR: blood_donor
#

DROP TABLE IF EXISTS `blood_donor`;

CREATE TABLE `blood_donor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(100) DEFAULT NULL,
  `age` varchar(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `blood_group` varchar(11) DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `blood_donor` (`id`, `donor_name`, `age`, `month`, `blood_group`, `gender`, `father_name`, `address`, `contact_no`, `created_at`) VALUES (1, 'nishu', '25', '6', 'B+', 'Male', 'kartik', 'bhp', '5896896568', '2020-11-13 11:34:57');
INSERT INTO `blood_donor` (`id`, `donor_name`, `age`, `month`, `blood_group`, `gender`, `father_name`, `address`, `contact_no`, `created_at`) VALUES (2, 'yy', '', '', 'O-', 'Female', '', '', '', '2020-12-02 06:47:04');


#
# TABLE STRUCTURE FOR: blood_donor_cycle
#

DROP TABLE IF EXISTS `blood_donor_cycle`;

CREATE TABLE `blood_donor_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_donor_id` int(11) NOT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `lot` varchar(11) DEFAULT NULL,
  `bag_no` varchar(11) DEFAULT NULL,
  `quantity` varchar(11) DEFAULT NULL,
  `donate_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: blood_issue
#

DROP TABLE IF EXISTS `blood_issue`;

CREATE TABLE `blood_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `recieve_to` varchar(50) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `doctor` varchar(200) DEFAULT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `technician` varchar(50) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `donor_name` varchar(50) DEFAULT NULL,
  `lot` varchar(20) DEFAULT NULL,
  `bag_no` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `blood_issue` (`id`, `bill_no`, `date_of_issue`, `recieve_to`, `blood_group`, `gender`, `doctor`, `institution`, `technician`, `amount`, `donor_name`, `lot`, `bag_no`, `remark`, `created_at`, `generated_by`) VALUES (1, '1', '2020-11-13 17:05:00', '24', NULL, NULL, 'David smith', NULL, '', '500.00', '1', '1', '2145', 'test', '2020-11-13 11:35:43', 1);
INSERT INTO `blood_issue` (`id`, `bill_no`, `date_of_issue`, `recieve_to`, `blood_group`, `gender`, `doctor`, `institution`, `technician`, `amount`, `donor_name`, `lot`, `bag_no`, `remark`, `created_at`, `generated_by`) VALUES (2, '2', '2020-11-30 13:09:00', '9', NULL, NULL, 'David smith', NULL, '', '500.00', '1', '', '', '', '2020-11-30 07:40:34', 3);
INSERT INTO `blood_issue` (`id`, `bill_no`, `date_of_issue`, `recieve_to`, `blood_group`, `gender`, `doctor`, `institution`, `technician`, `amount`, `donor_name`, `lot`, `bag_no`, `remark`, `created_at`, `generated_by`) VALUES (3, '3', '2020-12-05 16:13:00', '29', NULL, NULL, 'David smith', NULL, '', '1500.00', '1', '2', '1020', '', '2020-12-05 10:49:15', 1);


#
# TABLE STRUCTURE FOR: certificates
#

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text NOT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` date DEFAULT NULL,
  `created_for` tinyint(1) NOT NULL COMMENT '1 = staff, 2 = patients',
  `status` tinyint(1) NOT NULL,
  `header_height` int(11) NOT NULL,
  `content_height` int(11) NOT NULL,
  `footer_height` int(11) NOT NULL,
  `content_width` int(11) NOT NULL,
  `enable_patient_image` tinyint(1) NOT NULL COMMENT '0=no,1=yes',
  `enable_image_height` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_patient_image`, `enable_image_height`) VALUES (1, 'Sample Medical Certificate', 'This is certify that <b>[patient_name]</b> has born on [dob]  <br> and have following details [year] [month] [gender] [email] [phone] [address] [module_no]', 'Reff. No.....1111111.........', 'To Whomever It May Concern', 'Date: _10__/_10__/__2019__', '.................................<br>admin', '.................................<br>Medical staff', '.................................<br>admin', 'download_(2).png', '2020-11-28 12:44:52', NULL, 2, 1, 360, 400, 480, 810, 0, 0);
INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_patient_image`, `enable_image_height`) VALUES (23, 'Medical Certificate test', 'This is certify that <b>[patient_name]</b> has born on [dob]  <br> and have following details [year] [month] [gender] [email] [phone] [address] [module_no]', 'Reff. No.....1111111.........', 'To Whomever It May Concern', 'Date:  __/__/ 20__', '------------</br>admin', '------------</br>Medical Staff', '------------</br>admin', '16.jpg', '2020-12-02 07:40:51', NULL, 2, 1, 360, 400, 480, 810, 0, 0);
INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_patient_image`, `enable_image_height`) VALUES (24, 'sdsadasd', 'dsad', 'adsadsad', 'adasdsa', 'dsadsad', '', '', '', 'baby11.jpg', '2020-11-30 10:13:40', NULL, 2, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_patient_image`, `enable_image_height`) VALUES (25, 'sadasdasdsa', 'asdsadsadsadsad', '', '', '', '', '', '', 'android-rel.jpg', '2020-11-30 10:13:20', NULL, 2, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_patient_image`, `enable_image_height`) VALUES (26, 'Sample Medical Certificate', '[xyz][14][1993][august][female][rrr@gmai.com][852147963][vihay ngarar]][10]', '  ---------------------------------- <br>Sample Medical Certificate', '         --------------------------------<br> Sample Medical Certificate', '------------------------- <br> Sample Medical Certificate', 'Sample Medical Certificate', 'Sample Medical Certificate', 'Sample Medical Certificate', '16_(9).jpg', '2020-12-02 07:19:30', NULL, 2, 1, 120, 120, 422, 100, 0, 0);
INSERT INTO `certificates` (`id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_patient_image`, `enable_image_height`) VALUES (27, '----------<br>Date of birth', 'garima,1408/1993,female,63748489494490,vijay nagar,12', '---------------Full name', 'middle name', 'Last name', 'fgggg', 'fffh', 'fgfh', '2_(1).jpg', '2020-12-02 07:40:59', NULL, 2, 1, 300, 150, 400, 150, 0, 0);


#
# TABLE STRUCTURE FOR: charge_categories
#

DROP TABLE IF EXISTS `charge_categories`;

CREATE TABLE `charge_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `charge_type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (1, 'OT Charge', 'OT Charge', 'Operation Theatre');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (2, 'Blood checkup', 'Blood checkup', 'Investigations');
INSERT INTO `charge_categories` (`id`, `name`, `description`, `charge_type`) VALUES (3, 'scan', 'scan', 'Investigations');


#
# TABLE STRUCTURE FOR: charge_type_master
#

DROP TABLE IF EXISTS `charge_type_master`;

CREATE TABLE `charge_type_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_type` varchar(200) NOT NULL,
  `is_default` varchar(100) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`) VALUES (1, 'Procedures', 'yes', 'yes');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`) VALUES (2, 'Investigations', 'yes', 'yes');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`) VALUES (3, 'Supplier', 'yes', 'yes');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`) VALUES (4, 'Operation Theatre', 'yes', 'yes');
INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`) VALUES (5, 'Others', 'yes', 'yes');


#
# TABLE STRUCTURE FOR: charges
#

DROP TABLE IF EXISTS `charges`;

CREATE TABLE `charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_type` varchar(200) NOT NULL,
  `charge_category` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `code` varchar(100) NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (1, 'Investigations', 'Blood checkup', '', 'BC231', '600', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (2, 'Investigations', 'Blood checkup', '', 'BC3215', '700', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (3, 'Investigations', 'scan', '', 'SC12', '500', '0000-00-00', '');
INSERT INTO `charges` (`id`, `charge_type`, `charge_category`, `description`, `code`, `standard_charge`, `date`, `status`) VALUES (4, 'Operation Theatre', 'OT Charge', '', 'OT11', '400', '0000-00-00', '');


#
# TABLE STRUCTURE FOR: complaint
#

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(100) NOT NULL,
  `source` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: complaint_type
#

DROP TABLE IF EXISTS `complaint_type`;

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: conference_staff
#

DROP TABLE IF EXISTS `conference_staff`;

CREATE TABLE `conference_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conference_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (1, '2020-12-05 10:47:21', 4, 2);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (2, '2020-12-05 10:47:21', 4, 3);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (3, '2020-12-05 10:47:21', 4, 4);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (4, '2020-12-05 10:47:21', 4, 5);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (5, '2020-12-05 11:53:04', 6, 2);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (6, '2020-12-05 11:53:04', 6, 3);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (7, '2020-12-05 11:53:17', 7, 2);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (8, '2020-12-05 11:53:17', 7, 3);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (9, '2020-12-05 11:53:17', 7, 4);
INSERT INTO `conference_staff` (`id`, `created_at`, `conference_id`, `staff_id`) VALUES (10, '2020-12-05 11:53:17', 7, 5);


#
# TABLE STRUCTURE FOR: conferences
#

DROP TABLE IF EXISTS `conferences`;

CREATE TABLE `conferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(200) CHARACTER SET utf8 NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `created_id` int(11) DEFAULT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `host_video` int(11) NOT NULL,
  `client_video` int(11) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 NOT NULL,
  `timezone` varchar(100) CHARACTER SET utf8 NOT NULL,
  `return_response` text NOT NULL,
  `api_type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `conferences` (`id`, `purpose`, `staff_id`, `patient_id`, `opd_id`, `ipd_id`, `created_id`, `title`, `date`, `duration`, `password`, `host_video`, `client_video`, `description`, `timezone`, `return_response`, `api_type`, `status`, `created_at`) VALUES (1, 'consult', 2, 17, 26, 0, 1, 'Online consult for OPDN26', '2020-12-01 17:36:00', 15, 'ZJ5Pz', 1, 1, '', 'Europe/Dublin', '{\"uuid\":\"yVJ6VRxPQzmheKcprrC0rA==\",\"id\":71666524164,\"host_id\":\"O-DGVhFGT9aCYPO_Sx5eig\",\"host_email\":\"garimas663@gmail.com\",\"topic\":\"Online consult for OPDN26\",\"type\":2,\"status\":\"waiting\",\"start_time\":\"2020-12-05T10:32:26Z\",\"duration\":15,\"timezone\":\"Europe\\/Dublin\",\"created_at\":\"2020-12-05T10:32:26Z\",\"start_url\":\"https:\\/\\/us04web.zoom.us\\/s\\/71666524164?zak=eyJ6bV9za20iOiJ6bV9vMm0iLCJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJjbGllbnQiLCJ1aWQiOiJPLURHVmhGR1Q5YUNZUE9fU3g1ZWlnIiwiaXNzIjoid2ViIiwic3R5IjoxLCJ3Y2QiOiJ1czA0IiwiY2x0IjowLCJzdGsiOiJnN3dJTDBZX3dvMW9za0cyTk5ENGNyNEJoUTFxaW1sV2cwZW9zOWhfc1dBLkFHLmpfeWlyd2g4ZDRoRlk5elFKU3luSnJmTk1KY0MyU0JvSVEwV1ZfMmplbTNjOFZHemFSS2JiTXFUUnpDbWItUFd6bmdRZjI5enE4QlF5eG5vLkhhX0pwQXNLdW8tMTI1QkFyWU5raEEud29McTY2bkM0VWxCOUMwXyIsImV4cCI6MTYwNzE3MTU0NiwiaWF0IjoxNjA3MTY0MzQ2LCJhaWQiOiJSMXg0cnJDYlFFQzVDeVBSalB1MWNnIiwiY2lkIjoiIn0.Rv_iIlfwRZivW2AHbZaA3FzZjwiYoYoDRTLDaU8sR2w\",\"join_url\":\"https:\\/\\/us04web.zoom.us\\/j\\/71666524164?pwd=bUJ5WHNobGhyVjhoTGtFWjN6eFk4UT09\",\"password\":\"ZJ5Pz\",\"h323_password\":\"182430\",\"pstn_password\":\"182430\",\"encrypted_password\":\"bUJ5WHNobGhyVjhoTGtFWjN6eFk4UT09\",\"settings\":{\"host_video\":true,\"participant_video\":true,\"cn_meeting\":false,\"in_meeting\":false,\"join_before_host\":false,\"mute_upon_entry\":false,\"watermark\":false,\"use_pmi\":false,\"approval_type\":2,\"audio\":\"voip\",\"auto_recording\":\"none\",\"enforce_login\":false,\"enforce_login_domains\":\"\",\"alternative_hosts\":\"\",\"close_registration\":false,\"show_share_button\":false,\"allow_multiple_devices\":false,\"registrants_confirmation_email\":true,\"waiting_room\":true,\"request_permission_to_unmute_participants\":false,\"registrants_email_notification\":true,\"meeting_authentication\":false,\"encryption_type\":\"enhanced_encryption\",\"approved_or_denied_countries_or_regions\":{\"enable\":false}}}', 'global', 0, '2020-12-05 10:32:27');
INSERT INTO `conferences` (`id`, `purpose`, `staff_id`, `patient_id`, `opd_id`, `ipd_id`, `created_id`, `title`, `date`, `duration`, `password`, `host_video`, `client_video`, `description`, `timezone`, `return_response`, `api_type`, `status`, `created_at`) VALUES (2, 'consult', 2, 1, 3, 0, 1, 'test', '2020-12-05 10:39:00', 10, 'PRUVU', 1, 1, '', 'Europe/Dublin', '{\"uuid\":\"+y63Xip9QoS3tIOxb8JDjQ==\",\"id\":74220609437,\"host_id\":\"O-DGVhFGT9aCYPO_Sx5eig\",\"host_email\":\"garimas663@gmail.com\",\"topic\":\"test\",\"type\":2,\"status\":\"waiting\",\"start_time\":\"2020-12-05T10:39:00Z\",\"duration\":10,\"timezone\":\"Europe\\/Dublin\",\"created_at\":\"2020-12-05T10:39:35Z\",\"start_url\":\"https:\\/\\/us04web.zoom.us\\/s\\/74220609437?zak=eyJ6bV9za20iOiJ6bV9vMm0iLCJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJjbGllbnQiLCJ1aWQiOiJPLURHVmhGR1Q5YUNZUE9fU3g1ZWlnIiwiaXNzIjoid2ViIiwic3R5IjoxLCJ3Y2QiOiJ1czA0IiwiY2x0IjowLCJzdGsiOiJQWFpnUkR2eUs2SVNlZFNLdlItVnl3VkFacWZsdjdmcGt0NEpLY09wSzF3LkFHLnQ3aGd5T1IyQTVFeEF5ZjFEcU1ZLU9pVGt6ZGRnaTFtaEViNElVZm44QnptcnR5THNmMGpZLXFYTkVncF9kQkk4ZFdGZlpjYzhRRmdvVk1oLlFUZFBHVFd2TlZiaFZnOFA0SWJOS2cuanVLU2FkdTc3LVBfVUlxMCIsImV4cCI6MTYwNzE3MTk3NSwiaWF0IjoxNjA3MTY0Nzc1LCJhaWQiOiJSMXg0cnJDYlFFQzVDeVBSalB1MWNnIiwiY2lkIjoiIn0.QRnCSEH3MAHwec1qqG4bRUlF-DgJUi_LGAzhhhEe-D8\",\"join_url\":\"https:\\/\\/us04web.zoom.us\\/j\\/74220609437?pwd=aCtaWXo4Q25CdDBPR0lSdGJUcXNIUT09\",\"password\":\"PRUVU\",\"h323_password\":\"860034\",\"pstn_password\":\"860034\",\"encrypted_password\":\"aCtaWXo4Q25CdDBPR0lSdGJUcXNIUT09\",\"settings\":{\"host_video\":true,\"participant_video\":true,\"cn_meeting\":false,\"in_meeting\":false,\"join_before_host\":false,\"mute_upon_entry\":false,\"watermark\":false,\"use_pmi\":false,\"approval_type\":2,\"audio\":\"voip\",\"auto_recording\":\"none\",\"enforce_login\":false,\"enforce_login_domains\":\"\",\"alternative_hosts\":\"\",\"close_registration\":false,\"show_share_button\":false,\"allow_multiple_devices\":false,\"registrants_confirmation_email\":true,\"waiting_room\":true,\"request_permission_to_unmute_participants\":false,\"registrants_email_notification\":true,\"meeting_authentication\":false,\"encryption_type\":\"enhanced_encryption\",\"approved_or_denied_countries_or_regions\":{\"enable\":false}}}', 'global', 2, '2020-12-05 10:46:21');
INSERT INTO `conferences` (`id`, `purpose`, `staff_id`, `patient_id`, `opd_id`, `ipd_id`, `created_id`, `title`, `date`, `duration`, `password`, `host_video`, `client_video`, `description`, `timezone`, `return_response`, `api_type`, `status`, `created_at`) VALUES (3, 'consult', 2, 7, 9, 0, 1, 'nn', '2020-12-05 10:39:00', 10, 'VsqfZ', 1, 1, '', 'Europe/Dublin', '{\"uuid\":\"5+bmUt4hQ5e8DPLIg9RWjw==\",\"id\":77587380797,\"host_id\":\"O-DGVhFGT9aCYPO_Sx5eig\",\"host_email\":\"garimas663@gmail.com\",\"topic\":\"nn\",\"type\":2,\"status\":\"waiting\",\"start_time\":\"2020-12-05T10:39:00Z\",\"duration\":10,\"timezone\":\"Europe\\/Dublin\",\"created_at\":\"2020-12-05T10:40:16Z\",\"start_url\":\"https:\\/\\/us04web.zoom.us\\/s\\/77587380797?zak=eyJ6bV9za20iOiJ6bV9vMm0iLCJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJjbGllbnQiLCJ1aWQiOiJPLURHVmhGR1Q5YUNZUE9fU3g1ZWlnIiwiaXNzIjoid2ViIiwic3R5IjoxLCJ3Y2QiOiJ1czA0IiwiY2x0IjowLCJzdGsiOiIyMldvLWRfOEdEb1J2Q2ZzSTZmYXlxVlFmNmdRQmxISzQwQmJXR085TWwwLkFHLjZLYXNTbFoxVGUtQXJERUdwRjU3UXNxMmt4d3VLLUFTbXhjVkZhV0ZkYjVueXRpSE80Z2wtcTVsaGxJMDFpcUZnc0hqUm5VNm1HVjVjejFoLkRkbFpyeE5pdGE3ZVI4ckZYazVwc3cuMDZZQWFHQWZsc253aUpfSCIsImV4cCI6MTYwNzE3MjAxNiwiaWF0IjoxNjA3MTY0ODE2LCJhaWQiOiJSMXg0cnJDYlFFQzVDeVBSalB1MWNnIiwiY2lkIjoiIn0.-aNoh1pbm4xKO7-dSVUNtOTAd36tDkYRpjqXGKx2-jM\",\"join_url\":\"https:\\/\\/us04web.zoom.us\\/j\\/77587380797?pwd=dVFIa1ZCMk9PdURrdWhNeFhieVpudz09\",\"password\":\"VsqfZ\",\"h323_password\":\"576011\",\"pstn_password\":\"576011\",\"encrypted_password\":\"dVFIa1ZCMk9PdURrdWhNeFhieVpudz09\",\"settings\":{\"host_video\":true,\"participant_video\":true,\"cn_meeting\":false,\"in_meeting\":false,\"join_before_host\":false,\"mute_upon_entry\":false,\"watermark\":false,\"use_pmi\":false,\"approval_type\":2,\"audio\":\"voip\",\"auto_recording\":\"none\",\"enforce_login\":false,\"enforce_login_domains\":\"\",\"alternative_hosts\":\"\",\"close_registration\":false,\"show_share_button\":false,\"allow_multiple_devices\":false,\"registrants_confirmation_email\":true,\"waiting_room\":true,\"request_permission_to_unmute_participants\":false,\"registrants_email_notification\":true,\"meeting_authentication\":false,\"encryption_type\":\"enhanced_encryption\",\"approved_or_denied_countries_or_regions\":{\"enable\":false}}}', 'global', 2, '2020-12-05 10:46:34');
INSERT INTO `conferences` (`id`, `purpose`, `staff_id`, `patient_id`, `opd_id`, `ipd_id`, `created_id`, `title`, `date`, `duration`, `password`, `host_video`, `client_video`, `description`, `timezone`, `return_response`, `api_type`, `status`, `created_at`) VALUES (5, 'consult', 2, 1, 27, 0, 1, 'Online consult for OPDN27', '2020-12-05 17:01:00', 15, 'PUpDB', 1, 1, '', 'Europe/Dublin', '{\"uuid\":\"iDO4qXW\\/QByxdzMBU3iLlA==\",\"id\":76420267724,\"host_id\":\"O-DGVhFGT9aCYPO_Sx5eig\",\"host_email\":\"garimas663@gmail.com\",\"topic\":\"Online consult for OPDN27\",\"type\":2,\"status\":\"waiting\",\"start_time\":\"2020-12-05T17:01:00Z\",\"duration\":15,\"timezone\":\"Europe\\/Dublin\",\"created_at\":\"2020-12-05T11:36:19Z\",\"start_url\":\"https:\\/\\/us04web.zoom.us\\/s\\/76420267724?zak=eyJ6bV9za20iOiJ6bV9vMm0iLCJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJjbGllbnQiLCJ1aWQiOiJPLURHVmhGR1Q5YUNZUE9fU3g1ZWlnIiwiaXNzIjoid2ViIiwic3R5IjoxLCJ3Y2QiOiJ1czA0IiwiY2x0IjowLCJzdGsiOiJRZ0FtbC1mOGF6UzFEZWNpNkMweERiYW13UE1XbnJCeTZ6bTNIYjkxZ1hVLkFHLkh5cjZIdXBNWm1YMkpza2lNa0Y3ZXJYdUI1S054V1hRdENtV0dreDdZbDNNU3JUcXBFU01KSXY0NW9JRDNRWW1tZ1dNaUZBVmJkbFI0Rm00LmFLUDFNOUpkalFoYllEb19pYU1pblEuYXpmMVZ1dFRIRWRHa0RobSIsImV4cCI6MTYwNzE3NTM3OSwiaWF0IjoxNjA3MTY4MTc5LCJhaWQiOiJSMXg0cnJDYlFFQzVDeVBSalB1MWNnIiwiY2lkIjoiIn0.E3ypaX19rTsUiocwgoQOXWiFqIiQIrdajquYR-gWus4\",\"join_url\":\"https:\\/\\/us04web.zoom.us\\/j\\/76420267724?pwd=cGdTekI2OXBDYUZRYVliN2syVWVxdz09\",\"password\":\"PUpDB\",\"h323_password\":\"026351\",\"pstn_password\":\"026351\",\"encrypted_password\":\"cGdTekI2OXBDYUZRYVliN2syVWVxdz09\",\"settings\":{\"host_video\":true,\"participant_video\":true,\"cn_meeting\":false,\"in_meeting\":false,\"join_before_host\":false,\"mute_upon_entry\":false,\"watermark\":false,\"use_pmi\":false,\"approval_type\":2,\"audio\":\"voip\",\"auto_recording\":\"none\",\"enforce_login\":false,\"enforce_login_domains\":\"\",\"alternative_hosts\":\"\",\"close_registration\":false,\"show_share_button\":false,\"allow_multiple_devices\":false,\"registrants_confirmation_email\":true,\"waiting_room\":true,\"request_permission_to_unmute_participants\":false,\"registrants_email_notification\":true,\"meeting_authentication\":false,\"encryption_type\":\"enhanced_encryption\",\"approved_or_denied_countries_or_regions\":{\"enable\":false}}}', 'global', 0, '2020-12-05 11:36:19');
INSERT INTO `conferences` (`id`, `purpose`, `staff_id`, `patient_id`, `opd_id`, `ipd_id`, `created_id`, `title`, `date`, `duration`, `password`, `host_video`, `client_video`, `description`, `timezone`, `return_response`, `api_type`, `status`, `created_at`) VALUES (6, 'meeting', NULL, 0, 0, 0, 1, 'bb', '2020-12-05 17:18:00', 10, 'AQGSW', 1, 1, 'bbb', 'Europe/Dublin', '{\"uuid\":\"hEp5JI72SeaQNmSNZyPzbA==\",\"id\":71912239754,\"host_id\":\"O-DGVhFGT9aCYPO_Sx5eig\",\"host_email\":\"garimas663@gmail.com\",\"topic\":\"bb\",\"type\":2,\"status\":\"waiting\",\"start_time\":\"2020-12-05T17:18:00Z\",\"duration\":10,\"timezone\":\"Europe\\/Dublin\",\"created_at\":\"2020-12-05T11:53:04Z\",\"start_url\":\"https:\\/\\/us04web.zoom.us\\/s\\/71912239754?zak=eyJ6bV9za20iOiJ6bV9vMm0iLCJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJjbGllbnQiLCJ1aWQiOiJPLURHVmhGR1Q5YUNZUE9fU3g1ZWlnIiwiaXNzIjoid2ViIiwic3R5IjoxLCJ3Y2QiOiJ1czA0IiwiY2x0IjowLCJzdGsiOiJDRnFVM0ZzNVp3SnRucy1hWVRkNTVlU2Q4UDdnN0lScHVJNGltTU9SRmdNLkFHLkJQeVJ1bW5Lc0wxemtvQkllQW1kM0VyUEdVTTJ6Q0dVMWNPX3hRSjIzMVhWc1l2YkJ1OVZ5NURWSjdHVlJCTE50MzRMMGRIRmdYVzI0cG0zLnR0SUR2WFVfelE0RDdkYkhYcEFjVFEuU0p3VGZnM2tzSzFnMXVEMCIsImV4cCI6MTYwNzE3NjM4NCwiaWF0IjoxNjA3MTY5MTg0LCJhaWQiOiJSMXg0cnJDYlFFQzVDeVBSalB1MWNnIiwiY2lkIjoiIn0.40BbWqy7Mlvo_Pgrw6FXFZfcAi1dHbeMfS7aEK_Vkvg\",\"join_url\":\"https:\\/\\/us04web.zoom.us\\/j\\/71912239754?pwd=cGxidXd0YkxuT0ZZS2JCMERYS3pVZz09\",\"password\":\"AQGSW\",\"h323_password\":\"026844\",\"pstn_password\":\"026844\",\"encrypted_password\":\"cGxidXd0YkxuT0ZZS2JCMERYS3pVZz09\",\"settings\":{\"host_video\":true,\"participant_video\":true,\"cn_meeting\":false,\"in_meeting\":false,\"join_before_host\":false,\"mute_upon_entry\":false,\"watermark\":false,\"use_pmi\":false,\"approval_type\":2,\"audio\":\"voip\",\"auto_recording\":\"none\",\"enforce_login\":false,\"enforce_login_domains\":\"\",\"alternative_hosts\":\"\",\"close_registration\":false,\"show_share_button\":false,\"allow_multiple_devices\":false,\"registrants_confirmation_email\":true,\"waiting_room\":true,\"request_permission_to_unmute_participants\":false,\"registrants_email_notification\":true,\"meeting_authentication\":false,\"encryption_type\":\"enhanced_encryption\",\"approved_or_denied_countries_or_regions\":{\"enable\":false}}}', 'global', 1, '2020-12-05 12:03:15');
INSERT INTO `conferences` (`id`, `purpose`, `staff_id`, `patient_id`, `opd_id`, `ipd_id`, `created_id`, `title`, `date`, `duration`, `password`, `host_video`, `client_video`, `description`, `timezone`, `return_response`, `api_type`, `status`, `created_at`) VALUES (7, 'meeting', NULL, 0, 0, 0, 1, 'gggg', '2020-12-05 17:18:00', 15, 'yErhg', 1, 1, '', 'Europe/Dublin', '{\"uuid\":\"9gbTnH62QWq0fW1mqF3ZaQ==\",\"id\":71176791165,\"host_id\":\"O-DGVhFGT9aCYPO_Sx5eig\",\"host_email\":\"garimas663@gmail.com\",\"topic\":\"gggg\",\"type\":2,\"status\":\"waiting\",\"start_time\":\"2020-12-05T17:18:00Z\",\"duration\":15,\"timezone\":\"Europe\\/Dublin\",\"created_at\":\"2020-12-05T11:53:17Z\",\"start_url\":\"https:\\/\\/us04web.zoom.us\\/s\\/71176791165?zak=eyJ6bV9za20iOiJ6bV9vMm0iLCJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJjbGllbnQiLCJ1aWQiOiJPLURHVmhGR1Q5YUNZUE9fU3g1ZWlnIiwiaXNzIjoid2ViIiwic3R5IjoxLCJ3Y2QiOiJ1czA0IiwiY2x0IjowLCJzdGsiOiJ2R3lDamRaRVZpZ0s2bkt3cXdhMldTU1BUdHVQME10THRPX0I4b0lYNDA0LkFHLlRTM2dOclZRRXdlMmdsaFAzdjFFZlZFaFJhekpCcUxlN1gtUHI4TWJ4SnoxWF9qTmlnUW44VC1peURUM2VzUjdONmdGb0RVbS1YOGNwWmRhLmp6YUtpLXAxNHl2Q0JCTmpGcXR0S0Eud0RfcXBnLUpNenhFcEdnUyIsImV4cCI6MTYwNzE3NjM5NywiaWF0IjoxNjA3MTY5MTk3LCJhaWQiOiJSMXg0cnJDYlFFQzVDeVBSalB1MWNnIiwiY2lkIjoiIn0.m80D8u080_0wI8aX0xXfTcoz5wZcO3JFw3GW7qH0L14\",\"join_url\":\"https:\\/\\/us04web.zoom.us\\/j\\/71176791165?pwd=UlJxZEQvL2krdXRqR2JqSDVBQW4yQT09\",\"password\":\"yErhg\",\"h323_password\":\"212367\",\"pstn_password\":\"212367\",\"encrypted_password\":\"UlJxZEQvL2krdXRqR2JqSDVBQW4yQT09\",\"settings\":{\"host_video\":true,\"participant_video\":true,\"cn_meeting\":false,\"in_meeting\":false,\"join_before_host\":false,\"mute_upon_entry\":false,\"watermark\":false,\"use_pmi\":false,\"approval_type\":2,\"audio\":\"voip\",\"auto_recording\":\"none\",\"enforce_login\":false,\"enforce_login_domains\":\"\",\"alternative_hosts\":\"\",\"close_registration\":false,\"show_share_button\":false,\"allow_multiple_devices\":false,\"registrants_confirmation_email\":true,\"waiting_room\":true,\"request_permission_to_unmute_participants\":false,\"registrants_email_notification\":true,\"meeting_authentication\":false,\"encryption_type\":\"enhanced_encryption\",\"approved_or_denied_countries_or_regions\":{\"enable\":false}}}', 'global', 0, '2020-12-05 11:53:17');


#
# TABLE STRUCTURE FOR: conferences_history
#

DROP TABLE IF EXISTS `conferences_history`;

CREATE TABLE `conferences_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `total_hit` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `conferences_history` (`id`, `conference_id`, `staff_id`, `patient_id`, `total_hit`, `created_at`) VALUES (1, 3, 0, 7, 0, '2020-12-05 10:45:07');


#
# TABLE STRUCTURE FOR: consult_charges
#

DROP TABLE IF EXISTS `consult_charges`;

CREATE TABLE `consult_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor` int(11) NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `consult_charges` (`id`, `doctor`, `standard_charge`, `date`, `status`) VALUES (1, 2, '500', '0000-00-00', '');


#
# TABLE STRUCTURE FOR: consultant_register
#

DROP TABLE IF EXISTS `consultant_register`;

CREATE TABLE `consultant_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `date` varchar(100) DEFAULT NULL,
  `ins_date` varchar(50) DEFAULT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (1, 4, 4, '2020-11-24 12:32:00', '2020-11-24', 'dfgdfgdfg\r\ndfgdfgdfgdfg\r\ndfgdfgdfg\r\ndfg\r\ndfg\r\ndfg\r\nd\r\nfg\r\ndfg', 2);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (2, 2, 6, '2020-11-27 14:43:00', '2020-11-27', 'test instruction', 2);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (3, 2, 6, '2020-11-26 14:43:00', '2020-11-26', 'Instruction  1', 2);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (4, 2, 6, '2020-11-27 14:43:00', '2020-11-27', 'Instruction  2', 2);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (5, 2, 6, '2020-11-28 14:43:00', '2020-11-28', 'Instruction 3', 2);
INSERT INTO `consultant_register` (`id`, `patient_id`, `ipd_id`, `date`, `ins_date`, `instruction`, `cons_doctor`) VALUES (6, 19, 7, '2020-11-30 17:47:00', '2020-11-30', 'ndgfgff', 2);


#
# TABLE STRUCTURE FOR: content_for
#

DROP TABLE IF EXISTS `content_for`;

CREATE TABLE `content_for` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: contents
#

DROP TABLE IF EXISTS `contents`;

CREATE TABLE `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `cls_sec_id` int(10) NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: custom_field_values
#

DROP TABLE IF EXISTS `custom_field_values`;

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES (1, 1, 1, 'gcbgdngggg', '2020-12-02 07:45:00');
INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES (2, 1, 3, '', '2020-12-02 07:47:10');
INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES (3, 1, 4, '', '2020-12-02 07:47:10');
INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES (4, 2, 1, 'bbb', '2020-12-02 07:49:39');
INSERT INTO `custom_field_values` (`id`, `belong_table_id`, `custom_field_id`, `field_value`, `created_at`) VALUES (5, 2, 2, 'bbbb', '2020-12-02 07:49:39');


#
# TABLE STRUCTURE FOR: custom_fields
#

DROP TABLE IF EXISTS `custom_fields`;

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int(10) DEFAULT NULL,
  `validation` int(11) DEFAULT '0',
  `field_values` mediumtext,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`) VALUES (1, 'helo9', 'birth_report', 'input', NULL, 0, NULL, NULL, 0, NULL, 0, '2020-12-02 07:45:32');
INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`) VALUES (2, 'teststststsss', 'birth_report', 'input', NULL, 0, NULL, NULL, 0, NULL, 0, '2020-12-02 07:53:37');
INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`) VALUES (3, 'ffffff', 'death_report', 'input', NULL, 0, NULL, NULL, 0, NULL, 0, '2020-12-02 07:52:58');
INSERT INTO `custom_fields` (`id`, `name`, `belong_to`, `type`, `bs_column`, `validation`, `field_values`, `show_table`, `visible_on_table`, `weight`, `is_active`, `created_at`) VALUES (4, 'tersrttt', 'death_report', 'input', NULL, 0, NULL, NULL, 0, NULL, 0, '2020-12-02 07:45:56');


#
# TABLE STRUCTURE FOR: death_report
#

DROP TABLE IF EXISTS `death_report`;

CREATE TABLE `death_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opdipd_no` varchar(200) NOT NULL,
  `patient` varchar(200) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `death_date` datetime NOT NULL,
  `guardian_name` varchar(200) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `death_report` text NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `death_report` (`id`, `opdipd_no`, `patient`, `gender`, `image`, `death_date`, `guardian_name`, `contact`, `address`, `death_report`, `is_active`, `created_at`) VALUES (1, '1020', '18', '', '', '2020-12-02 13:11:00', 'nnn', '', '', '', 'yes', '2020-12-02 07:47:10');


#
# TABLE STRUCTURE FOR: department
#

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: diagnosis
#

DROP TABLE IF EXISTS `diagnosis`;

CREATE TABLE `diagnosis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `report_type` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `diagnosis` (`id`, `patient_id`, `report_type`, `document`, `description`, `report_date`) VALUES (1, 19, 'Hyroid', '', 'na', '2020-11-30');
INSERT INTO `diagnosis` (`id`, `patient_id`, `report_type`, `document`, `description`, `report_date`) VALUES (2, 2, 'dadasd', '', 'dasdasd', '2020-12-31');


#
# TABLE STRUCTURE FOR: discharged_summary
#

DROP TABLE IF EXISTS `discharged_summary`;

CREATE TABLE `discharged_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `operation` varchar(200) NOT NULL,
  `diagnosis` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `investigations` text NOT NULL,
  `treatment_home` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: discharged_summary_opd
#

DROP TABLE IF EXISTS `discharged_summary_opd`;

CREATE TABLE `discharged_summary_opd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `operation` varchar(200) NOT NULL,
  `diagnosis` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `investigations` text NOT NULL,
  `treatment_home` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `discharged_summary_opd` (`id`, `patient_id`, `opd_id`, `operation`, `diagnosis`, `note`, `investigations`, `treatment_home`, `created_at`) VALUES (1, 17, 19, '', '', '', '', '', '2020-11-30 12:00:08');


#
# TABLE STRUCTURE FOR: dispatch_receive
#

DROP TABLE IF EXISTS `dispatch_receive`;

CREATE TABLE `dispatch_receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: email_config
#

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `is_active`, `created_at`) VALUES (2, 'sendmail', '', '', '', '', '', 'yes', '2019-11-01 12:51:35');


#
# TABLE STRUCTURE FOR: enquiry
#

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` mediumtext NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` mediumtext NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` varchar(100) NOT NULL,
  `class` int(11) NOT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: enquiry_type
#

DROP TABLE IF EXISTS `enquiry_type`;

CREATE TABLE `enquiry_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: events
#

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `events` (`id`, `event_title`, `event_description`, `start_date`, `end_date`, `event_type`, `event_color`, `event_for`, `role_id`, `is_active`) VALUES (1, 'check opd patient report', '', '2020-11-30 00:00:00', '2020-11-30 00:00:00', 'task', '#000', '1', 7, 'yes');
INSERT INTO `events` (`id`, `event_title`, `event_description`, `start_date`, `end_date`, `event_type`, `event_color`, `event_for`, `role_id`, `is_active`) VALUES (2, 'seminar for medical student', 'na', '2020-11-28 06:30:00', '2020-12-01 06:30:00', 'private', '#c53da9', '1', 0, '');


#
# TABLE STRUCTURE FOR: expense_head
#

DROP TABLE IF EXISTS `expense_head`;

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: expenses
#

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: floor
#

DROP TABLE IF EXISTS `floor`;

CREATE TABLE `floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `floor` (`id`, `name`, `description`) VALUES (1, 'Ground', '');
INSERT INTO `floor` (`id`, `name`, `description`) VALUES (2, 'First', '');
INSERT INTO `floor` (`id`, `name`, `description`) VALUES (3, 'Second', '');


#
# TABLE STRUCTURE FOR: follow_up
#

DROP TABLE IF EXISTS `follow_up`;

CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: front_cms_media_gallery
#

DROP TABLE IF EXISTS `front_cms_media_gallery`;

CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` mediumtext NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: front_cms_menu_items
#

DROP TABLE IF EXISTS `front_cms_menu_items`;

CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` mediumtext,
  `open_new_tab` int(11) DEFAULT '0',
  `ext_url_link` mediumtext,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (16, 2, 'Home', 1, 0, NULL, NULL, NULL, 'home-1', NULL, 0, NULL, 'no', '2018-07-14 08:44:12');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (23, 1, 'Appointment', 77, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment', 2, 0, NULL, 'no', '2019-11-01 07:36:32');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (26, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', NULL, 0, NULL, 'no', '2019-01-24 08:48:17');
INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (27, 2, 'Appointment', 0, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment-1', NULL, 0, NULL, 'no', '2019-11-02 16:24:41');


#
# TABLE STRUCTURE FOR: front_cms_menus
#

DROP TABLE IF EXISTS `front_cms_menus`;

CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` mediumtext,
  `open_new_tab` int(10) NOT NULL DEFAULT '0',
  `ext_url` mediumtext NOT NULL,
  `ext_url_link` mediumtext NOT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:24:49');
INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:24:55');


#
# TABLE STRUCTURE FOR: front_cms_page_contents
#

DROP TABLE IF EXISTS `front_cms_page_contents`;

CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: front_cms_pages
#

DROP TABLE IF EXISTS `front_cms_pages`;

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(1) DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` mediumtext,
  `meta_description` mediumtext,
  `meta_keyword` mediumtext,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext,
  `publish_date` date NOT NULL,
  `publish` int(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT '0',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p>Home page</p>', '0000-00-00', 1, 1, 'no', '2019-01-24 08:33:59');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<div class=\"col-md-12 col-sm-12\">\r\n<h2 class=\"text-center\">&nbsp;</h2>\r\n\r\n<p class=\"text-center\">[form-builder:complain]</p>\r\n</div>', '0000-00-00', 1, 1, 'no', '2019-01-24 08:30:12');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (54, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 09:16:04');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (76, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<p>[form-builder:contact_us]</p>', '0000-00-00', 0, NULL, 'no', '2019-01-24 08:31:58');
INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (77, 'manual', 0, 'our-appointment', 'page/our-appointment', 'page', 'our-appointment', '', '', '', '', '<form action=\"welcome/appointment\" method=\"get\">\r\n  First name: <input type=\"text\" name=\"fname\"><br>\r\n  Last name: <input type=\"text\" name=\"lname\"><br>\r\n  <input type=\"submit\" value=\"Submit\">\r\n</form>', '0000-00-00', 0, 1, 'no', '2019-11-01 07:32:48');


#
# TABLE STRUCTURE FOR: front_cms_program_photos
#

DROP TABLE IF EXISTS `front_cms_program_photos`;

CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: front_cms_programs
#

DROP TABLE IF EXISTS `front_cms_programs`;

CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` mediumtext,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` mediumtext,
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_title` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `feature_image` mediumtext NOT NULL,
  `publish_date` date NOT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: front_cms_settings
#

DROP TABLE IF EXISTS `front_cms_settings`;

CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(10) DEFAULT '0',
  `is_active_front_cms` int(11) DEFAULT '0',
  `is_active_sidebar` int(1) DEFAULT '0',
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` mediumtext NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` mediumtext,
  `footer_text` varchar(500) DEFAULT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`, `created_at`) VALUES (1, 'default', NULL, 0, 0, '', '', '', '[\"news\",\"complain\"]', '', '', '', '', '', '', '', '', '', '', '2019-11-02 16:23:38');


#
# TABLE STRUCTURE FOR: general_calls
#

DROP TABLE IF EXISTS `general_calls`;

CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` mediumtext NOT NULL,
  `call_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: income
#

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `documents` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: income_head
#

DROP TABLE IF EXISTS `income_head`;

CREATE TABLE `income_head` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: ipd_billing
#

DROP TABLE IF EXISTS `ipd_billing`;

CREATE TABLE `ipd_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `other_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `gross_total` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `generated_by` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (1, 19, 1, 0, '0', '2020-11-13', '0.00', '600.00', '600.00', '600.00', 3, 'paid');
INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (2, 24, 2, 0, '0', '2020-11-16', '0.00', '0.00', '0.00', '0.00', 3, 'paid');
INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (3, 4, 3, 0, '0', '2020-11-20', '0.00', '600.00', '500.00', '600.00', 3, 'paid');
INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (4, 7, 5, 0, '0', '2020-11-28', '0.00', '0.00', '0.00', '0.00', 1, 'paid');
INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (5, 20, 8, 0, '0.00', '2020-12-03', '0.00', '600.00', '600.00', '600.00', 1, 'paid');
INSERT INTO `ipd_billing` (`id`, `patient_id`, `ipd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`) VALUES (6, 2, 6, 0, '0.00', '2020-12-03', '0.00', '600.00', '500.00', '600.00', 1, 'paid');


#
# TABLE STRUCTURE FOR: ipd_details
#

DROP TABLE IF EXISTS `ipd_details`;

CREATE TABLE `ipd_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `height` varchar(5) DEFAULT NULL,
  `weight` varchar(5) DEFAULT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `bp` varchar(20) DEFAULT NULL,
  `ipd_no` varchar(200) NOT NULL,
  `room` varchar(100) NOT NULL,
  `bed` varchar(100) NOT NULL,
  `bed_group_id` varchar(10) DEFAULT NULL,
  `case_type` varchar(100) NOT NULL,
  `casualty` varchar(100) NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `refference` varchar(200) NOT NULL,
  `cons_doctor` int(11) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `credit_limit` varchar(100) NOT NULL,
  `tax` varchar(100) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `discharged_date` date NOT NULL,
  `live_consult` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`, `live_consult`) VALUES (3, 4, '', '', '', '', '', '', 'IPDN3', '', '3', '1', '', 'No', '', '', '', '', 2, '', '20000', '', '', '2020-11-20 10:24:00', 'yes', '2020-11-20', 'Yes');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`, `live_consult`) VALUES (4, 4, '', '', '', '', '', '', 'IPDN4', '', '1', '1', '', 'No', '', '', '', '', 2, '', '20000', '', '', '2020-11-21 17:38:00', 'no', '0000-00-00', 'No');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`, `live_consult`) VALUES (5, 7, '', '', '', '', '', '', 'IPDN5', '', '2', '1', '', 'No', '', '', '', '', 2, '', '20000', '', '', '2020-11-25 13:01:00', 'yes', '2020-11-28', 'No');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`, `live_consult`) VALUES (6, 2, '', '', '', '', '', '', 'IPDN6', '', '4', '1', '', 'No', '', '', '', '', 2, '', '20000', '', '', '2020-11-26 13:02:00', 'yes', '2020-12-03', 'No');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`, `live_consult`) VALUES (7, 19, '', '', '', '', '', '', 'IPDN7', '', '2', '1', '', 'No', '', '', '', '', 2, '', '20000', '', '', '2020-11-30 17:44:00', 'no', '0000-00-00', 'Yes');
INSERT INTO `ipd_details` (`id`, `patient_id`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `bp`, `ipd_no`, `room`, `bed`, `bed_group_id`, `case_type`, `casualty`, `symptoms`, `known_allergies`, `note`, `refference`, `cons_doctor`, `amount`, `credit_limit`, `tax`, `payment_mode`, `date`, `discharged`, `discharged_date`, `live_consult`) VALUES (8, 20, '', '', '', '', '', '', 'IPDN8', '', '3', '1', '', 'No', '', '', '', '', 2, '', '20000', '', '', '2020-12-03 00:24:00', 'yes', '2020-12-03', 'No');


#
# TABLE STRUCTURE FOR: ipd_doctors
#

DROP TABLE IF EXISTS `ipd_doctors`;

CREATE TABLE `ipd_doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipd_id` int(11) NOT NULL,
  `consult_doctor` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `ipd_doctors` (`id`, `ipd_id`, `consult_doctor`, `created_at`) VALUES (3, 6, 5, '2020-12-02 07:52:02');
INSERT INTO `ipd_doctors` (`id`, `ipd_id`, `consult_doctor`, `created_at`) VALUES (4, 7, 4, '2020-12-04 06:06:59');
INSERT INTO `ipd_doctors` (`id`, `ipd_id`, `consult_doctor`, `created_at`) VALUES (5, 7, 5, '2020-12-04 06:06:59');
INSERT INTO `ipd_doctors` (`id`, `ipd_id`, `consult_doctor`, `created_at`) VALUES (6, 7, 4, '2020-12-04 06:07:20');
INSERT INTO `ipd_doctors` (`id`, `ipd_id`, `consult_doctor`, `created_at`) VALUES (7, 7, 5, '2020-12-04 06:07:20');
INSERT INTO `ipd_doctors` (`id`, `ipd_id`, `consult_doctor`, `created_at`) VALUES (8, 7, 4, '2020-12-04 06:07:37');
INSERT INTO `ipd_doctors` (`id`, `ipd_id`, `consult_doctor`, `created_at`) VALUES (9, 7, 5, '2020-12-04 06:07:37');


#
# TABLE STRUCTURE FOR: ipd_prescription_basic
#

DROP TABLE IF EXISTS `ipd_prescription_basic`;

CREATE TABLE `ipd_prescription_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipd_id` int(11) NOT NULL,
  `header_note` varchar(100) NOT NULL,
  `footer_note` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `ipd_prescription_basic` (`id`, `ipd_id`, `header_note`, `footer_note`, `date`) VALUES (1, 6, '<p>dgf</p>', '<p>dfgdfg</p>', '2020-11-27');
INSERT INTO `ipd_prescription_basic` (`id`, `ipd_id`, `header_note`, `footer_note`, `date`) VALUES (2, 7, '<p>grgfvergvthbtgrfbfg</p>', '<p>bbbbb</p>', '2020-11-30');


#
# TABLE STRUCTURE FOR: ipd_prescription_details
#

DROP TABLE IF EXISTS `ipd_prescription_details`;

CREATE TABLE `ipd_prescription_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `ipd_prescription_details` (`id`, `basic_id`, `ipd_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES (1, 1, 6, 1, 'Dcold', '1', '');
INSERT INTO `ipd_prescription_details` (`id`, `basic_id`, `ipd_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES (2, 2, 7, 1, 'Dcold', '1', 'bvnbvhnn');


#
# TABLE STRUCTURE FOR: item
#

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(200) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `quantity` int(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `created_at`, `item_store_id`, `item_supplier_id`, `quantity`, `date`) VALUES (1, 1, 'dispensary', '10', NULL, '', '2020-11-16 12:26:42', NULL, NULL, 0, '0000-00-00');
INSERT INTO `item` (`id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `created_at`, `item_store_id`, `item_supplier_id`, `quantity`, `date`) VALUES (2, 2, 'fsdf', '50', NULL, '', '2020-11-20 06:02:54', NULL, NULL, 0, '0000-00-00');


#
# TABLE STRUCTURE FOR: item_category
#

DROP TABLE IF EXISTS `item_category`;

CREATE TABLE `item_category` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `item_category` (`id`, `item_category`, `is_active`, `description`, `created_at`) VALUES (1, 'Syringe', 'yes', '', '2020-11-16 12:22:51');


#
# TABLE STRUCTURE FOR: item_issue
#

DROP TABLE IF EXISTS `item_issue`;

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` varchar(10) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `item_category_id` (`item_category_id`),
  CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES (1, '3', '2', 'Super Admin', '2020-11-13', '0000-00-00', 1, 1, 1, 'test', 1, '2020-11-18 07:32:33', 'no');
INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES (2, '3', '2', 'Super Admin', '2020-11-18', '0000-00-00', 1, 1, 1, 'tttt', 1, '2020-11-18 09:47:14', 'no');
INSERT INTO `item_issue` (`id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES (3, '3', '2', 'Super Admin', '2020-11-18', '2020-11-20', 1, 1, 1, 'rtyr', 1, '2020-11-18 09:50:34', 'no');


#
# TABLE STRUCTURE FOR: item_stock
#

DROP TABLE IF EXISTS `item_stock`;

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (1, 1, 1, '+', 1, 5, '100', '2020-11-16', NULL, 'fdfds dfdfdsf', 'yes', '2020-11-18 09:33:26');
INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (2, 1, 1, '+', 1, 5, '2', '2020-11-20', NULL, '', 'yes', '2020-11-20 06:02:33');
INSERT INTO `item_stock` (`id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (3, 2, 1, '+', 1, 10, '10', '2020-11-20', NULL, '', 'yes', '2020-11-20 06:03:12');


#
# TABLE STRUCTURE FOR: item_store
#

DROP TABLE IF EXISTS `item_store`;

CREATE TABLE `item_store` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `item_store` (`id`, `item_store`, `code`, `description`) VALUES (1, 'SK pharma', 'ss123', '');


#
# TABLE STRUCTURE FOR: item_supplier
#

DROP TABLE IF EXISTS `item_supplier`;

CREATE TABLE `item_supplier` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `item_supplier` (`id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES (1, 'john', '8958659864', 'jhon@gmail.com', 'jbp', '6589586954', '9856985698', 'ajay@gmail.com', 'test');


#
# TABLE STRUCTURE FOR: lab
#

DROP TABLE IF EXISTS `lab`;

CREATE TABLE `lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `lab` (`id`, `lab_name`) VALUES (1, 'xray');
INSERT INTO `lab` (`id`, `lab_name`) VALUES (2, 'sonography');


#
# TABLE STRUCTURE FOR: languages
#

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'Azerbaijan', 'az', 'az', 'no', 'no', '2019-11-20 11:23:12', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'Albanian', 'sq', 'al', 'no', 'no', '2019-11-20 11:42:42', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (3, 'Amharic', 'am', 'am', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (4, 'English', 'en', 'us', 'no', 'no', '2019-11-20 11:38:50', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (5, 'Arabic', 'ar', 'sa', 'no', 'no', '2019-11-20 11:47:28', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (7, 'Afrikaans', 'af', 'af', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (8, 'Basque', 'eu', 'es', 'no', 'no', '2019-11-20 11:54:10', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (11, 'Bengali', 'bn', 'in', 'no', 'no', '2019-11-20 11:41:53', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (13, 'Bosnian', 'bs', 'bs', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (14, 'Welsh', 'cy', 'cy', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (15, 'Hungarian', 'hu', 'hu', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (16, 'Vietnamese', 'vi', 'vi', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (17, 'Haitian', 'ht', 'ht', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (18, 'Galician', 'gl', 'gl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (19, 'Dutch', 'nl', 'nl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (21, 'Greek', 'el', 'gr', 'no', 'no', '2019-11-20 12:12:08', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (22, 'Georgian', 'ka', 'ge', 'no', 'no', '2019-11-20 12:11:40', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (23, 'Gujarati', 'gu', 'in', 'no', 'no', '2019-11-20 11:39:16', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (24, 'Danish', 'da', 'dk', 'no', 'no', '2019-11-20 12:03:25', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (25, 'Hebrew', 'he', 'il', 'no', 'no', '2019-11-20 12:13:50', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (26, 'Yiddish', 'yi', 'il', 'no', 'no', '2019-11-20 12:25:33', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (27, 'Indonesian', 'id', 'id', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (28, 'Irish', 'ga', 'ga', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (29, 'Italian', 'it', 'it', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (30, 'Icelandic', 'is', 'is', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (31, 'Spanish', 'es', 'es', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (33, 'Kannada', 'kn', 'kn', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (34, 'Catalan', 'ca', 'ca', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (36, 'Chinese', 'zh', 'cn', 'no', 'no', '2019-11-20 12:01:48', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (37, 'Korean', 'ko', 'kr', 'no', 'no', '2019-11-20 12:19:09', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (38, 'Xhosa', 'xh', 'ls', 'no', 'no', '2019-11-20 12:24:39', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (39, 'Latin', 'la', 'la', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (40, 'Latvian', 'lv', 'lv', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (41, 'Lithuanian', 'lt', 'lt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (43, 'Malagasy', 'mg', 'mg', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (44, 'Malay', 'ms', 'ms', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (45, 'Malayalam', 'ml', 'ml', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (46, 'Maltese', 'mt', 'mt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (47, 'Macedonian', 'mk', 'mk', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (48, 'Maori', 'mi', 'nz', 'no', 'no', '2019-11-20 12:20:27', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (49, 'Marathi', 'mr', 'in', 'no', 'no', '2019-11-20 11:39:51', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (51, 'Mongolian', 'mn', 'mn', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (52, 'German', 'de', 'de', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (53, 'Nepali', 'ne', 'ne', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (54, 'Norwegian', 'no', 'no', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (55, 'Punjabi', 'pa', 'in', 'no', 'no', '2019-11-20 11:40:16', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (57, 'Persian', 'fa', 'ir', 'no', 'no', '2019-11-20 12:21:17', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (59, 'Portuguese', 'pt', 'pt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (60, 'Romanian', 'ro', 'ro', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (61, 'Russian', 'ru', 'ru', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (62, 'Cebuano', 'ceb', 'ph', 'no', 'no', '2019-11-20 11:59:12', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (64, 'Sinhala', 'si', 'si', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (65, 'Slovakian', 'sk', 'sk', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (66, 'Slovenian', 'sl', 'sl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (67, 'Swahili', 'sw', 'ke', 'no', 'no', '2019-11-20 12:21:57', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (68, 'Sundanese', 'su', 'sd', 'no', 'no', '2019-12-03 11:06:57', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (70, 'Thai', 'th', 'th', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (71, 'Tagalog', 'tl', 'tl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (72, 'Tamil', 'ta', 'in', 'no', 'no', '2019-11-20 11:40:53', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (74, 'Telugu', 'te', 'in', 'no', 'no', '2019-11-20 11:41:15', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (75, 'Turkish', 'tr', 'tr', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (77, 'Uzbek', 'uz', 'uz', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (79, 'Urdu', 'ur', 'pk', 'no', 'no', '2019-11-20 12:23:57', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (80, 'Finnish', 'fi', 'fi', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (81, 'French', 'fr', 'fr', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (82, 'Hindi', 'hi', 'in', 'no', 'no', '2019-11-20 11:36:34', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (84, 'Czech', 'cs', 'cz', 'no', 'no', '2019-11-20 12:02:36', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (85, 'Swedish', 'sv', 'sv', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (86, 'Scottish', 'gd', 'gd', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (87, 'Estonian', 'et', 'et', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (88, 'Esperanto', 'eo', 'br', 'no', 'no', '2019-11-21 04:49:18', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (89, 'Javanese', 'jv', 'id', 'no', 'no', '2019-11-20 12:18:29', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (90, 'Japanese', 'ja', 'jp', 'no', 'no', '2019-11-20 12:14:39', '0000-00-00');
INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (91, 'Polish', 'pl', 'pl', 'yes', 'no', '2020-04-05 14:09:04', NULL);


#
# TABLE STRUCTURE FOR: leave_types
#

DROP TABLE IF EXISTS `leave_types`;

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (1, 'Man nahi hai', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (2, 'Physician', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (3, 'Heart Specialist', 'yes');
INSERT INTO `leave_types` (`id`, `type`, `is_active`) VALUES (4, 'Diabetes Specialist', 'yes');


#
# TABLE STRUCTURE FOR: medicine_bad_stock
#

DROP TABLE IF EXISTS `medicine_bad_stock`;

CREATE TABLE `medicine_bad_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacy_id` int(11) NOT NULL,
  `outward_date` date NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: medicine_batch_details
#

DROP TABLE IF EXISTS `medicine_batch_details`;

CREATE TABLE `medicine_batch_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_bill_basic_id` varchar(100) NOT NULL,
  `medicine_category_id` varchar(200) NOT NULL,
  `pharmacy_id` int(100) NOT NULL,
  `inward_date` datetime NOT NULL,
  `expiry_date` varchar(100) DEFAULT NULL,
  `expiry_date_format` date NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `packing_qty` varchar(100) NOT NULL,
  `purchase_rate_packing` varchar(100) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `mrp` varchar(11) DEFAULT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `sale_rate` varchar(11) DEFAULT NULL,
  `batch_amount` decimal(10,2) NOT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `available_quantity` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (1, '1', '1', 1, '2020-11-14 14:15:00', 'Feb/2019', '2019-02-01', '2489', '20', '', '10', '200', '100', '180', '2000.00', '1000', '0', '2020-11-13 08:46:52');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (2, '2', '1', 1, '2020-11-16 15:24:00', 'Mar/2022', '2022-03-01', '3251', '20', '', '20', '200', '80', '150', '1000.00', '1600', '9', '2020-11-16 09:55:55');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (3, '3', '1', 1, '2020-11-30 16:47:00', 'Jun/2020', '2020-06-01', '2315', '', '', '10', '230', '150', '600', '0.00', '1500', '5', '2020-11-30 11:18:53');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (4, '4', '1', 1, '2020-11-30 16:49:00', 'Feb/2020', '2020-03-01', '32313', '', '', '10', '200', '140', '500', '0.00', '1400', '10', '2020-11-30 11:19:42');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (5, '5', '1', 1, '2020-11-30 17:07:00', 'May/2020', '2020-05-01', '11', '1', '', '1', '1', '10', '1', '1.00', '10', '1', '2020-11-30 11:42:03');
INSERT INTO `medicine_batch_details` (`id`, `supplier_bill_basic_id`, `medicine_category_id`, `pharmacy_id`, `inward_date`, `expiry_date`, `expiry_date_format`, `batch_no`, `packing_qty`, `purchase_rate_packing`, `quantity`, `mrp`, `purchase_price`, `sale_rate`, `batch_amount`, `amount`, `available_quantity`, `created_at`) VALUES (6, '6', '1', 1, '2020-12-05 17:49:00', 'Feb/2020', '2020-02-01', '432', '12', '', '12', '1111', '800', '222', '222.00', '9600', '12', '2020-12-05 12:19:15');


#
# TABLE STRUCTURE FOR: medicine_category
#

DROP TABLE IF EXISTS `medicine_category`;

CREATE TABLE `medicine_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (1, 'Tablet');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (2, 'Syrup');
INSERT INTO `medicine_category` (`id`, `medicine_category`) VALUES (3, 'Capsules');


#
# TABLE STRUCTURE FOR: medicine_dosage
#

DROP TABLE IF EXISTS `medicine_dosage`;

CREATE TABLE `medicine_dosage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_category_id` int(11) NOT NULL,
  `dosage_form` varchar(100) NOT NULL,
  `dosage` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (1, 1, '', '1');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (2, 1, '', '1/2');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (3, 2, '', '10 ml');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (4, 2, '', '5 ml');
INSERT INTO `medicine_dosage` (`id`, `medicine_category_id`, `dosage_form`, `dosage`) VALUES (5, 3, '', '1');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `message` text,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `file` varchar(200) NOT NULL,
  `group_list` text,
  `user_list` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `messages` (`id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `file`, `group_list`, `user_list`, `created_at`) VALUES (1, 'hghgfhfg', 'fhfghfgh', '0', '1', '1', '0', '', '[]', NULL, '2020-12-02 10:28:48');


#
# TABLE STRUCTURE FOR: migrations
#

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: notification_roles
#

DROP TABLE IF EXISTS `notification_roles`;

CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `send_notification_id` (`send_notification_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (1, 1, 1, 0, '2020-12-05 11:33:02');
INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (2, 1, 2, 0, '2020-12-05 11:33:02');
INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (3, 1, 3, 0, '2020-12-05 11:33:02');
INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (4, 1, 4, 0, '2020-12-05 11:33:02');
INSERT INTO `notification_roles` (`id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (5, 2, 3, 0, '2020-12-05 11:33:39');


#
# TABLE STRUCTURE FOR: notification_setting
#

DROP TABLE IF EXISTS `notification_setting`;

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` int(11) DEFAULT '0',
  `is_sms` int(11) DEFAULT '0',
  `is_mobileapp` int(11) NOT NULL,
  `is_notification` int(11) NOT NULL,
  `display_notification` int(11) NOT NULL,
  `display_sms` int(11) NOT NULL,
  `template` longtext NOT NULL,
  `subject` text NOT NULL,
  `variables` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (1, 'opd_patient_registration', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your OPD Registration is successful at Hospital Name with Patient Id  {{patient_unique_id}} and OPD No  {{opd_no}}', 'OPD Patient', '{{patient_name}} {{mobileno}} {{email}}  {{dob}} {{gender}}  {{patient_unique_id}}    {{opd_no}}', '2020-11-10 06:59:59');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (2, 'ipd_patient_registration', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your IPD Registration is successful at Hospital Name with Patient Id  {{patient_unique_id}} and IPD No {{ipd_no}}', 'IPD Patient', '{{patient_name}} {{mobileno}} {{email}}  {{dob}} {{gender}}  {{patient_unique_id}}   {{ipd_no}} ', '2020-11-10 06:59:59');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (3, 'ipd_patient_discharged', 1, 0, 0, 0, 1, 1, 'IPD Patient {{patient_name}} is now discharged from Hospital Name Total Charges: {{currency_symbol}} {{charge_amount}}  Total payment: {{currency_symbol}} {{paid_amount}} Your net payable bill amount was {{currency_symbol}} {{net_amount}}', 'IPD Discharged Patient', '{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{currency_symbol}} {{charge_amount}} {{paid_amount}} {{net_amount}}', '2020-11-10 06:59:59');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (4, 'opd_patient_revisit', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your OPD Registration is successful at Hospital Name with Patient Id  {{patient_unique_id}} and OPD No {{opd_no}}\r\n\r\n{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{opd_no}}', 'OPD Patient Revisit', '{{patient_name}} {{mobileno}} {{email}}  {{dob}} {{gender}}  {{patient_unique_id}} {{opd_no}} ', '2020-11-10 06:59:59');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (5, 'login_credential', 1, 0, 0, 0, 0, 1, 'Hello {{display_name}} your login details for Url: {{url}} Username:  {{username}} Password: {{password}} {{email}}', 'Login Patient', '{{display_name}}    {{url}} {{username}} {{password}} {{email}}', '2020-11-10 06:57:09');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (6, 'appointment_approved', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your appointment with {{staff_name}} {{staff_surname}} is confirmed on {{date}} with appointment no: {{appointment_no}}', 'Appointment Approved', '{{patient_name}} {{mobileno}} {{email}}   {{gender}}    {{staff_name}}\r\n{{staff_surname}}  {{date}} {{appointment_no}}', '2020-11-10 06:59:59');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (7, 'live_meeting', 1, 0, 0, 0, 0, 1, 'Dear staff, your live meeting {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.\r\n\r\n{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', 'Live Meeting', '{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', '2020-11-07 12:55:38');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (8, 'live_consult', 1, 0, 0, 0, 1, 1, 'Dear patient, your live consultation {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.\r\n\r\n{{title}} {{date}} {{duration}}', 'Live Consultation', '{{title}} {{date}} {{duration}}', '2020-11-10 06:59:59');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (9, 'opd_patient_discharged', 1, 0, 0, 0, 1, 1, 'OPD No {{opd_no}}  {{patient_name}} is now discharged from Hospital Name Your net payable bill amount was {{currency_symbol}}  \r\n {{billing_amount}}\r\n\r\n\r\n{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{opd_no}} {{currency_symbol}} {{billing_amount}}', 'OPD Discharged Patient', '{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{opd_no}}{{currency_symbol}} {{billing_amount}}', '2020-11-10 06:59:59');
INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES (10, 'forgot_password', 1, 0, 0, 0, 0, 0, 'Dear  {{display_name}} , Recently a request was submitted to reset password for your account. If you didn\'t make the request, just ignore this email. Otherwise you can reset your password using this link <a href=\'{{resetpasslink}}\'>Click here to reset your password</a>, if you\'re having trouble clicking the password reset button, copy and paste the URL below into your web browser. {{resetpasslink}} <br> Regards,  <br>\r\nHospital Name', 'Password Update Request', '{{display_name}}  {{email}}  {{resetpasslink}', '2020-12-04 07:59:56');


#
# TABLE STRUCTURE FOR: opd_billing
#

DROP TABLE IF EXISTS `opd_billing`;

CREATE TABLE `opd_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `other_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `gross_total` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `generated_by` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `paymode` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (1, 27, 1, 0, '0', '2020-11-16', '0.00', '600.00', '600.00', '600.00', 3, 'paid', '');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (2, 1, 3, 0, '0', '2020-11-16', '0.00', '700.00', '700.00', '700.00', 3, 'paid', '');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (3, 2, 7, 0, '0', '2020-11-27', '0.00', '0.00', '0.00', '0.00', 1, 'paid', '');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (4, 7, 9, 0, '0', '2020-11-27', '0.00', '0.00', '0.00', '0.00', 1, 'paid', '');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (5, 4, 6, 0, '0', '2020-11-28', '0.00', '0.00', '0.00', '0.00', 1, 'paid', '');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (6, 2, 4, 0, '0', '2020-11-28', '0.00', '1000.00', '1000.00', '1000.00', 1, 'paid', 'Cash');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (7, 1, 10, 0, '0', '2020-11-28', '0.00', '0.00', '0.00', '0.00', 1, 'paid', 'Cheque');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (8, 8, 12, 0, '0', '2020-11-28', '0.00', '0.00', '0.00', '0.00', 1, 'paid', 'Cash');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (9, 11, 14, 0, '0.00', '2020-11-28', '0.00', '0.00', '0.00', '0.00', 1, 'paid', 'Cash');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (10, 7, 11, 0, '0.00', '2020-11-28', '0.00', '600.00', '600.00', '600.00', 1, 'paid', 'Cash');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (11, 17, 19, 0, '0.00', '2020-11-30', '0.00', '600.00', '600.00', '600.00', 1, 'paid', 'Cash');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (12, 18, 20, 0, '0.00', '2020-11-30', '0.00', '600.00', '600.00', '600.00', 1, 'paid', 'Cash');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (13, 16, 18, 60, '0.00', '2020-12-01', '27.00', '567.00', '567.00', '600.00', 1, 'paid', 'Online');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (14, 11, 15, 0, '10000.00', '2020-12-01', '0.00', '10000.00', '10000.00', '0.00', 1, 'paid', 'Cash');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (15, 10, 13, 100, '1000.00', '2020-12-01', '0.00', '900.00', '900.00', '0.00', 1, 'paid', 'Cash');
INSERT INTO `opd_billing` (`id`, `patient_id`, `opd_id`, `discount`, `other_charge`, `date`, `tax`, `gross_total`, `net_amount`, `total_amount`, `generated_by`, `status`, `paymode`) VALUES (16, 19, 24, 0, '0.00', '2020-12-05', '0.00', '1800.00', '1799.00', '1800.00', 1, 'paid', 'Cash');


#
# TABLE STRUCTURE FOR: opd_details
#

DROP TABLE IF EXISTS `opd_details`;

CREATE TABLE `opd_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `opd_no` varchar(100) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `case_type` varchar(200) NOT NULL,
  `casualty` varchar(200) NOT NULL,
  `symptoms` text,
  `bp` varchar(200) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `note_remark` varchar(225) DEFAULT NULL,
  `refference` varchar(100) NOT NULL,
  `cons_doctor` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `header_note` varchar(200) NOT NULL,
  `footer_note` varchar(200) NOT NULL,
  `generated_by` int(11) NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `live_consult` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (3, 1, 'OPDN3', '2020-11-16 11:59:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (4, 2, 'OPDN4', '2020-11-17 15:37:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (5, 4, 'OPDN5', '2020-11-18 10:10:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (6, 4, 'OPDN6', '2020-11-24 12:53:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (7, 2, 'OPDN7', '2020-11-30 12:54:00', '', 'No', '', '', '6', '54', '', '', '', 'dust', '', '', 2, '500.00', '0.00', 'Cash', '<p>\r\n\r\nHeader Note\r\n\r\n<br></p>', '<p>\r\n\r\n<div><div>Footer Note</div></div>\r\n\r\n<br></p>', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (8, 1, 'OPDN8', '2020-11-24 12:58:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (9, 7, 'OPDN9', '2020-12-01 13:04:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (10, 1, 'OPDN10', '2020-12-01 13:16:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (11, 7, 'OPDN11', '2020-11-28 15:37:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'Yes');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (12, 8, 'OPDN12', '2020-11-28 17:02:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '<p>\r\n\r\nHeader Note\r\n\r\n<br></p>', '<p>\r\n\r\n<div><div>Footer Note</div></div>\r\n\r\n<br></p>', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (13, 10, 'OPDN13', '2020-11-28 17:07:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'Yes');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (14, 11, 'OPDN14', '2020-11-28 17:34:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (15, 11, 'OPDN15', '2020-11-28 18:26:00', 'naa', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (16, 16, 'OPDN16', '2020-11-28 18:30:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'Yes');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (17, 16, 'OPDN17', '2020-11-30 15:49:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cheque', '', '', 1, 'no', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (18, 16, 'OPDN18', '2020-11-30 17:01:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (19, 17, 'OPDN19', '2020-11-30 17:21:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (20, 18, 'OPDN20', '2020-11-30 17:02:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'Yes');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (21, 18, 'OPDN21', '2020-11-30 17:38:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (22, 20, 'OPDN22', '2020-12-02 11:34:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'Yes');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (23, 21, 'OPDN23', '2020-12-02 11:46:00', 'fffffffffffff', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'Yes');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (24, 19, 'OPDN24', '2020-12-02 11:48:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'yes', 'No');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (25, 17, 'OPDN25', '2020-12-02 11:51:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'Yes');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (26, 17, 'OPDN26', '2020-12-01 17:36:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'Yes');
INSERT INTO `opd_details` (`id`, `patient_id`, `opd_no`, `appointment_date`, `case_type`, `casualty`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `note_remark`, `refference`, `cons_doctor`, `amount`, `tax`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (27, 1, 'OPDN27', '2020-12-05 17:01:00', '', 'No', '', '', '', '', '', '', '', '', '', '', 2, '500.00', '0.00', 'Cash', '', '', 1, 'no', 'Yes');


#
# TABLE STRUCTURE FOR: opd_patient_charges
#

DROP TABLE IF EXISTS `opd_patient_charges`;

CREATE TABLE `opd_patient_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `org_charge_id` int(11) NOT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (1, '2020-11-16', 27, 1, 1, 0, '600.00', '2020-11-16 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (2, '2020-11-16', 1, 3, 2, 0, '700.00', '2020-11-16 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (3, '2020-11-17', 2, 4, 1, 0, '600.00', '2020-11-17 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (4, '2020-11-17', 2, 4, 4, 0, '400.00', '2020-11-17 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (5, '2020-11-13', 7, 11, 1, 0, '600.00', '2020-11-28 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (6, '2020-11-30', 17, 19, 1, 0, '600.00', '2020-11-30 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (7, '2020-11-30', 18, 20, 1, 0, '600.00', '2020-11-30 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (8, '2020-12-01', 16, 18, 1, 0, '600.00', '2020-12-01 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (9, '2020-12-04', 19, 24, 1, 0, '600.00', '2020-12-05 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (10, '2020-12-05', 19, 24, 1, 0, '600.00', '2020-12-05 00:00:00');
INSERT INTO `opd_patient_charges` (`id`, `date`, `patient_id`, `opd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (11, '2020-12-01', 19, 24, 1, 0, '600.00', '2020-12-05 00:00:00');


#
# TABLE STRUCTURE FOR: opd_payment
#

DROP TABLE IF EXISTS `opd_payment`;

CREATE TABLE `opd_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(200) NOT NULL,
  `generated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `opd_payment` (`id`, `patient_id`, `opd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`, `generated_by`) VALUES (1, 19, 24, '100.00', '500.00', '600.00', 'Cash', 'test', '2020-12-04', '', 1);
INSERT INTO `opd_payment` (`id`, `patient_id`, `opd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`, `generated_by`) VALUES (2, 19, 24, '500.00', '700.00', '1200.00', 'Cash', 'naa', '2020-12-05', '', 1);
INSERT INTO `opd_payment` (`id`, `patient_id`, `opd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`, `generated_by`) VALUES (3, 19, 24, '500.00', '1300.00', '1800.00', 'Cash', '', '2020-12-06', '', 1);


#
# TABLE STRUCTURE FOR: operation_theatre
#

DROP TABLE IF EXISTS `operation_theatre`;

CREATE TABLE `operation_theatre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `charge_id` varchar(11) DEFAULT NULL,
  `operation_name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `operation_type` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(100) DEFAULT NULL,
  `ass_consultant_1` varchar(50) DEFAULT NULL,
  `ass_consultant_2` varchar(50) DEFAULT NULL,
  `anesthetist` varchar(50) DEFAULT NULL,
  `anaethesia_type` varchar(50) DEFAULT NULL,
  `ot_technician` varchar(100) DEFAULT NULL,
  `ot_assistant` varchar(100) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `height` varchar(200) NOT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `weight` varchar(200) NOT NULL,
  `bp` varchar(200) NOT NULL,
  `symptoms` text,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `operation_theatre` (`id`, `bill_no`, `patient_id`, `customer_type`, `charge_id`, `operation_name`, `date`, `operation_type`, `consultant_doctor`, `ass_consultant_1`, `ass_consultant_2`, `anesthetist`, `anaethesia_type`, `ot_technician`, `ot_assistant`, `result`, `remark`, `height`, `pulse`, `temperature`, `respiration`, `weight`, `bp`, `symptoms`, `apply_charge`, `created_at`, `generated_by`) VALUES (1, '1', 22, NULL, '4', 'ttt', '2020-11-13', 'ttt', '2', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '400.00', '2020-11-13 11:23:43', 1);
INSERT INTO `operation_theatre` (`id`, `bill_no`, `patient_id`, `customer_type`, `charge_id`, `operation_name`, `date`, `operation_type`, `consultant_doctor`, `ass_consultant_1`, `ass_consultant_2`, `anesthetist`, `anaethesia_type`, `ot_technician`, `ot_assistant`, `result`, `remark`, `height`, `pulse`, `temperature`, `respiration`, `weight`, `bp`, `symptoms`, `apply_charge`, `created_at`, `generated_by`) VALUES (2, '2', 7, NULL, '4', 'ttt', '2020-11-30', 'tt', '2', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '400.00', '2020-11-30 06:30:11', 3);
INSERT INTO `operation_theatre` (`id`, `bill_no`, `patient_id`, `customer_type`, `charge_id`, `operation_name`, `date`, `operation_type`, `consultant_doctor`, `ass_consultant_1`, `ass_consultant_2`, `anesthetist`, `anaethesia_type`, `ot_technician`, `ot_assistant`, `result`, `remark`, `height`, `pulse`, `temperature`, `respiration`, `weight`, `bp`, `symptoms`, `apply_charge`, `created_at`, `generated_by`) VALUES (3, '3', 9, NULL, '4', 'nnn', '2020-12-05', 'nn', '2', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '400.00', '2020-12-05 10:07:04', 1);


#
# TABLE STRUCTURE FOR: organisation
#

DROP TABLE IF EXISTS `organisation`;

CREATE TABLE `organisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organisation_name` varchar(200) NOT NULL,
  `code` varchar(50) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contact_person_name` varchar(200) NOT NULL,
  `contact_person_phone` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: organisations_charges
#

DROP TABLE IF EXISTS `organisations_charges`;

CREATE TABLE `organisations_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `charge_type` varchar(50) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `org_charge` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `charge_id` (`charge_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: ot_consultant_register
#

DROP TABLE IF EXISTS `ot_consultant_register`;

CREATE TABLE `ot_consultant_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `date` varchar(50) NOT NULL,
  `ins_date` date NOT NULL,
  `ins_time` time NOT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: pathology
#

DROP TABLE IF EXISTS `pathology`;

CREATE TABLE `pathology` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `pathology_category_id` varchar(11) NOT NULL,
  `pathology_parameter_id` varchar(100) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `pathology_parameter_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (1, 'Malariya', 'mp', 'mp', '2', '', '', 'mp', '1', 'blood test', 1, '2020-11-13 09:17:30');
INSERT INTO `pathology` (`id`, `test_name`, `short_name`, `test_type`, `pathology_category_id`, `pathology_parameter_id`, `unit`, `sub_category`, `report_days`, `method`, `charge_id`, `created_at`) VALUES (2, 'fever ', 'f', 'f', '1', '', '', '', '', '', 1, '2020-12-02 06:44:47');


#
# TABLE STRUCTURE FOR: pathology_category
#

DROP TABLE IF EXISTS `pathology_category`;

CREATE TABLE `pathology_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `pathology_category` (`id`, `category_name`) VALUES (1, 'mp');
INSERT INTO `pathology_category` (`id`, `category_name`) VALUES (2, 'blood ');


#
# TABLE STRUCTURE FOR: pathology_parameter
#

DROP TABLE IF EXISTS `pathology_parameter`;

CREATE TABLE `pathology_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `test_value` varchar(100) CHARACTER SET latin1 NOT NULL,
  `reference_range` varchar(100) CHARACTER SET latin1 NOT NULL,
  `gender` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `gender`, `unit`, `description`, `created_at`) VALUES (1, 'sugar', '', '150', '', '1', '', '2020-11-13 09:15:39');
INSERT INTO `pathology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `gender`, `unit`, `description`, `created_at`) VALUES (2, 'Hemoglobin', '', '12', '', '2', '', '2020-11-13 09:16:10');


#
# TABLE STRUCTURE FOR: pathology_parameterdetails
#

DROP TABLE IF EXISTS `pathology_parameterdetails`;

CREATE TABLE `pathology_parameterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pathology_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pathology_report_id` int(11) NOT NULL,
  `pathology_report_value` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `parameter_id`, `created_id`, `pathology_report_id`, `pathology_report_value`) VALUES (1, 1, 2, '2020-11-13 09:17:47', 0, '');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `parameter_id`, `created_id`, `pathology_report_id`, `pathology_report_value`) VALUES (2, 1, 1, '2020-11-28 12:43:05', 0, '');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `parameter_id`, `created_id`, `pathology_report_id`, `pathology_report_value`) VALUES (3, 1, 2, '2020-11-28 12:43:05', 0, '');
INSERT INTO `pathology_parameterdetails` (`id`, `pathology_id`, `parameter_id`, `created_id`, `pathology_report_id`, `pathology_report_value`) VALUES (4, 2, 2, '2020-12-02 06:44:47', 0, '');


#
# TABLE STRUCTURE FOR: pathology_report
#

DROP TABLE IF EXISTS `pathology_report`;

CREATE TABLE `pathology_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `pathology_id` int(11) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pathology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `pathology_report` (`id`, `bill_no`, `pathology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `pathology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (2, '2', 1, '1', NULL, NULL, '2', '2020-11-16', '', '', '600.00', '2020-11-16 06:39:03', 1);
INSERT INTO `pathology_report` (`id`, `bill_no`, `pathology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `pathology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (3, '3', 1, '7', NULL, NULL, '2', '2020-11-12', '', '3.jpg', '600.00', '2020-11-27 05:35:11', 3);
INSERT INTO `pathology_report` (`id`, `bill_no`, `pathology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `pathology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (4, '4', 2, '27', NULL, NULL, '', '2020-12-05', '', '', '600.00', '2020-12-05 10:48:08', 1);


#
# TABLE STRUCTURE FOR: pathology_report_parameterdetails
#

DROP TABLE IF EXISTS `pathology_report_parameterdetails`;

CREATE TABLE `pathology_report_parameterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pathology_report_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `pathology_report_value` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `pathology_report_parameterdetails` (`id`, `pathology_report_id`, `parameter_id`, `pathology_report_value`) VALUES (1, 1, 2, '');
INSERT INTO `pathology_report_parameterdetails` (`id`, `pathology_report_id`, `parameter_id`, `pathology_report_value`) VALUES (2, 2, 2, '');
INSERT INTO `pathology_report_parameterdetails` (`id`, `pathology_report_id`, `parameter_id`, `pathology_report_value`) VALUES (3, 3, 2, '');
INSERT INTO `pathology_report_parameterdetails` (`id`, `pathology_report_id`, `parameter_id`, `pathology_report_value`) VALUES (4, 4, 2, '');


#
# TABLE STRUCTURE FOR: patient_charges
#

DROP TABLE IF EXISTS `patient_charges`;

CREATE TABLE `patient_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `ipd_id` int(11) NOT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `org_charge_id` int(11) DEFAULT NULL,
  `apply_charge` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (1, '2020-11-13', 19, 1, 1, 0, '600', '2020-11-13 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (2, '2020-11-30', 4, 3, 1, 0, '600', '2020-11-20 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (3, '2020-11-30', 2, 6, 1, 0, '600', '2020-11-30 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (4, '2020-11-30', 19, 7, 1, 0, '600', '2020-11-30 00:00:00');
INSERT INTO `patient_charges` (`id`, `date`, `patient_id`, `ipd_id`, `charge_id`, `org_charge_id`, `apply_charge`, `created_at`) VALUES (5, '2020-12-31', 20, 8, 1, 0, '600', '2020-12-03 00:00:00');


#
# TABLE STRUCTURE FOR: patient_timeline
#

DROP TABLE IF EXISTS `patient_timeline`;

CREATE TABLE `patient_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: patients
#

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_unique_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `admission_date` varchar(100) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `age` varchar(10) NOT NULL,
  `month` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `marital_status` varchar(100) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_address` text,
  `guardian_email` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `discharged` varchar(100) NOT NULL,
  `patient_type` varchar(200) NOT NULL,
  `credit_limit` varchar(50) DEFAULT NULL,
  `organisation` varchar(100) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `old_patient` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `disable_at` date NOT NULL,
  `note` varchar(200) NOT NULL,
  `is_ipd` varchar(200) NOT NULL,
  `app_key` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (1, 1001, 0, NULL, 'nishu', '6', '4', 'uploads/patient_images/7klvd_1.jpg', '1234567890', 'nishutiwari112345@gmail.com', '2014-07-08', 'Male', 'Single', 'O+', 'jabalpur', '', NULL, NULL, '', 'yes', 'yes', 'OT', NULL, '', 'dust', 'No', '2020-11-26 07:20:15', '0000-00-00', 'ggg', 'yes', 'f1Q2v-HNx40:APA91bHUGGEfhBm-_aHD04MuswTtj8omWQIH_NZw4lYmVsxukNwTKnV-yvRm57hOcWnnj7HyUef-CjM-Dui2q4HKls56gC4SvExLgwt_KZbLPBG4XJaSXfVp8gmaJxxWwLyoxwpim8--');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (3, 1003, 0, NULL, 'nitin', '15', '2', 'uploads/patient_images/no_image.png', '', 'nitin.koshta1990@gmail.com', '0000-00-00', 'Male', '', '', 'Bhopal', '', NULL, NULL, '', 'no', 'no', '', NULL, '', '', '', '2020-12-05 10:30:47', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (4, 1004, 0, NULL, 'nitin', '16', '5', 'uploads/patient_images/no_image.png', '', '', '0000-00-00', 'Male', '', '', 'Bhoplal', '', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'No', '2020-11-28 09:45:01', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (7, 1005, 0, NULL, 'preeti', '20', '6', 'uploads/patient_images/no_image.png', '9926226695', '', '0000-00-00', 'Female', '', '', 'Indore', '', NULL, NULL, '', 'yes', 'yes', 'OT', NULL, '', '', 'No', '2020-11-30 06:30:11', '0000-00-00', '', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (9, 1007, 0, NULL, 'dinnu', '', '', 'uploads/patient_images/no_image.png', '2323232', 'demo12@gmail.com', '0000-00-00', '', '', '', '', '', NULL, NULL, '', 'yes', 'no', 'OT', NULL, '', '', '', '2020-12-05 10:07:04', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (10, 1008, 0, NULL, 'test bg', '20', '0', 'uploads/patient_images/10.jpg', '7412589632', '', '2000-11-25', 'Female', 'Single', 'AB+', 'vijay nagar', 'test', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'naaa', 'No', '2020-11-28 11:45:41', '0000-00-00', 'na', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (11, 1009, 0, NULL, 'test report', '19', '0', 'uploads/patient_images/11.png', '7896541230', '', '2000-11-30', 'Male', 'Single', 'B+', 'na', 'test', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'na', 'No', '2020-11-28 12:10:24', '0000-00-00', 'na', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (16, 1014, 0, NULL, 'test', '', '', 'uploads/patient_images/no_image.png', '789654', 'fff', '0000-00-00', 'Male', '', '', '', '', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'No', '2020-11-30 10:24:09', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (17, 1015, 0, NULL, 'ginni test', '20', '0', 'uploads/patient_images/no_image.png', '', '', '2000-11-30', 'Female', '', '', '', 'nana', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'No', '2020-11-30 11:56:30', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (18, 1016, 0, NULL, 'save test', '20', '0', 'uploads/patient_images/no_image.png', '789654123', '', '2000-11-30', 'Male', 'Single', 'O+', 'vijay nagar', '', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', 'No', '2020-11-30 12:01:32', '0000-00-00', 'naa', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (19, 1017, 0, NULL, 'garima marko', '28', '0', 'uploads/patient_images/no_image.png', '8451236975665', 'garimarock01@gmail.com', '1992-11-10', 'Female', 'Single', 'A+', 'vijay nagar', 'na', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'na', 'No', '2020-12-02 06:23:24', '0000-00-00', 'na', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (20, 1018, 0, NULL, 'Rashmi', '19', '0', 'uploads/patient_images/no_image.png', '8745123690', 'rashmi@gmail.com', '2000-12-30', 'Female', 'Single', 'AB+', 'na', '', NULL, NULL, '', 'yes', 'yes', '', NULL, '', 'na', 'No', '2020-12-03 06:01:35', '0000-00-00', 'na', 'yes', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (22, 1020, 0, NULL, 'saveeeee', '', '', 'uploads/patient_images/no_image.png', '78965412300000', '', '0000-00-00', 'Male', '', '', '', 'na', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2020-12-02 07:23:00', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (23, 1021, 0, NULL, 'Ronit', '19', '1', 'uploads/patient_images/no_image.png', '8521479630', '', '2000-12-23', 'Male', 'Single', 'O+', '', '', NULL, NULL, '', 'yes', 'no', '', NULL, '', '', '', '2020-12-05 10:23:46', '0000-00-00', '', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (25, 1025, 0, NULL, 'rahul', '20', 'august', 'uploads/patient_images/no_image.png', '789654130', 'rahul@gmail.com.', NULL, 'male', 'single', '120', 'vijay nagar', 'ronit', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'no', '', '2020-12-05 10:28:30', '0000-00-00', 'na', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (26, 1026, 0, NULL, 'rahul', '20', 'september', 'uploads/patient_images/no_image.png', '789654130', 'rahul@gmail.com.', NULL, 'male', 'single', '120', 'vijay nagar', 'ronit', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'no', '', '2020-12-05 10:28:30', '0000-00-00', 'na', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (27, 1027, 0, NULL, 'rahul', '20', 'october', 'uploads/patient_images/no_image.png', '789654130', 'rahul@gmail.com.', NULL, 'male', 'single', '120', 'vijay nagar', 'ronit', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'no', '', '2020-12-05 10:28:30', '0000-00-00', 'na', '', '');
INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `created_at`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES (28, 1028, 0, NULL, 'rahul', '20', 'november', 'uploads/patient_images/no_image.png', '789654130', 'rahul@gmail.com.', NULL, 'male', 'single', '120', 'vijay nagar', 'ronit', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'no', '', '2020-12-05 10:28:30', '0000-00-00', 'na', '', '');


#
# TABLE STRUCTURE FOR: payment
#

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`) VALUES (1, 4, 3, '100.00', '500.00', '600.00', 'Cash', '', '2020-11-18', '');
INSERT INTO `payment` (`id`, `patient_id`, `ipd_id`, `paid_amount`, `balance_amount`, `total_amount`, `payment_mode`, `note`, `date`, `document`) VALUES (2, 2, 6, '100.00', '500.00', '600.00', 'Cash', 'ssss', '2020-11-30', '');


#
# TABLE STRUCTURE FOR: payment_settings
#

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `paytm_website` varchar(255) NOT NULL,
  `paytm_industrytype` varchar(255) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `paytm_website`, `paytm_industrytype`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `created_at`) VALUES (1, 'pesapal', NULL, '', '', '', '', '', NULL, NULL, NULL, '', '', 'no', '2020-11-04 23:20:40');
INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `paytm_website`, `paytm_industrytype`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `created_at`) VALUES (2, 'ipayafrica', NULL, '', '', '', '', '', NULL, NULL, NULL, '', '', 'no', '2020-11-04 23:20:40');


#
# TABLE STRUCTURE FOR: payslip_allowance
#

DROP TABLE IF EXISTS `payslip_allowance`;

CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (1, 1, '', '0', 2, 'positive');
INSERT INTO `payslip_allowance` (`id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (2, 1, '', '0', 2, 'negative');


#
# TABLE STRUCTURE FOR: permission_category
#

DROP TABLE IF EXISTS `permission_category`;

CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT '0',
  `enable_add` int(11) DEFAULT '0',
  `enable_edit` int(11) DEFAULT '0',
  `enable_delete` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 10:23:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 10:22:44');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 10:24:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 10:23:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 10:33:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (31, 10, 'Issue Item', 'issue_item', 1, 1, 0, 1, '2018-12-17 09:55:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (32, 10, 'Item Stock', 'item_stock', 1, 1, 1, 1, '2018-06-22 10:35:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (33, 10, 'Item', 'item', 1, 1, 1, 1, '2018-06-22 10:35:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (34, 10, 'Store', 'store', 1, 1, 1, 1, '2018-06-22 10:36:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (35, 10, 'Supplier', 'supplier', 1, 1, 1, 1, '2018-06-22 10:36:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 10:41:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (44, 13, 'Email / SMS', 'email_sms', 1, 0, 0, 0, '2018-06-22 10:40:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (48, 14, 'OPD Report', 'opd_report', 1, 0, 0, 0, '2018-12-18 08:59:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (53, 15, 'Languages', 'languages', 0, 1, 0, 0, '2018-06-22 10:43:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 09:08:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 09:08:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 09:08:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 09:08:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 09:08:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 09:08:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 03:50:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 03:50:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 10:46:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 10:46:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 10:47:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 10:47:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 08:39:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 10:48:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 10:50:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 10:50:21');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 10:50:04');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (84, 17, 'Complain', 'complain', 1, 1, 1, 1, '2018-12-19 09:11:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (85, 17, 'Setup Front Office', 'setup_front_office', 1, 1, 1, 1, '2018-11-15 00:49:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 10:53:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 10:53:12');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 10:53:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (89, 18, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2018-06-22 10:52:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 10:52:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (91, 18, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2018-06-22 10:52:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 10:54:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 10:34:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 1, 1, 1, '2018-07-02 10:17:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 1, '2020-08-25 01:48:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 10:17:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 03:57:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 03:57:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 07:13:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 08:42:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 08:42:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-05 08:08:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 04:17:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 04:17:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (132, 23, 'OPD Patient', 'opd_patient', 1, 1, 1, 1, '2018-12-20 09:37:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (134, 23, 'Prescription', 'prescription', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (135, 23, 'Revisit', 'revisit', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (136, 23, 'OPD Diagnosis', 'opd diagnosis', 1, 1, 1, 1, '2018-10-11 06:46:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (137, 23, 'OPD Timeline', 'opd timeline', 1, 1, 1, 1, '2018-10-11 06:47:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (138, 24, 'IPD Patients', 'ipd_patient', 1, 1, 1, 1, '2018-10-11 07:14:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (139, 24, 'Discharged Patients', 'discharged patients', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (140, 24, 'Consultant Register', 'consultant register', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (141, 24, 'IPD Diagnosis', 'ipd diagnosis', 1, 1, 1, 1, '2018-10-11 06:49:18');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (142, 24, 'IPD Timeline', 'ipd timeline', 1, 1, 1, 1, '2018-10-11 06:49:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (143, 24, 'Charges', 'charges', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (144, 24, 'Payment', 'payment', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (145, 24, 'Bill', 'bill', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (146, 25, 'Medicine', 'medicine', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (147, 25, 'Add Medicine Stock', 'add_medicine_stock', 1, 1, 1, 1, '2018-12-21 10:49:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (148, 25, 'Pharmacy Bill', 'pharmacy bill', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (149, 26, 'Pathology Test', 'pathology test', 1, 1, 1, 1, '2018-12-22 08:46:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (150, 26, 'Add Patient & Test Report', 'add_patho_patient_test_report', 1, 1, 1, 1, '2019-10-18 07:05:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (152, 27, 'Radiology Test', 'radiology test', 1, 1, 1, 1, '2018-10-11 01:28:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (153, 27, 'Add Patient & Test Report', 'add_radio_patient_test_report', 1, 1, 1, 1, '2020-08-25 00:13:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (155, 22, 'IPD Income Widget', 'ipd_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (156, 22, 'OPD Income Widget', 'opd_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (157, 22, 'Pharmacy Income Widget', 'pharmacy_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (158, 22, 'Pathology Income Widget', 'pathology_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (159, 22, 'Radiology Income Widget', 'radiology_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (160, 22, 'OT Income Widget', 'ot_income_widget', 1, 0, 0, 0, '2018-12-20 09:09:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (161, 22, 'Blood Bank Income Widget', 'blood_bank_income_widget', 1, 0, 0, 0, '2018-12-20 09:09:13');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (162, 22, 'Ambulance Income Widget', 'ambulance_income_widget', 1, 0, 0, 0, '2018-12-20 09:09:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (163, 28, 'OT Patient', 'ot_patient', 1, 1, 1, 1, '2018-10-27 03:35:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (164, 28, 'OT Consultant Instruction', 'ot_consultant_instruction', 1, 1, 1, 1, '2018-10-27 03:36:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (165, 29, 'Ambulance Call', 'ambulance_call', 1, 1, 1, 1, '2018-10-27 03:37:51');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (166, 29, 'Ambulance', 'ambulance', 1, 1, 1, 1, '2018-10-27 03:37:59');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (167, 30, 'Blood Bank Status', 'blood_bank_status', 1, 1, 1, 1, '2018-10-27 04:20:09');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (168, 30, 'Blood Issue', 'blood_issue', 1, 1, 1, 1, '2018-10-27 04:20:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (169, 30, 'Blood Donor', 'blood_donor', 1, 1, 1, 1, '2018-10-27 04:20:19');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (170, 25, 'Medicine Category', 'medicine_category', 1, 1, 1, 1, '2018-10-25 06:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (171, 27, 'Radiology Category', 'radiology category', 1, 1, 1, 1, '2018-12-22 09:03:20');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (173, 31, 'Organisation', 'organisation', 1, 1, 1, 1, '2018-10-25 06:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (174, 31, 'Charges', 'tpa_charges', 1, 1, 1, 1, '2018-12-22 10:06:57');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (175, 26, 'Pathology Category', 'pathology_category', 1, 1, 1, 1, '2018-10-25 06:10:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (176, 32, 'Charges', 'hospital_charges', 1, 1, 1, 1, '2018-12-22 10:08:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (178, 14, 'IPD Report', 'ipd_report', 1, 0, 0, 0, '2018-12-12 10:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (179, 14, 'Pharmacy Bill Report', 'pharmacy_bill_report', 1, 0, 0, 0, '2018-12-12 10:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (180, 14, 'Pathology Patient Report', 'pathology_patient_report', 1, 0, 0, 0, '2018-12-12 10:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (181, 14, 'Radiology Patient Report', 'radiology_patient_report', 1, 0, 0, 0, '2018-12-12 10:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (182, 14, 'OT Report', 'ot_report', 1, 0, 0, 0, '2019-03-08 06:56:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (183, 14, 'Blood Donor Report', 'blood_donor_report', 1, 0, 0, 0, '2019-03-08 06:56:54');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (184, 14, 'Payroll Month Report', 'payroll_month_report', 1, 0, 0, 0, '2019-03-08 06:57:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (185, 14, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2019-03-08 06:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (186, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2019-03-08 07:03:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (187, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2018-12-12 10:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (188, 14, 'Patient Login Credential', 'patient_login_credential', 1, 0, 0, 0, '2018-12-12 10:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (189, 14, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-12-12 10:09:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (190, 22, 'Yearly Income & Expense Chart', 'yearly_income_expense_chart', 1, 0, 0, 0, '2018-12-12 10:22:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (191, 22, 'Monthly Income & Expense Chart', 'monthly_income_expense_chart', 1, 0, 0, 0, '2018-12-12 10:25:14');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (192, 23, 'OPD Prescription Print Header Footer ', 'opd_prescription_print_header_footer', 1, 1, 1, 1, '2018-12-12 10:31:07');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (193, 24, 'Revert Generated Bill', 'revert_generated_bill', 1, 0, 0, 0, '2018-12-12 10:34:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (194, 24, 'Calculate Bill', 'calculate_bill', 1, 0, 0, 0, '2018-12-12 10:35:30');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (195, 24, 'Generate Bill & Discharge Patient', 'generate_bill_discharge_patient', 1, 0, 0, 0, '2018-12-21 09:26:00');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (196, 24, 'Bed', 'bed', 1, 1, 1, 1, '2018-12-12 10:46:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (197, 24, 'IPD Prescription Print Header Footer', 'ipd_prescription_print_header_footer', 1, 1, 1, 1, '2018-12-12 10:39:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (198, 24, 'Bed Status', 'bed_status', 1, 0, 0, 0, '2018-12-12 10:39:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (200, 25, 'Medicine Bad Stock', 'medicine_bad_stock', 1, 1, 0, 1, '2018-12-18 01:12:46');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (201, 25, 'Pharmacy Bill print Header Footer', 'pharmacy_bill_print_header_footer', 1, 1, 1, 1, '2018-12-12 11:06:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (202, 30, 'Donate Blood', 'donate_blood', 1, 1, 0, 1, '2018-12-12 11:17:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (203, 32, 'Charge Category', 'charge_category', 1, 1, 1, 1, '2018-12-12 11:19:38');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (204, 17, 'Appointment', 'appointment', 1, 1, 1, 1, '2018-12-18 11:52:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (205, 17, 'Appointment Approve', 'appointment_approve', 1, 0, 0, 0, '2018-12-18 11:55:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (206, 14, 'TPA Report', 'tpa_report', 1, 0, 0, 0, '2019-03-08 06:49:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (207, 14, 'Ambulance Report', 'ambulance_report', 1, 0, 0, 0, '2019-03-08 06:49:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (208, 14, 'Discharge Patient Report', 'discharge_patient_report', 1, 0, 0, 0, '2019-03-08 06:49:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (209, 14, 'Appointment Report', 'appointment_report', 1, 0, 0, 0, '2019-03-08 06:50:10');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (210, 14, 'Transaction Report', 'transaction_report', 1, 0, 0, 0, '2019-03-08 06:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (211, 14, 'Blood Issue Report', 'blood_issue_report', 1, 0, 0, 0, '2019-03-08 06:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (212, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-03-08 06:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (213, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-03-08 06:57:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (214, 34, 'Birth Record', 'birth_record', 1, 1, 1, 1, '2018-06-22 10:36:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (215, 34, 'Death Record', 'death_record', 1, 1, 1, 1, '2018-06-22 10:36:02');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (216, 17, 'Move Patient in OPD', 'move_patient_in_opd', 1, 0, 0, 0, '2019-09-23 04:44:41');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (217, 17, 'Move Patient in IPD', 'move_patient_in_ipd', 1, 0, 0, 0, '2018-12-18 11:55:58');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (218, 23, 'Move Patient in IPD', 'opd_move _patient_in_ipd', 1, 0, 0, 0, '2019-09-23 04:49:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (219, 23, 'Manual Prescription', 'manual_prescription', 1, 0, 0, 0, '2019-09-23 04:52:06');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (220, 24, 'Prescription ', 'ipd_prescription', 1, 1, 1, 1, '2019-09-24 00:59:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (221, 23, 'Charges', 'opd_charges', 1, 1, 1, 1, '2019-09-23 04:58:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (222, 23, 'Payment', 'opd_payment', 1, 1, 1, 1, '2019-09-24 00:44:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (223, 23, 'Bill', 'opd_bill', 1, 1, 1, 1, '2019-09-23 04:59:37');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (224, 25, 'Import Medicine', 'import_medicine', 1, 0, 0, 0, '2019-09-23 05:03:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (225, 25, 'Medicine Purchase', 'medicine_purchase', 1, 1, 1, 1, '2019-09-23 05:05:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (226, 25, 'Medicine Supplier', 'medicine_supplier', 1, 1, 1, 1, '2019-09-23 05:09:36');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (227, 25, 'Medicine Dosage', 'medicine_dosage', 1, 1, 1, 1, '2019-09-23 05:17:16');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (228, 32, 'Doctor OPD Charges', 'doctor_opd_charges', 1, 1, 1, 1, '2019-09-23 05:20:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (236, 36, 'Patient', 'patient', 1, 1, 1, 1, '2019-09-23 06:25:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (237, 36, 'Enabled/Disabled', 'enabled_disabled', 1, 0, 0, 0, '2019-09-23 06:25:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (238, 22, 'Notification Center', 'notification_center', 1, 0, 0, 0, '2019-09-24 03:48:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (239, 36, 'Import', 'patient_import', 1, 0, 0, 0, '2019-10-04 01:20:26');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (240, 34, 'Birth Print Header Footer', 'birth_print_header_footer', 1, 1, 1, 1, '2019-10-04 02:44:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (241, 34, 'Custom Fields', 'birth_death_customfields', 1, 1, 1, 1, '2019-10-04 01:23:55');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (242, 34, 'Death Print Header Footer', 'death_print_header_footer', 1, 1, 1, 1, '2019-10-04 02:43:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (243, 26, 'Print Header Footer', 'pathology_print_header_footer', 1, 1, 1, 1, '2019-10-04 01:36:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (244, 27, 'Print Header Footer', 'radiology_print_header_footer', 1, 1, 1, 1, '2019-10-04 01:40:01');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (245, 28, 'Print Header Footer', 'ot_print_header_footer', 1, 1, 1, 1, '2019-10-04 01:41:15');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (246, 30, 'Print Header Footer', 'bloodbank_print_header_footer', 1, 1, 1, 1, '2019-10-04 02:47:17');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (247, 29, 'Print Header Footer', 'ambulance_print_header_footer', 1, 1, 1, 1, '2019-10-04 01:45:03');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (248, 24, 'IPD Bill Print Header Footer', 'ipd_bill_print_header_footer', 1, 1, 1, 1, '2019-10-04 02:13:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (249, 18, 'Print Payslip Header Footer', 'print_payslip_header_footer', 1, 1, 1, 1, '2019-10-04 02:31:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (250, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2020-08-12 05:52:52');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (251, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-04 04:15:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (253, 14, 'Inventory Stock Report', 'inventory_stock_report', 1, 0, 0, 0, '2019-10-04 05:20:31');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (254, 14, 'Inventory Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-04 05:23:22');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (255, 14, 'Inventory Issue Report', 'issue_inventory_report', 1, 0, 0, 0, '2019-10-04 05:24:40');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (256, 14, 'Expiry Medicine Report', 'expiry_medicine_report', 1, 0, 0, 0, '2019-10-04 06:00:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (257, 26, 'Pathology Bill', 'pathology bill', 1, 1, 1, 1, '2018-12-22 08:46:42');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (258, 14, 'Birth Report', 'birth_report', 1, 0, 0, 0, '2019-10-14 03:12:35');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (259, 14, 'Death Report', 'death_report', 1, 0, 0, 0, '2019-10-14 03:13:56');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (260, 26, 'Pathology Unit', 'pathology_unit', 1, 1, 1, 1, '2020-07-22 01:13:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (261, 27, 'Radiology Unit', 'radiology_unit', 1, 1, 1, 1, '2020-07-22 01:14:47');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (262, 27, 'Radiology Parameter', 'radiology_parameter', 1, 1, 1, 1, '2020-07-22 01:20:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (263, 26, 'Pathology Parameter', 'pathology_parameter', 1, 1, 1, 1, '2020-07-22 01:20:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (264, 32, 'Charge Type', 'charge_type', 1, 1, 0, 1, '2020-07-22 04:09:44');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (265, 14, 'OPD Balance Report', 'opd_balance_report', 1, 0, 0, 0, '2020-07-28 02:03:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (266, 14, 'IPD Balance Report', 'ipd_balance_report', 1, 0, 0, 0, '2020-07-28 02:03:34');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (267, 36, 'Symptoms Type', 'symptoms_type', 1, 1, 1, 1, '2020-08-04 07:24:49');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (268, 24, 'Discharged Summary', 'discharged_summary', 0, 0, 1, 0, '2020-08-12 02:10:43');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (269, 37, 'Live Consultation', 'live_consultation', 1, 1, 0, 1, '2020-08-13 06:19:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (270, 37, 'Live Meeting', 'live_meeting', 1, 1, 0, 1, '2020-08-13 06:19:27');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (271, 37, 'Live Consultation Report', 'live_consultation_report', 1, 0, 0, 0, '2020-08-13 06:21:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (272, 37, 'Live Meeting Report', 'live_meeting_report', 1, 0, 0, 0, '2020-08-13 06:21:25');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (273, 37, 'Setting', 'setting', 1, 0, 1, 0, '2020-08-13 07:03:28');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (274, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0, '2020-08-21 04:48:53');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (275, 26, 'Pathology Print Bill', 'pathology_print_bill', 1, 0, 0, 0, '2020-08-25 00:16:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (276, 27, 'Radiology Print Bill', 'radiology_print_bill', 1, 0, 0, 0, '2020-08-25 00:15:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (277, 26, 'Pathology Print Report', 'pathology_print_report', 1, 0, 0, 0, '2020-08-25 00:16:11');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (278, 27, 'Radiology Print Report', 'radiology_print_report', 1, 0, 0, 0, '2020-08-25 00:15:24');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (279, 36, 'Symptoms Head', 'symptoms_head', 1, 1, 1, 1, '2020-08-25 04:24:29');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (280, 18, 'Specialist', 'specialist', 1, 1, 1, 1, '2019-10-03 21:01:33');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (281, 22, 'General Income Widget', 'general_income_widget', 1, 0, 0, 0, '2018-12-20 03:38:05');
INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (282, 22, 'Expenses Widget', 'expenses_widget', 1, 0, 0, 0, '2018-12-20 03:38:05');


#
# TABLE STRUCTURE FOR: permission_group
#

DROP TABLE IF EXISTS `permission_group`;

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT '0',
  `system` int(11) NOT NULL,
  `sort_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (3, 'Income', 'income', 1, 0, '9.00', '2018-12-23 16:26:51');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (4, 'Expense', 'expense', 1, 0, '10.00', '2018-12-18 10:20:47');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (8, 'Download Center', 'download_center', 1, 0, '15.00', '2018-12-18 10:23:12');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (10, 'Inventory', 'inventory', 1, 0, '16.00', '2018-12-18 10:23:27');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (13, 'Messaging', 'communicate', 1, 0, '14.00', '2018-12-18 10:22:54');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (14, 'Reports', 'reports', 1, 1, '19.00', '2018-12-18 10:24:41');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (15, 'System Settings', 'system_settings', 1, 1, '18.00', '2018-12-18 10:24:23');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (16, 'Front CMS', 'front_cms', 1, 0, '17.00', '2018-12-18 10:23:47');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (17, 'Front Office', 'front_office', 1, 0, '12.00', '2018-12-18 10:21:58');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (18, 'Human Resource', 'human_resource', 1, 1, '13.00', '2018-12-18 10:22:37');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '22.00', '2019-10-04 07:26:23');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '20.00', '2018-12-18 10:24:51');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (23, 'OPD', 'OPD', 1, 0, '1.00', '2019-11-01 12:36:37');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (24, 'IPD', 'IPD', 1, 0, '2.00', '2019-10-30 13:05:10');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (25, 'Pharmacy', 'pharmacy', 1, 0, '3.00', '2018-12-18 10:02:51');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (26, 'Pathology', 'pathology', 1, 0, '4.00', '2018-12-18 10:02:56');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (27, 'Radiology', 'radiology', 1, 0, '5.00', '2018-12-18 10:03:00');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (28, 'Operation Theatre', 'operation_theatre', 1, 0, '6.00', '2018-12-18 10:03:05');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (29, 'Ambulance', 'ambulance', 1, 0, '11.00', '2018-12-18 10:20:57');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (30, 'Blood Bank', 'blood_bank', 1, 0, '7.00', '2018-12-18 10:19:14');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (31, 'TPA Management', 'tpa_management', 1, 0, '8.00', '2018-12-18 10:19:39');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (32, 'Hospital Charges', 'hospital_charges', 1, 1, '10.10', '2019-03-10 07:08:22');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (34, 'Birth Death Record', 'birth_death_report', 1, 0, '12.00', '2019-10-04 07:18:39');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (36, 'Patient', 'patient', 1, 0, '21.00', '2019-10-04 07:26:19');
INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES (37, 'Zoom Live Consultation', 'zoom_live_meeting', 1, 0, '7.01', '2020-11-06 11:55:47');


#
# TABLE STRUCTURE FOR: pharmacy
#

DROP TABLE IF EXISTS `pharmacy`;

CREATE TABLE `pharmacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(200) DEFAULT NULL,
  `medicine_category_id` varchar(50) NOT NULL,
  `medicine_image` varchar(200) NOT NULL,
  `medicine_company` varchar(100) DEFAULT NULL,
  `medicine_composition` varchar(100) DEFAULT NULL,
  `medicine_group` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `min_level` varchar(50) DEFAULT NULL,
  `reorder_level` varchar(50) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `unit_packing` varchar(50) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `vat_ac` varchar(50) DEFAULT NULL,
  `note` varchar(200) NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES (1, 'Dcold', '1', '', 'cipla', 'paracetamol', 'Cipla group', '20', '10', '5', '', '10', NULL, '', '', '', '2020-11-13 08:45:37');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES (2, 'tt', '1', '', 'tt', 'tt', 'tt', '1', '3', '5', '8', '10', NULL, NULL, 'test', 'yes', '2020-11-18 12:00:58');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES (3, 'ALTACEF Medicine ', '1', '', 'ALTACEF demo', '10S1', 'ALTACEF demo', '1', '5', '50', '8', '5', NULL, NULL, 'test', 'yes', '2020-11-18 12:15:05');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES (4, 'Alemtuzumab.', '1', '', 'Alemtuzumab.', 'Alemtuzumab.', 'Alemtuzumab.', '120', '10', '5', '10', '1500', NULL, '', '', '', '2020-11-28 11:50:21');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES (5, 'Allopurinol.', '1', '', 'Allopurinol.', 'Allopurinol.', 'Allopurinol.', '5', '1', '15', '10', '142', NULL, '', '', '', '2020-11-28 11:50:54');
INSERT INTO `pharmacy` (`id`, `medicine_name`, `medicine_category_id`, `medicine_image`, `medicine_company`, `medicine_composition`, `medicine_group`, `unit`, `min_level`, `reorder_level`, `vat`, `unit_packing`, `supplier`, `vat_ac`, `note`, `is_active`, `created_at`) VALUES (6, 'Abacavir', '1', 'uploads/medicine_images/6.jpg', 'Abacavir ', 'Abacavir ', 'Abacavir', '150', '100', '50', '10', '100', NULL, '10', '', '', '2020-11-28 12:36:03');


#
# TABLE STRUCTURE FOR: pharmacy_bill_basic
#

DROP TABLE IF EXISTS `pharmacy_bill_basic`;

CREATE TABLE `pharmacy_bill_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `patient_id` varchar(200) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `doctor_name` varchar(50) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `opd_ipd_no` varchar(50) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `discount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (1, '1', '2020-11-13 08:46:00', '27', 'jatin', NULL, '', '', NULL, '360.00', '0.00', '0.00', '360.00', '', '2020-11-13 08:47:26', 1);
INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (2, '2', '2020-11-16 07:50:00', '1', NULL, NULL, 'David smith', '', NULL, '360.00', '0.00', '0.00', '360.00', '', '2020-11-16 07:50:26', 3);
INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (3, '3', '2020-11-28 12:02:00', '10', 'test bg', NULL, '', '', NULL, '150.00', '0.00', '0.00', '150.00', '', '2020-11-28 12:02:26', 1);
INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (4, '4', '2020-11-28 13:14:00', '11', 'test report', NULL, 'David smith', '', NULL, '1500.00', '150.00', '0.00', '1350.00', 'naa', '2020-11-28 13:15:02', 1);
INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (5, '5', '2020-12-03 04:59:00', '17', 'ginni test', NULL, '', '', NULL, '180.00', '0.00', '0.00', '180.00', '', '2020-12-03 04:59:46', 1);
INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (6, '6', '2020-12-03 04:59:00', '9', 'dinnu', NULL, '', '', NULL, '3000.00', '0.00', '0.00', '3000.00', '', '2020-12-03 05:00:35', 1);
INSERT INTO `pharmacy_bill_basic` (`id`, `bill_no`, `date`, `patient_id`, `customer_name`, `customer_type`, `doctor_name`, `file`, `opd_ipd_no`, `total`, `discount`, `tax`, `net_amount`, `note`, `created_at`, `generated_by`) VALUES (7, '7', '2020-12-04 10:36:00', '19', 'garima marko', NULL, 'David smith', '', NULL, '180.00', '18.00', '0.00', '162.00', '', '2020-12-05 10:36:57', 1);


#
# TABLE STRUCTURE FOR: pharmacy_bill_detail
#

DROP TABLE IF EXISTS `pharmacy_bill_detail`;

CREATE TABLE `pharmacy_bill_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacy_bill_basic_id` varchar(50) NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `sale_price` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (1, '1', 1, '1', 'Feb/2019', '2489', '2', '180.00', '360.00');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (2, '2', 1, '1', 'Feb/2019', '2489', '2', '180.00', '360.00');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (3, '3', 1, '1', 'Mar/2022', '3251', '1', '150.00', '150.00');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (4, '4', 1, '1', 'Mar/2022', '3251', '10', '150.00', '1500.00');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (5, '5', 1, '1', 'Feb/2019', '2489', '1', '180.00', '180.00');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (6, '6', 1, '1', 'Jun/2020', '2315', '5', '600.00', '3000.00');
INSERT INTO `pharmacy_bill_detail` (`id`, `pharmacy_bill_basic_id`, `medicine_category_id`, `medicine_name`, `expire_date`, `batch_no`, `quantity`, `sale_price`, `amount`) VALUES (7, '7', 1, '1', 'Feb/2019', '2489', '1', '180.00', '180.00');


#
# TABLE STRUCTURE FOR: prescription
#

DROP TABLE IF EXISTS `prescription`;

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opd_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `prescription` (`id`, `opd_id`, `visit_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES (1, 7, 0, 1, 'Dcold', '1', 'Instruction1');
INSERT INTO `prescription` (`id`, `opd_id`, `visit_id`, `medicine_category_id`, `medicine`, `dosage`, `instruction`) VALUES (2, 12, 0, 1, 'Dcold', '1/2', '');


#
# TABLE STRUCTURE FOR: print_setting
#

DROP TABLE IF EXISTS `print_setting`;

CREATE TABLE `print_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print_header` varchar(300) NOT NULL,
  `print_footer` varchar(200) NOT NULL,
  `setting_for` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: radio
#

DROP TABLE IF EXISTS `radio`;

CREATE TABLE `radio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `radiology_category_id` varchar(11) NOT NULL,
  `radiology_parameter_id` varchar(100) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `radio` (`id`, `test_name`, `short_name`, `test_type`, `radiology_category_id`, `radiology_parameter_id`, `sub_category`, `report_days`, `charge_id`, `created_at`) VALUES (1, 'xray', 'xray', 'xray', '1', '', 'xray', '2', 1, '2020-11-13 11:07:33');


#
# TABLE STRUCTURE FOR: radiology_parameter
#

DROP TABLE IF EXISTS `radiology_parameter`;

CREATE TABLE `radiology_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(100) NOT NULL,
  `test_value` varchar(100) NOT NULL,
  `reference_range` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `radiology_parameter` (`id`, `parameter_name`, `test_value`, `reference_range`, `gender`, `unit`, `description`, `created_at`) VALUES (1, 'MRI', '', 'test', '', '3', '', '2020-11-13 10:58:03');


#
# TABLE STRUCTURE FOR: radiology_parameterdetails
#

DROP TABLE IF EXISTS `radiology_parameterdetails`;

CREATE TABLE `radiology_parameterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `radiology_id` varchar(100) NOT NULL,
  `parameter_id` varchar(100) NOT NULL,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `radiology_report_id` int(11) NOT NULL,
  `radiology_report_value` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `radiology_parameterdetails` (`id`, `radiology_id`, `parameter_id`, `created_id`, `radiology_report_id`, `radiology_report_value`) VALUES (1, '1', '1', '2020-11-13 11:07:33', 0, '');


#
# TABLE STRUCTURE FOR: radiology_report
#

DROP TABLE IF EXISTS `radiology_report`;

CREATE TABLE `radiology_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(200) NOT NULL,
  `radiology_id` int(11) NOT NULL,
  `patient_id` varchar(11) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `radiology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `radiology_report` (`id`, `bill_no`, `radiology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `radiology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (2, '2', 1, '7', NULL, NULL, '2', '2020-11-26', '', NULL, '500.00', '2020-11-28 06:24:59', 1);
INSERT INTO `radiology_report` (`id`, `bill_no`, `radiology_id`, `patient_id`, `customer_type`, `patient_name`, `consultant_doctor`, `reporting_date`, `description`, `radiology_report`, `apply_charge`, `created_at`, `generated_by`) VALUES (3, '3', 1, '19', NULL, NULL, '2', '2020-12-30', '', NULL, '600.00', '2020-12-05 06:22:10', 3);


#
# TABLE STRUCTURE FOR: radiology_report_parameterdetails
#

DROP TABLE IF EXISTS `radiology_report_parameterdetails`;

CREATE TABLE `radiology_report_parameterdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `radiology_report_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `radiology_report_value` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `radiology_report_parameterdetails` (`id`, `radiology_report_id`, `parameter_id`, `radiology_report_value`) VALUES (1, 1, 1, '');
INSERT INTO `radiology_report_parameterdetails` (`id`, `radiology_report_id`, `parameter_id`, `radiology_report_value`) VALUES (2, 2, 1, '');
INSERT INTO `radiology_report_parameterdetails` (`id`, `radiology_report_id`, `parameter_id`, `radiology_report_value`) VALUES (3, 3, 1, '');


#
# TABLE STRUCTURE FOR: read_notification
#

DROP TABLE IF EXISTS `read_notification`;

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `read_notification` (`id`, `student_id`, `parent_id`, `staff_id`, `notification_id`, `is_active`, `created_at`) VALUES (1, NULL, NULL, 4, 1, 'no', '2020-12-05 11:33:22');


#
# TABLE STRUCTURE FOR: read_systemnotification
#

DROP TABLE IF EXISTS `read_systemnotification`;

CREATE TABLE `read_systemnotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (1, 30, 1, 'no', '2020-11-20 05:27:42');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (2, 30, 1, 'no', '2020-11-20 05:27:43');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (3, 30, 1, 'no', '2020-11-20 07:31:26');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (4, 30, 1, 'no', '2020-11-20 08:13:28');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (5, 30, 1, 'no', '2020-11-20 08:13:30');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (6, 30, 1, 'no', '2020-11-20 08:17:47');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (7, 30, 1, 'no', '2020-11-20 08:17:50');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (8, 69, 7, 'no', '2020-11-28 11:22:46');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (9, 94, 11, 'no', '2020-11-28 12:22:02');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (10, 94, 11, 'no', '2020-11-28 12:22:02');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (11, 172, 2, 'no', '2020-12-02 06:08:59');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (12, 172, 2, 'no', '2020-12-02 06:09:00');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (13, 116, 2, 'no', '2020-12-02 06:09:05');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (14, 116, 2, 'no', '2020-12-02 06:09:05');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (15, 186, 1, 'no', '2020-12-02 06:27:07');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (16, 186, 1, 'no', '2020-12-05 06:03:50');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (17, 186, 1, 'no', '2020-12-05 06:03:52');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (18, 69, 7, 'no', '2020-12-05 10:46:48');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (19, 114, 7, 'no', '2020-12-05 10:46:51');
INSERT INTO `read_systemnotification` (`id`, `notification_id`, `receiver_id`, `is_active`, `date`) VALUES (20, 201, 1, 'no', '2020-12-05 11:29:15');


#
# TABLE STRUCTURE FOR: roles
#

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `is_system` int(1) NOT NULL DEFAULT '0',
  `is_superadmin` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (1, 'Admin', NULL, 0, 1, 0, '2018-12-25 11:49:43');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (2, 'Accountant', NULL, 0, 1, 0, '2018-12-25 11:49:38');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (3, 'Doctor', NULL, 0, 1, 0, '2018-07-21 10:37:36');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (4, 'Pharmacist', NULL, 0, 1, 0, '2018-07-21 10:38:26');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (5, 'Pathologist', NULL, 0, 1, 0, '2018-12-25 11:49:59');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (6, 'Radiologist', NULL, 0, 1, 0, '2018-12-25 11:50:27');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (7, 'Super Admin', NULL, 0, 1, 1, '2018-12-25 11:52:24');
INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES (8, 'Receptionist', NULL, 0, 1, 0, '2018-12-25 11:50:22');


#
# TABLE STRUCTURE FOR: roles_permissions
#

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1359 DEFAULT CHARSET=utf8;

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1, 1, 132, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (3, 1, 134, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (4, 1, 135, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (5, 1, 136, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (6, 1, 137, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (7, 1, 192, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (8, 1, 138, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (9, 1, 139, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (10, 1, 140, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (11, 1, 141, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (12, 1, 142, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (13, 1, 143, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (14, 1, 144, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (15, 1, 145, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (16, 1, 193, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (17, 1, 194, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (18, 1, 195, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (19, 1, 196, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (20, 1, 197, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (21, 1, 198, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (22, 1, 146, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (23, 1, 147, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (24, 1, 148, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (25, 1, 170, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (26, 1, 200, 1, 1, 0, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (27, 1, 201, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (28, 1, 149, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (29, 1, 150, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (30, 1, 175, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (31, 1, 152, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (32, 1, 153, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (33, 1, 171, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (34, 1, 163, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (35, 1, 164, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (36, 1, 167, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (37, 1, 168, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (38, 1, 169, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (39, 1, 202, 1, 1, 0, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (40, 1, 173, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (41, 1, 174, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (42, 1, 9, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (43, 1, 10, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (45, 1, 176, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (46, 1, 203, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (47, 1, 12, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (48, 1, 13, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (49, 1, 14, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (50, 1, 165, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (51, 1, 166, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (52, 1, 80, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (53, 1, 81, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (54, 1, 82, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (55, 1, 83, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (56, 1, 84, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (57, 1, 85, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (58, 1, 204, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (59, 1, 205, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (60, 1, 86, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (61, 1, 87, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (63, 1, 89, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (64, 1, 90, 1, 1, 0, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (65, 1, 91, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (66, 1, 108, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (67, 1, 109, 1, 1, 0, 1, '2020-08-25 01:48:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (68, 1, 110, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (69, 1, 111, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (70, 1, 112, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (72, 1, 129, 0, 1, 0, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (73, 1, 43, 1, 1, 1, 1, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (74, 1, 44, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (75, 1, 46, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (76, 1, 27, 1, 1, 0, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (77, 1, 31, 1, 1, 0, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (78, 1, 32, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (79, 1, 33, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (80, 1, 34, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (81, 1, 35, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (82, 1, 104, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (83, 1, 61, 1, 1, 0, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (85, 1, 63, 1, 1, 0, 1, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (86, 1, 64, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (87, 1, 65, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (88, 1, 66, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (89, 1, 67, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (90, 1, 53, 0, 1, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (91, 1, 54, 1, 0, 1, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (92, 1, 56, 1, 0, 1, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (93, 1, 57, 1, 0, 1, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (94, 1, 58, 1, 0, 1, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (95, 1, 59, 1, 0, 1, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (96, 1, 60, 1, 0, 1, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (97, 1, 126, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (98, 1, 130, 1, 1, 0, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (99, 1, 131, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (100, 1, 48, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (101, 1, 178, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (102, 1, 179, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (103, 1, 180, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (104, 1, 181, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (105, 1, 182, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (106, 1, 183, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (107, 1, 184, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (108, 1, 185, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (109, 1, 186, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (110, 1, 187, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (111, 1, 188, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (112, 1, 189, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (113, 1, 206, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (114, 1, 207, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (115, 1, 208, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (116, 1, 209, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (117, 1, 210, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (118, 1, 211, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (119, 1, 212, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (120, 1, 213, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (121, 1, 118, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (122, 1, 155, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (123, 1, 156, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (124, 1, 157, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (125, 1, 158, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (126, 1, 159, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (127, 1, 160, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (128, 1, 161, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (129, 1, 162, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (130, 1, 190, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (131, 1, 191, 1, 0, 0, 0, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (132, 1, 102, 1, 1, 1, 1, '2019-03-09 11:56:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (133, 2, 132, 1, 1, 1, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (134, 2, 135, 1, 1, 1, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (135, 2, 138, 1, 1, 1, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (136, 2, 139, 1, 1, 1, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (137, 2, 143, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (138, 2, 144, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (139, 2, 145, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (140, 2, 193, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (141, 2, 194, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (142, 2, 195, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (143, 2, 196, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (144, 2, 198, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (145, 2, 148, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (146, 2, 149, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (147, 2, 150, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (148, 2, 152, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (149, 2, 153, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (150, 2, 163, 1, 1, 1, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (151, 2, 167, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (152, 2, 168, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (153, 2, 173, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (154, 2, 174, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (155, 2, 9, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (156, 2, 10, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (158, 2, 176, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (159, 2, 203, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (160, 2, 12, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (161, 2, 13, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (162, 2, 14, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (163, 2, 165, 1, 1, 1, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (164, 2, 166, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (165, 2, 204, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (166, 2, 205, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (167, 2, 86, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (168, 2, 87, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (169, 2, 88, 1, 1, 1, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (170, 2, 89, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (171, 2, 90, 1, 1, 0, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (172, 2, 91, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (173, 2, 108, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (174, 2, 109, 1, 1, 0, 1, '2020-08-25 01:48:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (175, 2, 110, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (176, 2, 111, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (177, 2, 112, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (178, 2, 127, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (179, 2, 129, 0, 1, 0, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (180, 2, 43, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (181, 2, 44, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (182, 2, 46, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (183, 2, 27, 1, 1, 0, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (184, 2, 31, 1, 1, 0, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (185, 2, 32, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (186, 2, 33, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (187, 2, 34, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (188, 2, 35, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (189, 2, 104, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (190, 2, 48, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (191, 2, 178, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (192, 2, 179, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (193, 2, 180, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (194, 2, 181, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (195, 2, 182, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (196, 2, 184, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (197, 2, 185, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (198, 2, 186, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (199, 2, 188, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (200, 2, 189, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (201, 2, 206, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (202, 2, 207, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (203, 2, 208, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (204, 2, 209, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (205, 2, 210, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (206, 2, 211, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (207, 2, 212, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (208, 2, 213, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (209, 2, 118, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (210, 2, 155, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (211, 2, 156, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (212, 2, 157, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (213, 2, 158, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (214, 2, 159, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (215, 2, 160, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (216, 2, 161, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (217, 2, 162, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (218, 2, 190, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (219, 2, 191, 1, 0, 0, 0, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (220, 2, 102, 1, 1, 1, 1, '2019-03-09 12:13:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (221, 3, 132, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (222, 3, 134, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (223, 3, 135, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (224, 3, 136, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (225, 3, 137, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (226, 3, 138, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (227, 3, 139, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (228, 3, 140, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (229, 3, 141, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (230, 3, 142, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (231, 3, 143, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (232, 3, 144, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (233, 3, 145, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (234, 3, 194, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (235, 3, 198, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (236, 3, 163, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (237, 3, 164, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (238, 3, 167, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (239, 3, 166, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (240, 3, 204, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (241, 3, 205, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (242, 3, 86, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (243, 3, 109, 1, 1, 0, 1, '2020-08-25 01:48:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (244, 3, 127, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (245, 3, 43, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (246, 3, 44, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (248, 3, 27, 1, 1, 0, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (249, 3, 48, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (250, 3, 178, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (251, 3, 182, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (253, 3, 208, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (254, 3, 209, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (255, 3, 118, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (256, 3, 155, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (257, 3, 156, 1, 0, 0, 0, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (262, 3, 102, 1, 1, 1, 1, '2019-03-10 01:47:01');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (277, 5, 149, 1, 1, 1, 1, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (278, 5, 150, 1, 1, 1, 1, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (279, 5, 175, 1, 1, 1, 1, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (280, 5, 86, 1, 0, 0, 0, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (281, 5, 109, 1, 1, 0, 1, '2020-08-25 01:48:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (282, 5, 43, 1, 1, 1, 1, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (283, 5, 44, 1, 0, 0, 0, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (285, 5, 27, 1, 1, 0, 1, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (286, 5, 180, 1, 0, 0, 0, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (288, 5, 158, 1, 0, 0, 0, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (289, 5, 102, 1, 1, 1, 1, '2019-03-10 01:53:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (290, 6, 152, 1, 1, 1, 1, '2019-03-10 02:01:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (291, 6, 153, 1, 1, 1, 1, '2019-03-10 02:01:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (292, 6, 171, 1, 1, 1, 1, '2019-03-10 02:01:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (293, 6, 86, 1, 0, 0, 0, '2019-03-10 02:01:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (294, 6, 109, 1, 1, 0, 1, '2020-08-25 01:48:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (295, 6, 181, 1, 0, 0, 0, '2019-03-10 02:01:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (297, 6, 118, 1, 0, 0, 0, '2019-03-10 02:01:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (298, 6, 159, 1, 0, 0, 0, '2019-03-10 02:01:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (299, 6, 102, 1, 1, 1, 1, '2019-03-10 02:01:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (300, 8, 132, 1, 1, 1, 1, '2019-03-10 02:08:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (306, 8, 81, 1, 1, 1, 1, '2019-03-10 02:08:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (492, 8, 236, 1, 1, 1, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (493, 8, 146, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (495, 8, 138, 1, 1, 1, 1, '2019-10-04 01:05:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (496, 8, 139, 1, 1, 1, 1, '2019-10-04 01:05:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (500, 8, 143, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (501, 8, 144, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (502, 8, 145, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (504, 8, 194, 1, 0, 0, 0, '2019-10-04 01:06:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (506, 8, 196, 1, 0, 1, 1, '2019-10-12 07:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (508, 8, 198, 1, 0, 0, 0, '2019-10-04 01:06:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (511, 8, 148, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (516, 8, 225, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (540, 3, 245, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (580, 2, 221, 1, 1, 1, 1, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (581, 2, 222, 1, 1, 1, 1, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (582, 2, 223, 1, 1, 1, 1, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (583, 2, 225, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (584, 2, 216, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (585, 2, 217, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (587, 2, 249, 1, 1, 1, 1, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (588, 2, 250, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (589, 2, 251, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (590, 2, 253, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (591, 2, 254, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (592, 2, 255, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (593, 2, 256, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (594, 2, 238, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (595, 2, 236, 1, 1, 1, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (596, 2, 237, 1, 0, 0, 0, '2019-10-12 06:26:04');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (597, 3, 192, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (598, 3, 218, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (599, 3, 219, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (600, 3, 221, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (601, 3, 222, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (602, 3, 223, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (603, 3, 193, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (604, 3, 195, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (605, 3, 196, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (606, 3, 197, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (607, 3, 220, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (608, 3, 248, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (609, 3, 146, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (610, 3, 149, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (611, 3, 152, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (612, 3, 173, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (613, 3, 174, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (614, 3, 176, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (615, 3, 228, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (616, 3, 165, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (617, 3, 214, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (618, 3, 215, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (619, 3, 216, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (620, 3, 217, 1, 0, 0, 0, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (621, 3, 236, 1, 1, 1, 1, '2019-10-12 06:32:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (623, 5, 243, 1, 1, 1, 1, '2019-10-12 06:54:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (624, 5, 236, 1, 0, 0, 0, '2019-10-12 06:54:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (625, 6, 43, 1, 1, 1, 1, '2019-10-12 07:00:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (626, 6, 44, 1, 0, 0, 0, '2019-10-12 07:00:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (627, 6, 27, 1, 1, 0, 1, '2019-10-12 07:00:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (628, 6, 236, 1, 0, 0, 0, '2019-10-12 07:00:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (629, 8, 135, 1, 1, 1, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (630, 8, 218, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (631, 8, 219, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (632, 8, 221, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (633, 8, 222, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (634, 8, 223, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (635, 8, 149, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (636, 8, 152, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (637, 8, 163, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (638, 8, 167, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (639, 8, 173, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (640, 8, 174, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (641, 8, 176, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (642, 8, 228, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (643, 8, 165, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (644, 8, 166, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (645, 8, 214, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (646, 8, 215, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (647, 8, 82, 1, 1, 1, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (648, 8, 83, 1, 1, 1, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (649, 8, 84, 1, 1, 1, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (650, 8, 85, 1, 1, 1, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (651, 8, 204, 1, 1, 1, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (652, 8, 205, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (653, 8, 216, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (654, 8, 217, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (655, 8, 109, 1, 1, 0, 1, '2020-08-25 01:48:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (656, 8, 43, 1, 1, 1, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (657, 8, 44, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (658, 8, 27, 1, 1, 0, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (659, 8, 31, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (660, 8, 32, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (661, 8, 33, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (662, 8, 48, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (663, 8, 178, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (664, 8, 180, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (665, 8, 181, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (666, 8, 186, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (667, 8, 207, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (668, 8, 208, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (669, 8, 209, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (670, 8, 253, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (671, 8, 254, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (672, 8, 255, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (673, 8, 118, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (674, 8, 238, 1, 0, 0, 0, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (675, 8, 102, 1, 1, 1, 1, '2019-10-12 07:10:43');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (676, 5, 176, 1, 0, 0, 0, '2019-10-12 07:40:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (677, 6, 176, 1, 0, 0, 0, '2019-10-12 07:42:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (678, 8, 86, 1, 0, 0, 0, '2019-10-12 07:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (679, 8, 182, 1, 0, 0, 0, '2019-10-12 07:46:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (680, 2, 147, 1, 0, 0, 0, '2019-10-14 04:04:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (681, 2, 200, 1, 0, 0, 0, '2019-10-14 04:04:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (682, 2, 164, 1, 0, 0, 0, '2019-10-14 04:06:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (683, 2, 146, 1, 0, 0, 0, '2019-10-14 04:09:47');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (684, 1, 218, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (685, 1, 219, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (686, 1, 221, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (687, 1, 222, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (688, 1, 223, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (689, 1, 220, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (690, 1, 248, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (691, 1, 224, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (692, 1, 225, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (693, 1, 226, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (694, 1, 227, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (695, 1, 243, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (696, 1, 257, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (697, 1, 244, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (698, 1, 245, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (699, 1, 246, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (700, 1, 252, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (701, 1, 228, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (702, 1, 247, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (703, 1, 214, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (704, 1, 215, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (705, 1, 240, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (706, 1, 241, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (707, 1, 242, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (708, 1, 216, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (709, 1, 217, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (711, 1, 249, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (712, 1, 250, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (713, 1, 251, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (714, 1, 253, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (715, 1, 254, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (716, 1, 255, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (717, 1, 256, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (718, 1, 258, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (719, 1, 259, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (720, 1, 238, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (721, 1, 236, 1, 1, 1, 1, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (722, 1, 237, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (723, 1, 239, 1, 0, 0, 0, '2019-10-15 00:48:33');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (724, 3, 226, 1, 0, 0, 0, '2019-10-18 05:03:53');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (727, 3, 238, 1, 0, 0, 0, '2019-11-01 00:10:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (728, 9, 132, 1, 1, 1, 1, '2020-08-11 23:31:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (958, 1, 268, 0, 0, 1, 0, '2020-08-12 02:11:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (963, 1, 267, 1, 1, 1, 1, '2020-08-12 02:37:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1077, 3, 270, 1, 1, 0, 1, '2020-08-14 01:53:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1087, 1, 269, 1, 1, 0, 1, '2020-08-21 01:58:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1088, 1, 270, 1, 1, 0, 1, '2020-08-21 01:58:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1089, 1, 271, 1, 0, 0, 0, '2020-08-21 01:58:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1090, 1, 272, 1, 0, 0, 0, '2020-08-21 01:58:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1091, 1, 273, 1, 0, 1, 0, '2020-08-21 01:58:52');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1093, 3, 274, 1, 0, 0, 0, '2020-08-21 04:51:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1094, 1, 274, 1, 0, 0, 0, '2020-08-21 04:53:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1120, 4, 197, 1, 1, 1, 1, '2020-08-23 02:35:15');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1125, 4, 146, 1, 1, 1, 1, '2020-08-23 02:47:35');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1126, 4, 147, 1, 1, 1, 1, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1128, 4, 170, 1, 1, 1, 1, '2020-08-23 02:48:26');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1129, 4, 200, 1, 1, 0, 1, '2020-08-23 02:49:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1130, 4, 201, 1, 1, 1, 1, '2020-08-23 02:50:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1131, 4, 224, 1, 0, 0, 0, '2020-08-23 02:51:00');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1132, 4, 225, 1, 1, 1, 1, '2020-08-23 02:52:02');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1133, 4, 226, 1, 1, 1, 1, '2020-08-23 02:52:56');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1134, 4, 227, 1, 1, 1, 1, '2020-08-23 02:53:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1138, 4, 243, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1145, 4, 244, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1150, 4, 245, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1160, 4, 252, 1, 0, 0, 0, '2020-08-23 03:24:46');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1163, 4, 14, 1, 0, 0, 0, '2020-08-23 03:27:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1164, 4, 176, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1165, 4, 203, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1166, 4, 228, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1171, 4, 247, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1184, 4, 214, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1185, 4, 215, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1186, 4, 240, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1187, 4, 241, 1, 1, 1, 1, '2020-08-23 03:48:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1188, 4, 242, 1, 1, 1, 1, '2020-08-23 03:49:50');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1204, 4, 249, 1, 1, 1, 1, '2020-08-23 04:10:21');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1205, 4, 43, 1, 1, 1, 1, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1208, 4, 27, 1, 1, 0, 1, '2020-08-23 04:13:31');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1230, 4, 179, 1, 0, 0, 0, '2020-08-23 04:31:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1254, 4, 256, 1, 0, 0, 0, '2020-08-23 04:40:36');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1269, 4, 274, 1, 0, 0, 0, '2020-08-23 04:46:38');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1270, 4, 118, 1, 0, 0, 0, '2020-08-23 04:46:51');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1271, 4, 155, 1, 0, 0, 0, '2020-08-23 04:47:34');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1272, 4, 156, 1, 0, 0, 0, '2020-08-23 04:47:49');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1273, 4, 157, 1, 0, 0, 0, '2020-08-23 04:47:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1274, 4, 158, 1, 0, 0, 0, '2020-08-23 04:48:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1275, 4, 159, 1, 0, 0, 0, '2020-08-23 04:48:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1276, 4, 160, 1, 0, 0, 0, '2020-08-23 04:48:30');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1277, 4, 161, 1, 0, 0, 0, '2020-08-23 04:48:39');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1278, 4, 162, 1, 0, 0, 0, '2020-08-23 04:48:48');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1279, 4, 190, 1, 0, 0, 0, '2020-08-23 04:48:59');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1280, 4, 191, 1, 0, 0, 0, '2020-08-23 04:49:10');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1281, 4, 238, 1, 0, 0, 0, '2020-08-23 04:49:20');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1282, 4, 236, 1, 0, 0, 0, '2020-08-28 08:26:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1287, 4, 102, 1, 1, 1, 1, '2020-08-23 04:53:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1291, 4, 148, 1, 1, 1, 1, '2020-08-25 05:12:23');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1295, 1, 88, 1, 1, 1, 0, '2020-08-25 01:27:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1304, 4, 44, 1, 0, 0, 0, '2020-08-25 05:51:16');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1314, 4, 109, 1, 1, 0, 1, '2020-08-25 23:41:03');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1316, 1, 279, 1, 1, 1, 1, '2020-08-26 01:33:11');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1320, 1, 260, 1, 1, 1, 1, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1321, 1, 263, 1, 1, 1, 1, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1322, 1, 275, 1, 0, 0, 0, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1323, 1, 277, 1, 0, 0, 0, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1324, 1, 261, 1, 1, 1, 1, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1325, 1, 262, 1, 1, 1, 1, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1326, 1, 276, 1, 0, 0, 0, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1327, 1, 278, 1, 0, 0, 0, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1328, 1, 264, 1, 1, 0, 1, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1329, 1, 127, 1, 0, 0, 0, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1330, 1, 62, 1, 1, 0, 1, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1331, 1, 265, 1, 0, 0, 0, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1332, 1, 266, 1, 0, 0, 0, '2020-08-28 07:04:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1333, 2, 275, 1, 0, 0, 0, '2020-08-28 22:11:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1334, 2, 276, 1, 0, 0, 0, '2020-08-28 22:11:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1335, 2, 266, 1, 0, 0, 0, '2020-08-28 22:11:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1336, 2, 274, 1, 0, 0, 0, '2020-08-28 22:11:55');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1337, 3, 268, 0, 0, 1, 0, '2020-08-28 22:25:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1338, 3, 279, 1, 0, 0, 0, '2020-08-28 22:25:27');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1339, 4, 86, 1, 0, 0, 0, '2020-08-28 22:33:24');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1340, 5, 275, 1, 0, 0, 0, '2020-08-28 22:40:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1341, 5, 277, 1, 0, 0, 0, '2020-08-28 22:40:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1342, 5, 270, 1, 0, 0, 0, '2020-08-28 22:40:17');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1343, 2, 270, 1, 0, 0, 0, '2020-08-28 22:40:54');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1344, 3, 269, 1, 1, 0, 1, '2020-08-28 22:42:09');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1345, 4, 270, 1, 0, 0, 0, '2020-08-28 22:42:29');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1346, 6, 261, 1, 1, 1, 1, '2020-08-28 22:48:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1347, 6, 262, 1, 1, 1, 1, '2020-08-28 22:48:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1348, 6, 276, 1, 0, 0, 0, '2020-08-28 22:48:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1349, 6, 278, 1, 0, 0, 0, '2020-08-28 22:48:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1350, 6, 270, 1, 0, 0, 0, '2020-08-28 22:48:58');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1351, 5, 260, 1, 1, 1, 1, '2020-08-28 22:51:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1352, 5, 263, 1, 1, 1, 1, '2020-08-28 22:51:14');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1353, 8, 147, 1, 0, 0, 0, '2020-08-28 23:01:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1354, 8, 200, 1, 0, 0, 0, '2020-08-28 23:01:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1355, 8, 164, 1, 0, 0, 0, '2020-08-28 23:01:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1356, 8, 80, 1, 1, 1, 1, '2020-08-28 23:01:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1357, 8, 270, 1, 0, 0, 0, '2020-08-28 23:01:41');
INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (1358, 6, 244, 1, 1, 1, 1, '2020-08-28 23:12:16');


#
# TABLE STRUCTURE FOR: sch_settings
#

DROP TABLE IF EXISTS `sch_settings`;

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `start_month` varchar(100) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `languages` varchar(255) NOT NULL DEFAULT '["4"]',
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(20) DEFAULT '24-hour',
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `timezone` varchar(30) DEFAULT 'UTC',
  `image` varchar(100) DEFAULT NULL,
  `mini_logo` varchar(200) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `credit_limit` varchar(255) DEFAULT NULL,
  `opd_record_month` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cron_secret_key` varchar(100) NOT NULL,
  `doctor_restriction` varchar(100) NOT NULL,
  `superadmin_restriction` varchar(200) NOT NULL,
  `mobile_api_url` varchar(200) NOT NULL,
  `app_primary_color_code` varchar(50) NOT NULL,
  `app_secondary_color_code` varchar(50) NOT NULL,
  `app_logo` varchar(200) NOT NULL,
  `zoom_api_key` varchar(200) NOT NULL,
  `zoom_api_secret` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_id` (`lang_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sch_settings` (`id`, `name`, `email`, `phone`, `address`, `start_month`, `session_id`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `timezone`, `image`, `mini_logo`, `theme`, `credit_limit`, `opd_record_month`, `is_active`, `created_at`, `cron_secret_key`, `doctor_restriction`, `superadmin_restriction`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`, `zoom_api_key`, `zoom_api_secret`) VALUES (0, 'alpha hospital', 'YourHospitalpha@gmail.com', '1234565522', 'ganga nagar garha', '', NULL, 4, '[\"4\",\"5\"]', 'Ap1025 ', 'm-d-Y', '12-hour', 'BIF', '$', 'disabled', 'Europe/Dublin', '0.png', '0mini_logo.png', 'default.jpg', '56', '1', 'no', '2020-12-04 12:02:22', '', 'disabled', 'disabled', '', '', '', '0app_logo.png', '', '');


#
# TABLE STRUCTURE FOR: send_notification
#

DROP TABLE IF EXISTS `send_notification`;

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text,
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_patient` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `send_notification` (`id`, `title`, `publish_date`, `date`, `message`, `visible_staff`, `visible_patient`, `created_by`, `created_id`, `is_active`, `created_at`) VALUES (1, 'nnn', '2020-12-05', '2020-12-05', '<p>nnnn</p>', 'Yes', 'No', 'admin', 1, 'no', '2020-12-05 11:33:02');
INSERT INTO `send_notification` (`id`, `title`, `publish_date`, `date`, `message`, `visible_staff`, `visible_patient`, `created_by`, `created_id`, `is_active`, `created_at`) VALUES (2, 'bb', '2020-12-05', '2020-12-01', '<p>bbb</p>', 'Yes', 'No', 'admin', 1, 'no', '2020-12-05 11:33:39');


#
# TABLE STRUCTURE FOR: sms_config
#

DROP TABLE IF EXISTS `sms_config`;

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: source
#

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: specialist
#

DROP TABLE IF EXISTS `specialist`;

CREATE TABLE `specialist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specialist_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`) VALUES (1, 'Eye Specialist', 'yes');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`) VALUES (2, 'Dentist', 'yes');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`) VALUES (3, 'Physician', 'yes');
INSERT INTO `specialist` (`id`, `specialist_name`, `is_active`) VALUES (4, 'Heart Specialist', 'yes');


#
# TABLE STRUCTURE FOR: staff
#

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `department` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `specialist` varchar(200) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `specialization` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `blood_group` varchar(100) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `zoom_api_key` varchar(100) NOT NULL,
  `zoom_api_secret` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department`, `designation`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`) VALUES (1, '9001', 4, '', '', '', '', '', '', 'Super Admin', '', '', '', '', '', 'superadmin@gmail.com', '0000-00-00', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$RuPaHUbWBki06/tvrtPwnerkppY5GRd6jn3PhCQn9wBd8YbETgDr.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department`, `designation`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`) VALUES (2, 'DR121', 0, 'select', 'select', 'select', '', '', '', 'David', 'smith', '', '', '8956898686', '56', 'david@gmail.com', '2010-06-16', 'Single', '1970-01-01', '0000-00-00', '', '', '', '', '$2y$10$x90kOr.Gtd/sml2zZptuwuzZRQQG/J3HJBetirBcs5PyGO/g9Gf5G', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', '', '');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department`, `designation`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`) VALUES (3, 'AC120', 0, 'select', 'select', 'select', '', '', '', 'Kunal', 'smith', '', '', '', '', 'kunal@gmail.com', '1990-01-30', 'Single', '2020-11-01', '0000-00-00', '', '', '', '', '$2y$10$2OpKib8UAZfSWfhNB6FgF.ih0vX1u96LH9Zfv5a2912X8b553KFL2', 'Male', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department`, `designation`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`) VALUES (4, 'DR251', 0, 'select', 'select', 'select', '', '', '', 'Jhon', 'Smith', '', '', '', '', 'jhon@gmail.com', '2019-02-06', 'Single', '1970-01-01', '0000-00-00', '', '', '', '', '$2y$10$OkNpLdYXBiK7o3kJqmUchuNvtCXalbCjAuddxpt3mU7d5vRJ1dSt2', 'Male', 'B+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', '', '');
INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department`, `designation`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`) VALUES (5, 'DR321', 0, 'select', 'select', 'select', '', '', '', 'Steve', 'Smith', '', '', '', '', 'steve@gmail.com', '1989-01-05', 'Single', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$pCcyTxDbqTq6KQroTOq1kupurV8FGSo9Zqvzu9v4YFxDrTnYnM1tS', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '');


#
# TABLE STRUCTURE FOR: staff_attendance
#

DROP TABLE IF EXISTS `staff_attendance`;

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (1, '2020-12-02', 2, 1, 'note 1', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (2, '2020-12-02', 4, 2, 'note 2', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `staff_attendance` (`id`, `date`, `staff_id`, `staff_attendance_type_id`, `remark`, `is_active`, `created_at`, `updated_at`) VALUES (3, '2020-12-02', 5, 3, 'note 3', 0, '0000-00-00 00:00:00', 0);


#
# TABLE STRUCTURE FOR: staff_attendance_type
#

DROP TABLE IF EXISTS `staff_attendance_type`;

CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '0000-00-00 00:00:00');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2018-05-07 01:56:16');
INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES (5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00');


#
# TABLE STRUCTURE FOR: staff_designation
#

DROP TABLE IF EXISTS `staff_designation`;

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: staff_leave_details
#

DROP TABLE IF EXISTS `staff_leave_details`;

CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (1, 2, 1, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (2, 2, 2, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (3, 2, 3, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (4, 2, 4, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (5, 3, 1, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (6, 3, 2, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (7, 3, 3, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (8, 3, 4, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (9, 4, 1, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (10, 4, 2, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (11, 4, 3, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (12, 4, 4, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (13, 5, 1, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (14, 5, 2, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (15, 5, 3, '');
INSERT INTO `staff_leave_details` (`id`, `staff_id`, `leave_type_id`, `alloted_leave`) VALUES (16, 5, 4, '');


#
# TABLE STRUCTURE FOR: staff_leave_request
#

DROP TABLE IF EXISTS `staff_leave_request`;

CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_by` varchar(200) NOT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: staff_payroll
#

DROP TABLE IF EXISTS `staff_payroll`;

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: staff_payslip
#

DROP TABLE IF EXISTS `staff_payslip`;

CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `basic` float NOT NULL,
  `total_allowance` float NOT NULL,
  `total_deduction` float NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `net_salary` float NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `staff_payslip` (`id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`) VALUES (1, 2, '10000', '0', '0', 0, '0.00', '10000', 'paid', 'November', '2020', 'Cash', '2020-11-16', 'test');


#
# TABLE STRUCTURE FOR: staff_roles
#

DROP TABLE IF EXISTS `staff_roles`;

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (1, 7, 1, 0, '2020-11-13 04:56:36');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (2, 3, 2, 0, '2020-11-13 06:30:02');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (3, 2, 3, 0, '2020-11-30 08:42:35');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (4, 3, 4, 0, '2020-12-01 06:52:03');
INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`, `created_at`) VALUES (5, 3, 5, 0, '2020-12-02 07:50:58');


#
# TABLE STRUCTURE FOR: staff_timeline
#

DROP TABLE IF EXISTS `staff_timeline`;

CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: supplier_bill_basic
#

DROP TABLE IF EXISTS `supplier_bill_basic`;

CREATE TABLE `supplier_bill_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_no` varchar(200) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `date` varchar(200) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `discount` varchar(200) NOT NULL,
  `net_amount` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `invoice_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `created_at`) VALUES (1, '1', '1254', '2020-11-14 14:15:00', 1, 'nishu', '', '1000.00', '0', '0', '1000.00', '', '2020-11-13 08:46:52');
INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `invoice_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `created_at`) VALUES (2, '2', '3251', '2020-11-16 15:24:00', 2, 'Abhi', '', '1600.00', '0', '0', '1600.00', '', '2020-11-16 09:55:55');
INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `invoice_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `created_at`) VALUES (3, '3', '32615', '2020-11-30 16:47:00', 1, 'nishu', '', '1500.00', '0', '0', '1500.00', '', '2020-11-30 11:18:53');
INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `invoice_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `created_at`) VALUES (4, '4', '32323', '2020-11-30 16:49:00', 1, 'nishu', '', '1400.00', '0', '0', '1400.00', '', '2020-11-30 11:19:42');
INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `invoice_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `created_at`) VALUES (5, '5', '111', '2020-11-30 17:07:00', 1, 'nishu', '', '10.00', '0', '0', '10.00', '', '2020-11-30 11:42:03');
INSERT INTO `supplier_bill_basic` (`id`, `purchase_no`, `invoice_no`, `date`, `supplier_id`, `supplier_name`, `file`, `total`, `tax`, `discount`, `net_amount`, `note`, `created_at`) VALUES (6, '6', '3234', '2020-12-05 17:49:00', 1, 'nishu', '', '9600.00', '0', '0', '9600.00', '', '2020-12-05 12:19:15');


#
# TABLE STRUCTURE FOR: supplier_bill_detail
#

DROP TABLE IF EXISTS `supplier_bill_detail`;

CREATE TABLE `supplier_bill_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_bill_basic_id` varchar(200) NOT NULL,
  `medicine_category_id` varchar(200) NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `mrp` varchar(200) NOT NULL,
  `sale_price` varchar(200) NOT NULL,
  `amount` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: supplier_category
#

DROP TABLE IF EXISTS `supplier_category`;

CREATE TABLE `supplier_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_category` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `supplier_person` varchar(200) NOT NULL,
  `supplier_person_contact` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `supplier_category` (`id`, `supplier_category`, `contact`, `supplier_person`, `supplier_person_contact`, `address`) VALUES (1, 'M pharma', '5986598699', 'nishu', '8956859868', 'Bhopal');
INSERT INTO `supplier_category` (`id`, `supplier_category`, `contact`, `supplier_person`, `supplier_person_contact`, `address`) VALUES (2, 'B pharma', '8985659869', 'Abhi', '5986598659', '');


#
# TABLE STRUCTURE FOR: symptoms
#

DROP TABLE IF EXISTS `symptoms`;

CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptoms_title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: symptoms_classification
#

DROP TABLE IF EXISTS `symptoms_classification`;

CREATE TABLE `symptoms_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptoms_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: system_notification
#

DROP TABLE IF EXISTS `system_notification`;

CREATE TABLE `system_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_title` varchar(200) NOT NULL,
  `notification_type` varchar(200) NOT NULL,
  `notification_desc` varchar(200) NOT NULL,
  `notification_for` varchar(200) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `is_active` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (1, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN1</a>', 'Patient', 27, '2020-11-18 00:40:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (2, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/27/1\'>OPDN1</a>', 'Super Admin', 0, '2020-11-18 00:40:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (3, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/27/1\'>OPDN1</a>', 'Doctor', 2, '2020-11-18 00:40:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (4, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN2</a>', 'Patient', 26, '2020-11-18 00:40:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (5, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/26/2\'>OPDN2</a>', 'Super Admin', 0, '2020-11-18 00:40:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (6, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/26/2\'>OPDN2</a>', 'Doctor', 2, '2020-11-18 00:40:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (7, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/ipdprofile\'>IPDN1</a>', 'Patient', 19, '2020-11-13 00:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (8, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/19/1\'>IPDN1</a>', 'Super Admin', 0, '2020-11-13 00:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (9, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/19/1\'>IPDN1</a>', 'Doctor', 2, '2020-11-13 00:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (10, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/ipdprofile\'>IPDN2</a>', 'Patient', 24, '2020-11-13 01:53:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (11, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/24/2\'>IPDN2</a>', 'Super Admin', 0, '2020-11-13 01:53:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (12, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/24/2\'>IPDN2</a>', 'Doctor', 2, '2020-11-13 01:53:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (13, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>Yuvi</a>', 'Patient', 22, '2020-11-13 11:23:43', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (14, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'admin/systemnotification/moveotpatient/1/22\' onclick=\'<onchngfun>\'>Yuvi</a>', 'Super Admin', 0, '2020-11-13 11:23:43', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (15, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'admin/systemnotification/moveotpatient/1/22\' onclick=\'<onchngfun>\'>Yuvi</a>', 'Doctor', 2, '2020-11-13 11:23:43', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (16, 'Salary Paid', 'salary', 'Salary Amount 10000 has been paid for Month November<a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/movesalarypay/2/1\'>David smith</a>', 'Doctor', 2, '2020-11-16 06:14:37', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (17, 'Salary Paid', 'salary', 'Salary Amount 10000 has been paid for Month November<a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/movesalarypay/2/1\'>David smith</a>', 'Super Admin', 0, '2020-11-16 06:14:37', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (18, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN3</a>', 'Patient', 1, '2020-11-16 11:59:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (19, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/1/3\'>OPDN3</a>', 'Super Admin', 0, '2020-11-16 11:59:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (20, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/1/3\'>OPDN3</a>', 'Doctor', 2, '2020-11-16 11:59:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (21, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>Patient </a>', 'Patient', 0, '2020-11-17 14:25:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (22, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/1\'>Patient </a>', 'Super Admin', 0, '2020-11-17 14:25:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (23, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN4</a>', 'Patient', 2, '2020-11-17 15:37:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (24, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/2/4\'>OPDN4</a>', 'Super Admin', 0, '2020-11-17 15:37:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (25, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/2/4\'>OPDN4</a>', 'Doctor', 2, '2020-11-17 15:37:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (26, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN5</a>', 'Patient', 4, '2020-11-18 10:10:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (27, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/4/5\'>OPDN5</a>', 'Super Admin', 0, '2020-11-18 10:10:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (28, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/4/5\'>OPDN5</a>', 'Doctor', 2, '2020-11-18 10:10:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (29, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/ipdprofile\'>IPDN3</a>', 'Patient', 4, '2020-11-20 10:24:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (30, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/4/3\'>IPDN3</a>', 'Super Admin', 0, '2020-11-20 10:24:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (31, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/4/3\'>IPDN3</a>', 'Doctor', 2, '2020-11-20 10:24:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (32, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/ipdprofile\'>IPDN4</a>', 'Patient', 4, '2020-11-21 17:38:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (33, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/4/4\'>IPDN4</a>', 'Super Admin', 0, '2020-11-21 17:38:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (34, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/4/4\'>IPDN4</a>', 'Doctor', 2, '2020-11-21 17:38:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (35, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN6</a>', 'Patient', 4, '2020-11-24 12:53:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (36, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/4/6\'>OPDN6</a>', 'Super Admin', 0, '2020-11-24 12:53:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (37, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/4/6\'>OPDN6</a>', 'Doctor', 2, '2020-11-24 12:53:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (38, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN7</a>', 'Patient', 2, '2020-11-30 12:54:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (39, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/2/7\'>OPDN7</a>', 'Super Admin', 0, '2020-11-30 12:54:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (40, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/2/7\'>OPDN7</a>', 'Doctor', 2, '2020-11-30 12:54:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (41, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN8</a>', 'Patient', 1, '2020-11-24 12:58:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (42, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/1/8\'>OPDN8</a>', 'Super Admin', 0, '2020-11-24 12:58:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (43, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/1/8\'>OPDN8</a>', 'Doctor', 2, '2020-11-24 12:58:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (44, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/ipdprofile\'>IPDN5</a>', 'Patient', 7, '2020-11-25 13:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (45, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/7/5\'>IPDN5</a>', 'Super Admin', 0, '2020-11-25 13:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (46, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/7/5\'>IPDN5</a>', 'Doctor', 2, '2020-11-25 13:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (47, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/ipdprofile\'>IPDN6</a>', 'Patient', 2, '2020-11-26 13:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (48, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/2/6\'>IPDN6</a>', 'Super Admin', 0, '2020-11-26 13:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (49, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/2/6\'>IPDN6</a>', 'Doctor', 2, '2020-11-26 13:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (50, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN9</a>', 'Patient', 7, '2020-12-01 13:04:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (51, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/7/9\'>OPDN9</a>', 'Super Admin', 0, '2020-12-01 13:04:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (52, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/7/9\'>OPDN9</a>', 'Doctor', 2, '2020-12-01 13:04:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (53, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN10</a>', 'Patient', 1, '2020-12-01 13:16:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (54, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/1/10\'>OPDN10</a>', 'Super Admin', 0, '2020-12-01 13:16:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (55, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/1/10\'>OPDN10</a>', 'Doctor', 2, '2020-12-01 13:16:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (56, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>shivu</a>', 'Patient', 0, '2020-11-27 15:51:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (57, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/2\'>shivu</a>', 'Super Admin', 0, '2020-11-27 15:51:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (58, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>subh</a>', 'Patient', 0, '2020-11-25 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (59, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/3\'>subh</a>', 'Super Admin', 0, '2020-11-25 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (60, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN7</a>', 'Patient', 2, '2020-11-27 09:39:01', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (61, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdpresnotification/2/7\'>OPDN7</a>', 'Super Admin', 0, '2020-11-27 09:39:01', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (62, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdpresnotification/2/7\'>OPDN7</a>', 'Doctor', 2, '2020-11-27 09:39:01', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (63, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdpresnotification/2/7\'>OPDN7</a>', 'Super Admin', 1, '2020-11-27 09:39:01', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (64, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdpresnotification/2/7\'>OPDN7</a>', 'Doctor', 2, '2020-11-27 09:39:01', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (65, 'IPD Prescription Created', 'ipd', 'IPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/patient/systemnotifications/moveipdpresnotification/6/1\'>IPDN6</a>', 'Patient', 2, '2020-11-27 09:49:04', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (66, 'IPD Prescription Created', 'ipd', 'IPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdpresnotification/2/6/1\'>IPDN6</a>', 'Super Admin', 0, '2020-11-27 09:49:04', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (67, 'IPD Prescription Created', 'ipd', 'IPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdpresnotification/2/6/1\'>IPDN6</a>', 'Super Admin', 1, '2020-11-27 09:49:04', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (68, 'IPD Prescription Created', 'ipd', 'IPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdpresnotification/2/6/1\'>IPDN6</a>', 'Doctor', 2, '2020-11-27 09:49:04', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (69, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN11</a>', 'Patient', 7, '2020-11-28 15:37:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (70, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/7/11\'>OPDN11</a>', 'Super Admin', 0, '2020-11-28 15:37:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (71, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/7/11\'>OPDN11</a>', 'Doctor', 2, '2020-11-28 15:37:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (72, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>aaaaa</a>', 'Patient', 8, '2020-11-28 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (73, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/4\'>aaaaa</a>', 'Super Admin', 0, '2020-11-28 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (74, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>aaaaa</a>', 'Patient', 8, '2020-11-28 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (75, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveappointment/4\'>aaaaa</a>', 'Super Admin', 0, '2020-11-28 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (76, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveappointment/4\'>aaaaa</a>', 'Doctor', 2, '2020-11-28 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (77, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN12</a>', 'Patient', 8, '2020-11-28 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (78, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/8/12\'>OPDN12</a>', 'Super Admin', 0, '2020-11-28 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (79, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/8/12\'>OPDN12</a>', 'Doctor', 2, '2020-11-28 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (80, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test bg</a>', 'Patient', 0, '2020-11-28 17:07:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (81, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/5\'>test bg</a>', 'Super Admin', 0, '2020-11-28 17:07:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (82, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/5\'>test bg</a>', 'Doctor', 2, '2020-11-28 17:07:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (83, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test save button</a>', 'Patient', 0, '2020-11-28 17:09:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (84, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/6\'>test save button</a>', 'Super Admin', 0, '2020-11-28 17:09:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (85, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/6\'>test save button</a>', 'Doctor', 2, '2020-11-28 17:09:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (86, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN13</a>', 'Patient', 10, '2020-11-28 17:07:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (87, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/10/13\'>OPDN13</a>', 'Super Admin', 0, '2020-11-28 17:07:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (88, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/10/13\'>OPDN13</a>', 'Doctor', 2, '2020-11-28 17:07:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (89, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>srishti</a>', 'Patient', 0, '2020-11-28 16:57:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (90, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/7\'>srishti</a>', 'Super Admin', 0, '2020-11-28 16:57:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (91, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test report</a>', 'Patient', 0, '2020-11-28 17:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (92, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/8\'>test report</a>', 'Super Admin', 0, '2020-11-28 17:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (93, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/8\'>test report</a>', 'Doctor', 2, '2020-11-28 17:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (94, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN14</a>', 'Patient', 11, '2020-11-28 17:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (95, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/11/14\'>OPDN14</a>', 'Super Admin', 0, '2020-11-28 17:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (96, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/11/14\'>OPDN14</a>', 'Doctor', 2, '2020-11-28 17:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (97, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>garima</a>', 'Patient', 0, '2020-11-28 18:18:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (98, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/9\'>garima</a>', 'Super Admin', 0, '2020-11-28 18:18:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (99, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/9\'>garima</a>', 'Doctor', 2, '2020-11-28 18:18:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (100, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test report</a>', 'Patient', 11, '2020-11-28 18:21:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (101, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/10\'>test report</a>', 'Super Admin', 0, '2020-11-28 18:21:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (102, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/10\'>test report</a>', 'Doctor', 2, '2020-11-28 18:21:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (103, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN15</a>', 'Patient', 11, '2020-11-28 18:26:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (104, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/11/15\'>OPDN15</a>', 'Super Admin', 0, '2020-11-28 18:26:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (105, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/11/15\'>OPDN15</a>', 'Doctor', 2, '2020-11-28 18:26:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (106, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>live consultation </a>', 'Patient', 0, '2020-11-28 18:29:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (107, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/11\'>live consultation </a>', 'Super Admin', 0, '2020-11-28 18:29:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (108, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/11\'>live consultation </a>', 'Doctor', 2, '2020-11-28 18:29:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (109, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test </a>', 'Patient', 0, '2020-11-28 18:30:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (110, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/12\'>test </a>', 'Super Admin', 0, '2020-11-28 18:30:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (111, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/12\'>test </a>', 'Doctor', 2, '2020-11-28 18:30:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (112, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>ffff</a>', 'Patient', 0, '2020-11-28 18:31:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (113, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/13\'>ffff</a>', 'Super Admin', 0, '2020-11-28 18:31:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (114, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>preeti</a>', 'Patient', 7, '2020-11-30 06:30:11', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (115, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'admin/systemnotification/moveotpatient/2/7\' onclick=\'<onchngfun>\'>preeti</a>', 'Super Admin', 0, '2020-11-30 06:30:11', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (116, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'admin/systemnotification/moveotpatient/2/7\' onclick=\'<onchngfun>\'>preeti</a>', 'Doctor', 2, '2020-11-30 06:30:11', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (117, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN16</a>', 'Patient', 16, '2020-11-28 18:30:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (118, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/16/16\'>OPDN16</a>', 'Super Admin', 0, '2020-11-28 18:30:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (119, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/16/16\'>OPDN16</a>', 'Doctor', 2, '2020-11-28 18:30:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (120, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN17</a>', 'Patient', 16, '2020-11-30 15:49:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (121, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/16/17\'>OPDN17</a>', 'Super Admin', 0, '2020-11-30 15:49:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (122, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/16/17\'>OPDN17</a>', 'Doctor', 2, '2020-11-30 15:49:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (123, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test</a>', 'Patient', 16, '2020-11-30 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (124, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/14\'>test</a>', 'Super Admin', 0, '2020-11-30 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (125, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test</a>', 'Patient', 16, '2020-11-30 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (126, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveappointment/14\'>test</a>', 'Super Admin', 0, '2020-11-30 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (127, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveappointment/14\'>test</a>', 'Doctor', 2, '2020-11-30 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (128, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN18</a>', 'Patient', 16, '2020-11-30 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (129, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/16/18\'>OPDN18</a>', 'Super Admin', 0, '2020-11-30 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (130, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/16/18\'>OPDN18</a>', 'Doctor', 2, '2020-11-30 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (131, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>save test</a>', 'Patient', 0, '2020-11-30 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (132, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/15\'>save test</a>', 'Super Admin', 0, '2020-11-30 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (133, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/15\'>save test</a>', 'Doctor', 2, '2020-11-30 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (134, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>ttttttttttttttttttt</a>', 'Patient', 0, '2020-11-30 17:03:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (135, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/16\'>ttttttttttttttttttt</a>', 'Super Admin', 0, '2020-11-30 17:03:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (136, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/16\'>ttttttttttttttttttt</a>', 'Doctor', 2, '2020-11-30 17:03:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (137, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>saveeeee</a>', 'Patient', 0, '2020-11-30 17:03:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (138, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/17\'>saveeeee</a>', 'Super Admin', 0, '2020-11-30 17:03:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (139, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>gg</a>', 'Patient', 0, '2020-11-30 17:04:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (140, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/18\'>gg</a>', 'Super Admin', 0, '2020-11-30 17:04:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (141, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/18\'>gg</a>', 'Doctor', 2, '2020-11-30 17:04:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (142, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test</a>', 'Patient', 16, '2020-11-30 17:09:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (143, 'Appointment Created', 'appointment', 'Appointment has been created for <a href=\'admin/systemnotification/moveappointment/19\'>test</a>', 'Super Admin', 0, '2020-11-30 17:09:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (144, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>test</a>', 'Patient', 0, '2020-11-30 17:10:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (145, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/20\'>test</a>', 'Super Admin', 0, '2020-11-30 17:10:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (146, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/20\'>test</a>', 'Doctor', 2, '2020-11-30 17:10:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (147, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN19</a>', 'Patient', 17, '2020-11-30 17:21:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (148, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/17/19\'>OPDN19</a>', 'Super Admin', 0, '2020-11-30 17:21:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (149, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/17/19\'>OPDN19</a>', 'Doctor', 2, '2020-11-30 17:21:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (150, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN20</a>', 'Patient', 18, '2020-11-30 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (151, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/18/20\'>OPDN20</a>', 'Super Admin', 0, '2020-11-30 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (152, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/18/20\'>OPDN20</a>', 'Doctor', 2, '2020-11-30 17:02:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (153, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>ginni test</a>', 'Patient', 17, '2020-11-30 17:36:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (154, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/21\'>ginni test</a>', 'Super Admin', 0, '2020-11-30 17:36:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (155, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/21\'>ginni test</a>', 'Doctor', 2, '2020-11-30 17:36:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (156, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN21</a>', 'Patient', 18, '2020-11-30 17:38:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (157, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/18/21\'>OPDN21</a>', 'Super Admin', 0, '2020-11-30 17:38:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (158, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/18/21\'>OPDN21</a>', 'Doctor', 2, '2020-11-30 17:38:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (159, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>garima marko</a>', 'Patient', 0, '2020-11-30 17:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (160, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/22\'>garima marko</a>', 'Super Admin', 0, '2020-11-30 17:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (161, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/22\'>garima marko</a>', 'Doctor', 2, '2020-11-30 17:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (162, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/ipdprofile\'>IPDN7</a>', 'Patient', 19, '2020-11-30 17:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (163, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/19/7\'>IPDN7</a>', 'Super Admin', 0, '2020-11-30 17:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (164, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/19/7\'>IPDN7</a>', 'Doctor', 2, '2020-11-30 17:44:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (165, 'IPD Prescription Created', 'ipd', 'IPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/patient/systemnotifications/moveipdpresnotification/7/2\'>IPDN7</a>', 'Patient', 19, '2020-11-30 12:21:13', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (166, 'IPD Prescription Created', 'ipd', 'IPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdpresnotification/19/7/2\'>IPDN7</a>', 'Super Admin', 0, '2020-11-30 12:21:13', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (167, 'IPD Prescription Created', 'ipd', 'IPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdpresnotification/19/7/2\'>IPDN7</a>', 'Super Admin', 1, '2020-11-30 12:21:13', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (168, 'IPD Prescription Created', 'ipd', 'IPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdpresnotification/19/7/2\'>IPDN7</a>', 'Doctor', 2, '2020-11-30 12:21:13', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (169, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN12</a>', 'Patient', 8, '2020-12-02 04:59:02', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (170, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdpresnotification/8/12\'>OPDN12</a>', 'Super Admin', 0, '2020-12-02 04:59:02', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (171, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdpresnotification/8/12\'>OPDN12</a>', 'Super Admin', 1, '2020-12-02 04:59:02', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (172, 'OPD Prescription Created', 'opd', 'OPD Prescription has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdpresnotification/8/12\'>OPDN12</a>', 'Doctor', 2, '2020-12-02 04:59:02', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (173, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>Rashmi</a>', 'Patient', 0, '2020-12-02 11:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (174, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/23\'>Rashmi</a>', 'Super Admin', 0, '2020-12-02 11:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (175, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/23\'>Rashmi</a>', 'Doctor', 2, '2020-12-02 11:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (176, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN22</a>', 'Patient', 20, '2020-12-02 11:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (177, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/20/22\'>OPDN22</a>', 'Super Admin', 0, '2020-12-02 11:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (178, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/20/22\'>OPDN22</a>', 'Doctor', 2, '2020-12-02 11:34:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (179, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN23</a>', 'Patient', 21, '2020-12-02 11:46:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (180, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/21/23\'>OPDN23</a>', 'Super Admin', 0, '2020-12-02 11:46:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (181, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/21/23\'>OPDN23</a>', 'Doctor', 2, '2020-12-02 11:46:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (182, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN24</a>', 'Patient', 19, '2020-12-02 11:48:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (183, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/19/24\'>OPDN24</a>', 'Super Admin', 0, '2020-12-02 11:48:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (184, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/19/24\'>OPDN24</a>', 'Doctor', 2, '2020-12-02 11:48:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (185, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN25</a>', 'Patient', 17, '2020-12-02 11:51:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (186, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/17/25\'>OPDN25</a>', 'Super Admin', 0, '2020-12-02 11:51:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (187, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/17/25\'>OPDN25</a>', 'Doctor', 2, '2020-12-02 11:51:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (188, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>saveeeee</a>', 'Patient', 0, '2020-11-30 17:03:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (189, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveappointment/17\'>saveeeee</a>', 'Super Admin', 0, '2020-11-30 17:03:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (190, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveappointment/17\'>saveeeee</a>', 'Doctor', 2, '2020-11-30 17:03:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (191, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/ipdprofile\'>IPDN8</a>', 'Patient', 20, '2020-12-03 00:24:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (192, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/20/8\'>IPDN8</a>', 'Super Admin', 0, '2020-12-03 00:24:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (193, 'IPD Visit Created', 'ipd', 'IPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveipdnotification/20/8\'>IPDN8</a>', 'Doctor', 2, '2020-12-03 00:24:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (194, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'patient/dashboard/otsearch\' onclick=\'<onchngfun>\'>dinnu</a>', 'Patient', 9, '2020-12-05 10:07:04', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (195, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'admin/systemnotification/moveotpatient/3/9\' onclick=\'<onchngfun>\'>dinnu</a>', 'Super Admin', 0, '2020-12-05 10:07:04', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (196, 'notification_operation_theatre_visit_created', 'ot', 'OT Visit has been created for <a href=\'admin/systemnotification/moveotpatient/3/9\' onclick=\'<onchngfun>\'>dinnu</a>', 'Doctor', 2, '2020-12-05 10:07:04', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (197, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN26</a>', 'Patient', 17, '2020-12-01 17:36:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (198, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/17/26\'>OPDN26</a>', 'Super Admin', 0, '2020-12-01 17:36:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (199, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/17/26\'>OPDN26</a>', 'Doctor', 2, '2020-12-01 17:36:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (200, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/appointment\'>rahul</a>', 'Patient', 28, '2020-12-05 16:52:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (201, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/24\'>rahul</a>', 'Super Admin', 0, '2020-12-05 16:52:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (202, 'Appointment Approved', 'appointment', 'Appointment has been approved for <a href=\'admin/systemnotification/moveappointment/24\'>rahul</a>', 'Doctor', 2, '2020-12-05 16:52:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (203, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/patient/dashboard/profile\'>OPDN27</a>', 'Patient', 1, '2020-12-05 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (204, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/1/27\'>OPDN27</a>', 'Super Admin', 0, '2020-12-05 17:01:00', 'yes');
INSERT INTO `system_notification` (`id`, `notification_title`, `notification_type`, `notification_desc`, `notification_for`, `receiver_id`, `date`, `is_active`) VALUES (205, 'OPD Visit Created', 'opd', 'OPD has been created with <a href=\'https://dev.webfeb.com/sh32/admin/systemnotification/moveopdnotification/1/27\'>OPDN27</a>', 'Doctor', 2, '2020-12-05 17:01:00', 'yes');


#
# TABLE STRUCTURE FOR: test_type_report
#

DROP TABLE IF EXISTS `test_type_report`;

CREATE TABLE `test_type_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `radiology_id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `test_report` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: tpa_doctorcharges
#

DROP TABLE IF EXISTS `tpa_doctorcharges`;

CREATE TABLE `tpa_doctorcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `org_charge` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `charge_id` (`charge_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: tpa_master
#

DROP TABLE IF EXISTS `tpa_master`;

CREATE TABLE `tpa_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organisation` varchar(200) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `organisation_charge` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: unit
#

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) NOT NULL,
  `unit_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (1, 'mg', 'patho', '2020-11-13 09:14:48');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (2, 'ml', 'patho', '2020-11-13 09:14:56');
INSERT INTO `unit` (`id`, `unit_name`, `unit_type`, `created_at`) VALUES (3, 'test', 'radio', '2020-11-13 10:57:47');


#
# TABLE STRUCTURE FOR: userlog
#

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (1, 'superadmin@gmail.com', 'Super Admin', '122.168.188.27', 'Chrome 86.0.4240.193, Windows 10', '2020-11-13 04:56:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 'superadmin@gmail.com', 'Super Admin', '122.168.188.27', 'Chrome 86.0.4240.193, Windows 10', '2020-11-13 07:53:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (3, 'superadmin@gmail.com', 'Super Admin', '122.168.188.253', 'Chrome 86.0.4240.198, Windows 10', '2020-11-16 04:27:37');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (4, 'superadmin@gmail.com', 'Super Admin', '122.168.189.117', 'Chrome 86.0.4240.198, Windows 10', '2020-11-17 04:37:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (5, 'superadmin@gmail.com', 'Super Admin', '122.168.188.31', 'Chrome 86.0.4240.198, Windows 10', '2020-11-17 05:59:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (6, 'superadmin@gmail.com', 'Super Admin', '122.168.188.31', 'Chrome 86.0.4240.198, Windows 10', '2020-11-17 08:42:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (7, 'superadmin@gmail.com', 'Super Admin', '122.168.188.31', 'Chrome 86.0.4240.198, Windows 10', '2020-11-17 10:07:04');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (8, 'superadmin@gmail.com', 'Super Admin', '122.168.188.31', 'Chrome 86.0.4240.198, Windows 10', '2020-11-17 11:59:52');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (9, 'superadmin@gmail.com', 'Super Admin', '122.168.189.34', 'Chrome 86.0.4240.198, Windows 10', '2020-11-18 04:39:02');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (10, 'superadmin@gmail.com', 'Super Admin', '122.168.189.34', 'Chrome 87.0.4280.66, Windows 10', '2020-11-18 05:06:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (11, 'superadmin@gmail.com', 'Super Admin', '122.168.189.34', 'Chrome 86.0.4240.198, Windows 10', '2020-11-18 05:47:25');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (12, 'superadmin@gmail.com', 'Super Admin', '122.168.189.34', 'Chrome 86.0.4240.198, Windows 10', '2020-11-18 06:33:02');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (13, 'superadmin@gmail.com', 'Super Admin', '122.168.189.34', 'Chrome 87.0.4280.66, Windows 10', '2020-11-18 07:26:46');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (14, 'superadmin@gmail.com', 'Super Admin', '122.168.189.189', 'Chrome 86.0.4240.198, Windows 10', '2020-11-19 09:22:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (15, 'superadmin@gmail.com', 'Super Admin', '122.168.189.189', 'Chrome 86.0.4240.198, Windows 10', '2020-11-19 09:57:58');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (16, 'superadmin@gmail.com', 'Super Admin', '122.168.189.189', 'Chrome 86.0.4240.198, Windows 10', '2020-11-19 10:24:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (17, 'superadmin@gmail.com', 'Super Admin', '122.168.189.241', 'Chrome 87.0.4280.66, Windows 10', '2020-11-20 04:27:36');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (18, 'superadmin@gmail.com', 'Super Admin', '122.168.189.241', 'Chrome 86.0.4240.198, Windows 10', '2020-11-20 04:49:32');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (19, 'superadmin@gmail.com', 'Super Admin', '122.168.189.241', 'Chrome 86.0.4240.198, Windows 10', '2020-11-20 04:54:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (20, 'superadmin@gmail.com', 'Super Admin', '122.168.188.186', 'Chrome 86.0.4240.198, Windows 10', '2020-11-20 05:25:54');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (21, 'superadmin@gmail.com', 'Super Admin', '122.168.188.186', 'Chrome 87.0.4280.66, Windows 10', '2020-11-20 07:37:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (22, 'superadmin@gmail.com', 'Super Admin', '47.247.123.228', 'Chrome 86.0.4240.183, Windows 10', '2020-11-20 13:37:31');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (23, 'superadmin@gmail.com', 'Super Admin', '122.168.188.249', 'Chrome 87.0.4280.66, Windows 10', '2020-11-21 04:33:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (24, 'superadmin@gmail.com', 'Super Admin', '122.168.188.249', 'Chrome 87.0.4280.66, Windows 10', '2020-11-21 05:09:20');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (25, 'superadmin@gmail.com', 'Super Admin', '122.168.188.249', 'Chrome 86.0.4240.198, Windows 10', '2020-11-21 06:25:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (26, 'superadmin@gmail.com', 'Super Admin', '122.168.188.249', 'Chrome 86.0.4240.198, Windows 10', '2020-11-21 11:00:14');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (27, 'superadmin@gmail.com', 'Super Admin', '122.168.188.25', 'Chrome 87.0.4280.66, Windows 10', '2020-11-24 04:34:51');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (28, 'superadmin@gmail.com', 'Super Admin', '122.168.188.25', 'Chrome 87.0.4280.66, Windows 10', '2020-11-24 04:57:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (29, 'superadmin@gmail.com', 'Super Admin', '122.168.188.25', 'Chrome 86.0.4240.198, Windows 10', '2020-11-24 06:50:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (30, 'superadmin@gmail.com', 'Super Admin', '122.168.188.204', 'Chrome 87.0.4280.66, Windows 10', '2020-11-25 04:51:12');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (31, 'superadmin@gmail.com', 'Super Admin', '122.168.188.204', 'Chrome 86.0.4240.198, Windows 10', '2020-11-25 16:57:04');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (32, 'superadmin@gmail.com', 'Super Admin', '47.247.172.71', 'Chrome 86.0.4240.198, Windows 10', '2020-11-26 03:26:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (33, 'superadmin@gmail.com', 'Super Admin', '47.247.172.71', 'Chrome 86.0.4240.198, Windows 10', '2020-11-26 05:01:34');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (34, 'superadmin@gmail.com', 'Super Admin', '122.168.189.201', 'Chrome 87.0.4280.66, Windows 10', '2020-11-26 05:15:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (35, 'superadmin@gmail.com', 'Super Admin', '122.168.189.29', 'Chrome 87.0.4280.66, Windows 10', '2020-11-27 04:28:01');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (36, 'superadmin@gmail.com', 'Super Admin', '122.168.189.29', 'Chrome 87.0.4280.66, Windows 10', '2020-11-27 05:23:03');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (37, 'superadmin@gmail.com', 'Super Admin', '122.168.189.29', 'Chrome 86.0.4240.198, Windows 10', '2020-11-27 05:52:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (38, 'superadmin@gmail.com', 'Super Admin', '122.168.189.29', 'Chrome 86.0.4240.198, Windows 10', '2020-11-27 09:01:17');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (39, 'superadmin@gmail.com', 'Super Admin', '122.168.189.29', 'Chrome 86.0.4240.198, Windows 10', '2020-11-27 13:46:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (40, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 87.0.4280.66, Windows 10', '2020-11-28 04:31:27');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (41, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 04:35:56');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (42, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 87.0.4280.66, Windows 10', '2020-11-28 04:50:20');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (43, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 87.0.4280.66, Windows 10', '2020-11-28 05:13:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (44, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 87.0.4280.66, Windows 10', '2020-11-28 05:21:53');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (45, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 07:23:43');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (46, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 07:40:07');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (47, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 09:14:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (48, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 09:49:29');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (49, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 09:56:33');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (50, 'pat7', 'patient', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 10:22:52');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (51, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 10:51:25');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (52, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 10:51:48');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (53, 'superadmin@gmail.com', 'Super Admin', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 11:35:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (54, 'pat8', 'patient', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 11:35:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (55, 'pat10', 'patient', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 11:46:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (56, 'pat11', 'patient', '122.168.188.239', 'Chrome 86.0.4240.198, Windows 10', '2020-11-28 12:13:00');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (57, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 87.0.4280.66, Windows 10', '2020-11-30 04:28:14');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (58, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 87.0.4280.66, Windows 10', '2020-11-30 04:42:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (59, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 87.0.4280.66, Windows 10', '2020-11-30 05:03:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (60, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 86.0.4240.198, Windows 10', '2020-11-30 06:30:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (61, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 87.0.4280.66, Windows 10', '2020-11-30 08:35:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (62, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 86.0.4240.198, Windows 10', '2020-11-30 09:04:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (63, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 86.0.4240.198, Windows 10', '2020-11-30 10:22:37');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (64, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 86.0.4240.198, Windows 10', '2020-11-30 11:34:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (65, 'david@gmail.com', 'Doctor', '122.168.189.59', 'Chrome 86.0.4240.198, Windows 10', '2020-11-30 12:25:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (66, 'superadmin@gmail.com', 'Super Admin', '122.168.189.59', 'Chrome 86.0.4240.198, Windows 10', '2020-11-30 12:49:43');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (67, 'superadmin@gmail.com', 'Super Admin', '122.168.188.226', 'Chrome 87.0.4280.66, Windows 10', '2020-12-01 04:27:52');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (68, 'superadmin@gmail.com', 'Super Admin', '122.168.188.226', 'Chrome 87.0.4280.66, Windows 10', '2020-12-01 04:49:11');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (69, 'superadmin@gmail.com', 'Super Admin', '122.168.188.226', 'Chrome 86.0.4240.198, Windows 10', '2020-12-01 05:30:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (70, 'superadmin@gmail.com', 'Super Admin', '122.168.188.226', 'Chrome 87.0.4280.66, Windows 10', '2020-12-01 09:11:32');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (71, 'superadmin@gmail.com', 'Super Admin', '122.168.188.74', 'Chrome 87.0.4280.66, Windows 10', '2020-12-02 04:22:14');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (72, 'superadmin@gmail.com', 'Super Admin', '122.168.188.74', 'Chrome 86.0.4240.198, Windows 10', '2020-12-02 04:46:10');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (73, 'superadmin@gmail.com', 'Super Admin', '122.168.188.74', 'Chrome 86.0.4240.198, Windows 10', '2020-12-02 05:51:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (74, 'david@gmail.com', 'Doctor', '122.168.188.74', 'Chrome 86.0.4240.198, Windows 10', '2020-12-02 05:54:38');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (75, 'superadmin@gmail.com', 'Super Admin', '122.168.188.74', 'Chrome 86.0.4240.198, Windows 10', '2020-12-02 06:18:36');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (76, 'superadmin@gmail.com', 'Super Admin', '122.168.188.74', 'Chrome 87.0.4280.66, Windows 10', '2020-12-02 06:40:58');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (77, 'superadmin@gmail.com', 'Super Admin', '122.168.188.74', 'Chrome 86.0.4240.198, Windows 10', '2020-12-02 10:12:23');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (78, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 87.0.4280.66, Windows 10', '2020-12-03 04:19:57');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (79, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 87.0.4280.66, Windows 10', '2020-12-03 04:49:52');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (80, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 86.0.4240.198, Windows 10', '2020-12-03 05:32:05');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (81, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 86.0.4240.198, Windows 10', '2020-12-03 06:41:37');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (82, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 86.0.4240.198, Windows 10', '2020-12-03 07:10:10');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (83, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 87.0.4280.66, Windows 10', '2020-12-03 07:12:59');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (84, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 86.0.4240.198, Windows 10', '2020-12-03 07:25:41');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (85, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 86.0.4240.198, Windows 10', '2020-12-03 07:59:32');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (86, 'superadmin@gmail.com', 'Super Admin', '122.168.188.133', 'Chrome 86.0.4240.198, Windows 10', '2020-12-03 11:15:54');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (87, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 87.0.4280.88, Windows 10', '2020-12-04 04:32:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (88, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 05:22:34');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (89, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 87.0.4280.66, Windows 10', '2020-12-04 05:24:42');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (90, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 05:40:28');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (91, 'david@gmail.com', 'Doctor', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 05:46:13');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (92, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 87.0.4280.66, Windows 10', '2020-12-04 05:51:06');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (93, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 06:05:40');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (94, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 06:14:09');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (95, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 06:14:35');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (96, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 06:34:10');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (97, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 07:06:08');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (98, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 07:06:14');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (99, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 07:10:49');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (100, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 07:28:46');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (101, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 12:00:45');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (102, 'superadmin@gmail.com', 'Super Admin', '122.168.188.155', 'Chrome 86.0.4240.198, Windows 10', '2020-12-04 14:28:21');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (103, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 86.0.4240.198, Windows 10', '2020-12-05 04:17:44');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (104, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 87.0.4280.88, Windows 10', '2020-12-05 04:31:55');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (105, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 87.0.4280.66, Windows 10', '2020-12-05 07:24:47');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (106, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 86.0.4240.198, Windows 10', '2020-12-05 09:37:06');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (107, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 86.0.4240.198, Windows 10', '2020-12-05 10:15:16');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (108, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 87.0.4280.66, Windows 10', '2020-12-05 10:24:00');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (109, 'pat7', 'patient', '122.168.188.247', 'Chrome 86.0.4240.198, Android', '2020-12-05 10:43:43');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (110, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 86.0.4240.198, Windows 10', '2020-12-05 11:06:03');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (111, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 86.0.4240.198, Windows 10', '2020-12-05 11:06:30');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (112, 'jhon@gmail.com', 'Doctor', '122.168.188.247', 'Chrome 86.0.4240.198, Windows 10', '2020-12-05 11:32:22');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (113, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 86.0.4240.198, Android', '2020-12-05 11:55:37');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (114, 'superadmin@gmail.com', 'Super Admin', '122.168.188.247', 'Chrome 86.0.4240.198, Windows 10', '2020-12-05 12:00:28');
INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (115, 'superadmin@gmail.com', 'Super Admin', '157.34.73.246', 'Chrome 86.0.4240.198, Windows 10', '2020-12-06 01:41:51');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (1, 1, 'pat1', 'r0doua', '', 'patient', '', 'no', '2020-11-13 06:11:07');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (2, 0, NULL, NULL, '', '', '', 'no', '2020-11-16 06:30:49');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (3, 2, 'pat2', 'rsogt9', '', 'patient', '', 'no', '2020-12-05 10:30:37');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (4, 3, 'pat3', '8neas7', '', 'patient', '', 'no', '2020-12-05 10:30:47');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (5, 4, 'pat4', 'p54n2a', '', 'patient', '', 'yes', '2020-11-18 04:40:31');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (6, 5, 'pat5', '4nba5q', '', 'patient', '', 'yes', '2020-11-20 10:15:34');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (7, 6, 'pat6', 'tmbcdd', '', 'patient', '', 'yes', '2020-11-20 10:32:08');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (8, 7, 'pat7', '6t5bb1', '', 'patient', '', 'yes', '2020-11-20 10:36:07');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (9, 8, 'pat8', '69saib', '', 'patient', '', 'no', '2020-12-05 10:31:17');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (10, 9, 'pat9', 'uyp6wd', '', 'patient', '', 'yes', '2020-11-28 10:12:19');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (11, 10, 'pat10', 'eja2g7', '', 'patient', '', 'yes', '2020-11-28 11:45:24');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (12, 11, 'pat11', 'em02od', '', 'patient', '', 'yes', '2020-11-28 12:10:12');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (13, 12, 'pat12', 'ad175r', '', 'patient', '', 'no', '2020-12-05 10:30:09');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (14, 13, 'pat13', 'uw2pfq', '', 'patient', '', 'no', '2020-12-05 10:30:16');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (15, 14, 'pat14', 'jqfkm0', '', 'patient', '', 'no', '2020-12-05 10:30:59');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (16, 15, 'pat15', '2r3089', '', 'patient', '', 'no', '2020-12-05 10:30:27');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (17, 16, 'pat16', 'm5xd25', '', 'patient', '', 'yes', '2020-11-30 10:24:07');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (18, 17, 'pat17', 'swupfe', '', 'patient', '', 'yes', '2020-11-30 11:56:14');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (19, 18, 'pat18', '3hsgsc', '', 'patient', '', 'yes', '2020-11-30 12:01:28');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (20, 19, 'pat19', 'mbwmxn', '', 'patient', '', 'yes', '2020-11-30 12:20:17');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (21, 20, 'pat20', 'n7jgmq', '', 'patient', '', 'yes', '2020-12-02 06:11:46');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (22, 21, 'pat21', 'zi7yhi', '', 'patient', '', 'no', '2020-12-05 10:29:06');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (23, 22, 'pat22', '6cdsb7', '', 'patient', '', 'yes', '2020-12-02 07:23:00');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (24, 23, 'pat23', 'o80yla', '', 'patient', '', 'yes', '2020-12-05 10:23:46');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (25, 24, 'pat24', '2jazvd', '', 'patient', '', 'no', '2020-12-05 10:50:03');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (26, 25, 'pat25', 'elwryb', '', 'patient', '', 'yes', '2020-12-05 10:28:30');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (27, 26, 'pat26', 'k47k1a', '', 'patient', '', 'yes', '2020-12-05 10:28:30');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (28, 27, 'pat27', 'gvfwcc', '', 'patient', '', 'yes', '2020-12-05 10:28:30');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (29, 28, 'pat28', 'xy07am', '', 'patient', '', 'yes', '2020-12-05 10:28:30');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (30, 29, 'pat29', 'iymauw', '', 'patient', '', 'no', '2020-12-05 10:50:15');
INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`, `created_at`) VALUES (31, 29, 'pat29', 's4r1cf', '', 'patient', '', 'yes', '2020-12-05 10:28:30');


#
# TABLE STRUCTURE FOR: users_authentication
#

DROP TABLE IF EXISTS `users_authentication`;

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `token` varchar(200) NOT NULL,
  `expired_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: vehicles
#

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `vehicles` (`id`, `vehicle_no`, `vehicle_model`, `manufacture_year`, `vehicle_type`, `driver_name`, `driver_licence`, `driver_contact`, `note`, `created_at`) VALUES (1, 'MP20 MH1329', '2015', '2015', 'Owned', 'Depanshu', 'mp15-849-3434', '5986598659', '', '2020-11-16 05:55:48');


#
# TABLE STRUCTURE FOR: visit_details
#

DROP TABLE IF EXISTS `visit_details`;

CREATE TABLE `visit_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `opd_no` varchar(100) NOT NULL,
  `cons_doctor` int(11) NOT NULL,
  `case_type` varchar(200) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `bp` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `known_allergies` varchar(100) NOT NULL,
  `casualty` varchar(200) NOT NULL,
  `refference` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `note_remark` mediumtext NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `header_note` text NOT NULL,
  `footer_note` text NOT NULL,
  `generated_by` int(11) NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `live_consult` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `visit_details` (`id`, `patient_id`, `opd_id`, `opd_no`, `cons_doctor`, `case_type`, `appointment_date`, `symptoms`, `bp`, `height`, `weight`, `pulse`, `temperature`, `respiration`, `known_allergies`, `casualty`, `refference`, `date`, `note`, `amount`, `tax`, `note_remark`, `payment_mode`, `header_note`, `footer_note`, `generated_by`, `discharged`, `live_consult`) VALUES (1, 2, 4, 'OPDN4', 2, 'sssss', '2020-11-18 16:52:00', '', '', '', '', '', '', '', '', 'No', '', '0000-00-00', '', '500.00', '0.00', '', 'Cash', '', '', 1, '', 'No');


#
# TABLE STRUCTURE FOR: visitors_book
#

DROP TABLE IF EXISTS `visitors_book`;

CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` mediumtext NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: visitors_purpose
#

DROP TABLE IF EXISTS `visitors_purpose`;

CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: zoom_settings
#

DROP TABLE IF EXISTS `zoom_settings`;

CREATE TABLE `zoom_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zoom_api_key` varchar(200) DEFAULT NULL,
  `zoom_api_secret` varchar(200) DEFAULT NULL,
  `use_doctor_api` int(1) DEFAULT '1',
  `use_zoom_app` int(1) DEFAULT '1',
  `opd_duration` int(11) DEFAULT NULL,
  `ipd_duration` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `zoom_settings` (`id`, `zoom_api_key`, `zoom_api_secret`, `use_doctor_api`, `use_zoom_app`, `opd_duration`, `ipd_duration`, `created_at`) VALUES (1, 'D-RU4KuUR6aTDQhgFGUlPA', 'CH4pJAQvmUT4PQ1SSWHBFuFuXkPNnnmEQJxJ', 1, 1, 15, 30, '2020-12-05 10:39:00');


