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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='安全组和安全角色关系表,Y：拥有该权限,N：没有该权限';