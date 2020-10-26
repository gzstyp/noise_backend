/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.3.66_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 192.168.3.66:3306
 Source Schema         : noise_security

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 26/10/2020 17:23:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织机构主键',
  `dep_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称或下属机构名称',
  `parent_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '父级主键id',
  `dep_exist` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有部门机构(默认为0;0没有;1有)',
  `seq` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序号',
  `creator` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `isParent` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是父级菜单(1为true0为false)',
  `ctime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`kid`) USING BTREE,
  INDEX `index_dep_name`(`dep_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('00000000725247e1000000002ef687a8', '人事部', '46e3efc5aa1e46b1ad86e663b8af5f70', 0, 0, 'c6ec0578a1aa48eaad610cb4206c8d8c', 0, '2020-09-23 18:19:08');
INSERT INTO `sys_department` VALUES ('46e3efc5aa1e46b1ad86e663b8af5f70', '贵州驼峰科技有限责任公司', 'kid00000000000000000000000001024', 0, 1, 'c6ec0578a1aa48eaad610cb4206c8d8c', 1, '2020-09-23 18:18:40');
INSERT INTO `sys_department` VALUES ('ffffffffaaf8c1cdffffffffd9aa7a10', '行政部', '46e3efc5aa1e46b1ad86e663b8af5f70', 0, 0, 'c6ec0578a1aa48eaad610cb4206c8d8c', 0, '2020-09-23 18:19:01');
INSERT INTO `sys_department` VALUES ('ffffffffef12724effffffff988e8d50', '研发部', '46e3efc5aa1e46b1ad86e663b8af5f70', 0, 0, 'c6ec0578a1aa48eaad610cb4206c8d8c', 0, '2020-09-23 18:19:16');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `KID` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典主键',
  `NAME` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `DELETED` smallint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除(0未删除1已删除)',
  `SORT` int(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `PID` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '88888888888888888888888888888888' COMMENT '父级ID',
  `REMARKS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`KID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('000000003154d347000000000118619b', '已通过', 0, 3, '00000000382d48760000000079b1fbe5', '审核状态');
INSERT INTO `sys_dict` VALUES ('0000000037d27354ffffffffc4ef7062', '未通过', 0, 2, '00000000382d48760000000079b1fbe5', '审核状态');
INSERT INTO `sys_dict` VALUES ('ffffffffdf5ca826000000002855ee97', '未审核', 0, 1, '00000000382d48760000000079b1fbe5', '审核状态');
INSERT INTO `sys_dict` VALUES ('00000000382d48760000000079b1fbe5', '审核状态', 0, 1, '88888888888888888888888888888888', '根节点');
INSERT INTO `sys_dict` VALUES ('ffffffffc580f57b000000005d861734', '博士', 0, 9, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('ffffffff9e454217ffffffffb3d5e955', '硕士', 0, 8, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('00000000461deb28ffffffff87061372', '本科', 0, 7, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('00000000657d8fc30000000044020a60', '专科', 0, 6, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('ffffffffa20005cf0000000044d0c62f', '大专', 0, 5, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('0000000046e43ca9ffffffff8892d864', '中专', 0, 4, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('ffffffffabb9e458000000002264d37b', '高中', 0, 3, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('ffffffffee7f2588ffffffffa9e12b00', '初中', 0, 2, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('00000000090b40d7ffffffffb92e9caa', '小学', 0, 1, '0000000051f9d61affffffff8405fc42', '学历');
INSERT INTO `sys_dict` VALUES ('0000000051f9d61affffffff8405fc42', '学历', 0, 1, '88888888888888888888888888888888', '根节点');

-- ----------------------------
-- Table structure for sys_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_logs`;
CREATE TABLE `sys_login_logs`  (
  `kid` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录账号',
  `flag` smallint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否登录成功(0失败;1成功)',
  `login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录ip',
  `login_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登录时间',
  PRIMARY KEY (`kid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_logs
-- ----------------------------
INSERT INTO `sys_login_logs` VALUES (1, 'admin', 1, '192.168.3.108', '2020-10-26 16:57:38');
INSERT INTO `sys_login_logs` VALUES (2, 'admin', 1, '192.168.3.108', '2020-10-26 17:05:25');
INSERT INTO `sys_login_logs` VALUES (3, 'admin', 1, '192.168.3.108', '2020-10-26 17:06:33');
INSERT INTO `sys_login_logs` VALUES (4, 'super', 0, '192.168.3.108', '2020-10-26 17:07:05');
INSERT INTO `sys_login_logs` VALUES (5, 'admin', 1, '192.168.3.108', '2020-10-26 17:07:11');
INSERT INTO `sys_login_logs` VALUES (6, 'admin', 1, '192.168.3.108', '2020-10-26 17:07:42');
INSERT INTO `sys_login_logs` VALUES (7, 'admin', 1, '192.168.3.108', '2020-10-26 17:16:07');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单标识(权限标识)',
  `category` smallint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '权限类型(1查询;2编辑;3删除;4添加)',
  `icon_style` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'menu-icon fa fa-caret-right' COMMENT '元素span后面的i元素样式',
  `pid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '88888888888888888888888888888888' COMMENT '父级id',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'javascript:;' COMMENT 'url路径',
  `subset` smallint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否含子节点(1含子节点;0不含)',
  `type` smallint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '菜单类型(1导航菜单;2普通按钮;3行内按钮)',
  `relation` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '88888888888888888888888888888888' COMMENT '菜单层次级别关系(限制最多就8级导航菜单)',
  `order_by` smallint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_menu_permission`(`permission`) USING BTREE,
  UNIQUE INDEX `index_menu_url`(`url`) USING BTREE,
  UNIQUE INDEX `index_menu_relation`(`relation`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0000000006a9099300000000100d10cd', '获取数据列表(搜索)', 'menu_btn_listData', 1, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/listData', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@0000000006a9099300000000100d10cd', 1);
INSERT INTO `sys_menu` VALUES ('000000000ba93c43ffffffffe5c59508', '添加', 'menu_btn_add', 1, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/add', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@000000000ba93c43ffffffffe5c59508', 2);
INSERT INTO `sys_menu` VALUES ('000000000ff54fcbffffffffbbe16acc', '添加', 'dictionary_btn_add', 4, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/add', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffffdc83a84dffffffffe53ca925@000000000ff54fcbffffffffbbe16acc', 2);
INSERT INTO `sys_menu` VALUES ('000000002441c5fe000000005f6b6829', '获取单条数据', 'dictionary_row_queryById', 1, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/queryById', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffffdc83a84dffffffffe53ca925@000000002441c5fe000000005f6b6829', 4);
INSERT INTO `sys_menu` VALUES ('000000002d8402d60000000072f7dea2', '获取数据列表(搜索)', 'user_btn_listData', 1, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/listData', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@000000002d8402d60000000072f7dea2', 1);
INSERT INTO `sys_menu` VALUES ('000000002e18cf48ffffffffab242e16', '角色菜单(保存)', 'role_row_saveRoleMenu', 4, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/saveRoleMenu', 0, 2, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff@000000002e18cf48ffffffffab242e16', 8);
INSERT INTO `sys_menu` VALUES ('0000000035fbca03000000003a33d6b7', '删除(批量删除)', 'user_btn_delByKeys', 3, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/delByKeys', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@0000000035fbca03000000003a33d6b7', 5);
INSERT INTO `sys_menu` VALUES ('000000003a56d4fb0000000037016444', '角色(保存)', 'user_btn_row_saveAllotRole', 4, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/saveAllotRole', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@000000003a56d4fb0000000037016444', 9);
INSERT INTO `sys_menu` VALUES ('000000003da08df5ffffffffc394ba29', '删除', 'department_delById', 3, 'menu-icon fa fa-caret-right', 'ffffffffa8b52b0d000000007e7de9c8', 'department/delById', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffffa8b52b0d000000007e7de9c8@000000003da08df5ffffffffc394ba29', 4);
INSERT INTO `sys_menu` VALUES ('000000004cb26aeeffffffffa8f37b4b', '获取数据列表(搜索)', 'loginLogs_btn_listData', 1, 'menu-icon fa fa-caret-right', 'ffffffffc034a8e00000000032ebfbeb', 'loginLogs/listData', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffc034a8e00000000032ebfbeb@000000004cb26aeeffffffffa8f37b4b', 1);
INSERT INTO `sys_menu` VALUES ('00000000545f18ddffffffff9482ed27', '删除(行内删除)', 'dictionary_row_delById', 3, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/delById', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffffdc83a84dffffffffe53ca925@00000000545f18ddffffffff9482ed27', 5);
INSERT INTO `sys_menu` VALUES ('0000000058e2ec83000000002f978e03', '编辑', 'menu_row_edit', 2, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/edit', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@0000000058e2ec83000000002f978e03', 4);
INSERT INTO `sys_menu` VALUES ('000000005c41138100000000288a6b45', '删除(行内删除)', 'menu_row_delById', 3, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/delById', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@000000005c41138100000000288a6b45', 3);
INSERT INTO `sys_menu` VALUES ('000000007330a2a9ffffffff98cebe66', '添加', 'user_btn_add', 4, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/add', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@000000007330a2a9ffffffff98cebe66', 2);
INSERT INTO `sys_menu` VALUES ('0000000077224459ffffffffc9d752ca', '启用禁用', 'user_row_editEnabled', 2, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/editEnabled', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@0000000077224459ffffffffc9d752ca', 10);
INSERT INTO `sys_menu` VALUES ('000000007937b8de0000000034ef3b70', '清空菜单', 'role_row_delEmptyMenu', 3, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/delEmptyMenu', 0, 3, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff@000000007937b8de0000000034ef3b70', 6);
INSERT INTO `sys_menu` VALUES ('000000007a3bebc1ffffffffc0d19222', '角色(查询)', 'user_btn_row_getAllotRole', 1, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/getAllotRole', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@000000007a3bebc1ffffffffc0d19222', 8);
INSERT INTO `sys_menu` VALUES ('000000007ea75783000000004607fdec', '编辑', 'user_row_edit', 2, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/edit', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@000000007ea75783000000004607fdec', 3);
INSERT INTO `sys_menu` VALUES ('111fffffbd911aa0ffffffffd5637fff', '角色权限', 'page_sys_role', 1, 'menu-icon fa fa-caret-right', 'ffffffffae50baba000000000e0fdbc7', 'sys_role.html', 0, 1, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff', 3);
INSERT INTO `sys_menu` VALUES ('ffffffff84e5da13fffffffface485ec', '删除(批量删除)', 'dictionary_btn_delByKeys', 3, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/delByKeys', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffffdc83a84dffffffffe53ca925@ffffffff84e5da13fffffffface485ec', 6);
INSERT INTO `sys_menu` VALUES ('ffffffff87212d7d000000005fbd6e98', '添加', 'role_btn_add', 4, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/add', 0, 2, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff@ffffffff87212d7d000000005fbd6e98', 2);
INSERT INTO `sys_menu` VALUES ('ffffffff8b559df0ffffffff834bba04', '系统设置', 'page_sys_setting', 1, 'menu-icon fa fa-cog', '88888888888888888888888888888888', 'sys_setting', 1, 1, 'ffffffff8b559df0ffffffff834bba04', 1);
INSERT INTO `sys_menu` VALUES ('ffffffff8c468a55ffffffff8f59d635', '用户账号', 'page_sys_user', 1, 'menu-icon fa fa-caret-right', 'ffffffffae50baba000000000e0fdbc7', 'sys_user.html', 0, 1, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635', 2);
INSERT INTO `sys_menu` VALUES ('ffffffff8e6151ff0000000015f6e145', '删除(行内删除)', 'role_row_delById', 3, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/delById', 0, 3, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff@ffffffff8e6151ff0000000015f6e145', 4);
INSERT INTO `sys_menu` VALUES ('ffffffff93f9086effffffffb4a239cd', '删除(批量删除)', 'role_btn_delByKeys', 3, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/delByKeys', 0, 2, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff@ffffffff93f9086effffffffb4a239cd', 5);
INSERT INTO `sys_menu` VALUES ('ffffffff983d99e6ffffffff9a4c304c', '编辑', 'dictionary_row_edit', 2, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/edit', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffffdc83a84dffffffffe53ca925@ffffffff983d99e6ffffffff9a4c304c', 3);
INSERT INTO `sys_menu` VALUES ('ffffffff9db05c1000000000002e5179', '私有菜单(查询)', 'user_row_getOwnMenu', 1, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/getOwnMenu', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@ffffffff9db05c1000000000002e5179', 6);
INSERT INTO `sys_menu` VALUES ('ffffffff9dcbdcebffffffff99573f80', '私有菜单(保存)', 'user_row_saveOwnMenu', 4, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/saveOwnMenu', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@ffffffff9dcbdcebffffffff99573f80', 7);
INSERT INTO `sys_menu` VALUES ('ffffffffa8b52b0d000000007e7de9c8', '组织部门', 'page_department', 1, 'menu-icon fa fa-caret-right', 'ffffffffae50baba000000000e0fdbc7', 'department.html', 0, 1, 'ffffffffae50baba000000000e0fdbc7@ffffffffa8b52b0d000000007e7de9c8', 4);
INSERT INTO `sys_menu` VALUES ('ffffffffae50baba000000000e0fdbc7', '基础数据', 'page_base_data', 1, 'menu-icon fa fa-futbol-o', '88888888888888888888888888888888', 'nav_base_data', 1, 1, 'ffffffffae50baba000000000e0fdbc7', 2);
INSERT INTO `sys_menu` VALUES ('ffffffffb6c53999ffffffffe7762b90', '获取部门信息', 'department_queryAllDepartment', 1, 'menu-icon fa fa-caret-right', 'ffffffffa8b52b0d000000007e7de9c8', 'department/queryAllDepartment', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffffa8b52b0d000000007e7de9c8@ffffffffb6c53999ffffffffe7762b90', 1);
INSERT INTO `sys_menu` VALUES ('ffffffffb71281a2ffffffffd931eb95', '删除(行内删除)', 'user_row_delById', 3, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/delById', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@ffffffffb71281a2ffffffffd931eb95', 4);
INSERT INTO `sys_menu` VALUES ('ffffffffc034a8e00000000032ebfbeb', '登录日志', 'nav_login_permission', 1, 'menu-icon fa fa-caret-right', 'ffffffff8b559df0ffffffff834bba04', 'login_logs.html', 0, 1, 'ffffffff8b559df0ffffffff834bba04@ffffffffc034a8e00000000032ebfbeb', 2);
INSERT INTO `sys_menu` VALUES ('ffffffffc43097b8000000003a72e62f', '权限菜单', 'user_row_getMenuData', 1, 'menu-icon fa fa-caret-right', 'ffffffff8c468a55ffffffff8f59d635', 'user/getMenuData', 0, 3, 'ffffffffae50baba000000000e0fdbc7@ffffffff8c468a55ffffffff8f59d635@ffffffffc43097b8000000003a72e62f', 11);
INSERT INTO `sys_menu` VALUES ('ffffffffc9421e24ffffffffe4170035', '获取数据列表(搜索)', 'dictionary_btn_listData', 1, 'menu-icon fa fa-caret-right', 'ffffffffdc83a84dffffffffe53ca925', 'dictionary/listData', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffffdc83a84dffffffffe53ca925@ffffffffc9421e24ffffffffe4170035', 1);
INSERT INTO `sys_menu` VALUES ('ffffffffd39992beffffffffa1474912', '编辑', 'department_edit', 2, 'menu-icon fa fa-caret-right', 'ffffffffa8b52b0d000000007e7de9c8', 'department/edit', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffffa8b52b0d000000007e7de9c8@ffffffffd39992beffffffffa1474912', 3);
INSERT INTO `sys_menu` VALUES ('ffffffffdae3cd4affffffff9894b623', '角色菜单(查询)', 'role_row_getRoleMenu', 1, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/getRoleMenu', 0, 2, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff@ffffffffdae3cd4affffffff9894b623', 7);
INSERT INTO `sys_menu` VALUES ('ffffffffdb1ecd68ffffffffaa56bc49', '添加', 'department_add', 4, 'menu-icon fa fa-caret-right', 'ffffffffa8b52b0d000000007e7de9c8', 'department/add', 0, 2, 'ffffffffae50baba000000000e0fdbc7@ffffffffa8b52b0d000000007e7de9c8@ffffffffdb1ecd68ffffffffaa56bc49', 2);
INSERT INTO `sys_menu` VALUES ('ffffffffdc83a84dffffffffe53ca925', '数据字典', 'page:sys_dict', 1, 'menu-icon fa fa-caret-right', 'ffffffffae50baba000000000e0fdbc7', 'sys_dict.html', 0, 1, 'ffffffffae50baba000000000e0fdbc7@ffffffffdc83a84dffffffffe53ca925', 4);
INSERT INTO `sys_menu` VALUES ('ffffffffddf9f51ffffffffff6157ca3', '根据id获取详情', 'menu_row_queryById', 1, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/queryById', 0, 3, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@ffffffffddf9f51ffffffffff6157ca3', 6);
INSERT INTO `sys_menu` VALUES ('ffffffffdfaf333c000000001760f4a5', '编辑', 'role_row_edit', 2, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/edit', 0, 3, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff@ffffffffdfaf333c000000001760f4a5', 3);
INSERT INTO `sys_menu` VALUES ('ffffffffe56e8ef0ffffffff912af74a', '菜单管理', 'page_sys_menu', 1, 'menu-icon fa fa-caret-right', 'ffffffff8b559df0ffffffff834bba04', 'sys_menu.html', 0, 1, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a', 1);
INSERT INTO `sys_menu` VALUES ('fffffffff051bf04ffffffffa2ae3c8e', '获取树形菜单', 'menu_btn_queryTreeMenu', 1, 'menu-icon fa fa-caret-right', 'ffffffffe56e8ef0ffffffff912af74a', 'menu/queryTreeMenu', 0, 2, 'ffffffff8b559df0ffffffff834bba04@ffffffffe56e8ef0ffffffff912af74a@fffffffff051bf04ffffffffa2ae3c8e', 5);
INSERT INTO `sys_menu` VALUES ('fffffffffaad7649ffffffffe7c3d6a6', '获取数据列表(搜索)', 'role_btn_listData', 1, 'menu-icon fa fa-caret-right', '111fffffbd911aa0ffffffffd5637fff', 'role/listData', 0, 2, 'ffffffffae50baba000000000e0fdbc7@111fffffbd911aa0ffffffffd5637fff@fffffffffaad7649ffffffffe7c3d6a6', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `role_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_flag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色标识',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_role_name`(`role_name`) USING BTREE,
  UNIQUE INDEX `index_role_flag`(`role_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('000000003035dacf000000000c087217', '游客', 'ROLE_GUEST');
INSERT INTO `sys_role` VALUES ('ffffffffa04b32a6ffffffffba40a72e', '系统管理员', 'ROLE_ADMINISTRATORS');
INSERT INTO `sys_role` VALUES ('ffffffffdc2ebe6a000000006b149e18', '操作员', 'ROLE_OPERATOR');
INSERT INTO `sys_role` VALUES ('ffffffffde90da3fffffffffdef7150f', '管理员', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `role_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色的id(sys_role.kid)',
  `menu_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单的id(sys_menu.kid)',
  PRIMARY KEY (`kid`) USING BTREE,
  INDEX `index_role_menu`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限(菜单)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('ffffffffb01caf92ffffffff9340ac47', 'ffffffffde90da3fffffffffdef7150f', '0000000006a9099300000000100d10cd');
INSERT INTO `sys_role_menu` VALUES ('ffffffffde27380cffffffffd04ba22a', 'ffffffffde90da3fffffffffdef7150f', '000000000ba93c43ffffffffe5c59508');
INSERT INTO `sys_role_menu` VALUES ('000000007b5e8a10000000000c3af698', 'ffffffffde90da3fffffffffdef7150f', '000000000ff54fcbffffffffbbe16acc');
INSERT INTO `sys_role_menu` VALUES ('000000006388570affffffffeaaf0bcd', 'ffffffffde90da3fffffffffdef7150f', '000000002441c5fe000000005f6b6829');
INSERT INTO `sys_role_menu` VALUES ('ffffffff9736b9c7ffffffffa978dd23', 'ffffffffde90da3fffffffffdef7150f', '000000002d8402d60000000072f7dea2');
INSERT INTO `sys_role_menu` VALUES ('0000000028edccfb000000004c9c8bac', 'ffffffffde90da3fffffffffdef7150f', '000000002e18cf48ffffffffab242e16');
INSERT INTO `sys_role_menu` VALUES ('00000000725186dcffffffffdfed34ee', 'ffffffffde90da3fffffffffdef7150f', '0000000035fbca03000000003a33d6b7');
INSERT INTO `sys_role_menu` VALUES ('ffffffffe261be7e000000000fae5291', 'ffffffffde90da3fffffffffdef7150f', '000000003a56d4fb0000000037016444');
INSERT INTO `sys_role_menu` VALUES ('fffffffff127dc990000000056e70ef5', 'ffffffffde90da3fffffffffdef7150f', '000000003da08df5ffffffffc394ba29');
INSERT INTO `sys_role_menu` VALUES ('ffffffff949349ca0000000064e93087', 'ffffffffde90da3fffffffffdef7150f', '000000004cb26aeeffffffffa8f37b4b');
INSERT INTO `sys_role_menu` VALUES ('ffffffffe96ea6ff000000005de3ea68', 'ffffffffde90da3fffffffffdef7150f', '00000000545f18ddffffffff9482ed27');
INSERT INTO `sys_role_menu` VALUES ('000000007939277effffffffde5a2f69', 'ffffffffde90da3fffffffffdef7150f', '0000000058e2ec83000000002f978e03');
INSERT INTO `sys_role_menu` VALUES ('000000006b2b8815ffffffff96f20b30', 'ffffffffde90da3fffffffffdef7150f', '000000005c41138100000000288a6b45');
INSERT INTO `sys_role_menu` VALUES ('000000000b87a7f7ffffffff9fc511ff', 'ffffffffde90da3fffffffffdef7150f', '000000007330a2a9ffffffff98cebe66');
INSERT INTO `sys_role_menu` VALUES ('ffffffffa777153cffffffffbe06c63a', 'ffffffffde90da3fffffffffdef7150f', '0000000077224459ffffffffc9d752ca');
INSERT INTO `sys_role_menu` VALUES ('000000002d4d3e1dffffffff84dffb19', 'ffffffffde90da3fffffffffdef7150f', '000000007937b8de0000000034ef3b70');
INSERT INTO `sys_role_menu` VALUES ('0000000050c52071000000004a8c3373', 'ffffffffde90da3fffffffffdef7150f', '000000007a3bebc1ffffffffc0d19222');
INSERT INTO `sys_role_menu` VALUES ('000000001ebcb541000000005e28e3b6', 'ffffffffde90da3fffffffffdef7150f', '000000007ea75783000000004607fdec');
INSERT INTO `sys_role_menu` VALUES ('000000002f9e94fbffffffffbdf7b7a5', 'ffffffffde90da3fffffffffdef7150f', '111fffffbd911aa0ffffffffd5637fff');
INSERT INTO `sys_role_menu` VALUES ('ffffffffcdc3bed9ffffffffd7d75c5c', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff84e5da13fffffffface485ec');
INSERT INTO `sys_role_menu` VALUES ('fffffffff706648dfffffffff78a96ef', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff87212d7d000000005fbd6e98');
INSERT INTO `sys_role_menu` VALUES ('ffffffff9c825fdcffffffffb43c531a', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff8b559df0ffffffff834bba04');
INSERT INTO `sys_role_menu` VALUES ('000000007f0548af0000000030b978ef', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff8c468a55ffffffff8f59d635');
INSERT INTO `sys_role_menu` VALUES ('ffffffffcb2e9befffffffff998e91f4', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff8e6151ff0000000015f6e145');
INSERT INTO `sys_role_menu` VALUES ('000000006b65ea74ffffffffbf25b3ad', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff93f9086effffffffb4a239cd');
INSERT INTO `sys_role_menu` VALUES ('0000000039e6e20bffffffffe882801f', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff983d99e6ffffffff9a4c304c');
INSERT INTO `sys_role_menu` VALUES ('ffffffffffcd348bfffffffff96fa7d7', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff9db05c1000000000002e5179');
INSERT INTO `sys_role_menu` VALUES ('000000001b5de0150000000064c20e86', 'ffffffffde90da3fffffffffdef7150f', 'ffffffff9dcbdcebffffffff99573f80');
INSERT INTO `sys_role_menu` VALUES ('0000000058c5e94cfffffffff7c90491', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffa8b52b0d000000007e7de9c8');
INSERT INTO `sys_role_menu` VALUES ('00000000290163a4ffffffff8ce996a4', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffae50baba000000000e0fdbc7');
INSERT INTO `sys_role_menu` VALUES ('fffffffff8da072cffffffffde480459', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffb6c53999ffffffffe7762b90');
INSERT INTO `sys_role_menu` VALUES ('0000000060a5fe53ffffffffe18aa04b', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffb71281a2ffffffffd931eb95');
INSERT INTO `sys_role_menu` VALUES ('0000000053617a3d000000006a4d535b', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffc034a8e00000000032ebfbeb');
INSERT INTO `sys_role_menu` VALUES ('00000000454c157affffffffe8e5d129', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffc43097b8000000003a72e62f');
INSERT INTO `sys_role_menu` VALUES ('ffffffff92876f02ffffffffabab9471', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffc9421e24ffffffffe4170035');
INSERT INTO `sys_role_menu` VALUES ('00000000503a036400000000508bfa2b', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffd39992beffffffffa1474912');
INSERT INTO `sys_role_menu` VALUES ('ffffffffae3822fcffffffff96217fa6', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffdae3cd4affffffff9894b623');
INSERT INTO `sys_role_menu` VALUES ('0000000026aa227f000000006747f5e7', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffdb1ecd68ffffffffaa56bc49');
INSERT INTO `sys_role_menu` VALUES ('ffffffff9db3a954000000005b9156a1', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffdc83a84dffffffffe53ca925');
INSERT INTO `sys_role_menu` VALUES ('ffffffff88ad2b010000000025aad3f4', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffddf9f51ffffffffff6157ca3');
INSERT INTO `sys_role_menu` VALUES ('000000002edfaa04ffffffff9c8e7ac1', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffdfaf333c000000001760f4a5');
INSERT INTO `sys_role_menu` VALUES ('0000000012985a6d000000002b5a8649', 'ffffffffde90da3fffffffffdef7150f', 'ffffffffe56e8ef0ffffffff912af74a');
INSERT INTO `sys_role_menu` VALUES ('ffffffffbcb7f61300000000325985d2', 'ffffffffde90da3fffffffffdef7150f', 'fffffffff051bf04ffffffffa2ae3c8e');
INSERT INTO `sys_role_menu` VALUES ('ffffffff82d4589bffffffffc96fee11', 'ffffffffde90da3fffffffffdef7150f', 'fffffffffaad7649ffffffffe7c3d6a6');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `type` smallint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户名|账号类型(1系统账号;2注册账号;)',
  `add_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `enabled` smallint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否冻结（0正常1冻结）',
  `logintime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后登录时间',
  `times` int(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '已成功登录次数,默认为1，每次累加1',
  `error_count` smallint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录错误次数',
  `error_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录登录错误的时刻',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0000000046e62728000000005d3ed02e', 'admin0', 1, '2020-10-11 11:00:01', 0, '2020-10-11 11:00:56', 3, 0, '2020-10-11 11:00:56');
INSERT INTO `sys_user` VALUES ('ffffffffddf9f1ffffffffff88888888', 'admin', 1, '2020-04-15 22:39:30', 0, '2020-10-26 17:16:07', 143, 0, '2020-10-26 17:16:07');

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门机构账号主键',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号id主键(sys_user.kid)',
  `dep_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织机构id主键',
  PRIMARY KEY (`kid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构部门账号' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for sys_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户菜单(私有菜单)id',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id(sys_user.kid)',
  `menu_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单id(sys_menu.kid)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`kid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户菜单(私有菜单)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_menu
-- ----------------------------
INSERT INTO `sys_user_menu` VALUES ('f7b464700b6d11eb812c0242ac110002', '0000000046e62728000000005d3ed02e', 'ffffffff8b559df0ffffffff834bba04', '2020-10-11 11:00:50');
INSERT INTO `sys_user_menu` VALUES ('f7b466a10b6d11eb812c0242ac110002', '0000000046e62728000000005d3ed02e', 'ffffffffe56e8ef0ffffffff912af74a', '2020-10-11 11:00:50');
INSERT INTO `sys_user_menu` VALUES ('f7b467670b6d11eb812c0242ac110002', '0000000046e62728000000005d3ed02e', '0000000006a9099300000000100d10cd', '2020-10-11 11:00:50');
INSERT INTO `sys_user_menu` VALUES ('f7b467ee0b6d11eb812c0242ac110002', '0000000046e62728000000005d3ed02e', '000000000ba93c43ffffffffe5c59508', '2020-10-11 11:00:50');

-- ----------------------------
-- Table structure for sys_user_password
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_password`;
CREATE TABLE `sys_user_password`  (
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'user主键(sys_user.kid)',
  `user_password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号密码',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `index_user_name`(`user_password`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户密码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_password
-- ----------------------------
INSERT INTO `sys_user_password` VALUES ('ffffffffddf9f1ffffffffff88888888', '$2a$10$2swupMvymbSVqW1qHWaxCuI4rv/Er6EdSqlVTKqe.wTqgGUGhLaDm');
INSERT INTO `sys_user_password` VALUES ('0000000046e62728000000005d3ed02e', '$2a$10$zdWGIbqAoMU.XhQiCAwH/ubi5gWFwExQW.1z4eMdXQjgztvjhO0OC');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `kid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名|账号的id(sys_user.kid)',
  `role_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色的id(sys_role.kid)',
  PRIMARY KEY (`kid`) USING BTREE,
  UNIQUE INDEX `index_user_role`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('ffffffffa04b32a6ffffffffba40ffff', 'ffffffffddf9f1ffffffffff88888888', 'ffffffffa04b32a6ffffffffba40a72e');
INSERT INTO `sys_user_role` VALUES ('fffffffff051bf04ffffffffa2afffff', 'ffffffffddf9f1ffffffffff88888888', 'ffffffffde90da3fffffffffdef7150f');

-- ----------------------------
-- View structure for view_user_login
-- ----------------------------
DROP VIEW IF EXISTS `view_user_login`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_user_login` AS select `su`.`kid` AS `kid`,`su`.`user_name` AS `user_name`,`sup`.`user_password` AS `user_password`,`su`.`enabled` AS `enabled`,`su`.`error_count` AS `error_count`,`su`.`error_time` AS `error_time` from (`sys_user` `su` join `sys_user_password` `sup`) where (`su`.`kid` = `sup`.`user_id`);

SET FOREIGN_KEY_CHECKS = 1;
