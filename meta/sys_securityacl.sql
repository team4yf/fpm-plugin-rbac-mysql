DROP TABLE IF EXISTS `sys_securityacl`;
CREATE TABLE IF NOT EXISTS `sys_securityacl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delflag` tinyint(1) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL DEFAULT '0',
  `updateAt` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;