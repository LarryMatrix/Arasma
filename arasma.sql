-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 15, 2017 at 05:15 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arasma`
--

-- --------------------------------------------------------

--
-- Table structure for table `appeal_info`
--

CREATE TABLE `appeal_info` (
  `appeal_id` int(10) NOT NULL,
  `appeal_subject` varchar(100) NOT NULL,
  `appeal_reason` varchar(500) NOT NULL,
  `appeal_date` date NOT NULL,
  `payment_info_id` int(10) NOT NULL,
  `hod_comment` varchar(50) NOT NULL,
  `bursar_comment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appeal_info`
--

INSERT INTO `appeal_info` (`appeal_id`, `appeal_subject`, `appeal_reason`, `appeal_date`, `payment_info_id`, `hod_comment`, `bursar_comment`) VALUES
(1, 'ICT311', 'Counting of marks', '2017-06-11', 7, '', ''),
(2, 'ICT209', 'Marks did not reach', '2017-06-11', 7, '', ''),
(3, 'ICT 300', 'error in counting of marks', '2017-06-11', 7, '', ''),
(4, 'Ict300', 'My marks were not fulfilling', '2017-06-12', 7, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(10) NOT NULL,
  `contact_email` varchar(50) NOT NULL,
  `contact_mobile_no` varchar(20) NOT NULL,
  `contact_mailing_address` varchar(25) NOT NULL,
  `contact_pob` varchar(25) NOT NULL,
  `student_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_email`, `contact_mobile_no`, `contact_mailing_address`, `contact_pob`, `student_id`) VALUES
(2, 'massanjal4@gmail.com', '0754690060', 'P. O. Box 112 Mzumbe', 'Nzega, Tabora', '1302122/T.14'),
(3, 'christopherpeter@gmail.com', '0712233445', 'P. O. Box 4323 Arusha', 'Arusha', '1302159/T.14'),
(4, 'esterbulaya@gmail.com', '0788112233', 'P. O. Box 321 Mara', 'Mara', '13021211/T.14');

-- --------------------------------------------------------

--
-- Table structure for table `core_course`
--

CREATE TABLE `core_course` (
  `core_course_id` int(10) NOT NULL,
  `program_id` varchar(15) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `course_yos` int(1) NOT NULL,
  `course_sos` int(1) NOT NULL,
  `teacher_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_course`
--

INSERT INTO `core_course` (`core_course_id`, `program_id`, `course_id`, `course_yos`, `course_sos`, `teacher_id`) VALUES
(1, 'ITS', 'ICT114', 1, 1, 1),
(2, 'ITS', 'ICT111', 1, 1, 1),
(3, 'ITS', 'COM101', 2, 2, 1),
(4, 'ITS', 'DST100', 1, 1, 2),
(5, 'ITS', 'ICT112', 1, 1, 3),
(6, 'ITS', 'ICT119', 1, 1, 2),
(7, 'ITS', 'ICT121', 1, 2, 2),
(8, 'ITS', 'ICT122', 1, 2, 3),
(9, 'ITS', 'ICT123', 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(10) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_unit` int(2) NOT NULL,
  `course_level` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_unit`, `course_level`) VALUES
('COM101', 'Study Skills and Business Communication', 2, 'Degree'),
('DST100', 'Development Perspectives', 2, 'Degree'),
('ICT111', 'Introduction to Information Technology and Systems', 2, 'Degree'),
('ICT112', 'Principles of Computer Programming', 2, 'Degree'),
('ICT114', 'Databases and Database Systems', 3, 'Degree'),
('ICT118', 'Fundamental of Artificial Intelligence', 2, 'Degree'),
('ICT119', 'Elementary Statistics', 2, 'Degree'),
('ICT121', 'Object Oriented Programming with Java', 3, 'Degree'),
('ICT122', 'Computer Architecture', 2, 'Degree'),
('ICT123', 'Computer Networks', 2, 'Degree'),
('ICT124', 'Algorithms and Data Structures', 2, 'Degree'),
('ICT125', 'Linear Algebra', 2, 'Degree'),
('ICT200', 'Collaborative Networks and Facilitating Technologies', 2, 'Degree'),
('ICT201', 'Human Computer Interactions', 2, 'Degree'),
('ICT203', 'Social Informatics', 2, 'Degree'),
('ICT211', 'Systems and Software Engineering', 2, 'Degree'),
('ICT212', 'Advanced Computer Networks', 2, 'Degree'),
('ICT213', 'System Analysis and Design', 2, 'Degree'),
('ICT215', 'Discrete Mathematics', 2, 'Degree'),
('ICT216', 'Calculus and Foundational Analysis', 2, 'Degree'),
('ICT221', 'Web Applications Design and Implementation with PHP or JSP', 2, 'Degree'),
('ICT222', 'Computer Graphics', 2, 'Degree'),
('ICT223', 'Operating Systems', 2, 'Degree'),
('ICT303', 'Data Warehousing', 2, 'Degree'),
('ICT311', 'Distributed Systems', 2, 'Degree'),
('ICT312', 'Management of IT Projects', 2, 'Degree'),
('ICT313', 'Informatics Research and Development Methodologies', 2, 'Degree'),
('ICT316', 'E-Governance', 2, 'Degree'),
('ICT321', 'Advanced Databases and Database Implementation', 2, 'Degree'),
('ICT323', 'Final Year Projects', 6, 'Degree'),
('ICT324', 'E-Business and E-Commerce', 2, 'Degree'),
('ICT325', 'Cryptography and Network Security', 2, 'Degree');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` varchar(10) NOT NULL,
  `department_name` varchar(150) NOT NULL,
  `faculty_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `faculty_id`) VALUES
('CSS', 'Department of Computing Science Studies', 'FSS');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` varchar(5) NOT NULL,
  `faculty_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_name`) VALUES
