<!DOCTYPE html>
<html>
    <head>
        <title>KERANJANG</title>
        <link href="ASSETS/RANDOM/LOGO.png" rel="shortcut icon">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link href="style_home.css" rel="stylesheet">
        <link href="style_header.css" rel="stylesheet">
        <link href="style_table.css" rel="stylesheet">
    </head>
    <body>
<?php 
    include "header_toko.php";
?>
<div class="sidebar">
            <center>
                <!-- <img name="foto" src="ASSETS/foto/<?=$_SESSION["foto"]?>" class="profile-img" alt=""> -->
                <h2><?=$_SESSION["nama_petugas"]?></h2>
            </center>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="home_toko.php"><span class="las la-home"></span>
                        <span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href="produk.php"><span class="las la-hamburger"></span>
                        <span>Product</span></a>
                    </li>
                    <li>
                        <a href="history_pembelian.php"><span class="las la-shopping-cart"></span>
                        <span>Transaction</span></a>
                    </li>
                    <!-- <li>
                        <a href="tampil_petugas.php"><span class="las la-user-astronaut"></span>
                        <span>Admin</span></a>
                    </li>
                    <li>
                        <a href="tampil_pelanggan.php"><span class="las la-user-friends"></span>
                        <span>Customer</span></a>
                    </li> -->
                </ul>
            </div>
        </div>
<h2>Daftar Produk di Keranjang</h2>
<table class="table table-hover striped">
    <thead>
        <tr>
            <th>NO</th>
            <th>Nama Produk</th>
            <th>Jumlah</th>
            <th>Total Harga</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach (@$_SESSION['cart'] as $key_produk => $val_produk): ?>
            <tr>
                <td>
                    <?=($key_produk+1)?>
                </td>
                <td>
                    <?=$val_produk['nama_produk']?>
                </td>
                <td>
                    <?=$val_produk['qty']?>
                </td>
                <td>
                    <?=$val_produk['harga']* $val_produk['qty']?>
                </td>
                <td>
                    <a href="hapus_cart.php?id=<?=$key_produk?>" class="btn btn-danger"><strong>Hapus</strong></a>
                </td>
            </tr>
        <?php endforeach ?>
    </tbody>
    <tr>
        <td>
        <a href="checkout.php?id=<?=$key_produk?>" class="btn btn-danger"><strong>Check Out</strong></a>
        <a href="produk.php?id=<?=$key_produk?>" class="btn btn-danger"><strong>Tambah</strong></a>
        </td>
    </tr>
</table>
<!-- <a href="produk.php" class="btn btn-primary">Tambah Produk</a>
<a href="checkout.php" class="btn btn-primary">Check Out</a> -->
<!-- <a href="checkout.php" class="btn btn-primary">Check Out</a> -->
                <!-- <td>
                    <a href="checkout.php?id=<?=$key_produk?>" class="btn btn-danger"><strong>Check Out</strong></a>
                </td> -->
<?php 
    include "footer_toko.php";
?>
