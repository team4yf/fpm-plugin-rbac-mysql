INSERT INTO `sys_securityacl` (`id`, `delflag`, `createAt`, `updateAt`, `name`, `url`, `group_id`) VALUES
(1, 0, 0, 0, '设备列表查看', '/device/list', 3),
(2, 0, 0, 0, '设备添加', '/device/add', 3);
INSERT INTO `sys_securitygroup` (`id`, `title`, `remark`, `delflag`, `createAt`, `updateAt`) VALUES
(1, 'LOCAL MANAGER ADMIN', '本地管理员，拥有最高权限', 0, 0, 0),
(2, 'LOCAL ADMIN', '本地管理员，拥有后台管理权限', 0, 0, 0),
(3, 'DEFAULT ADMIN', '默认管理员，拥有后台部分管理权限', 0, 0, 0),
(4, 'DEFAULT USER', '默认用户组，拥有处理部分业务数据的权限', 0, 0, 0);
INSERT INTO `sys_securityrelationship` (`id`, `group_id`, `role_id`, `can_create`, `can_update`, `can_read`, `can_delete`, `delflag`, `createAt`, `updateAt`) VALUES
(3, 3, 3, 1, 1, 1, 1, 0, 0, 0),
(5, 3, 4, 1, 1, 1, 1, 0, 0, 0),
(6, 4, 3, 1, 1, 1, 1, 0, 0, 0),
(7, 4, 4, 1, 1, 1, 1, 0, 0, 0);
INSERT INTO `sys_securityrole` (`id`, `title`, `remark`, `parent_id`, `delflag`, `createAt`, `updateAt`) VALUES
(1, '本地管理员角色', '管理系统的最高权限角色', 0, 0, 0, 0),
(2, '通用管理员角色', '权限有限制的管理员权限角色', 0, 0, 0, 0),
(3, '高级用户', '高级用户', 0, 0, 0, 0),
(4, '普通用户', '普通用户', 0, 0, 0, 0);