/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50734 (5.7.34)
 Source Host           : localhost:3306
 Source Schema         : tokomas

 Target Server Type    : MySQL
 Target Server Version : 50734 (5.7.34)
 File Encoding         : 65001

 Date: 07/06/2023 13:31:56
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
  `satuan_id` int(11) unsigned DEFAULT NULL,
  `kategori_id` int(11) unsigned DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `satuan_id_barang` (`satuan_id`),
  KEY `kategori_id_barang` (`kategori_id`),
  CONSTRAINT `kategori_id_barang` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `satuan_id_barang` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of barang
-- ----------------------------
BEGIN;
INSERT INTO `barang` (`id`, `kode`, `nama`, `satuan_id`, `kategori_id`, `harga_beli`, `harga_jual`, `stok`, `created_at`, `updated_at`) VALUES (2, 'RB0001', 'Cincin Motif Bunga 5g', 1, 2, 4000000, 5000000, 26, '2023-05-19 17:30:46', '2023-05-19 17:49:19');
INSERT INTO `barang` (`id`, `kode`, `nama`, `satuan_id`, `kategori_id`, `harga_beli`, `harga_jual`, `stok`, `created_at`, `updated_at`) VALUES (3, 'RB0002', 'Gelang 10g Motif Bintang', 1, 1, 9000000, 10000000, 13, '2023-05-19 17:31:10', '2023-05-19 17:48:04');
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
INSERT INTO `kategori` (`id`, `nama`) VALUES (1, 'Gelang');
INSERT INTO `kategori` (`id`, `nama`) VALUES (2, 'Cincin');
INSERT INTO `kategori` (`id`, `nama`) VALUES (3, 'Kalung');
INSERT INTO `kategori` (`id`, `nama`) VALUES (4, 'Batang');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `supplier_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_transaksi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id_pembelian` (`supplier_id`),
  CONSTRAINT `supplier_id_pembelian` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pembelian
-- ----------------------------
BEGIN;
INSERT INTO `pembelian` (`id`, `total`, `supplier_id`, `created_at`, `updated_at`, `no_transaksi`) VALUES (6, 25000000, 1, '2023-05-19 17:44:44', '2023-05-19 17:44:50', 'TRSPB-0001');
INSERT INTO `pembelian` (`id`, `total`, `supplier_id`, `created_at`, `updated_at`, `no_transaksi`) VALUES (7, 95000000, 1, '2023-05-19 17:49:15', '2023-05-19 17:49:19', 'TRSPB-0002');
COMMIT;

-- ----------------------------
-- Table structure for pembelian_detail
-- ----------------------------
DROP TABLE IF EXISTS `pembelian_detail`;
CREATE TABLE `pembelian_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pembelian_id` int(11) unsigned DEFAULT NULL,
  `barang_id` int(11) unsigned DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pembelian_detail
-- ----------------------------
BEGIN;
INSERT INTO `pembelian_detail` (`id`, `pembelian_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (2, 5, 1, 4400, 31, 136400);
INSERT INTO `pembelian_detail` (`id`, `pembelian_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (3, 6, 2, 5000000, 1, 5000000);
INSERT INTO `pembelian_detail` (`id`, `pembelian_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (4, 6, 3, 10000000, 2, 20000000);
INSERT INTO `pembelian_detail` (`id`, `pembelian_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (5, 7, 2, 5000000, 19, 95000000);
COMMIT;

-- ----------------------------
-- Table structure for penjualan
-- ----------------------------
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `retail_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no_transaksi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `retail_id_penjualan` (`retail_id`),
  CONSTRAINT `retail_id_penjualan` FOREIGN KEY (`retail_id`) REFERENCES `retail` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of penjualan
-- ----------------------------
BEGIN;
INSERT INTO `penjualan` (`id`, `total`, `retail_id`, `created_at`, `updated_at`, `no_transaksi`) VALUES (3, 5000000, 4, '2023-05-19 17:45:42', '2023-05-19 17:45:45', 'TRSPJ-0001');
INSERT INTO `penjualan` (`id`, `total`, `retail_id`, `created_at`, `updated_at`, `no_transaksi`) VALUES (4, 10000000, 5, '2023-05-19 17:46:27', '2023-05-19 17:46:29', 'TRSPJ-0002');
INSERT INTO `penjualan` (`id`, `total`, `retail_id`, `created_at`, `updated_at`, `no_transaksi`) VALUES (5, 15000000, 5, '2023-05-19 17:48:01', '2023-05-19 17:48:04', 'TRSPJ-0003');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of penjualan_detail
-- ----------------------------
BEGIN;
INSERT INTO `penjualan_detail` (`id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (1, 2, 1, 4400, 2, 8800);
INSERT INTO `penjualan_detail` (`id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (2, 3, 2, 5000000, 1, 5000000);
INSERT INTO `penjualan_detail` (`id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (3, 4, 2, 5000000, 2, 10000000);
INSERT INTO `penjualan_detail` (`id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (4, 5, 3, 10000000, 1, 10000000);
INSERT INTO `penjualan_detail` (`id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `subtotal`) VALUES (5, 5, 2, 5000000, 1, 5000000);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of retail
-- ----------------------------
BEGIN;
INSERT INTO `retail` (`id`, `nama`, `alamat`, `telp`, `created_at`, `updated_at`) VALUES (4, 'Adi', 'jl pramuka k 6 gg teratai', '098765456789', '2023-05-19 17:32:18', '2023-05-19 17:32:18');
INSERT INTO `retail` (`id`, `nama`, `alamat`, `telp`, `created_at`, `updated_at`) VALUES (5, 'Budi', 'Jl Sultan Adam', '0987654567890', '2023-05-19 17:32:26', '2023-05-19 17:32:26');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of satuan
-- ----------------------------
BEGIN;
INSERT INTO `satuan` (`id`, `nama`) VALUES (1, 'PCS');
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
INSERT INTO `supplier` (`id`, `nama`, `alamat`, `telp`, `created_at`, `updated_at`) VALUES (1, 'PT Antam', 'jl.....', '0987656789', '2022-10-17 14:03:39', '2023-05-19 17:31:23');
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
INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `password_superadmin`, `remember_token`, `created_at`, `updated_at`, `api_token`, `last_session`, `change_password`) VALUES (1, 'superadmin', NULL, 'superadmin', '2023-05-20 02:01:48', '$2y$10$3k7FLC2TkBzYnumOyiv7BOmTOsTzzJHb3/p4aKcBUoGonp4Jij0Wu', NULL, 'hjigWN2PGuYaRY540P0DydOZ7Y9Z0Qo1568BvQ675UikHOY8PtutNq4eKKf6', '2023-05-20 02:01:48', '2023-05-20 02:01:48', NULL, NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
