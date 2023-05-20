/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50734 (5.7.34)
 Source Host           : localhost:3306
 Source Schema         : _agus

 Target Server Type    : MySQL
 Target Server Version : 50734 (5.7.34)
 File Encoding         : 65001

 Date: 18/10/2022 08:28:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `satuan_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of barang
-- ----------------------------
BEGIN;
INSERT INTO `barang` (`id`, `kode`, `nama`, `satuan_id`, `kategori_id`, `harga_beli`, `harga_jual`, `stok`, `created_at`, `updated_at`) VALUES (1, 'RB0001', 'Indomie Goreng', 1, 1, 3000, 4400, 29, '2022-10-17 14:00:00', '2022-10-17 14:57:41');
COMMIT;

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kategori
-- ----------------------------
BEGIN;
INSERT INTO `kategori` (`id`, `nama`) VALUES (1, 'Makanan');
INSERT INTO `kategori` (`id`, `nama`) VALUES (2, 'Pecah Belah');
INSERT INTO `kategori` (`id`, `nama`) VALUES (3, 'Kosmetik');
INSERT INTO `kategori` (`id`, `nama`) VALUES (4, 'Mebel');
COMMIT;

-- ----------------------------
-- Table structure for keranjang_belanja
-- ----------------------------
DROP TABLE IF EXISTS `keranjang_belanja`;
CREATE TABLE `keranjang_belanja` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keranjang_belanja
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pembelian
-- ----------------------------
DROP TABLE IF EXISTS `pembelian`;
CREATE TABLE `pembelian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_transaksi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pembelian
-- ----------------------------
BEGIN;
INSERT INTO `pembelian` (`id`, `total`, `supplier_id`, `created_at`, `updated_at`, `no_transaksi`) VALUES (5, 136400, 1, '2022-10-17 14:42:14', '2022-10-17 14:43:19', 'TRSPB-0001');
COMMIT;

-- ----------------------------
-- Table structure for pembelian_detail
-- ----------------------------
DROP TABLE IF EXISTS `pembelian_detail`;
CREATE TABLE `pembelian_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pembelian_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pembelian_detail
-- ----------------------------
BEGIN;
INSERT INTO `pembelian_detail` (`id`, `pembelian_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (2, 5, 1, 4400, 31, 136400);
COMMIT;

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `retail_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_transaksi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
BEGIN;
INSERT INTO `penjualan` (`id`, `total`, `retail_id`, `created_at`, `updated_at`, `no_transaksi`) VALUES (2, 8800, 2, '2022-10-17 14:24:04', '2022-10-17 14:24:07', 'TRSPJ-0001');
COMMIT;

-- ----------------------------
-- Table structure for penjualan_detail
-- ----------------------------
DROP TABLE IF EXISTS `penjualan_detail`;
CREATE TABLE `penjualan_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `penjualan_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of penjualan_detail
-- ----------------------------
BEGIN;
INSERT INTO `penjualan_detail` (`id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (1, 2, 1, 4400, 2, 8800);
COMMIT;

-- ----------------------------
-- Table structure for retail
-- ----------------------------
DROP TABLE IF EXISTS `retail`;
CREATE TABLE `retail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of retail
-- ----------------------------
BEGIN;
INSERT INTO `retail` (`id`, `nama`, `alamat`, `telp`, `created_at`, `updated_at`) VALUES (2, 'Retail 1', 'jl .sdfsdf', '098765789', '2022-10-17 14:08:28', '2022-10-17 14:08:28');
COMMIT;

-- ----------------------------
-- Table structure for retur_pembelian
-- ----------------------------
DROP TABLE IF EXISTS `retur_pembelian`;
CREATE TABLE `retur_pembelian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_transaksi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of retur_pembelian
-- ----------------------------
BEGIN;
INSERT INTO `retur_pembelian` (`id`, `total`, `supplier_id`, `created_at`, `updated_at`, `no_transaksi`) VALUES (9, 44000, 1, '2022-10-17 14:57:38', '2022-10-17 14:57:41', 'RPB-0001');
COMMIT;

-- ----------------------------
-- Table structure for retur_pembelian_detail
-- ----------------------------
DROP TABLE IF EXISTS `retur_pembelian_detail`;
CREATE TABLE `retur_pembelian_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `retur_pembelian_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of retur_pembelian_detail
-- ----------------------------
BEGIN;
INSERT INTO `retur_pembelian_detail` (`id`, `retur_pembelian_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (2, 9, 1, 4400, 10, 44000);
COMMIT;

-- ----------------------------
-- Table structure for role_users
-- ----------------------------
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `role_users_user_id_role_id_unique` (`user_id`,`role_id`) USING BTREE,
  KEY `role_users_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_users
-- ----------------------------
BEGIN;
INSERT INTO `role_users` (`user_id`, `role_id`) VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'superadmin', '2020-12-23 23:17:35', '2020-12-23 23:17:35');
COMMIT;

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for satuan
-- ----------------------------
DROP TABLE IF EXISTS `satuan`;
CREATE TABLE `satuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of satuan
-- ----------------------------
BEGIN;
INSERT INTO `satuan` (`id`, `nama`) VALUES (1, 'PCS');
INSERT INTO `satuan` (`id`, `nama`) VALUES (2, 'Kotak');
INSERT INTO `satuan` (`id`, `nama`) VALUES (3, 'Botol');
COMMIT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` (`id`, `nama`, `alamat`, `telp`, `created_at`, `updated_at`) VALUES (1, 'PT Indofood', 'jl.....', '0987656789', '2022-10-17 14:03:39', '2022-10-17 14:03:39');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  `password_superadmin` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `api_token` varchar(255) DEFAULT NULL,
  `last_session` varchar(255) DEFAULT NULL,
  `change_password` int(1) unsigned DEFAULT '0' COMMENT '0: belum, 1: sudah',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_username_unique` (`username`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `password_superadmin`, `remember_token`, `created_at`, `updated_at`, `api_token`, `last_session`, `change_password`) VALUES (1, 'superadmin', NULL, 'superadmin', '2022-10-17 23:09:58', '$2y$10$3k7FLC2TkBzYnumOyiv7BOmTOsTzzJHb3/p4aKcBUoGonp4Jij0Wu', NULL, 'XkwHMsfMVuFqnPHHpkOmdXZqE9kSZL2N39dnzvy73LsvdDI24xzKzmrYjTmk', '2022-10-17 23:09:58', '2022-10-17 23:09:58', NULL, NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
