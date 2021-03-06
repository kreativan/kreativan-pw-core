# --- WireDatabaseBackup {"time":"2019-08-31 13:00:53","user":"","dbName":"core","description":"","tables":[],"excludeTables":["pages_drafts","pages_roles","permissions","roles","roles_permissions","users","users_roles","user","role","permission"],"excludeCreateTables":[],"excludeExportTables":["field_roles","field_permissions","field_email","field_pass","caches","session_login_throttle","page_path_history"]}

DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(250) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_admin_theme` (`pages_id`, `data`) VALUES('41', '159');

DROP TABLE IF EXISTS `field_bg`;
CREATE TABLE `field_bg` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_body`;
CREATE TABLE `field_body` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_body` (`pages_id`, `data`) VALUES('27', '<h3>The page you were looking for is not found.</h3>\n\n<p>Please use our search engine or navigation above to find the page.</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1', '<h2>What is ProcessWire?</h2>\n\n<p>ProcessWire gives you full control over your fields, templates and markup. It provides a powerful template system that works the way you do. Not to mention, ProcessWire\'s API makes working with your content easy and enjoyable. <a href=\"http://processwire.com\">Learn more</a></p>\n\n<h3>About this site profile</h3>\n\n<p>This is a basic minimal site for you to use in developing your own site or to learn from. There are a few pages here to serve as examples, but this site profile does not make any attempt to demonstrate all that ProcessWire can do. To learn more or ask questions, visit the <a href=\"http://www.processwire.com/talk/\" target=\"_blank\" rel=\"noreferrer noopener\">ProcessWire forums</a> or <a href=\"http://modules.processwire.com/categories/site-profile/\">browse more site profiles</a>. If you are building a new site, this minimal profile is a good place to start. You may use these existing templates and design as they are, or you may replace them entirely.</p>\n\n<h3>Browse the site</h3>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1080', '<blockquote>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien velit, aliquet eget commodo nec, auctor a sapien. Nam eu neque vulputate diam rhoncus faucibus. Curabitur quis varius libero. Lorem.</p>\n</blockquote>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1019', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien velit, aliquet eget commodo nec, auctor a sapien. Nam eu neque vulputate diam rhoncus faucibus. Curabitur quis varius libero. Lorem.</p>');

DROP TABLE IF EXISTS `field_button`;
CREATE TABLE `field_button` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_button` (`pages_id`, `data`) VALUES('1031', '1032');
INSERT INTO `field_button` (`pages_id`, `data`) VALUES('1033', '1034');
INSERT INTO `field_button` (`pages_id`, `data`) VALUES('1035', '1036');
INSERT INTO `field_button` (`pages_id`, `data`) VALUES('1037', '1038');

DROP TABLE IF EXISTS `field_button_style`;
CREATE TABLE `field_button_style` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_button_style` (`pages_id`, `data`, `sort`) VALUES('1032', '1', '0');
INSERT INTO `field_button_style` (`pages_id`, `data`, `sort`) VALUES('1034', '2', '0');
INSERT INTO `field_button_style` (`pages_id`, `data`, `sort`) VALUES('1036', '3', '0');
INSERT INTO `field_button_style` (`pages_id`, `data`, `sort`) VALUES('1038', '4', '0');

DROP TABLE IF EXISTS `field_buttons`;
CREATE TABLE `field_buttons` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_buttons` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1', '1031,1033,1035,1037', '4', '1030');

DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_favicon`;
CREATE TABLE `field_favicon` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_google_analytics`;
CREATE TABLE `field_google_analytics` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_headline`;
CREATE TABLE `field_headline` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_headline` (`pages_id`, `data`) VALUES('1', 'Minimal Site Profile');

DROP TABLE IF EXISTS `field_images`;
CREATE TABLE `field_images` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1', 'rough_cartoon_puppet.jpg', '1', 'Copyright by Austin Cramer for DesignIntelligence. This is a placeholder while he makes new ones for us.', '2018-05-21 09:56:12', '2018-05-21 09:56:12', NULL);
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1', 'airport_cartoon_3.jpg', '0', 'Copyright by Austin Cramer for DesignIntelligence. This is a placeholder while he makes new ones for us.', '2018-05-21 09:56:12', '2018-05-21 09:56:12', NULL);

DROP TABLE IF EXISTS `field_img`;
CREATE TABLE `field_img` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_language`;
CREATE TABLE `field_language` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('40', '1077', '0');
INSERT INTO `field_language` (`pages_id`, `data`, `sort`) VALUES('41', '1077', '0');

DROP TABLE IF EXISTS `field_language_files`;
CREATE TABLE `field_language_files` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_language_files_site`;
CREATE TABLE `field_language_files_site` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_language_files_site` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`) VALUES('1077', 'site--templates--_lang-php.json', '0', '', '2019-08-31 10:50:53', '2019-08-31 10:50:53', '');

DROP TABLE IF EXISTS `field_link`;
CREATE TABLE `field_link` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1032', '#');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1034', '#');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1036', '#');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1038', '#');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1059', '#');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1088', './system/contact-form');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1071', '#');
INSERT INTO `field_link` (`pages_id`, `data`) VALUES('1094', 'http://laragon.box/Kreativan/CORE/system/widgets/?id=1094');

DROP TABLE IF EXISTS `field_link_attr`;
CREATE TABLE `field_link_attr` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_link_block`;
CREATE TABLE `field_link_block` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_link_block` (`pages_id`, `data`) VALUES('1058', '1059');
INSERT INTO `field_link_block` (`pages_id`, `data`) VALUES('1087', '1088');
INSERT INTO `field_link_block` (`pages_id`, `data`) VALUES('1083', '1084');
INSERT INTO `field_link_block` (`pages_id`, `data`) VALUES('1070', '1071');
INSERT INTO `field_link_block` (`pages_id`, `data`) VALUES('1085', '1086');

DROP TABLE IF EXISTS `field_link_type`;
CREATE TABLE `field_link_type` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1088', '2', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1071', '3', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1086', '3', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1084', '3', '0');
INSERT INTO `field_link_type` (`pages_id`, `data`, `sort`) VALUES('1059', '3', '0');

DROP TABLE IF EXISTS `field_logo`;
CREATE TABLE `field_logo` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_map`;
CREATE TABLE `field_map` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  `lat` float(10,6) NOT NULL DEFAULT '0.000000',
  `lng` float(10,6) NOT NULL DEFAULT '0.000000',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `zoom` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `latlng` (`lat`,`lng`),
  KEY `zoom` (`zoom`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_menu`;
CREATE TABLE `field_menu` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_menu` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1058', '1085,1083,1087', '3', '1060');
INSERT INTO `field_menu` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1070', '', '0', '1072');

DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_process` (`pages_id`, `data`) VALUES('6', '17');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('3', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('8', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('9', '14');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('10', '7');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('11', '47');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('16', '48');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('300', '104');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('21', '50');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('29', '66');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('23', '10');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('304', '138');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('31', '136');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('22', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('30', '68');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('303', '129');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('2', '87');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('302', '121');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('301', '109');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('28', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1007', '150');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1009', '158');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1011', '160');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1016', '176');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1068', '210');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1020', '182');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1021', '184');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1026', '187');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1039', '188');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1048', '199');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1052', '202');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1054', '208');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1074', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1076', '213');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1078', '214');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1081', '215');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1089', '221');

DROP TABLE IF EXISTS `field_repeater_matrix_type`;
CREATE TABLE `field_repeater_matrix_type` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `field_select_page`;
CREATE TABLE `field_select_page` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1059', '1017', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1086', '1017', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1071', '1019', '0');
INSERT INTO `field_select_page` (`pages_id`, `data`, `sort`) VALUES('1084', '1079', '0');

