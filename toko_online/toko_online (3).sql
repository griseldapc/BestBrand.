-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Sep 2022 pada 09.59
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `id_transaksi`, `id_produk`, `qty`) VALUES
(1, 1, 16, 2),
(2, 2, 13, 1),
(3, 3, 22, 4),
(4, 4, 13, 4),
(5, 4, 16, 1),
(6, 5, 13, 4),
(7, 5, 16, 1),
(8, 6, 13, 1),
(9, 6, 13, 4),
(10, 7, 19, 2),
(11, 8, 13, 1),
(12, 8, 16, 1),
(13, 9, 22, 3),
(14, 10, 13, 1),
(15, 10, 13, 1),
(16, 10, 22, 1),
(17, 10, 13, 1),
(18, 10, 16, 1),
(19, 10, 16, 1),
(20, 11, 13, 1),
(21, 11, 13, 1),
(22, 12, 13, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(50) NOT NULL,
  `foto_pelanggan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `telp`, `foto_pelanggan`) VALUES
(111, 'grisel', 'turen', '0812', ''),
(123, 'grisel', 'turen', '0812', ''),
(222, 'griselda', 'turen', '081', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `level`) VALUES
(11, 'grisel', 'gg', '123', 'pelanggan'),
(12, 'putri', 'pp', '123', 'petugas'),
(18, 'Griselda Putri C', 'griselda', '070805', 'petugas'),
(33, 'ya', 'yy', '111', 'pelanggan'),
(12345, 'grisel', 'griselda', '123', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `foto_produk` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi`, `harga`, `foto_produk`) VALUES
(13, 'Lem Putih (FOX)', 'Lem Putih Serba Guna Terbaik', 17500, 'lem putih.jpg'),
(16, 'Cat Tembok (Dulux) 2,5ltr', 'Tahan Segala Cuaca', 112500, 'cat tembok.jpg'),
(19, 'Cat Kayu (Avian) 100cc', 'Kilap yang Sempurna', 65000, 'cat kayu.jpg'),
(20, 'Thinner Dulux', 'Anti Bau, Kelupas, & Retak', 78000, 'thinner.jpg'),
(21, 'Semen Gresik 40kg', 'Hasil Lebih Halus', 62000, 'semen.jpg'),
(22, 'Semen Putih 40kg', 'Daya Rekat Tinggi', 110000, 'semen putih.jpg'),
(23, 'Cangkul', 'Anti Lengket', 35000, 'cangkul.jpg'),
(24, 'Sabit', 'Lebih Tajam & Kuat', 32000, 'sabit.jpg'),
(25, 'Sekop Pasir', 'Kuat & Ringan', 22500, 'sekop.jpg'),
(26, 'Cetok Tanah', 'Anti Karat, Awet', 21000, 'cetok.jpg'),
(27, 'Kawat 10m', 'Kuat Anti Kendor', 7500, 'kawat.jpg'),
(28, 'Selang Air /m', 'No Bocor Bocor', 15000, 'selang.jpg'),
(29, 'Paku 10pcs', 'Tajam dan Kuat', 5000, 'paku.jpg'),
(30, 'Engsel 4inch', 'Kokoh & Tidak Bising', 32500, 'engsel.jpg'),
(31, 'Kran Air', 'Anti Karat, Rapat', 16000, 'kran air.jpg'),
(34, 'Pompa Air', 'Daya Dorong Kuat', 650000, 'pompa air.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_sampai`
--

CREATE TABLE `produk_sampai` (
  `id_produk_sampai` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `tanggal_sampai` date NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk_sampai`
--

INSERT INTO `produk_sampai` (`id_produk_sampai`, `id_transaksi`, `tanggal_sampai`, `denda`) VALUES
(1, 1, '2022-09-09', 0),
(2, 3, '2022-09-09', 0),
(3, 6, '2022-09-15', 0),
(4, 5, '2022-09-15', 0),
(5, 7, '2022-09-17', 0),
(6, 9, '2022-09-18', 0),
(7, 10, '2022-09-18', 0),
(8, 8, '2022-09-18', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_petugas` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `tanggal_beli` date NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `tanggal_sampai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_petugas`, `id_transaksi`, `tanggal_beli`, `tanggal_bayar`, `tanggal_sampai`) VALUES
(11, 8, '0000-00-00', '2022-09-17', '2022-09-22'),
(11, 9, '0000-00-00', '2022-09-17', '2022-09-22'),
(33, 10, '0000-00-00', '2022-09-18', '2022-09-23'),
(33, 11, '0000-00-00', '2022-09-18', '2022-09-23'),
(18, 12, '0000-00-00', '2022-09-18', '2022-09-23');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_pembelian_produk` (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_sampai`
--
ALTER TABLE `produk_sampai`
  ADD PRIMARY KEY (`id_produk_sampai`),
  ADD KEY `id_pembelian_produk` (`id_transaksi`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_petugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123456790;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `produk_sampai`
--
ALTER TABLE `produk_sampai`
  MODIFY `id_produk_sampai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
