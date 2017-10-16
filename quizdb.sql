-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2017 at 08:21 AM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `angular_questionset`
--

CREATE TABLE `angular_questionset` (
  `id` int(11) NOT NULL,
  `question` varchar(150) NOT NULL,
  `option1` varchar(150) NOT NULL,
  `option2` varchar(150) NOT NULL,
  `option3` varchar(150) NOT NULL,
  `option4` varchar(150) NOT NULL,
  `answer` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `angular_questionset`
--

INSERT INTO `angular_questionset` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`) VALUES
(1, 'Which of the following is true about ng-init directive?', 'ng-init directive initializes an AngularJS Application data.', 'ng-init directive is used to put values to the variables to be used in the application.', 'Both of the above.', 'None of the above.', 2),
(2, 'Which of the following directive is used to initialize an angular app?', 'ng-model', 'ng-app', 'ng-controller', 'None of the above', 1),
(3, 'AngularJS expressions are written using.', 'double braces like {{ expression}}', 'single braces like {expression}', 'small bracket like (expression)', 'capital bracket like [expression]', 0),
(4, 'Angular initializes based upon which of the following scenario?', 'DOMContentLoaded event happens', 'document.readyState is set to complete', 'Both of the above', 'None of the above', 2),
(5, 'Directives can be applied to which all element type?', 'Element', 'Attribute', 'Comment', 'All of the above', 3),
(6, 'angular.module is primarily used to create application module.', 'True', 'False', '', '', 0),
(7, 'Which angular module is loaded by default?', 'ng', 'ng-app', 'ng-controller', 'ng-init', 0),
(8, 'Which angular function is used to wrap a raw DOM element or HTML string as a jQuery element?', 'angular.bootstrap', 'angular.element', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bootstrap_questionset`
--

CREATE TABLE `bootstrap_questionset` (
  `id` int(11) NOT NULL,
  `question` varchar(150) NOT NULL,
  `option1` varchar(150) NOT NULL,
  `option2` varchar(150) NOT NULL,
  `option3` varchar(150) NOT NULL,
  `option4` varchar(150) NOT NULL,
  `answer` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `knockout_questionset`
--

CREATE TABLE `knockout_questionset` (
  `id` int(11) NOT NULL,
  `question` varchar(150) NOT NULL,
  `option1` varchar(150) NOT NULL,
  `option2` varchar(150) NOT NULL,
  `option3` varchar(150) NOT NULL,
  `option4` varchar(150) NOT NULL,
  `answer` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `knockout_questionset`
--

INSERT INTO `knockout_questionset` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`) VALUES
(1, 'How we can add reference of KO in project?', 'using local reference', 'using CDN', 'using Nuget package', 'all of the above', 3),
(2, 'KO performs following operations?', 'Automatic Refresh', 'Two way Binding', 'Templating', 'All of the above', 3),
(3, 'Value of computed observable is determined at: ', 'Time of creation', 'Time of DOM loading', 'Time of update', 'Depends on implementation', 0),
(4, 'On which event bindings in KO fire notification', 'On Any event', 'Update event', 'Change event', 'None of the above', 2),
(5, 'ko.toJSON is used for following purpose', 'to convert string to object', 'to consume JSON service', 'convert objects that include observables to a JSON string', 'to consume any service', 2),
(6, 'On which value of ViewModel property visible binding will be set to block?', 'Null', 'Undefined', 'Zero', 'All of the above', 3),
(7, 'Click binding can be bind to what kind of property in ViewModel', 'Function', 'Boolean', 'Array', 'All of the above', 0),
(8, 'ViewModel can be created as', 'Function', 'Object literal', 'Both', 'None of the above', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nodejs_questionset`
--

CREATE TABLE `nodejs_questionset` (
  `id` int(11) NOT NULL,
  `question` varchar(150) NOT NULL,
  `option1` varchar(150) NOT NULL,
  `option2` varchar(150) NOT NULL,
  `option3` varchar(150) NOT NULL,
  `option4` varchar(150) NOT NULL,
  `answer` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quizregister`
--

CREATE TABLE `quizregister` (
  `user_id` varchar(10) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_mobile` bigint(13) NOT NULL,
  `user_pwd` varchar(100) NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quizregister`
--

INSERT INTO `quizregister` (`user_id`, `user_name`, `user_email`, `user_mobile`, `user_pwd`, `register_time`) VALUES
('1', 'Ankan M', 'ankan@oracle.com', 9916096639, 'password', '2017-07-04 07:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_category`
--

CREATE TABLE `quiz_category` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(20) NOT NULL,
  `course_img` varchar(1000) NOT NULL,
  `question_category` varchar(20) NOT NULL,
  `course_description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_category`
--

INSERT INTO `quiz_category` (`course_id`, `course_name`, `course_img`, `question_category`, `course_description`) VALUES
(1, 'AngularJS', 'https://i.ytimg.com/vi/Inkz9JmL__k/maxresdefault.jpg', 'angularjs', 'It is never a good practice to judge someone just by questions like these, but these can give you an overview of the person\'s experience in Angular.js.'),
(2, 'NodeJS', 'http://asphostportal.com/img/icon-nodejs.png', 'nodejs', 'There are two sides of the table: you either want to hire Node.js developers or you want to get hired as a Node.js developer. This list helps you navigate a bit in this space, giving you some questions to ask, and a list of questions you should know the answer to.'),
(3, 'KnockoutJS', 'https://udemy-images.udemy.com/course/750x422/70562_3496_3.jpg', 'knockoutjs', 'It\'s Been A while And I Still Have A Couple Outstanding Questions. I Hope By Adding A Bounty Maybe These Questions Will Get Answered.'),
(4, 'Bootstrap', 'https://control.divio.com/media/tmp/addons/225/small_promo_image_1.png.440x280_q99_crop_upscale.png', 'bootstrap', 'Dear readers, these BOOTSTRAP Interview Questions have been designed specially to get you acquainted with the nature of questions you may encounter during your interview for the subject of BOOTSTRAP Language.'),
(5, 'JavaScript', 'https://i2.wp.com/opensourceforu.com/wp-content/uploads/2016/10/JavaScript.jpg?resize=750%2C492', 'javascript', 'JavaScript (\"JS\" for short) is a full-fledged dynamic programming language that, when applied to an HTML document, can provide dynamic interactivity on websites. It was invented by Brendan Eich, co-founder of the Mozilla project, the Mozilla Foundation, and the Mozilla Corporation.');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_result`
--

CREATE TABLE `quiz_result` (
  `id` int(11) NOT NULL,
  `UID` varchar(15) NOT NULL,
  `angularjs` float NOT NULL,
  `nodejs` float NOT NULL,
  `knockoutjs` float NOT NULL,
  `bootstrap` float NOT NULL,
  `submission_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_result`
--

INSERT INTO `quiz_result` (`id`, `UID`, `angularjs`, `nodejs`, `knockoutjs`, `bootstrap`, `submission_time`) VALUES
(1, 'QUIZ0004', 80, 0, 0, 95, '2017-08-01 11:17:53'),
(2, 'QUIZ0003', 12.5, 0, 37.5, 0, '2017-08-01 11:17:53'),
(3, 'QUIZ0008', 87.5, 0, 0, 0, '2017-08-01 11:17:53'),
(4, 'QUIZ0001', 0, 72, 0, 0, '2017-08-01 11:17:53'),
(5, 'QUIZ0002', 87.5, 0, 10, 0, '2017-08-04 10:23:03'),
(6, 'QUIZ0009', 0, 0, 62.5, 0, '2017-08-04 10:21:33'),
(7, 'QUIZ00011', 75, 0, 0, 0, '2017-10-05 06:48:38');

-- --------------------------------------------------------

--
-- Table structure for table `register_quiz`
--

CREATE TABLE `register_quiz` (
  `user_id` int(11) NOT NULL,
  `UID` varchar(15) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_mobile` bigint(13) NOT NULL,
  `user_pwd` varchar(1000) NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile_picture` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register_quiz`
--

INSERT INTO `register_quiz` (`user_id`, `UID`, `user_name`, `user_email`, `user_mobile`, `user_pwd`, `register_time`, `profile_picture`) VALUES
(1, 'QUIZ0001', 'Ankan Mukherjee', 'ankan@a.com', 9916096639, 'sha1$9e319bb1$1$0ac09ef1917dfc0e2e99829447bbe90275f8e305', '2017-07-21 11:09:38', 'http://localhost:8100/assets/images/profilepics/ankan.jpg'),
(2, 'QUIZ0002', 'Ankan Mukhopadhyay', 'ankan@oracle.com', 9916096639, 'sha1$99002df1$1$8f07267df7584982051ac7ff54f62e6ee00d0b75', '2017-08-03 10:07:36', 'http://localhost:8100/assets/images/profilepics/Profile.png'),
(3, 'QUIZ0003', 'Roop', 'roop@gmail.com', 8867315438, 'sha1$74819b22$1$700b394dc4fe68c3f10d3cb89f45128959e95f2a', '2017-07-21 10:38:42', 'http://localhost:8100/assets/images/profilepics/new.jpg'),
(4, 'QUIZ0004', 'Jagdeesh', 'jagdeeshj@gmail.com', 9322245157, 'sha1$634207f1$1$e13271309f27f757656e9b4ca31d14603eab7289', '2017-08-01 10:17:29', 'http://localhost:8100/assets/images/profilepics/default.png'),
(5, 'QUIZ0005', 'Arifa Begum', 'arifa@gmail.com', 9620256612, 'sha1$bfddb588$1$0070dc9b7796ba49e9a6e47a1063c465692edbc2', '2017-07-21 11:07:41', 'http://localhost:8100/assets/images/profilepics/arifa.jpg'),
(7, 'QUIZ0006', 'Debashsish Chakraborty', 'deb@gmail.com', 9739789657, 'sha1$1cfa2d7e$1$7c560ce727cbee2431c216732cfb72f8e95dd750', '2017-08-01 09:45:41', ''),
(8, 'QUIZ0008', 'Pritam Mitra', 'pritam@oracle.com', 7878787878, 'sha1$e0ffb2d1$1$141943d714d812191b85469daf68e97e3253de73', '2017-08-01 09:47:00', 'http://localhost:8100/assets/images/profilepics/default.png'),
(9, 'QUIZ0009', 'conrad', 'con@gmail.com', 9999999999, 'sha1$e163119b$1$5abd79e8c01e646d81e1f3a96d2314a0eed67412', '2017-08-04 10:22:33', 'http://localhost:8100/assets/images/profilepics/lookup_value.PNG'),
(10, 'QUIZ00010', 'Ankan', 'ankan@ankan.com', 8978787887, 'sha1$24fd3493$1$e6eefbf81ea426220f55e4ec926bcbf11c95dc4c', '2017-08-14 09:55:37', 'http://localhost:8100/assets/images/profilepics/default.png'),
(11, 'QUIZ00011', 'Ankan', 'ankan.mukhopadhyay90@gmail.com', 9916096639, 'sha1$816e84c8$1$47c46b886f232ab706b5d1ceee26d708c57b5b74', '2017-10-16 05:56:46', 'http://localhost:8100/assets/images/profilepics/DSLogin.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angular_questionset`
--
ALTER TABLE `angular_questionset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bootstrap_questionset`
--
ALTER TABLE `bootstrap_questionset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knockout_questionset`
--
ALTER TABLE `knockout_questionset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nodejs_questionset`
--
ALTER TABLE `nodejs_questionset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizregister`
--
ALTER TABLE `quizregister`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `quiz_category`
--
ALTER TABLE `quiz_category`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `quiz_result`
--
ALTER TABLE `quiz_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register_quiz`
--
ALTER TABLE `register_quiz`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `angular_questionset`
--
ALTER TABLE `angular_questionset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `bootstrap_questionset`
--
ALTER TABLE `bootstrap_questionset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `knockout_questionset`
--
ALTER TABLE `knockout_questionset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `nodejs_questionset`
--
ALTER TABLE `nodejs_questionset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quiz_category`
--
ALTER TABLE `quiz_category`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `quiz_result`
--
ALTER TABLE `quiz_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `register_quiz`
--
ALTER TABLE `register_quiz`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