('FOL', 'Faculty of Law'),
('FSS', 'Faculty of Social Science'),
('FST', 'Faculty of Science and Technology'),
('SOB', 'School of Business'),
('SOPAM', 'School of Public Administration and Management');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(1) NOT NULL,
  `gender_name` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `gender_name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(2) NOT NULL,
  `level_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_name`) VALUES
(1, 'Admin'),
(2, 'Student'),
(3, 'HOD'),
(4, 'Teacher'),
(5, 'Bursar');

-- --------------------------------------------------------

--
-- Table structure for table `marital_status`
--

CREATE TABLE `marital_status` (
  `marital_status_id` int(1) NOT NULL,
  `marital_status_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marital_status`
--

INSERT INTO `marital_status` (`marital_status_id`, `marital_status_type`) VALUES
(1, 'Single'),
(2, 'Married'),
(3, 'Divorced');

-- --------------------------------------------------------

--
-- Table structure for table `option_course`
--

CREATE TABLE `option_course` (
  `option_course_id` int(10) NOT NULL,
  `program_id` varchar(15) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `course_yos` int(1) NOT NULL,
  `course_sos` int(1) NOT NULL,
  `teacher_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `option_course`
--

INSERT INTO `option_course` (`option_course_id`, `program_id`, `course_id`, `course_yos`, `course_sos`, `teacher_id`) VALUES
(1, 'ITS', 'ICT203', 2, 1, 3),
(2, 'ITS', 'ICT123', 3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment_category`
--

CREATE TABLE `payment_category` (
  `payment_cat_id` int(2) NOT NULL,
  `payment_cat_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_category`
--

INSERT INTO `payment_category` (`payment_cat_id`, `payment_cat_name`) VALUES
(1, 'FEE'),
(2, 'ACCOMODATION'),
(3, 'BIMA'),
(4, 'MUSO'),
(5, 'TCU'),
(6, 'APPEAL'),
(7, 'SUPPLEMENTARY'),
(8, 'OTHERS');

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `payment_info_id` int(20) NOT NULL,
  `payment_cat_id` int(2) NOT NULL,
  `transaction_id` varchar(25) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount_paid` varchar(8) NOT NULL,
  `payment_brach` varchar(25) NOT NULL,
  `student_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_info`
--

INSERT INTO `payment_info` (`payment_info_id`, `payment_cat_id`, `transaction_id`, `transaction_date`, `amount_paid`, `payment_brach`, `student_id`) VALUES
(7, 6, '112567394', '1970-01-01', '20000', 'Mzumbe', '1302122/T.14'),
(8, 7, '55346748', '1970-01-01', '20000', 'mzumbe', '1302122/T.14'),
(13, 6, '12343354564', '1970-01-01', '20000', 'Mzumbe', '1302122/T.14'),
(14, 7, '120910422129', '1970-01-01', '20000', 'Mzumbe', '1302122/T.14'),
(15, 6, '11221212134561', '1970-01-01', '20000', 'Mzumbe', '1302122/T.14');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `program_id` varchar(15) NOT NULL,
  `program_name` varchar(100) NOT NULL,
  `program_duration` int(2) NOT NULL,
  `department_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`program_id`, `program_name`, `program_duration`, `department_id`) VALUES
('ICTM', 'Bachelor of Science in Information Communication and Technology with Management', 3, 'CSS'),
('ITS', 'Bachelor of Science in Information Technology and Systems', 3, 'CSS');

-- --------------------------------------------------------

--
-- Table structure for table `purpose`
--

CREATE TABLE `purpose` (
  `purpose_id` int(10) NOT NULL,
  `purspose_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purpose`
--

INSERT INTO `purpose` (`purpose_id`, `purspose_name`) VALUES
(1, 'Appeal date informed');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `sponsor_id` int(1) NOT NULL,
  `sponsor_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`sponsor_id`, `sponsor_type`) VALUES
