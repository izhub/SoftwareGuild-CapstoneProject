-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 30, 2015 at 10:28 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blogsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_author_name` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL,
  `comment_author_website` varchar(200) DEFAULT NULL,
  `comment_content` text NOT NULL,
  `comment_date` datetime NOT NULL,
  `comment_status` varchar(20) NOT NULL DEFAULT 'unapproved',
  PRIMARY KEY (`comment_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment_author_name`, `comment_author_email`, `comment_author_website`, `comment_content`, `comment_date`, `comment_status`) VALUES
(7, 30, 0, 'abc', 'a@abc.com', 'www.abe.com', 'Test', '2015-06-27 15:01:54', 'approved'),
(8, 30, 0, 'abc', 'a@abc.com', 'www.abe.com', 'Test', '2015-06-27 15:02:13', 'approved'),
(9, 37, 0, 'Anonymous', 'no@one.com', 'www.noone.com', 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean', '2015-06-29 11:18:11', 'unapproved'),
(10, 37, 0, 'Anonymous', 'no@one.com', 'www.noone.com', 'One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.', '2015-06-29 11:26:55', 'unapproved');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_user_id` int(11) NOT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_title` varchar(500) NOT NULL,
  `post_content` longtext NOT NULL,
  `post_date` datetime NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'draft',
  PRIMARY KEY (`post_id`),
  KEY `post_user_id` (`post_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_user_id`, `post_type`, `post_title`, `post_content`, `post_date`, `post_status`) VALUES
(30, 3, 'blog', 'My First Post', '<p>first post</p>', '2015-06-27 13:00:39', 'publish'),
(31, 1, 'blog', 'My Second Post abc', '<p><strong style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem Ipsum</strong><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', '2015-06-27 13:30:35', 'draft'),
(33, 1, 'blog', 'My Fourth Post', '<p><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Duis scelerisque vestibulum nulla et venenatis. Aenean enim justo, viverra in lobortis vitae, aliquam ac nunc. Morbi a nisi vel enim pretium bibendum. Nullam varius interdum nulla ut tincidunt. Cras quis tortor lacus. Suspendisse eros lacus, convallis sed massa nec, vestibulum elementum risus. Quisque nisi quam, porttitor eu convallis quis, condimentum id metus. Nulla dignissim ullamcorper accumsan. Etiam id imperdiet quam. Curabitur egestas faucibus nunc.</span></p>', '2015-06-27 13:38:35', 'draft'),
(34, 1, 'page', 'Another Page', '<p style="text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;">Cras egestas bibendum augue. Aliquam pharetra tincidunt semper. Curabitur mi libero, iaculis consectetur ligula sed, facilisis consequat magna. Aenean vulputate nulla vel nisi maximus, quis dictum sapien pulvinar. Mauris ac tempor dolor. Nam eget dapibus est. Sed vitae magna ipsum. Duis iaculis, purus vitae tincidunt dictum, ligula tellus porttitor leo, et laoreet ligula dui eu turpis.</p>\n<p>&nbsp;</p>', '2015-06-27 15:21:07', 'publish'),
(35, 1, 'blog', 'Draft Post', '<p>This is a draft post</p>', '2015-06-28 16:56:07', 'draft'),
(36, 1, 'blog', 'Published post', '<p>This is a published post</p>', '2015-06-28 16:56:32', 'publish'),
(37, 1, 'blog', 'Another published post', '<p>This should be published</p>', '2015-06-28 17:00:36', 'publish'),
(38, 1, 'blog', 'Add Test Post', '<p>Test Post</p>', '2015-06-28 17:03:48', 'publish'),
(39, 1, 'blog', 'Uncategorized post', '<p>no&nbsp;category</p>', '2015-06-28 17:08:31', 'publish'),
(40, 1, 'blog', 'Uncategorized post', '<p>no&nbsp;category</p>', '2015-06-28 17:09:09', 'publish'),
(41, 1, 'blog', 'Test-Monday', '<p>Test blog post</p>', '2015-06-29 10:42:03', 'draft'),
(43, 1, 'page', 'Test A Page - Monday', '<p>test</p>', '2015-06-29 10:45:02', 'publish'),
(44, 1, 'page', '123', '<p>test</p>', '2015-06-29 10:48:40', 'publish'),
(45, 1, 'page', '123', '<p>test</p>', '2015-06-29 10:48:56', 'publish'),
(46, 1, 'page', '43221', '<p>Test</p>', '2015-06-29 10:52:20', 'publish'),
(47, 1, 'page', 'qwerty', '', '2015-06-29 10:56:19', 'publish');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
  `term_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_name` varchar(50) NOT NULL,
  `term_type` varchar(50) NOT NULL,
  PRIMARY KEY (`term_id`),
  KEY `term_name` (`term_name`,`term_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_name`, `term_type`) VALUES
(48, 'Another Category', 'category'),
(59, 'hello', 'category'),
(53, 'Page Category', 'category'),
(58, 'published posts', 'tag'),
(56, 'tag', 'tag'),
(49, 'tags', 'tag'),
(57, 'test', 'category'),
(55, 'uncategorized', 'category');

-- --------------------------------------------------------

--
-- Table structure for table `terms_posts`
--

CREATE TABLE IF NOT EXISTS `terms_posts` (
  `term_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`term_id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms_posts`
--

INSERT INTO `terms_posts` (`term_id`, `post_id`) VALUES
(55, 30),
(49, 31),
(59, 31),
(48, 33),
(49, 33),
(49, 34),
(53, 34),
(56, 34),
(49, 36),
(55, 36),
(58, 36),
(57, 37),
(53, 41),
(55, 41),
(56, 41),
(55, 47);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_display_name` varchar(250) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_role` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `user_display_name` (`user_display_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_display_name`, `user_password`, `user_role`, `enabled`) VALUES
(22, 'admin', 'admin', 'password', 'ROLE_ADMIN', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `terms_posts`
--
ALTER TABLE `terms_posts`
  ADD CONSTRAINT `terms_posts_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`),
  ADD CONSTRAINT `terms_posts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
