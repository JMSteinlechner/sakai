--
-- Table structure for table `attendance_site_t`
--
CREATE TABLE `attendance_site_t` (
  `A_SITE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` varchar(255) DEFAULT NULL,
  `DEFAULT_STATUS` varchar(255) DEFAULT NULL,
  `MAXIMUM_GRADE` double DEFAULT NULL,
  `IS_GRADE_SHOWN` bit(1) DEFAULT NULL,
  `SEND_TO_GRADEBOOK` bit(1) DEFAULT NULL,
  `GRADEBOOK_ITEM_NAME` varchar(255) DEFAULT NULL,
  `SHOW_COMMENTS` bit(1) DEFAULT NULL,
  PRIMARY KEY (`A_SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Table structure for table `attendance_event_t`
--
CREATE TABLE `attendance_event_t` (
  `A_EVENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `START_DATE_TIME` datetime DEFAULT NULL,
  `END_DATE_TIME` datetime DEFAULT NULL,
  `IS_REOCCURRING` bit(1) DEFAULT NULL,
  `REOCCURRING_ID` bigint(20) DEFAULT NULL,
  `IS_REQUIRED` bit(1) DEFAULT NULL,
  `RELEASED_TO` varchar(255) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `A_SITE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`A_EVENT_ID`),
  KEY `FK65EC4C79E9210FFF` (`A_SITE_ID`),
  CONSTRAINT `FK65EC4C79E9210FFF` FOREIGN KEY (`A_SITE_ID`) REFERENCES `attendance_site_t` (`A_SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Table structure for table `attendance_record_t`
--
CREATE TABLE `attendance_record_t` (
  `A_RECORD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `A_EVENT_ID` bigint(20) NOT NULL,
  `RECORD_COMMENT` text,
  PRIMARY KEY (`A_RECORD_ID`),
  KEY `FK1765B47C22917075` (`A_EVENT_ID`),
  CONSTRAINT `FK1765B47C22917075` FOREIGN KEY (`A_EVENT_ID`) REFERENCES `attendance_event_t` (`A_EVENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Table structure for table `attendance_grade_t`
--
CREATE TABLE `attendance_grade_t` (
  `A_GRADE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GRADE` double DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `A_SITE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`A_GRADE_ID`),
  KEY `FKC8A83E76E9210FFF` (`A_SITE_ID`),
  CONSTRAINT `FKC8A83E76E9210FFF` FOREIGN KEY (`A_SITE_ID`) REFERENCES `attendance_site_t` (`A_SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Table structure for table `attendance_status_t`
--
CREATE TABLE `attendance_status_t` (
  `A_STATUS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `A_SITE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`A_STATUS_ID`),
  KEY `FK95A2B3DDE9210FFF` (`A_SITE_ID`),
  CONSTRAINT `FK95A2B3DDE9210FFF` FOREIGN KEY (`A_SITE_ID`) REFERENCES `attendance_site_t` (`A_SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