(1, 'Private'),
(2, 'Heslb');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` varchar(20) NOT NULL,
  `student_fname` varchar(25) NOT NULL,
  `student_mname` varchar(25) DEFAULT NULL,
  `student_lname` varchar(25) NOT NULL,
  `student_dob` date NOT NULL,
  `student_enrollment_year` year(4) NOT NULL,
  `program_id` varchar(15) NOT NULL,
  `gender_id` int(1) NOT NULL,
  `marital_status_id` int(1) NOT NULL,
  `sponsor_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_fname`, `student_mname`, `student_lname`, `student_dob`, `student_enrollment_year`, `program_id`, `gender_id`, `marital_status_id`, `sponsor_id`) VALUES
('1302090/T.14', 'Lunodzo', 'Justine', 'Mwinuka', '1994-03-15', 2014, 'ITS', 1, 1, 1),
('13021211/T.14', 'Ester', NULL, 'Bulaya', '1992-02-02', 2014, 'ICTM', 2, 2, 1),
('1302122/T.14', 'Lawrance', NULL, 'Massanja', '1993-07-25', 2014, 'ITS', 1, 1, 2),
('1302159/T.14', 'Christopher', 'Peter', 'Msubi', '1994-07-21', 2014, 'ITS', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_score`
--

CREATE TABLE `student_score` (
  `student_score_id` int(10) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `student_yos` varchar(10) NOT NULL,
  `student_sos` varchar(11) NOT NULL,
  `student_cw` varchar(5) NOT NULL,
  `student_ue` varchar(5) NOT NULL,
  `student_final` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_score`
--

INSERT INTO `student_score` (`student_score_id`, `student_id`, `course_id`, `student_yos`, `student_sos`, `student_cw`, `student_ue`, `student_final`) VALUES
(1, '1302159/T.14', 'ICT111', '1', '1', '45', '55', '50'),
(2, '1302159/T.14', 'ICT112', '1', '1', '60', '50', '55'),
(3, '1302159/T.14', 'ICT114', '1', '1', '40', '35', '37.5'),
(4, '1302159/T.14', 'ICT119', '1', '1', '45', '45', '45'),
(5, '1302159/T.14', 'DST100', '1', '1', '78', '75', '76.5'),
(6, '1302159/T.14', 'ICT121', '1', '2', '60', '70', '65'),
(7, '1302159/T.14', 'ICT122', '1', '2', '65', '65', '65'),
(8, '1302159/T.14', 'ICT123', '1', '2', '50', '50', '50'),
(9, '1302159/T.14', 'ICT124', '1', '2', '48', '30', '39'),
(10, '1302159/T.14', 'ICT125', '1', '2', '79', '85', '82'),
(11, '1302122/T.14', 'DST100', '1', '1', '48', '52', '50'),
(12, '1302122/T.14', 'ICT111', '1', '1', '63.58', '57.50', '60.54'),
(13, '1302122/T.14', 'ICT114', '1', '1', '68', '42', '55'),
(14, '1302122/T.14', 'ICT112', '1', '1', '82', '52.50', '67.25'),
(15, '1302122/T.14', 'ICT119', '1', '1', '45', '40', '42.50'),
(16, '1302122/T.14', 'ICT121', '1', '2', '72.40', '48.50', '60.45'),
(17, '1302122/T.14', 'ICT124', '1', '2', '60', '66', '63'),
(18, '1302122/T.14', 'ICT122', '1', '2', '62', '60', '61'),
(19, '1302122/T.14', 'ICT123', '1', '2', '54', '56', '55'),
(20, '1302122/T.14', 'ICT125', '1', '2', '40', '40', '40'),
(21, '1302122/T.14', 'ICT211', '2', '1', '57', '58', '57.5'),
(22, '1302122/T.14', 'ICT216', '2', '1', '57', '62', '59.5'),
(23, '1302122/T.14', 'ICT213', '2', '1', '72.60', '52', '62.30'),
(24, '1302122/T.14', 'ICT215', '2', '1', '56', '56', '56'),
(25, '1302122/T.14', 'ICT212', '2', '1', '82.10', '68', '75.05'),
(26, '1302122/T.14', 'ICT221', '2', '2', '54', '72', '63'),
(27, '1302122/T.14', 'ICT222', '2', '2', '52.40', '58', '55.20'),
(28, '1302122/T.14', 'ICT223', '2', '2', '54.20', '40', '47.10'),
(29, '1302122/T.14', 'ICT200', '2', '2', '61.80', '74', '67.90'),
(30, '1302122/T.14', 'COM101', '2', '2', '69.5', '45', '57.25'),
(31, '1302122/T.14', 'ICT201', '3', '1', '66', '49', '57.5'),
(32, '1302122/T.14', 'ICT303', '3', '1', '68.0', '48', '58'),
(33, '1302122/T.14', 'ICT313', '3', '1', '70', '58', '64'),
(34, '1302122/T.14', 'ICT311', '3', '1', '43', '33', '38'),
(35, '1302122/T.14', 'ICT312', '3', '1', '75.40', '40', '57.70');

-- --------------------------------------------------------

--
-- Table structure for table `supplementary_info`
--

CREATE TABLE `supplementary_info` (
  `supplementary_id` int(10) NOT NULL,
  `supplementary_subject` varchar(100) NOT NULL,
  `supplementary_apply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_info_id` int(10) NOT NULL,
  `bursar_comment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplementary_info`
--

INSERT INTO `supplementary_info` (`supplementary_id`, `supplementary_subject`, `supplementary_apply_date`, `payment_info_id`, `bursar_comment`) VALUES
(2, 'ict311', '2017-06-11 23:21:13', 7, ''),
(3, 'ICT300', '2017-06-11 23:21:13', 7, '');

-- --------------------------------------------------------

--
-- Table structure for table `system_control`
--

CREATE TABLE `system_control` (
  `system_control_id` int(10) NOT NULL,
  `system_date_control` date NOT NULL,
  `purpose_id` int(10) NOT NULL,
  `admin_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_control`
--

INSERT INTO `system_control` (`system_control_id`, `system_date_control`, `purpose_id`, `admin_id`) VALUES
(1, '2017-05-31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(10) NOT NULL,
  `teacher_fname` varchar(25) NOT NULL,
  `teacher_mname` varchar(25) DEFAULT NULL,
  `teacher_lname` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `teacher_role` int(2) NOT NULL,
  `department_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `teacher_fname`, `teacher_mname`, `teacher_lname`, `username`, `teacher_role`, `department_id`) VALUES
