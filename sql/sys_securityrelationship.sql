DROP TABLE IF EXISTS `sys_securityrelationship`;
CREATE TABLE IF NOT EXISTS `sys_securityrelationship` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '关系表的ID',
  `group_id` bigint(11) DEFAULT NULL COMMENT '关联的组编号',
  `role_id` bigint(11) DEFAULT NULL COMMENT '关联的角色编号',
  `can_create` tinyint(1) NOT NULL DEFAULT '0' COMMENT '创建权限',
  `can_update` tinyint(1) NOT NULL DEFAULT '0' COMMENT '更新权限',
  `can_read` tinyint(1) NOT NULL DEFAULT '1' COMMENT '读取权限',
  `can_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除权限',
  `delflag` tinyint(1) NOT NULL DEFAULT '0',
  `createAt` bigint(20) NOT NULL DEFAULT '0',
  `updateAt` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='安全组和安全角色关系表,Y：拥有该权限,N：没有该权限';


INSERT INTO `sys_securityrelationship` (`id`, `group_id`, `role_id`, `can_create`, `can_update`, `can_read`, `can_delete`, `delflag`, `createAt`, `updateAt`) VALUES
(3, 6, 6, 1, 1, 1, 1, 0, 0, 0),
(5, 6, 7, 0, 1, 1, 1, 0, 0, 0),
(6, 7, 7, 0, 1, 1, 1, 0, 0, 0),
(7, 3, 4, 0, 0, 0, 0, 0, 0, 0),
(8, 4, 7, 0, 0, 0, 1, 0, 0, 0),
(9, 5, 12, 1, 1, 1, 1, 0, 0, 0),
(10, 6, 10, 1, 1, 1, 1, 0, 0, 0),
(12, 6, 11, 1, 1, 1, 1, 0, 0, 0),
(15, 6, 8, 1, 1, 1, 1, 0, 0, 0),
(17, 6, 13, 1, 1, 1, 1, 0, 0, 0),
(18, 6, 9, 0, 1, 1, 0, 0, 0, 0);