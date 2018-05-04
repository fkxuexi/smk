drop database if exists smk;
create database smk default charset=utf8;
-- 用户表
CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL COMMENT '登录名',
  `nike_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(50) NOT NULL COMMENT '盐',
  `avatar` varchar(100) DEFAULT NULL COMMENT '图像',
  `phone` varchar(11) NOT NULL COMMENT '管理员电话',
  `email` varchar(50) NOT NULL COMMENT '管理员邮箱',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(1：启用  2：冻结  3：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 角色表
CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_key` varchar(20) NOT NULL COMMENT '用户角色，用来判断',
  `role_name` varchar(20) NOT NULL COMMENT '用户角色，用来展示',
  `status` int(255) NOT NULL DEFAULT '1' COMMENT '状态(1：启用  2：冻结  3：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 菜单表
CREATE TABLE `sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `url` varchar(100) NOT NULL DEFAULT '#' COMMENT '如果为‘# ’就说明是顶级菜单',
  `path` varchar(50) NOT NULL,
  `type` int(11) NOT NULL COMMENT '是按钮还是连接',
  `levels` int(255) DEFAULT NULL COMMENT '菜单层级，这个避免后来计算，先前直接在添加的时候计算好',
  `order_sort` int(11) DEFAULT NULL COMMENT '组内排序',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1：启用；2：禁用；3：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 用户角色表
CREATE TABLE `sys_user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_name` varchar(20) NOT NULL COMMENT '冗余的角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 角色菜单表
CREATE TABLE `sys_role_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` varchar(255) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;