(1, 'Frank', 'G', 'Kilima', 'fkilima', 4, 'CSS'),
(2, 'Mercy', NULL, 'Komba', 'mkomba', 3, 'CSS'),
(3, 'Titus', NULL, 'Tossy', 'ttossy', 4, 'CSS');

-- --------------------------------------------------------

--
-- Table structure for table `transcript`
--

CREATE TABLE `transcript` (
  `id` int(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `request_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcript`
--

INSERT INTO `transcript` (`id`, `student_id`, `request_date`) VALUES
(1, '1302122/T.14', '2017-06-11'),
(3, '1302159/T.14', '2017-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '25d55ad283aa400af464c76d713c07ad',
  `level` int(2) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, '1302122/T.14', '81dc9bdb52d04dc20036dbd8313ed055', 2),
(5, '1302090/T.14', 'cd73502828457d15655bbd7a63fb0bc8', 2),
(6, 'bursar', '8d98684e08ba01b902f8adddc6b45050', 5),
(7, '1302159/T.14', '25d55ad283aa400af464c76d713c07ad', 2),
(8, '13021211/T.14', '25d55ad283aa400af464c76d713c07ad', 2),
(9, 'mkomba', '25d55ad283aa400af464c76d713c07ad', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appeal_info`
--
ALTER TABLE `appeal_info`
  ADD PRIMARY KEY (`appeal_id`),
  ADD KEY `payment_info_id` (`payment_info_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `core_course`
--
ALTER TABLE `core_course`
  ADD PRIMARY KEY (`core_course_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `marital_status`
--
ALTER TABLE `marital_status`
  ADD PRIMARY KEY (`marital_status_id`);

--
-- Indexes for table `option_course`
--
ALTER TABLE `option_course`
  ADD PRIMARY KEY (`option_course_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `payment_category`
--
ALTER TABLE `payment_category`
  ADD PRIMARY KEY (`payment_cat_id`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`payment_info_id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `student_score_id` (`student_id`),
  ADD KEY `payment_cat_id` (`payment_cat_id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`program_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `purpose`
--
ALTER TABLE `purpose`
  ADD PRIMARY KEY (`purpose_id`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`sponsor_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `marital_status_id` (`marital_status_id`),
  ADD KEY `sponsor_id` (`sponsor_id`);

--
-- Indexes for table `student_score`
--
ALTER TABLE `student_score`
  ADD PRIMARY KEY (`student_score_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `supplementary_info`
--
ALTER TABLE `supplementary_info`
  ADD PRIMARY KEY (`supplementary_id`),
  ADD KEY `payment_info_id` (`payment_info_id`);

--
-- Indexes for table `system_control`
--
ALTER TABLE `system_control`
  ADD PRIMARY KEY (`system_control_id`),
  ADD KEY `purpose_id` (`purpose_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `teacher_role` (`teacher_role`);

--
-- Indexes for table `transcript`
--
ALTER TABLE `transcript`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `level` (`level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appeal_info`
--
ALTER TABLE `appeal_info`
  MODIFY `appeal_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `core_course`
--
ALTER TABLE `core_course`
  MODIFY `core_course_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `marital_status`
--
ALTER TABLE `marital_status`
  MODIFY `marital_status_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `option_course`
--
ALTER TABLE `option_course`
  MODIFY `option_course_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `payment_category`
--
ALTER TABLE `payment_category`
  MODIFY `payment_cat_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `payment_info`
--
ALTER TABLE `payment_info`
  MODIFY `payment_info_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `purpose`
--
ALTER TABLE `purpose`
  MODIFY `purpose_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `sponsor_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student_score`
--
ALTER TABLE `student_score`
  MODIFY `student_score_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `supplementary_info`
--
ALTER TABLE `supplementary_info`
  MODIFY `supplementary_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `system_control`
--
ALTER TABLE `system_control`
  MODIFY `system_control_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transcript`
--
ALTER TABLE `transcript`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appeal_info`
--
ALTER TABLE `appeal_info`
  ADD CONSTRAINT `appeal_info_ibfk_1` FOREIGN KEY (`payment_info_id`) REFERENCES `payment_info` (`payment_info_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_course`
--
ALTER TABLE `core_course`
  ADD CONSTRAINT `core_course_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `core_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `core_course_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `option_course`
--
ALTER TABLE `option_course`
  ADD CONSTRAINT `option_course_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `option_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `option_course_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD CONSTRAINT `payment_info_ibfk_3` FOREIGN KEY (`payment_cat_id`) REFERENCES `payment_category` (`payment_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_info_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_status` (`marital_status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`sponsor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_score`
--
ALTER TABLE `student_score`
  ADD CONSTRAINT `student_score_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_score_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplementary_info`
--
ALTER TABLE `supplementary_info`
  ADD CONSTRAINT `supplementary_info_ibfk_1` FOREIGN KEY (`payment_info_id`) REFERENCES `payment_info` (`payment_info_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `system_control`
--
ALTER TABLE `system_control`
  ADD CONSTRAINT `system_control_ibfk_1` FOREIGN KEY (`purpose_id`) REFERENCES `purpose` (`purpose_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `system_control_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`teacher_role`) REFERENCES `level` (`level_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `level` (`level_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
