--广告位置
CREATE TABLE `adv_position` (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) collate utf8_unicode_ci NOT NULL,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `creator_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `image_size` varchar(20) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--广告
CREATE TABLE `adv` (
  `id` bigint(20) NOT NULL,
  `titile` varchar(100) collate utf8_unicode_ci default NULL,
  `pic_url` varchar(200) collate utf8_unicode_ci default NULL,
  `adv_type` int(11) NOT NULL,
  `url` varchar(200) collate utf8_unicode_ci NOT NULL,
  `adv_position_id` bigint(20) NOT NULL,
  `ord` int(11) default NULL,
  `click_count` int(11) default NULL,
  `enabled` tinyint(4) default NULL,
  `creator_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `description` varchar(250) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告';
