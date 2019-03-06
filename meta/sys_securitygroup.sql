DROP TABLE IF EXISTS `sys_securitygroup`;
CREATE TABLE IF NOT EXISTS `sys_securitygroup` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '安全组编号',
  `title` varchar(100) DEFAULT NULL COMMENT '安全组名称中文',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `delflag` tinyint(1) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL DEFAULT '0',
  `updateAt` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='权限安全组';