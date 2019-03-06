DROP TABLE IF EXISTS `sys_securityrole`;
CREATE TABLE IF NOT EXISTS `sys_securityrole` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '安全角色编号',
  `title` varchar(100) NOT NULL COMMENT '角色标题中文',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注信息',
  `parent_id` bigint(11) DEFAULT NULL COMMENT '基权限编码',
  `delflag` tinyint(1) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL DEFAULT '0',
  `updateAt` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户安全角色';