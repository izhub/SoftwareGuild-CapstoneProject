-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 30, 2015 at 08:40 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

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
(39, 22, 'blog', 'Uncategorized post', '<p>no&nbsp;category</p>', '2015-06-28 17:08:31', 'publish'),
(40, 22, 'blog', 'Uncategorized post', '<p>no&nbsp;category</p>', '2015-06-28 17:09:09', 'publish'),
(41, 22, 'blog', 'Test-Monday', '<p>Test blog post</p>', '2015-06-29 10:42:03', 'draft'),
(43, 22, 'page', 'Test A Page - Monday', '<p>test</p>', '2015-06-29 10:45:02', 'publish'),
(44, 22, 'page', '123', '<p>test</p>', '2015-06-29 10:48:40', 'publish'),
(45, 22, 'page', '123', '<p>test</p>', '2015-06-29 10:48:56', 'publish'),
(46, 22, 'page', '43221', '<p>Test</p>', '2015-06-29 10:52:20', 'publish'),
(47, 22, 'page', 'qwerty', '', '2015-06-29 10:56:19', 'publish'),
(48, 22, 'blog', 'Post by marketing', '<p>post by marketing</p>', '2015-06-30 11:52:27', 'publish'),
(49, 23, 'page', 'Another page by marketing', '<p>Another page by marketing</p>', '2015-06-30 11:55:58', 'publish'),
(50, 23, 'blog', 'This post by marketing should work', '<p>Hello</p>', '2015-06-30 11:58:26', 'publish'),
(51, 22, 'blog', 'Super Mario', '<h4 style="box-sizing: inherit; margin: 0px 0px 1rem; padding: 0px; font-family: ProximaNovaCond, sans-serif; line-height: 1.3; text-rendering: optimizeLegibility; font-size: 1.3125rem;" data-textannotation-id="f3b2127bd9c7b5d189996a7d60249444">It Serves As A Flagship Of The Nintendo Philosophy&nbsp;</h4>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="8883ea4d7773401abe694ac0dcbf62c5">Part of what makes&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Super Mario Maker</em>&nbsp;such a unique title is due to its original conception. While the idea of making a&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Mario Paint</em>&nbsp;game died in the drawing board the quirky nature of the SNES title managed to find its way into the creation tool.&nbsp;</p>\n<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="2fc7ca1bf9dfc04fb7f23f2523607e65"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--VY2tFErf--/c_fit,fl_progressive,q_80,w_636/1320230149989437103.jpg" alt="Super Mario Maker Is A Love Letter To A Nintendo Legacy" width="636" height="457" data-chomp-id="1320230149989437103" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--VY2tFErf--/c_fit,fl_progressive,q_80,w_636/1320230149989437103.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1320230149989437103.jpg" /></span></span></p>', '2015-06-30 14:33:20', 'publish'),
(52, 23, 'page', 'Lurking', '<div class="row" style="box-sizing: inherit; margin: 0px -1.125rem; padding: 0px; max-width: none; width: auto;">\n<div class="post-bottom column" style="box-sizing: inherit; margin: 1rem 0px; padding: 0px 1.125rem; width: 672px; float: left; position: relative; color: #777777;"><a style="box-sizing: inherit; color: #777777; line-height: 24px; text-decoration: none; font-family: Georgia, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;" name="replies"></a></div>\n</div>\n<div class="post-content entry-content  new-annotation" style="box-sizing: inherit; margin: 0px; padding: 0px; position: relative;">\n<p class="has-media media-470 has-image" style="box-sizing: inherit; margin: 0px 1.125rem 0px 0px; padding: 5px 1.125rem 0px 0px; font-family: inherit; font-size: 0.9375rem; font-weight: normal; line-height: 1.6; text-rendering: auto; word-break: break-word; width: 318px; clear: both; float: left;" data-textannotation-id="a5855aafb18f306a6d6f6c59454140ba"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both; max-width: 300px;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--MA4hwHgK--/c_fit,fl_progressive,q_80,w_320/1317287904244702279.jpg" alt="QUESTION OF THE WEEKEND" width="320" height="243" data-chomp-id="1317287904244702279" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--MA4hwHgK--/c_fit,fl_progressive,q_80,w_320/1317287904244702279.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317287904244702279.jpg" /></span></span></p>\n<h3 class="first-text" style="box-sizing: inherit; margin: 0px 0px 1rem; padding: 0px; color: #000000; font-family: ProximaNovaCond, sans-serif; font-style: normal; font-weight: bold; line-height: 1.3; text-rendering: optimizeLegibility; font-size: 1.5625rem; white-space: pre-wrap;" data-textannotation-id="5a294a37434ebbe99d9f5baf9bb3c537">What&rsquo;s your history as a lurker? What kept you from participating or compelled you to finally join in? <em style="box-sizing: inherit; font-style: italic; line-height: inherit;">ARE YOU LURKING RIGHT NOW?</em></h3>\n</div>', '2015-06-30 16:01:48', 'pending'),
(54, 1, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:08:25', 'pending'),
(55, 1, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:08:25', 'pending'),
(56, 1, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:08:25', 'pending'),
(57, 1, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:10:21', 'pending'),
(58, 23, 'page', 'Sonic Runners', '<p class="has-media media-640 has-image" style="box-sizing: inherit; margin: 0px; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; width: 636px; clear: both; color: #222222;" data-textannotation-id="0ec80f2352c09f63bf99f1a45f09fe3d"><span class="lightBoxWrapper" style="box-sizing: inherit; position: relative; display: block; clear: both;"><span class="img-border" style="box-sizing: inherit; position: relative; display: block; clear: both; margin-bottom: 1.5rem; overflow: hidden; max-width: 640px; margin-left: auto; margin-right: auto;"><img class="js_annotatable-image cursor-crosshair" style="box-sizing: inherit; max-width: 100%; height: auto; display: block; vertical-align: middle; cursor: crosshair !important; border: 0px; margin-bottom: 0px;" src="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" alt="Sonic Runners: The TAY Review" width="636" height="358" data-chomp-id="1317530848062375089" data-asset-url="http://i.kinja-img.com/gawker-media/image/upload/s--t1eKDtE0--/1317530848062375089.jpg" data-format="jpg" data-original-src="https://i.kinja-img.com/gawker-media/image/upload/1317530848062375089.jpg" /></span></span></p>\n<p class="first-text" style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="041e94ffffe6d6c64001933930ecf632"><em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;is pretty fun mobile game...provided you can withstand the constant bombardment of advertisements, patch notes and offers.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="2ba18a86c6d0ff958981b803ddd0f73d">In&nbsp;<em style="box-sizing: inherit; line-height: inherit;">Sonic Runners</em>&nbsp;you, yep you guessed it, run. It&rsquo;s a 2D endless where the only control you have over your character is tapping the screen to jump, which you need to do in order to avoid the constant barrage of obstacles that Dr. Eggman sends your way. As you play you unlock &ldquo;companions&rdquo; which accompany you on your journey and provide you with bonuses such as a score multiplier or having access to a certain power up. After a certain point you will encounter Dr. Eggman who is trying to get away in his Eggmobile. You have a certain amount of time to cause as much damage as possible so he&rsquo;ll drop a whole swath of sweet, sweet gold rings. Also along the way you can collect crystals which increase your score, provided you can keep the combo going.</p>\n<p style="box-sizing: inherit; margin: 0px 0px 1.25rem; padding: 0px; font-family: Georgia, serif; font-size: 0.9375rem; line-height: 24px; text-rendering: auto; word-break: break-word; color: #222222;" data-textannotation-id="9e93e513b5ad6dc1ba44a687a99a09a8">You&rsquo;d think with such a simple game it&rsquo;d be hard to mess up, right? Well this is a mobile game after all...</p>', '2015-06-30 16:15:04', 'publish');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_name`, `term_type`) VALUES
(48, 'Another Category', 'category'),
(61, 'games', 'category'),
(59, 'hello', 'category'),
(60, 'marketing', 'tag'),
(58, 'published posts', 'tag'),
(68, 'running', 'category'),
(69, 'sonic', 'tag'),
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
(56, 34),
(49, 36),
(55, 36),
(58, 36),
(57, 37),
(55, 41),
(56, 41),
(55, 47),
(55, 48),
(60, 48),
(55, 49),
(55, 50),
(60, 50),
(55, 51),
(55, 52),
(55, 54),
(61, 55),
(55, 56),
(55, 57),
(61, 58),
(68, 58),
(69, 58);

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
