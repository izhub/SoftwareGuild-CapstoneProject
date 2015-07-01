-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2015 at 05:56 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment_author_name`, `comment_author_email`, `comment_author_website`, `comment_content`, `comment_date`, `comment_status`) VALUES
(7, 30, 0, 'abc', 'a@abc.com', 'www.abe.com', 'Test', '2015-06-27 15:01:54', 'approved'),
(8, 30, 0, 'abc', 'a@abc.com', 'www.abe.com', 'Test', '2015-06-27 15:02:13', 'approved'),
(9, 37, 0, 'Anonymous', 'no@one.com', 'www.noone.com', 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean', '2015-06-29 11:18:11', 'approved'),
(10, 37, 0, 'Anonymous', 'no@one.com', 'www.noone.com', 'One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.', '2015-06-29 11:26:55', 'approved'),
(11, 61, 0, 'Troy', 'troy@troy.com', 'troy.com', 'Hi All', '2015-07-01 14:28:08', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(100) NOT NULL,
  `option_value` varchar(100) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `option_value`) VALUES
(12, 'blogTitle', 'The best blog ever');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_user_id`, `post_type`, `post_title`, `post_content`, `post_date`, `post_status`) VALUES
(30, 23, 'blog', 'My First Post', '<p>first post</p>', '2015-06-27 13:00:39', 'publish'),
(31, 22, 'blog', 'My Second Post abc', '<p><strong style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Lorem Ipsum</strong><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', '2015-06-27 13:30:35', 'draft'),
(33, 22, 'blog', 'My Fourth Post', '<p><span style="font-family: Arial, Helvetica, sans; line-height: 14px; text-align: justify;">Duis scelerisque vestibulum nulla et venenatis. Aenean enim justo, viverra in lobortis vitae, aliquam ac nunc. Morbi a nisi vel enim pretium bibendum. Nullam varius interdum nulla ut tincidunt. Cras quis tortor lacus. Suspendisse eros lacus, convallis sed massa nec, vestibulum elementum risus. Quisque nisi quam, porttitor eu convallis quis, condimentum id metus. Nulla dignissim ullamcorper accumsan. Etiam id imperdiet quam. Curabitur egestas faucibus nunc.</span></p>', '2015-06-27 13:38:35', 'draft'),
(34, 22, 'page', 'Another Page', '<p style="text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;">Cras egestas bibendum augue. Aliquam pharetra tincidunt semper. Curabitur mi libero, iaculis consectetur ligula sed, facilisis consequat magna. Aenean vulputate nulla vel nisi maximus, quis dictum sapien pulvinar. Mauris ac tempor dolor. Nam eget dapibus est. Sed vitae magna ipsum. Duis iaculis, purus vitae tincidunt dictum, ligula tellus porttitor leo, et laoreet ligula dui eu turpis.</p>\n<p>&nbsp;</p>', '2015-06-27 15:21:07', 'publish'),
(35, 22, 'blog', 'Draft Post', '<p>This is a draft post</p>', '2015-06-28 16:56:07', 'draft'),
(36, 22, 'blog', 'Published post', '<p>This is a published post</p>', '2015-06-28 16:56:32', 'publish'),
(37, 22, 'blog', 'Another published post', '<p>This should be published</p>', '2015-06-28 17:00:36', 'publish'),
(38, 22, 'blog', 'Add Test Post', '<p>Test Post</p>', '2015-06-28 17:03:48', 'publish'),
(40, 22, 'blog', 'Uncategorized post', '<p>no&nbsp;category</p>', '2015-06-28 17:09:09', 'publish'),
(43, 22, 'page', 'Test A Page - Monday', '<p>test</p>', '2015-06-29 10:45:02', 'publish'),
(45, 22, 'page', '123', '<p>test</p>', '2015-06-29 10:48:56', 'publish'),
(46, 22, 'page', '43221', '<p>Test</p>', '2015-06-29 10:52:20', 'publish'),
(47, 22, 'page', 'qwerty', '', '2015-06-29 10:56:19', 'publish'),
(48, 22, 'blog', 'Post by marketing', '<p>post by marketing</p>', '2015-06-30 11:52:27', 'publish'),
(49, 23, 'page', 'Another page by marketing', '<p>Another page by marketing</p>', '2015-06-30 11:55:58', 'pending'),
(50, 23, 'blog', 'This post by marketing should work', '<p>Hello</p>', '2015-06-30 11:58:26', 'publish'),
(52, 23, 'page', 'Lurking', '<div class="row" style="box-sizing: inherit; margin: 0px -1.125rem; padding: 0px; max-width: none; width: auto;">\n<div class="post-bottom column" style="box-sizing: inherit; margin: 1rem 0px; padding: 0px 1.125rem; width: 672px; float: left; position: relative; color: #777777;"><a style="box-sizing: inherit; color: #777777; line-height: 24px; text-decoration: none; font-family: Georgia, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;" name="replies"></a></div>\n</div>\n<div class="post-content entry-content  new-annotation" style="box-sizing: inherit; margin: 0px; padding: 0px; position: relative;">\n<p class="has-media media-470 has-image" style="box-sizing: inherit; margin: 0px 1.125rem 0px 0px; padding: 5px 1.125rem 0px 0px; font-family: inherit; font-size: 0.9375rem; font-weight: normal; line-height: 1.6; text-rendering: auto; word-break: break-word; width: 318px; clear: both; float: left;" data-textannotation-id="a5855aafb18f306a6d6f6c59454140ba"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both; max-width: 300px;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--MA4hwHgK--/c_fit,fl_progressive,q_80,w_320/1317287904244702279.jpg" alt="QUESTION OF THE WEEKEND" width="320" height="243" data-chomp-id="1317287904244702279" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--MA4hwHgK--/c_fit,fl_progressive,q_80,w_320/1317287904244702279.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317287904244702279.jpg" /></span></span></p>\n<h3 class="first-text" style="box-sizing: inherit; margin: 0px 0px 1rem; padding: 0px; color: #000000; font-family: ProximaNovaCond, sans-serif; font-style: normal; font-weight: bold; line-height: 1.3; text-rendering: optimizeLegibility; font-size: 1.5625rem; white-space: pre-wrap;" data-textannotation-id="5a294a37434ebbe99d9f5baf9bb3c537">What&rsquo;s your history as a lurker? What kept you from participating or compelled you to finally join in? <em style="box-sizing: inherit; font-style: italic; line-height: inherit;">ARE YOU LURKING RIGHT NOW?</em></h3>\n</div>', '2015-06-30 16:01:48', 'publish'),
(54, 1, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:08:25', 'pending'),
(55, 1, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:08:25', 'pending'),
(56, 1, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:08:25', 'pending'),
(57, 1, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:10:21', 'pending'),
(59, 22, 'blog', 'Online game ''may control snacking''', '<p class="story-body__introduction" style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; font-weight: bold; line-height: 1.375; margin: 28px 0px 0px; padding: 0px; vertical-align: baseline;">A computer game may help some people control their unhealthy snacking habits, suggests a small study from the University of Exeter.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 23px 0px 0px; padding: 0px; vertical-align: baseline;">The game trained participants'' brains to cut out calories by telling them to avoid pressing on pictures of certain images, such as biscuits and chocolate.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">They lost a small amount of weight and appeared to eat fewer calories for up to six months afterwards.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">The 10-minute game was played four times in one week.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Forty-one adults took part in the study, published in the journal&nbsp;<a class="story-body__link-external" style="border-width: 0px 0px 1px; border-bottom-style: solid; border-bottom-color: #dcdcdc; color: #222222; font-family: inherit; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; font-weight: bold; letter-spacing: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; text-decoration: none; -webkit-tap-highlight-color: rgba(17, 103, 168, 0.298039);" href="http://www.journals.elsevier.com/appetite/">Appetite</a>.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">The majority were overweight, and all said they ate calorie-dense snacks, such as crisps, biscuits, cake and chocolate, at least three times a week.</p>\n<h2 class="story-body__crosshead" style="border: 0px; color: #1e1e1e; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 2rem; font-weight: inherit; line-height: 1.2; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Train the brain</h2>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">The online game, developed by psychologists at the University of Exeter and Cardiff University, used "brain training" techniques to change behaviour - in this case, to resist unhealthy snack foods.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">It required people to avoid pressing a key when an unhealthy food appeared on the screen.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">This type of training helps people associate this unhealthy food with "stopping", the researchers said.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">The results were compared with another group of 41 adults who completed the same training, but involving non-food pictures.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">The results showed that participants lost an average of 1.5lb (0.7kg) and consumed around 220 fewer calories a day during the week of training.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Food diaries in the following six months suggested that the participants maintained their improved habits.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Dr Natalia Lawrence, from the University of Exeter, who led the research, said the game had the ability to change some people''s eating behaviour, but it was still early days.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">"This research is still in its infancy and the effects are modest. Larger, registered trials with longer-term measures need to be conducted.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">"However, our findings suggest that this cognitive training approach is worth pursuing: it is free, easy to do and 88% of our participants said they would be happy to keep doing it."</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">She said this type of training could be used as one element of a weight loss programme or for improving eating behaviour.</p>', '2015-07-01 10:56:05', 'publish'),
(60, 22, 'blog', 'Heroes of the Storm’s new map brings a whole lot of Diablo', '<p style="margin: 0px; padding: 0px 0px 20px; position: relative; line-height: 1.8; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ededed;">The clashing animations for the Immortals are some of the most cinematic and beautiful things added to Heroes of the Storm so far, incomparable to any other animation in the game, but I&rsquo;m not sure how I feel about the stark graphical difference otherwise. I&rsquo;ve become so accustomed to how minions and mercenaries look, that seeing entirely new ones is a little jarring. I imagine I would have been happy with a Diablo themed set of merc camps, similar to previous maps, but maybe that formula would begin to feel tedious a few battlegrounds down the line. The unique looking minions may be Blizzard&rsquo;s attempt at being proactive about this problem, and might mean it aims&nbsp;to vary the map objectives more consistently down the line.</p>\n<p style="margin: 0px; padding: 0px 0px 20px; position: relative; line-height: 1.8; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ededed;">One thing&rsquo;s for sure: The Battlefield of Eternity battleground is undeniably Diablo&mdash;a faction of Blizzard&rsquo;s roster that has so far been disappointingly under-represented. I haven&rsquo;t played on the map enough to really see how the gameplay stacks up against the others, but you&rsquo;ll see that it instantly distinguishes itself graphically. The changes may seem stark now, but they show that Blizzard isn&rsquo;t afraid to bring its other worlds into Heroes of the Storm for more than just characters, and make me interested in what other new maps we might see in the future.</p>\n<figure style="margin: 0px; position: relative; overflow: hidden; padding: 0px 0px 20px; font-family: Roboto, sans-serif; font-size: 16px; line-height: 16px; clear: both; background-color: #ededed;"><img class="" style="border: 0px; width: 633.59375px; max-width: 100%; height: auto;" src="http://4d663a369f9f03c3c61e-870e77779efd63f7bd6c2ee08d8cfae6.r2.cf1.rackcdn.com/images/lAAHuzwRFhMu.878x0.Z-Z96KYq.jpg" alt="The Immortal for Battlefield of Eternity''s Hell side." data-fullimage-src="http://0cb8dd5d2dc142d08f0f-eb3b436d25971e5860b39e72b0600342.r94.cf1.rackcdn.com/images/axgiXYF2TnWr.png" /></figure>', '2015-07-01 13:06:34', 'publish'),
(61, 22, 'blog', 'Austrian court rejects Facebook privacy case', '<p class="story-body__introduction" style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; font-weight: bold; line-height: 1.375; margin: 28px 0px 0px; padding: 0px; vertical-align: baseline;">A privacy campaigner has been dealt a setback in a legal battle with Facebook.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 23px 0px 0px; padding: 0px; vertical-align: baseline;">A court in Vienna has rejected the case brought by Max Schrems saying that it lacked jurisdiction in the matter.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Mr Schrems hoped the court would consider claims that the social network broke EU data protection laws because of the way it collected and forwarded users'' details.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Facebook welcomed the ruling. But Mr Schrems said he intended to fight on.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">"The matter will... be decided in another round at the Higher Regional Court and can be further appealed to the Austrian Supreme Court,"&nbsp;<a class="story-body__link-external" style="border-width: 0px 0px 1px; border-bottom-style: solid; border-bottom-color: #dcdcdc; color: #222222; font-family: inherit; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; font-weight: bold; letter-spacing: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; text-decoration: none; -webkit-tap-highlight-color: rgba(17, 103, 168, 0.298039);" href="http://www.europe-v-facebook.org/sk/PR_LG_en.pdf">the law student said</a>.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Mr Schrems initially tried to bring his "class action" case on behalf of 25,000 Facebook users to a commercial court in Vienna in 2014, but it too said the matter was beyond its remit.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">In the latest case, a court spokeswoman said that Mr Schrems did not have an automatic right to bring the case in his home country of Austria because he was acting more like an organisation than a consumer.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Facebook said it believed the litigation was "unnecessary" and that it was pleased with the latest ruling.</p>\n<figure class="media-landscape full-width has-caption" style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 14px; line-height: 16px; margin: 24px -24.640625px 0px 0px; padding: 0px; vertical-align: baseline; clear: both; background-color: #111111;"><img class="js-image-replace" style="border: 0px; color: #bdbdbd; font-family: inherit; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-weight: inherit; letter-spacing: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; height: auto; max-width: 100%; -webkit-user-select: none; width: 616.203125px; display: block;" src="http://ichef.bbci.co.uk/news/624/cpsprodpb/AD8C/production/_83982444_b895dbe4-a638-42e3-84b1-3b12e4b9df8e.jpg" alt="null" width="624" height="351" /><figcaption class="media-caption" style="border: 0px; color: inherit; font-family: inherit; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-weight: inherit; letter-spacing: inherit; line-height: inherit; margin: 0px; padding: 16px; vertical-align: baseline;"><span class="media-caption__text" style="border: 0px; color: #ececec; font-family: inherit; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 1.3rem; font-weight: inherit; letter-spacing: inherit; line-height: 1.23077; margin: 0px; padding: 0px; vertical-align: baseline; display: block;">Facebook''s office in Dublin is its biggest outside of California</span></figcaption></figure>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">"We remain happy to work with our regulator, the Irish Data Protection Commissioner, to address any questions about our commitment to protecting people''s information," said a spokeswoman.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">Mr Schrems had previously attempted to get the Irish Data Protection Commission to investigate allegations that Facebook - which bases its European headquarters in Dublin - co-operated with US intelligence agencies by handing over data from Europeans.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">However, the regulator declined to pursue the matter - a decision that Mr Schrems subsequently challenged in the Irish High Court.</p>\n<p style="border: 0px; color: #404040; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-stretch: inherit; font-size: 1.6rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;">The issue was then referred to the European Court of Justice, which has yet to issue an opinion.</p>', '2015-07-01 13:12:06', 'publish'),
(62, 22, 'page', 'Microsoft begins testing three new Skype for Business services', '<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">Microsoft is entering the next phase of its multi-part Skype for Business (Lync) rollout, with the launch of&nbsp;<a style="text-decoration: none; cursor: pointer; color: #1174c7;" href="https://blogs.office.com/2015/07/01/announcing-preview-of-new-skype-for-business-services-in-office-365/">three new preview programs for its promised Skype for Business services</a>.</p>\n<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">&nbsp;</p>\n<figure class="image alignRight image-small shortcode-image" style="margin: 5px 0px 0px 30px; float: right; clear: both; width: 220px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;"><span class="img "><img class="" style="border: 0px; width: auto; height: auto; margin: 0px auto 21px; display: block; max-width: 100%; font-size: 0.33333em;" src="http://zdnet2.cbsistatic.com/hub/i/r/2015/07/01/aaa5fcbc-1657-49f8-933b-337a6717c00f/resize/270x270/65abbd193edef570244f1c922c0f194f/skypeforbusinessservices.jpg" alt="skypeforbusinessservices.jpg" width="270" height="270" /></span></figure>\n<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">Technical previews are launching on July 1 for three new services. To participate in the test programs, users must have an Office 365 Enterprise plan or a&nbsp;<a style="text-decoration: none; cursor: pointer; color: #1174c7;" href="https://products.office.com/en-US/skype-for-business/compare-plans">Skype for Business Plan 2</a>.</p>\n<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">&nbsp;</p>\n<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">The three:</p>\n<ul style="margin: 0px 0px 21px; padding: 0px 0px 0px 30px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">\n<li style="list-style: disc;"><strong>Skype Meeting Broadcast</strong>&nbsp;enables users to broadcast of a Skype for Business meeting on the Internet to up to 10,000 people, who can attend in a browser. This service is for large virtual meetings like internal "Town Hall" style meetings and public webinars. This preview is available worldwide.</li>\n<li style="list-style: disc;"><strong>PSTN (Public Switched Telephone Network) Conferencing</strong>&nbsp;allows people invited to a Skype for Business meeting in Office 365 to join the meeting by dialing-in using a landline or mobile phone. This service also allows users to add others to a meeting by dialing-out. This preview is U.S. only at this time.</li>\n<li style="list-style: disc;"><strong>Cloud PBX with PSTN Calling</strong>&nbsp;provides users with the ability to make and receive traditional phone calls in their Skype for Business client, and to manage these calls using hold, resume, forward and transfer. This preview is built on the enterprise voice technology available in Lync Server and Skype for Business Server, and runs on Azure. This preview is U.S. only at this time.</li>\n</ul>\n<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">In the fall, Microsoft plans to make available Cloud PBX for customers worldwide, with a configuration option for customers to use existing on-premises phone lines for inbound and outbound calling. PSTN Conferencing and Skype Meeting Broadcast should be generally available before the end of calendar 2015, a spokesperson said.</p>', '2015-07-01 13:14:46', 'publish'),
(63, 23, 'blog', 'Microsoft''s latest Windows 10 preview for PCs gets Edge browser branding', '<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">With exactly one month to go before it begins rolling out Windows 10 for PCs, Microsoft made available to its Insider testers another preview build of the coming operating system.</p>\n<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">&nbsp;</p>\n<figure class="image alignRight image-small shortcode-image" style="margin: 5px 0px 0px 30px; float: right; clear: both; width: 220px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;"><span class="img "><img class="" style="border: 0px; width: auto; height: auto; margin: 0px auto 21px; display: block; max-width: 100%; font-size: 0.33333em;" src="http://zdnet2.cbsistatic.com/hub/i/r/2015/06/30/ca02b9c9-9bb7-4069-acdd-ec05e3c5f8b1/resize/270x270/615c58ac90eec13db5fa3c8f96f4c415/windows10hero.jpg" alt="windows10hero.jpg" width="270" height="270" /></span></figure>\n<p><a style="text-decoration: none; cursor: pointer; color: #1174c7; font-family: Raleway; font-size: 18px; line-height: 30px;" href="http://blogs.windows.com/bloggingwindows/2015/06/29/announcing-windows-10-insider-preview-build-10158-for-pcs/">Windows 10 Build 10158,</a><span style="color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">&nbsp;which went to Fast Ring testers on June 29, now includes the "Edge" branding for the browser that was formerly known as "Project Spartan." The&nbsp;</span><a style="text-decoration: none; cursor: pointer; color: #1174c7; font-family: Raleway; font-size: 18px; line-height: 30px;" href="http://www.zdnet.com/article/microsoft-releases-windows-10-mobile-test-build-with-edge-browser-branding/">newest official preview build of Windows 10 Mobile for Windows Phones</a><span style="color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">&nbsp;last week also now has the Edge browser branding.</span></p>\n<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">&nbsp;</p>\n<p style="margin: 0px 0px 21px; color: #080e14; font-family: Raleway; font-size: 18px; line-height: 30px;">With the change in branding from Spartan to Edge,&nbsp;<a style="text-decoration: none; cursor: pointer; color: #1174c7;" href="http://www.zdnet.com/article/windows-10-whats-next-for-microsofts-insider-testers/">Microsoft has introduced a new app ID</a>that causes any favorites, cookies, history and Reading list items saved in Spartan to be lost, so testers who want to save these need to back up their favorites, as Microsoft officials warned a week ago.The Edge app in the new Windows 10 test build includes new customizations, a dark theme, password and form-fill options and other tweaks.</p>', '2015-07-01 14:29:51', 'publish');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_name`, `term_type`) VALUES
(48, 'Another Category', 'category'),
(75, 'facebook', 'tag'),
(72, 'game', 'tag'),
(61, 'games', 'category'),
(70, 'games', 'tag'),
(59, 'hello', 'category'),
(73, 'hots', 'tag'),
(60, 'marketing', 'tag'),
(79, 'microsoft', 'category'),
(76, 'microsoft', 'tag'),
(58, 'published posts', 'tag'),
(71, 'snacks', 'tag'),
(56, 'tag', 'tag'),
(49, 'tags', 'tag'),
(74, 'tech', 'category'),
(57, 'test', 'category'),
(55, 'uncategorized', 'category'),
(80, 'windows 10', 'tag');

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
(56, 34),
(49, 36),
(55, 36),
(58, 36),
(57, 37),
(55, 47),
(55, 48),
(60, 48),
(55, 49),
(55, 50),
(60, 50),
(55, 52),
(55, 54),
(61, 55),
(55, 56),
(55, 57),
(55, 59),
(70, 59),
(71, 59),
(61, 60),
(72, 60),
(73, 60),
(74, 61),
(75, 61),
(74, 62),
(76, 62),
(74, 63),
(79, 63),
(80, 63);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_display_name`, `user_password`, `user_role`, `enabled`) VALUES
(22, 'admin', 'admin', 'password', 'ROLE_ADMIN', 1),
(23, 'marketing', 'marketing', 'password', 'ROLE_MARKETING', 1);

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
