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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户安全角色';

INSERT INTO `sys_securityrole` (`id`, `title`, `remark`, `parent_id`, `delflag`, `createAt`, `updateAt`) VALUES
(4, '本地管理员角色', '管理系统的最高权限角色', 0, 0, 0, 0),
(5, '通用管理员角色', '权限有限制的管理员权限角色', 0, 0, 0, 0),
(9, '运营中心', '运营中心', 0, 0, 0, 0),
(10, '战略企划部', '战略企划部', 0, 0, 0, 0),
(11, '信息中心', '信息中心', 0, 0, 0, 0);