DROP TABLE IF EXISTS `field_seo`;
CREATE TABLE `field_seo` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `meta_inherit` tinyint(3) unsigned NOT NULL,
  `opengraph_inherit` tinyint(3) unsigned NOT NULL,
  `twitter_inherit` tinyint(3) unsigned NOT NULL,
  `robots_inherit` tinyint(3) unsigned NOT NULL,
  `sitemap_inherit` tinyint(3) unsigned NOT NULL,
  `structuredData_inherit` tinyint(3) unsigned NOT NULL,
  `sitemap_include` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_seo_tab`;
CREATE TABLE `field_seo_tab` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_seo_tab_end`;
CREATE TABLE `field_seo_tab_end` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_site_info`;
CREATE TABLE `field_site_info` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_site_info` (`pages_id`, `data`) VALUES('1017', 'site_name:Kreativan\rwebsite:kreativan.net\remail:email@email.com\rphone:+123 456 789\raddress:Belgrade, Serbia');

DROP TABLE IF EXISTS `field_subtitle`;
CREATE TABLE `field_subtitle` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_tab`;
CREATE TABLE `field_tab` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_tab_end`;
CREATE TABLE `field_tab_end` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` int(11) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `field_text`;
CREATE TABLE `field_text` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_text` (`pages_id`, `data`) VALUES('1017', 'Copyright © {{date}} {{site_name}}');

DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('11', 'Templates');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('16', 'Fields');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('22', 'Setup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('3', 'Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('6', 'Add Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('8', 'Tree');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('9', 'Save Sort');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('10', 'Edit');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('21', 'Modules');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('29', 'Users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('30', 'Roles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('2', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('7', 'Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('27', '404 Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('302', 'Insert Link');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('23', 'Login');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('304', 'Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('301', 'Empty Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('300', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('303', 'Insert Image');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('28', 'Access');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('31', 'Permissions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('32', 'Edit pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('34', 'Delete pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('35', 'Move pages (change parent)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('36', 'View pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('50', 'Sort child pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('51', 'Change templates on pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('52', 'Administer users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('53', 'User can update profile/password');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('54', 'Lock or unlock a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1017', 'Site Settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1000', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1006', 'Use Page Lister');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1007', 'Find');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1009', 'Recent');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1010', 'Can see recently edited pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1011', 'Logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1012', 'Can view system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1013', 'Can manage system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1014', 'Repeaters');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1015', 'Manage database backups (recommended for superuser only)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1016', 'DB Backups');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1019', 'Basic Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1020', 'Export Site Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1021', 'Clone');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1022', 'Clone a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1023', 'Clone a tree of pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1026', 'Export Site Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1027', 'button');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1039', 'Export Site Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1029', 'buttons');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1030', 'home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1032', 'Default');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1034', 'Primary');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1036', 'Secondary');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1038', 'Danger');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1040', 'menu');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1079', 'Widgets');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1048', 'Export Site Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1054', 'Site Settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1052', 'Upgrades');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1055', 'Manage Site Settings');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1056', 'link_block');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1057', 'Main Menu');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1058', 'Features');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1060', 'menu-item-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1087', 'Contact Form');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1068', 'Menu Manager');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1069', 'Access to menu manager');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1070', 'Basic Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1072', 'menu-item-2');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1074', 'Manage');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1075', 'Administer languages and static translation files');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1076', 'Languages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1077', 'en');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1078', 'Language Translator');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1080', 'Editor Widget Example');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1081', 'Widgets');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1082', 'Access to widgets');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1083', 'Widgets');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1085', 'Web Elements');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1089', 'Hanna Code');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1090', 'List and view Hanna Codes');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1091', 'Add/edit/delete Hanna Codes (text/html, javascript only)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1092', 'Add/edit/delete Hanna Codes (text/html, javascript and PHP)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1093', 'Use AdminBar');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1094', 'Contact Form');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('80', 'search');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', '404');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('98', 'system');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('99', 'repeater_button');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('100', 'repeater_buttons');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('101', 'repeater_menu');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('102', 'menu');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('103', 'menu-item');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('104', 'blank');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('105', 'repeater_link_block');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('106', 'language');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('107', 'widgets');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('108', 'editor-wg');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('109', 'contact-form-wg');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fields_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '97', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('80', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '78', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '76', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '130', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '122', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '131', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '131', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '132', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '44', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '76', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '130', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '132', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '76', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '127', '5', '{\"label\":\"Footer\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '113', '3', '{\"themeColor\":\"secondary\",\"themeOffset\":\"m\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '115', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '1', '0', '{\"collapsed\":\"4\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '110', '1', '{\"columnWidth\":50}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '117', '5', '{\"columnWidth\":40,\"showIf\":\"link_type=2\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '1', '0', '{\"columnWidth\":70,\"required\":\"\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '118', '1', '{\"columnWidth\":30}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '116', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '120', '3', '{\"showIf\":\"link_type=3\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '119', '4', '{\"columnWidth\":60,\"showIf\":\"link_type=2\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '121', '0', '{\"themeOffset\":\"\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '133', '1', '{\"label\":\"Link\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '129', '2', '{\"label\":\"Dropdown \\/ Submenu\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '1', '0', '{\"required\":\"\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '133', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '128', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '108', '6', '{\"label\":\"Copyright\",\"notes\":\"{{date}} {{site_name}} {{website}}\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '111', '2', '{\"columnWidth\":50}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '44', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '120', '1', '{\"showIf\":\"link_type=3\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '119', '2', '{\"columnWidth\":60,\"description\":\"If you use `Toggle` or `Scroll` attributes, use element css id as link eg: `#my_css_id`\",\"showIf\":\"link_type=2\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '117', '3', '{\"columnWidth\":40,\"description\":\"Use `Toggle` to invoke modal or offcanvas. Use `Scroll` to scroll to the element position by it\'s css id\",\"showIf\":\"link_type=2\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '134', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '135', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '136', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '76', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('105', '116', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '92', '1', '{\"description\":\"If empty, Site Settings email will be used\",\"label\":\"Admin E-Mail Address\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '108', '2', '{\"label\":\"Form success message\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '119', '3', '{\"label\":\"Action URL\"}');

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii NOT NULL,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `label` varchar(250) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Title', '{\"required\":1,\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail Address', '{\"size\":70,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('110', 'FieldtypeImage', 'logo', '0', 'logo', '{\"extensions\":\"gif jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":2,\"defaultValuePage\":0,\"useTags\":0,\"inputfieldClass\":\"InputfieldImage\",\"descriptionRows\":1,\"gridMode\":\"grid\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('44', 'FieldtypeImage', 'images', '0', 'Images', '{\"extensions\":\"gif jpg jpeg png\",\"adminThumbs\":1,\"inputfieldClass\":\"InputfieldImage\",\"maxFiles\":0,\"descriptionRows\":1,\"fileSchema\":6,\"textformatters\":[\"TextformatterEntities\"],\"outputFormat\":1,\"defaultValuePage\":0,\"defaultGrid\":0,\"icon\":\"camera\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('111', 'FieldtypeImage', 'favicon', '0', 'Favicon', '{\"extensions\":\"gif jpg jpeg png ico\",\"maxFiles\":1,\"outputFormat\":2,\"defaultValuePage\":0,\"useTags\":0,\"inputfieldClass\":\"InputfieldImage\",\"descriptionRows\":1,\"gridMode\":\"grid\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('76', 'FieldtypeTextarea', 'body', '32768', 'Body', '{\"inputfieldClass\":\"InputfieldCKEditor\",\"rows\":7,\"contentType\":1,\"toolbar\":\"Format, Bold, Italic, -, RemoveFormat\\nNumberedList, BulletedList, -, Blockquote\\nJustifyLeft, JustifyCenter, JustifyRight, JustifyBlock\\nPWLink, Unlink, Anchor\\nPWImage, Table, HorizontalRule, SpecialChar\\nPasteText, PasteFromWord\\nScayt, -, Sourcedialog\",\"inlineMode\":0,\"useACF\":1,\"usePurifier\":1,\"formatTags\":\"p;h1;h2;h3;h4;h5;h6;pre;address\",\"extraPlugins\":[\"justify\",\"pwimage\",\"pwlink\",\"sourcedialog\"],\"removePlugins\":\"image,magicline\",\"toggles\":[2,4,8],\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('78', 'FieldtypeText', 'headline', '0', 'Headline', '{\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":1024,\"minlength\":0,\"showCount\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('109', 'FieldtypeImage', 'img', '0', 'Image', '{\"extensions\":\"gif jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":2,\"defaultValuePage\":0,\"useTags\":0,\"inputfieldClass\":\"InputfieldImage\",\"descriptionRows\":1,\"gridMode\":\"grid\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('108', 'FieldtypeTextarea', 'text', '0', 'Text', '{\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":3,\"textformatters\":[\"TextformatterNewlineBR\",\"TextformatterMarkdownExtra\",\"TextformatterPstripper\"],\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('112', 'FieldtypeMapMarker', 'map', '0', 'Map', '{\"schemaVersion\":1,\"defaultAddr\":\"Castaway Cay\",\"defaultLat\":\"26.0936823\",\"defaultLng\":\"-77.5332796\",\"defaultType\":\"ROADMAP\",\"height\":400,\"defaultZoom\":13}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('113', 'FieldtypeTextareas', 'site_info', '0', 'Site Info', '{\"inputfieldClass\":\"InputfieldText\",\"valueType\":\"Text:InputfieldText:FieldtypeText\",\"definitions\":\"site_name = Site Name = 50%\\nwebsite = Website = 50%\\nemail = Email = 50%\\nphone = Phone= 50%\\naddress = Address\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":5,\"inputWidth\":0,\"collapsed2\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('115', 'FieldtypeTextarea', 'google_analytics', '0', 'Google Analytics', '{\"description\":\"Paste your google analytics code here...\",\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":10}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('116', 'FieldtypeOptions', 'link_type', '32768', 'Link Type', '{\"inputfieldClass\":\"InputfieldRadios\",\"collapsed\":0,\"required\":1,\"defaultValue\":1,\"tags\":\"Options\",\"optionColumns\":1,\"icon\":\"toggle-on\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('117', 'FieldtypeOptions', 'link_attr', '32768', 'Link Attributes', '{\"inputfieldClass\":\"InputfieldCheckboxes\",\"collapsed\":0,\"tags\":\"Options\",\"optionColumns\":2,\"icon\":\"external-link\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('118', 'FieldtypeOptions', 'button_style', '0', 'Button Style', '{\"inputfieldClass\":\"InputfieldSelect\",\"collapsed\":0,\"required\":1,\"defaultValue\":1,\"icon\":\"paint-brush\",\"tags\":\"Options\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('119', 'FieldtypeText', 'link', '0', 'Link', '{\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"icon\":\"link\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('120', 'FieldtypePage', 'select_page', '0', 'Select Page', '{\"derefAsPage\":2,\"inputfield\":\"InputfieldPageListSelect\",\"parent_id\":1,\"labelFieldName\":\"title\",\"icon\":\"file-text-o\",\"usePageEdit\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('121', 'FieldtypeFieldsetPage', 'button', '32768', 'Button', '{\"template_id\":45,\"parent_id\":1027,\"repeaterLoading\":2,\"repeaterMaxItems\":1,\"repeaterMinItems\":1,\"repeaterFields\":[1,118,116,120,119,117],\"themeOffset\":\"m\",\"themeColor\":\"secondary\",\"tags\":\"Blocks\",\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('122', 'FieldtypeRepeater', 'buttons', '0', 'Buttons', '{\"template_id\":46,\"parent_id\":1029,\"tags\":\"Repeaters\",\"repeaterFields\":[121],\"repeaterTitle\":\"{button.title}\",\"repeaterCollapse\":0,\"repeaterLoading\":1,\"collapsed\":0,\"themeOffset\":\"m\",\"themeColor\":\"secondary\",\"icon\":\"mouse-pointer\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('132', 'FieldtypeSeoMaestro', 'seo', '0', 'SEO', '');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('130', 'FieldtypeFieldsetTabOpen', 'SEO_tab', '32768', 'SEO', '{\"closeFieldID\":131,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('131', 'FieldtypeFieldsetClose', 'SEO_tab_END', '0', 'Close an open fieldset', '{\"description\":\"This field was added automatically to accompany fieldset \'SEO_tab\'.  It should be placed in your template\\/fieldgroup wherever you want the fieldset to end.\",\"openFieldID\":130}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('125', 'FieldtypeImage', 'bg', '0', 'Background', '{\"extensions\":\"gif jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":2,\"defaultValuePage\":0,\"useTags\":0,\"inputfieldClass\":\"InputfieldImage\",\"descriptionRows\":1,\"gridMode\":\"grid\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"fileSchema\":6,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('126', 'FieldtypeText', 'subtitle', '0', 'Subtitle', '{\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":3,\"collapsed\":0,\"size\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('127', 'FieldtypeFieldsetTabOpen', 'TAB', '0', 'TAB', '{\"closeFieldID\":128,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('128', 'FieldtypeFieldsetClose', 'TAB_END', '0', 'Close an open fieldset', '{\"description\":\"This field was added automatically to accompany fieldset \'TAB\'.  It should be placed in your template\\/fieldgroup wherever you want the fieldset to end.\",\"openFieldID\":127}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('129', 'FieldtypeRepeater', 'menu', '32768', 'Menu', '{\"template_id\":47,\"parent_id\":1040,\"repeaterFields\":[1,133],\"repeaterCollapse\":0,\"repeaterLoading\":1,\"collapsed\":0,\"tags\":\"Repeaters\",\"icon\":\"bars\",\"repeaterTitle\":\"{title}\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('133', 'FieldtypeFieldsetPage', 'link_block', '32768', 'Link Block', '{\"template_id\":51,\"parent_id\":1056,\"repeaterLoading\":2,\"repeaterMaxItems\":1,\"repeaterMinItems\":1,\"repeaterFields\":[116,120,119,117],\"collapsed\":0,\"tags\":\"Blocks\",\"themeColor\":\"secondary\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('134', 'FieldtypeFile', 'language_files_site', '24', 'Site Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for translations specific to your site (like files in \\/site\\/templates\\/ for example).\",\"descriptionRows\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('135', 'FieldtypeFile', 'language_files', '24', 'Core Translation Files', '{\"extensions\":\"json csv\",\"maxFiles\":0,\"inputfieldClass\":\"InputfieldFile\",\"unzip\":1,\"description\":\"Use this field for [language packs](http:\\/\\/modules.processwire.com\\/categories\\/language-pack\\/). To delete all files, double-click the trash can for any file, then save.\",\"descriptionRows\":0,\"fileSchema\":6}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('136', 'FieldtypePage', 'language', '24', 'Language', '{\"derefAsPage\":1,\"parent_id\":1076,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldRadios\",\"required\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('137', 'FieldtypeInteger', 'repeater_matrix_type', '25', 'Repeater matrix type', '');

DROP TABLE IF EXISTS `fieldtype_options`;
CREATE TABLE `fieldtype_options` (
  `fields_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `title` text,
  `value` varchar(250) DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fields_id`,`option_id`),
  UNIQUE KEY `title` (`title`(250),`fields_id`),
  KEY `value` (`value`,`fields_id`),
  KEY `sort` (`sort`,`fields_id`),
  FULLTEXT KEY `title_value` (`title`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('116', '2', 'external', '', '1');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('116', '1', 'no-link', '', '0');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('117', '1', 'New Tab', '', '0');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('117', '2', 'Nofollow', '', '1');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('118', '1', 'default', '', '0');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('118', '2', 'primary', '', '1');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('118', '3', 'secondary', '', '2');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('118', '4', 'danger', '', '3');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('118', '5', 'text', '', '4');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('118', '6', 'link', '', '5');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('117', '3', 'Toggle', '', '2');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('117', '4', 'Scroll', '', '3');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('116', '3', 'page', '', '2');

DROP TABLE IF EXISTS `hanna_code`;
CREATE TABLE `hanna_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `code` text,
  `modified` int(10) unsigned NOT NULL DEFAULT '0',
  `accessed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `hanna_code` (`id`, `name`, `type`, `code`, `modified`, `accessed`) VALUES('1', 'form_builder', '2', '/*hc_attr\nform_name=\"\"\nclass=\"\"\nheadline=\"\"\nhc_attr*/\n<?php\n\n$shortcode_file = wire(\"config\")->paths->templates.\"shortcodes/form-builder.php\";\n\ninclude($shortcode_file);', '1567251796', '0');
INSERT INTO `hanna_code` (`id`, `name`, `type`, `code`, `modified`, `accessed`) VALUES('2', 'widget', '2', '/*hc_attr\nid=\"\"\nhc_attr*/\n<?php\n\n$shortcode_file = wire(\"config\")->paths->templates.\"shortcodes/widget.php\";\n\ninclude($shortcode_file);', '1567251840', '0');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('2', 'FieldtypeNumber', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '3', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '{\"classOptions\":\"uk-button\\nuk-button-default\\nuk-button-primary\\nuk-button-secondary\\nuk-button-text\\nuk-button-large\\nuk-button-small\\ntm-toggle\",\"relOptions\":\"nofollow\",\"targetOptions\":\"_blank\",\"extLinkClass\":\"\",\"extLinkRel\":\"\",\"extLinkTarget\":\"\",\"urlType\":\"0\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('14', 'ProcessPageSort', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('15', 'InputfieldPageListSelect', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('117', 'JqueryUI', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('17', 'ProcessPageAdd', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('125', 'SessionLoginThrottle', '11', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('122', 'InputfieldPassword', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('25', 'InputfieldAsmSelect', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('116', 'JqueryCore', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('108', 'InputfieldURL', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('32', 'InputfieldSubmit', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('33', 'InputfieldWrapper', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('34', 'InputfieldText', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('35', 'InputfieldTextarea', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('36', 'InputfieldSelect', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('37', 'InputfieldCheckbox', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('38', 'InputfieldCheckboxes', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('39', 'InputfieldRadios', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('40', 'InputfieldHidden', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('41', 'InputfieldName', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('43', 'InputfieldSelectMultiple', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('45', 'JqueryWireTabs', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('46', 'ProcessPage', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('47', 'ProcessTemplate', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('48', 'ProcessField', '32', '{\"collapsedTags\":[\"seo\",\"Options\",\"Repeaters\"]}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('50', 'ProcessModule', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('114', 'PagePermissions', '3', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('97', 'FieldtypeCheckbox', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('115', 'PageRender', '3', '{\"clearCache\":1}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('55', 'InputfieldFile', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('56', 'InputfieldImage', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('57', 'FieldtypeImage', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('60', 'InputfieldPage', '0', '{\"inputfieldClasses\":[\"InputfieldSelect\",\"InputfieldSelectMultiple\",\"InputfieldCheckboxes\",\"InputfieldRadios\",\"InputfieldAsmSelect\",\"InputfieldPageListSelect\",\"InputfieldPageListSelectMultiple\",\"InputfieldPageAutocomplete\"]}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('61', 'TextformatterEntities', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('66', 'ProcessUser', '0', '{\"showFields\":[\"name\",\"email\",\"roles\"]}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('67', 'MarkupAdminDataTable', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('68', 'ProcessRole', '0', '{\"showFields\":[\"name\"]}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('76', 'ProcessList', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('78', 'InputfieldFieldset', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('79', 'InputfieldMarkup', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('80', 'InputfieldEmail', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('89', 'FieldtypeFloat', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('83', 'ProcessPageView', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('84', 'FieldtypeInteger', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('85', 'InputfieldInteger', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('86', 'InputfieldPageName', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('87', 'ProcessHome', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('90', 'InputfieldFloat', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('94', 'InputfieldDatetime', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('98', 'MarkupPagerNav', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('129', 'ProcessPageEditImageSelect', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('103', 'JqueryTableSorter', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('104', 'ProcessPageSearch', '1', '{\"searchFields\":\"title\",\"displayField\":\"title path\"}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('105', 'FieldtypeFieldsetOpen', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('106', 'FieldtypeFieldsetClose', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('107', 'FieldtypeFieldsetTabOpen', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('109', 'ProcessPageTrash', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('111', 'FieldtypePageTitle', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('112', 'InputfieldPageTitle', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('113', 'MarkupPageArray', '3', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('131', 'InputfieldButton', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('133', 'FieldtypePassword', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('134', 'ProcessPageType', '33', '{\"showFields\":[]}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('135', 'FieldtypeURL', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('136', 'ProcessPermission', '1', '{\"showFields\":[\"name\",\"title\"]}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('137', 'InputfieldPageListSelectMultiple', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('138', 'ProcessProfile', '1', '{\"profileFields\":[\"pass\",\"email\",\"admin_theme\",\"language\"]}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":17,\"coreVersion\":\"3.0.139\"}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('148', 'AdminThemeDefault', '10', '{\"colors\":\"classic\"}', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('149', 'InputfieldSelector', '42', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('150', 'ProcessPageLister', '32', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('151', 'JqueryMagnific', '1', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('152', 'PagePathHistory', '3', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('155', 'InputfieldCKEditor', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('156', 'MarkupHTMLPurifier', '0', '', '2018-05-21 09:56:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('158', 'ProcessRecentPages', '1', '', '2018-05-21 09:56:24');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('159', 'AdminThemeUikit', '10', '{\"useAsLogin\":\"\",\"userAvatar\":\"icon.user-circle\",\"userLabel\":\"{Name}\",\"logoURL\":\"\",\"logoAction\":\"0\",\"layout\":\"\",\"noGrid\":\"1\",\"maxWidth\":1400,\"groupNotices\":\"1\",\"cssURL\":\"\",\"inputSize\":\"m\",\"noBorderTypes\":[],\"offsetTypes\":[]}', '2018-05-21 09:56:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('160', 'ProcessLogger', '1', '', '2018-05-21 09:56:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('161', 'InputfieldIcon', '0', '', '2018-05-21 09:56:33');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('162', 'FieldtypeRepeater', '3', '{\"repeatersRootPageID\":1014}', '2018-05-21 10:02:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('163', 'InputfieldRepeater', '0', '', '2018-05-21 10:02:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('164', 'FieldtypeFieldsetPage', '35', '{\"repeatersRootPageID\":1014}', '2018-05-21 10:02:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('165', 'ImageSizerEngineAnimatedGif', '0', '{\"enginePriority\":9,\"sharpening\":\"soft\",\"quality\":90}', '2018-05-21 10:03:14');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('167', 'AllInOneMinify', '3', '{\"stylesheet_prefix\":\"css_\",\"javascript_prefix\":\"js_\",\"max_cache_lifetime\":\"2419200\",\"html_minify\":\"\",\"development_mode\":1,\"directory_traversal\":\"\",\"empty_cache\":\"Empty cache\",\"domain_sharding\":\"\",\"domain_sharding_ssl\":\"\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2018-05-21 10:04:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('168', 'LazyCron', '3', '', '2018-05-21 10:04:39');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('169', 'CronjobDatabaseBackup', '3', '{\"cycle\":\"everyDay\",\"max\":5,\"deadline\":\"\",\"backup_name\":\"\",\"backup_fileinfo\":\"\",\"field_storage_path\":\"\",\"backup_all\":1,\"tables\":{\"caches\":\"caches\",\"field_admin_theme\":\"field_admin_theme\",\"field_body\":\"field_body\",\"field_email\":\"field_email\",\"field_headline\":\"field_headline\",\"field_images\":\"field_images\",\"field_pass\":\"field_pass\",\"field_permissions\":\"field_permissions\",\"field_process\":\"field_process\",\"field_roles\":\"field_roles\",\"field_sidebar\":\"field_sidebar\",\"field_summary\":\"field_summary\",\"field_title\":\"field_title\",\"fieldgroups\":\"fieldgroups\",\"fieldgroups_fields\":\"fieldgroups_fields\",\"fields\":\"fields\",\"modules\":\"modules\",\"page_path_history\":\"page_path_history\",\"pages\":\"pages\",\"pages_access\":\"pages_access\",\"pages_parents\":\"pages_parents\",\"pages_sortfields\":\"pages_sortfields\",\"session_login_throttle\":\"session_login_throttle\",\"templates\":\"templates\"},\"cleanup\":\"\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2018-05-21 10:04:39');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('170', 'FieldtypeMapMarker', '1', '{\"googleApiKey\":\"\"}', '2018-05-21 10:05:19');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('171', 'InputfieldMapMarker', '0', '', '2018-05-21 10:05:19');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('172', 'MarkupGoogleMap', '0', '', '2018-05-21 10:05:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('204', 'SeoMaestro', '3', '{\"sitemapEnable\":1,\"sitemapPath\":\"sitemap.seomaestro.xml\",\"sitemapCache\":\"120\",\"baseUrl\":\"\",\"defaultLanguage\":\"en\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2019-07-24 18:03:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('205', 'FieldtypeSeoMaestro', '1', '', '2019-07-24 18:03:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('206', 'InputfieldSeoMaestro', '0', '', '2019-07-24 18:03:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('175', 'MarkupCache', '3', '', '2018-05-21 10:06:26');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('176', 'ProcessDatabaseBackups', '1', '', '2018-05-21 10:06:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('178', 'TracyDebugger', '3', '{\"enabled\":1,\"outputMode\":\"development\",\"superuserForceDevelopment\":\"\",\"guestForceDevelopmentLocal\":\"\",\"ipAddress\":\"\",\"strictMode\":\"\",\"strictModeAjax\":\"\",\"forceScream\":\"\",\"showLocation\":[\"Tracy\\\\Dumper::LOCATION_SOURCE\",\"Tracy\\\\Dumper::LOCATION_LINK\",\"Tracy\\\\Dumper::LOCATION_CLASS\"],\"debugInfo\":1,\"maxDepth\":3,\"maxLength\":150,\"showFireLogger\":1,\"referencePageEdited\":1,\"logSeverity\":[],\"email\":\"\",\"clearEmailSent\":\"\",\"showDebugBar\":[\"frontend\",\"backend\"],\"hideDebugBarModals\":[\"regularModal\",\"inlineModal\",\"overlayPanels\",\"formBuilderIframe\"],\"hideDebugBarTemplates\":[],\"hideDebugBar\":\"\",\"showPanelLabels\":\"\",\"panelZindex\":100,\"frontendPanels\":[\"processwireInfo\",\"requestInfo\",\"processwireLogs\",\"tracyLogs\",\"methodsInfo\",\"debugMode\",\"console\",\"panelSelector\",\"tracyToggler\"],\"backendPanels\":[\"processwireInfo\",\"requestInfo\",\"processwireLogs\",\"tracyLogs\",\"methodsInfo\",\"debugMode\",\"console\",\"panelSelector\",\"tracyToggler\"],\"restrictedUserDisabledPanels\":[],\"editor\":\"subl:\\/\\/open\\/?url=file:\\/\\/%file&line=%line\",\"localRootPath\":\"\",\"useOnlineEditor\":[],\"onlineEditor\":\"tracy\",\"forceEditorLinksToTracy\":1,\"fileEditorBaseDirectory\":\"templates\",\"fileEditorAllowedExtensions\":\"php, module, js, css, htaccess\",\"processwireInfoPanelSections\":[\"configData\",\"versionsList\",\"adminLinks\",\"documentationLinks\",\"gotoId\",\"processWireWebsiteSearch\"],\"customPWInfoPanelLinks\":[\"\\/admin\\/setup\\/template\\/\",\"\\/admin\\/setup\\/field\\/\",\"\\/admin\\/setup\\/\",\"\\/admin\\/module\\/\",\"\\/admin\\/access\\/users\\/\",\"\\/admin\\/access\\/roles\\/\",\"\\/admin\\/access\\/permissions\\/\",\"\\/admin\\/profile\\/\"],\"showPWInfoPanelIconLabels\":1,\"pWInfoPanelLinksNewTab\":\"\",\"requestInfoPanelSections\":[\"moduleSettings\",\"templateSettings\",\"fieldSettings\",\"pageInfo\",\"languageInfo\",\"templateInfo\",\"fieldsListValues\",\"serverRequest\",\"inputGet\",\"inputPost\",\"inputCookie\",\"session\",\"editLinks\"],\"imagesInFieldListValues\":1,\"debugModePanelSections\":[\"pagesLoaded\",\"modulesLoaded\",\"hooks\",\"databaseQueries\",\"selectorQueries\",\"timers\",\"user\",\"cache\",\"autoload\"],\"alwaysShowDebugTools\":1,\"diagnosticsPanelSections\":[\"filesystemFolders\"],\"todoIgnoreDirs\":\"git, svn, images, img, errors, sass-cache, node_modules\",\"todoAllowedExtensions\":\"php, module, inc, txt, latte, html, htm, md, css, scss, less, js\",\"todoScanModules\":\"\",\"numLogEntries\":10,\"variablesShowPwObjects\":\"\",\"snippetsPath\":\"templates\",\"customPhpCode\":\"\",\"userSwitcherRestricted\":[],\"styleWhere\":[],\"styleAdminColors\":\"local|#FF9933\\n*.local|#FF9933\\n*.dev|#FF9933\\ndev.*|#FF9933\\n*.test|#FF9933\\nstaging.*|#8b0066\\n*.com|#009900\",\"styleAdminType\":[\"default\"],\"styleAdminElements\":\"body::before {\\n\\tcontent: \\\"[type]\\\";\\n\\tbackground: [color];\\n\\tposition: fixed;\\n\\tleft: 0;\\n\\tbottom: 100%;\\n\\tcolor: #ffffff;\\n\\twidth: 100vh;\\n\\tpadding: 0;\\n\\ttext-align: center;\\n\\tfont-weight: 600;\\n\\ttext-transform: uppercase;\\n\\ttransform: rotate(90deg);\\n\\ttransform-origin: bottom left;\\n\\tz-index: 999999;\\n\\tfont-family: sans-serif;\\n\\tfont-size: 11px;\\n\\theight: 13px;\\n\\tline-height: 13px;\\npointer-events: none;\\n}\",\"userDevTemplate\":\"\",\"userDevTemplateSuffix\":\"dev\",\"showUserBar\":\"\",\"showUserBarTracyUsers\":null,\"userBarFeatures\":[\"admin\",\"editPage\"],\"userBarCustomFeatures\":\"\",\"userBarTopBottom\":\"bottom\",\"userBarLeftRight\":\"left\",\"userBarBackgroundColor\":null,\"userBarBackgroundOpacity\":\"1\",\"userBarIconColor\":\"#666666\",\"enableShortcutMethods\":1,\"enabledShortcutMethods\":[\"addBreakpoint\",\"bp\",\"barDump\",\"bd\",\"barDumpBig\",\"bdb\",\"debugAll\",\"da\",\"dump\",\"d\",\"fireLog\",\"fl\",\"l\",\"templateVars\",\"tv\",\"timer\",\"t\"],\"apiDataVersion\":\"3.0.139\",\"maxAjaxRows\":3,\"reservedMemorySize\":500000,\"linksNewTab\":\"\",\"hideDebugBarFrontendTemplates\":[],\"hideDebugBarBackendTemplates\":[],\"nonToggleablePanels\":[],\"panelSelectorTracyTogglerButton\":1,\"aceTheme\":\"tomorrow_night_bright\",\"codeFontSize\":14,\"codeLineHeight\":24,\"codeShowInvisibles\":\"1\",\"codeTabSize\":4,\"codeUseSoftTabs\":\"1\",\"pwAutocompletions\":1,\"codeShowDescription\":1,\"customSnippetsUrl\":\"\",\"fileEditorExcludedDirs\":\"site\\/assets\",\"apiExplorerShowDescription\":1,\"apiExplorerToggleDocComment\":\"\",\"apiExplorerModuleClasses\":[],\"captainHookShowDescription\":1,\"captainHookToggleDocComment\":\"\",\"dumpPanelTabs\":[\"debugInfo\",\"fullObject\"],\"todoScanAssets\":\"\",\"requestMethods\":[\"GET\",\"POST\",\"PUT\",\"DELETE\",\"PATCH\"],\"requestLoggerMaxLogs\":10,\"requestLoggerReturnType\":\"array\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2018-05-21 10:07:35');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('179', 'FieldtypeTextareas', '1', '{\"allowTypes\":[\"InputfieldText\",\"InputfieldInteger\",\"InputfieldDatetime\"]}', '2018-05-21 10:17:45');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('180', 'InputfieldTextareas', '0', '', '2018-05-21 10:17:45');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('208', 'SiteSettings', '1', '{\"hide_admin\":\"2\",\"sys_pages\":[],\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2019-08-14 16:06:28');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('183', 'FieldtypeOptions', '1', '', '2018-06-05 07:49:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('184', 'ProcessPageClone', '11', '', '2018-06-05 07:50:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('189', 'FieldtypeAdminCustomPagesSelect', '1', '', '2018-09-03 12:21:42');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('191', 'TextformatterMarkdownExtra', '1', '{\"flavor\":\"2\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2018-09-03 12:52:54');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('192', 'TextformatterNewlineBR', '1', '', '2018-09-03 12:53:02');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('193', 'TextformatterPstripper', '1', '', '2018-09-03 12:53:09');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('194', 'InputfieldPageAutocomplete', '0', '', '2018-09-03 14:05:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('202', 'ProcessWireUpgrade', '1', '', '2019-07-24 18:01:57');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('203', 'ProcessWireUpgradeCheck', '11', '', '2019-07-24 18:01:57');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('209', 'SiteHelper', '3', '', '2019-08-14 16:40:19');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('210', 'SiteMenu', '1', '{\"show_home\":\"1\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\",\"mobile_menu_style\":\"2\"}', '2019-08-14 19:30:25');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('212', 'LanguageSupport', '35', '{\"languagesPageID\":1076,\"defaultLanguagePageID\":1077,\"otherLanguagePageIDs\":[],\"languageTranslatorPageID\":1078,\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2019-08-31 12:50:32');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('213', 'ProcessLanguage', '1', '', '2019-08-31 12:50:32');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('214', 'ProcessLanguageTranslator', '1', '', '2019-08-31 12:50:32');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('215', 'SiteWidgets', '1', '', '2019-08-31 13:04:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('216', 'FieldtypeTable', '1', '', '2019-08-31 13:19:27');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('217', 'InputfieldTable', '0', '', '2019-08-31 13:19:27');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('218', 'FieldtypeRepeaterMatrix', '33', '{\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2019-08-31 13:19:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('219', 'InputfieldRepeaterMatrix', '0', '', '2019-08-31 13:19:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('220', 'TextformatterHannaCode', '1', '{\"openTag\":\"[[\",\"closeTag\":\"]]\",\"uninstall\":\"\",\"submit_save_module\":\"Submit\"}', '2019-08-31 13:40:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('221', 'ProcessHannaCode', '1', '', '2019-08-31 13:40:18');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('222', 'AdminBar', '3', '', '2019-08-31 14:15:58');

DROP TABLE IF EXISTS `page_path_history`;
CREATE TABLE `page_path_history` (
  `path` varchar(250) NOT NULL,
  `pages_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`path`),
  KEY `pages_id` (`pages_id`),
  KEY `created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `templates_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '2015-12-18 06:09:00',
  `created_users_id` int(10) unsigned NOT NULL DEFAULT '2',
  `published` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1096 DEFAULT CHARSET=utf8;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2018-09-03 12:19:32', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'admin', '1035', '2019-08-31 12:49:47', '40', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2018-05-21 09:56:35', '40', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2018-05-21 09:56:41', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2018-05-21 09:56:37', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2019-08-15 13:57:55', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '43', 'http404', '1035', '2018-09-03 08:41:57', '41', '2018-05-21 09:56:12', '3', '2018-05-21 09:56:12', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('28', '2', '2', 'access', '13', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('29', '28', '2', 'users', '29', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('30', '28', '2', 'roles', '29', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('31', '28', '2', 'permissions', '29', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('32', '31', '5', 'page-edit', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('34', '31', '5', 'page-delete', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('35', '31', '5', 'page-move', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('36', '31', '5', 'page-view', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('37', '30', '4', 'guest', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('38', '30', '4', 'superuser', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'admin', '1', '2019-08-31 12:50:32', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('40', '29', '3', 'guest', '25', '2019-08-31 12:50:32', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('50', '31', '5', 'page-sort', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('51', '31', '5', 'page-template', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('52', '31', '5', 'user-admin', '25', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('53', '31', '5', 'profile-edit', '1', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('54', '31', '5', 'page-lock', '1', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('300', '3', '2', 'search', '1045', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('301', '3', '2', 'trash', '1047', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('302', '3', '2', 'link', '1041', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('303', '3', '2', 'image', '1041', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('304', '2', '2', 'profile', '1025', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1000', '1', '26', 'search', '1025', '2018-05-21 09:56:12', '41', '2018-05-21 09:56:12', '2', '2018-05-21 09:56:12', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1019', '1', '29', 'basic-page', '1', '2019-08-31 14:20:22', '41', '2018-05-21 11:07:08', '41', '2018-05-21 11:07:12', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1006', '31', '5', 'page-lister', '1', '2018-05-21 09:56:12', '40', '2018-05-21 09:56:12', '40', '2018-05-21 09:56:12', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1007', '3', '2', 'lister', '1', '2018-05-21 09:56:12', '40', '2018-05-21 09:56:12', '40', '2018-05-21 09:56:12', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1009', '3', '2', 'recent-pages', '1', '2018-05-21 09:56:24', '40', '2018-05-21 09:56:24', '40', '2018-05-21 09:56:24', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1010', '31', '5', 'page-edit-recent', '1', '2018-05-21 09:56:24', '40', '2018-05-21 09:56:24', '40', '2018-05-21 09:56:24', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1011', '22', '2', 'logs', '1', '2018-05-21 09:56:31', '40', '2018-05-21 09:56:31', '40', '2018-05-21 09:56:31', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1012', '31', '5', 'logs-view', '1', '2018-05-21 09:56:31', '40', '2018-05-21 09:56:31', '40', '2018-05-21 09:56:31', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1013', '31', '5', 'logs-edit', '1', '2018-05-21 09:56:31', '40', '2018-05-21 09:56:31', '40', '2018-05-21 09:56:31', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1014', '2', '2', 'repeaters', '1036', '2018-05-21 10:02:29', '41', '2018-05-21 10:02:29', '41', '2018-05-21 10:02:29', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1015', '31', '5', 'db-backup', '1', '2018-05-21 10:04:39', '41', '2018-05-21 10:04:39', '41', '2018-05-21 10:04:39', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1016', '22', '2', 'db-backups', '1', '2018-05-21 10:06:36', '41', '2018-05-21 10:06:36', '41', '2018-05-21 10:06:36', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1017', '1', '44', 'system', '1025', '2019-08-15 13:59:23', '41', '2018-05-21 10:23:35', '41', '2018-05-21 10:23:38', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1021', '3', '2', 'clone', '1024', '2018-06-05 07:50:07', '41', '2018-06-05 07:50:07', '41', '2018-06-05 07:50:07', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1022', '31', '5', 'page-clone', '1', '2018-06-05 07:50:07', '41', '2018-06-05 07:50:07', '41', '2018-06-05 07:50:07', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1023', '31', '5', 'page-clone-tree', '1', '2018-06-05 07:50:07', '41', '2018-06-05 07:50:07', '41', '2018-06-05 07:50:07', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1027', '1014', '2', 'for-field-121', '17', '2018-09-03 12:04:52', '41', '2018-09-03 12:04:52', '41', '2018-09-03 12:04:52', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1029', '1014', '2', 'for-field-122', '17', '2018-09-03 12:15:30', '41', '2018-09-03 12:15:30', '41', '2018-09-03 12:15:30', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1030', '1029', '2', 'for-page-1', '17', '2018-09-03 12:16:56', '41', '2018-09-03 12:16:56', '41', '2018-09-03 12:16:56', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1031', '1030', '46', '1535977020-2577-1', '1', '2018-09-03 12:19:32', '41', '2018-09-03 12:17:00', '41', '2018-09-03 12:18:43', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1032', '1027', '45', 'for-page-1031', '1', '2018-09-03 12:19:32', '41', '2018-09-03 12:17:00', '41', '2018-09-03 12:18:43', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1033', '1030', '46', '1535977030-7916-1', '1', '2018-09-03 12:19:32', '41', '2018-09-03 12:17:10', '41', '2018-09-03 12:18:43', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1034', '1027', '45', 'for-page-1033', '1', '2018-09-03 12:19:32', '41', '2018-09-03 12:17:10', '41', '2018-09-03 12:18:43', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1035', '1030', '46', '1535977104-9724-1', '1', '2018-09-03 12:19:32', '41', '2018-09-03 12:18:24', '41', '2018-09-03 12:18:43', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1036', '1027', '45', 'for-page-1035', '1', '2018-09-03 12:19:32', '41', '2018-09-03 12:18:24', '41', '2018-09-03 12:18:43', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1037', '1030', '46', '1535977115-5053-1', '1', '2018-09-03 12:19:32', '41', '2018-09-03 12:18:35', '41', '2018-09-03 12:18:43', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1038', '1027', '45', 'for-page-1037', '1', '2018-09-03 12:19:32', '41', '2018-09-03 12:18:35', '41', '2018-09-03 12:18:43', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1040', '1014', '2', 'for-field-129', '17', '2018-09-05 08:58:05', '41', '2018-09-05 08:58:05', '41', '2018-09-05 08:58:05', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1054', '1074', '2', 'site-settings', '1', '2019-08-15 13:58:10', '41', '2019-08-14 16:06:28', '41', '2019-08-14 16:06:28', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1052', '22', '2', 'upgrades', '1', '2019-07-24 18:01:57', '41', '2019-07-24 18:01:57', '41', '2019-07-24 18:01:57', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1068', '1074', '2', 'menu-manager', '1', '2019-08-15 13:58:04', '41', '2019-08-14 19:30:25', '41', '2019-08-14 19:30:25', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1055', '31', '5', 'site-settings', '1', '2019-08-14 16:06:28', '41', '2019-08-14 16:06:28', '41', '2019-08-14 16:06:28', '16');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1056', '1014', '2', 'for-field-133', '17', '2019-08-14 16:46:23', '41', '2019-08-14 16:46:23', '41', '2019-08-14 16:46:23', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1057', '1017', '48', 'main-menu', '1', '2019-08-14 18:33:02', '41', '2019-08-14 18:32:58', '41', '2019-08-14 18:32:58', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1058', '1057', '49', 'menu-item-1', '0', '2019-08-31 13:37:21', '41', '2019-08-14 18:33:16', '41', '2019-08-14 19:45:08', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1059', '1056', '51', 'for-page-1058', '1', '2019-08-31 13:37:21', '41', '2019-08-14 18:33:16', '41', '2019-08-14 19:45:08', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1060', '1040', '2', 'for-page-1058', '17', '2019-08-14 18:33:16', '41', '2019-08-14 18:33:16', '41', '2019-08-14 18:33:16', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1079', '1017', '53', 'widgets', '1', '2019-08-31 13:00:17', '41', '2019-08-31 13:00:14', '41', '2019-08-31 13:00:14', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1088', '1056', '51', 'for-page-1087', '1', '2019-08-31 13:37:21', '41', '2019-08-31 13:33:45', '41', '2019-08-31 13:34:00', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1080', '1079', '54', 'editor-widget-example', '1', '2019-08-31 14:29:11', '41', '2019-08-31 13:02:04', '41', '2019-08-31 13:02:04', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1089', '22', '2', 'hanna-code', '1', '2019-08-31 13:40:18', '41', '2019-08-31 13:40:18', '41', '2019-08-31 13:40:18', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1069', '31', '5', 'menu-manager', '1', '2019-08-14 19:30:25', '41', '2019-08-14 19:30:25', '41', '2019-08-14 19:30:25', '17');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1070', '1057', '49', 'menu-item-2', '1', '2019-08-31 14:20:41', '41', '2019-08-14 19:48:42', '41', '2019-08-14 19:48:42', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1071', '1056', '51', 'for-page-1070', '1', '2019-08-31 14:20:38', '41', '2019-08-14 19:48:42', '41', '2019-08-14 19:48:42', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1072', '1040', '2', 'for-page-1070', '17', '2019-08-14 19:48:42', '41', '2019-08-14 19:48:42', '41', '2019-08-14 19:48:42', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1074', '2', '2', 'manage', '1', '2019-08-15 13:58:10', '41', '2019-08-15 13:57:22', '41', '2019-08-15 13:57:32', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1075', '31', '5', 'lang-edit', '1', '2019-08-31 12:50:32', '41', '2019-08-31 12:50:32', '41', '2019-08-31 12:50:32', '18');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1076', '22', '2', 'languages', '16', '2019-08-31 12:50:32', '41', '2019-08-31 12:50:32', '41', '2019-08-31 12:50:32', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1077', '1076', '52', 'default', '16', '2019-08-31 12:50:53', '41', '2019-08-31 12:50:32', '41', '2019-08-31 12:50:32', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1078', '22', '2', 'language-translator', '1040', '2019-08-31 12:50:32', '41', '2019-08-31 12:50:32', '41', '2019-08-31 12:50:32', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1081', '1074', '2', 'widgets', '1', '2019-08-31 13:04:12', '41', '2019-08-31 13:04:12', '41', '2019-08-31 13:04:12', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1082', '31', '5', 'site-widgets', '1', '2019-08-31 13:04:12', '41', '2019-08-31 13:04:12', '41', '2019-08-31 13:04:12', '19');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1083', '1060', '47', '1567249896-9084-1', '1', '2019-08-31 13:24:43', '41', '2019-08-31 13:11:36', '41', '2019-08-31 13:11:47', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1084', '1056', '51', 'for-page-1083', '1', '2019-08-31 13:24:43', '41', '2019-08-31 13:11:36', '41', '2019-08-31 13:11:47', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1085', '1060', '47', '1567250565-5226-1', '1', '2019-08-31 13:23:07', '41', '2019-08-31 13:22:45', '41', '2019-08-31 13:22:56', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1086', '1056', '51', 'for-page-1085', '1', '2019-08-31 13:23:07', '41', '2019-08-31 13:22:45', '41', '2019-08-31 13:22:56', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1087', '1060', '47', '1567251225-0035-1', '1', '2019-08-31 13:37:21', '41', '2019-08-31 13:33:44', '41', '2019-08-31 13:34:00', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1090', '31', '5', 'hanna-code', '1', '2019-08-31 13:40:18', '41', '2019-08-31 13:40:18', '41', '2019-08-31 13:40:18', '20');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1091', '31', '5', 'hanna-code-edit', '1', '2019-08-31 13:40:18', '41', '2019-08-31 13:40:18', '41', '2019-08-31 13:40:18', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1092', '31', '5', 'hanna-code-php', '1', '2019-08-31 13:40:18', '41', '2019-08-31 13:40:18', '41', '2019-08-31 13:40:18', '22');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1093', '31', '5', 'adminbar', '1', '2019-08-31 14:15:58', '41', '2019-08-31 14:15:58', '41', '2019-08-31 14:15:58', '23');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1094', '1079', '55', 'contact-form', '1', '2019-08-31 14:56:41', '41', '2019-08-31 14:24:22', '41', '2019-08-31 14:24:22', '1');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int(11) NOT NULL,
  `templates_id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1006', '2', '2018-05-21 09:56:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1010', '2', '2018-05-21 09:56:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1012', '2', '2018-05-21 09:56:31');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1013', '2', '2018-05-21 09:56:31');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1015', '2', '2018-05-21 10:04:39');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('27', '1', '2018-05-21 10:10:03');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1019', '1', '2018-05-21 11:07:08');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1017', '1', '2018-05-21 10:23:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1022', '2', '2018-06-05 07:50:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1023', '2', '2018-06-05 07:50:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1032', '2', '2018-09-03 12:17:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1031', '2', '2018-09-03 12:17:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1034', '2', '2018-09-03 12:17:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1033', '2', '2018-09-03 12:17:10');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1036', '2', '2018-09-03 12:18:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1035', '2', '2018-09-03 12:18:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1038', '2', '2018-09-03 12:18:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1037', '2', '2018-09-03 12:18:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1055', '2', '2019-08-14 16:06:28');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1057', '1', '2019-08-14 18:32:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1059', '2', '2019-08-14 18:33:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1058', '1', '2019-08-14 18:33:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1088', '2', '2019-08-31 13:33:45');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1087', '2', '2019-08-31 13:33:45');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1080', '1', '2019-08-31 13:02:04');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1079', '1', '2019-08-31 13:00:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1069', '2', '2019-08-14 19:30:25');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1071', '2', '2019-08-14 19:48:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1070', '1', '2019-08-15 13:50:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1075', '2', '2019-08-31 12:50:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1077', '2', '2019-08-31 12:50:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1082', '2', '2019-08-31 13:04:12');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1084', '2', '2019-08-31 13:11:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1083', '2', '2019-08-31 13:11:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1086', '2', '2019-08-31 13:22:45');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1085', '2', '2019-08-31 13:22:45');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1090', '2', '2019-08-31 13:40:18');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1091', '2', '2019-08-31 13:40:18');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1092', '2', '2019-08-31 13:40:18');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1093', '2', '2019-08-31 14:15:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1094', '1', '2019-08-31 14:24:22');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int(10) unsigned NOT NULL,
  `parents_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('2', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('7', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1014', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1027', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1027', '1014');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1029', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1029', '1014');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1030', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1030', '1014');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1030', '1029');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1040', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1040', '1014');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1056', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1056', '1014');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1057', '1017');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1060', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1060', '1014');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1060', '1040');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1074', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1076', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1076', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1079', '1017');

DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `last_attempt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii NOT NULL,
  `fieldgroups_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cache_time` mediumint(9) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1566217887,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1566217887,\"ns\":\"\\\\\",\"roles\":[37]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"slashUrls\":1,\"compile\":3,\"modified\":1567254107,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('26', 'search', '80', '0', '0', '{\"noChildren\":1,\"noParents\":1,\"allowPageNum\":1,\"slashUrls\":1,\"compile\":3,\"modified\":1566217887,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', '404', '97', '0', '0', '{\"noChildren\":1,\"noParents\":-1,\"slashUrls\":1,\"compile\":3,\"tags\":\"-Sys\",\"modified\":1526898034}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('44', 'system', '98', '0', '0', '{\"noParents\":-1,\"urlSegments\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-cog title\",\"noSettings\":1,\"compile\":3,\"tags\":\"-Sys\",\"modified\":1567254587,\"tabContent\":\"Settings\",\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('45', 'repeater_button', '99', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"FieldsetPage\",\"pageLabelField\":\"for_page_path\",\"noGlobal\":1,\"compile\":3,\"modified\":1535976292}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('46', 'repeater_buttons', '100', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1535976930}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('47', 'repeater_menu', '101', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1536137885}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('48', 'menu', '102', '0', '0', '{\"childTemplates\":[49],\"parentTemplates\":[44],\"slashUrls\":1,\"pageLabelField\":\"fa-sitemap title\",\"compile\":3,\"tags\":\"-Menu\",\"modified\":1565793907}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('49', 'menu-item', '103', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[48],\"slashUrls\":1,\"pageLabelField\":\"fa-bars title\",\"compile\":3,\"tags\":\"Menu\",\"modified\":1565800573}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('50', 'blank', '104', '0', '0', '{\"childTemplates\":[50],\"parentTemplates\":[44],\"slashUrls\":1,\"compile\":3,\"tags\":\"Sys\",\"modified\":1565793891}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('51', 'repeater_link_block', '105', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"FieldsetPage\",\"pageLabelField\":\"for_page_path\",\"noGlobal\":1,\"compile\":3,\"modified\":1565793983}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'language', '106', '8', '0', '{\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Language\",\"pageLabelField\":\"name\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noChangeTemplate\":1,\"noUnpublish\":1,\"compile\":3,\"nameContentTab\":1,\"modified\":1567248632}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('53', 'widgets', '107', '0', '0', '{\"noParents\":-1,\"childTemplates\":[54,55],\"parentTemplates\":[44],\"slashUrls\":1,\"pageLabelField\":\"fa-html5 title\",\"compile\":3,\"tags\":\"Sys\",\"modified\":1567255005,\"ns\":\"\\\\\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'editor-wg', '108', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[53],\"slashUrls\":1,\"pageLabelField\":\"fa-pencil title\",\"compile\":3,\"label\":\"Editor\",\"tags\":\"-Widgets\",\"modified\":1567249345}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('55', 'contact-form-wg', '109', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[53],\"slashUrls\":1,\"pageLabelField\":\"fa-envelope title\",\"compile\":3,\"label\":\"Contact Form\",\"tags\":\"Widgets\",\"modified\":1567256167}');

UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":44,"numCreateTables":51,"numInserts":645,"numSeconds":0}