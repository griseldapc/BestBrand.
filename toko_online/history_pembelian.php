<!DOCTYPE html>
<html>
    <head>
        <title>TRANSAKSI</title>
        <link href="ASSETS/RANDOM/LOGO.png" rel="shortcut icon">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link href="style_header.css" rel="stylesheet">
        <link href="style_home.css" rel="stylesheet">
        <link href="style_table.css" rel="stylesheet">
    </head>
    <body>
<?php 
    // session_start();
     include "header_toko.php";
    $id = $_SESSION['id_petugas'];
   
?>
<div class="sidebar">
            <center>
                <!-- <img name="foto" src="ASSETS/tb/<?=$_SESSION["foto"]?>" class="profile-img" alt=""> -->
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
                        <a href="history_pembelian.php" class="active"><span class="las la-shopping-cart"></span>
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
<!-- <h2>Histori Pembelian Produk</h2> -->
<table class="table table-hover table-striped">
    <thead>
        <th>NO</th>
        <th>Tanggal Bayar</th>
        <th>Tanggal Sampai</th>
        <th>Nama Produk</th>
        <th>Status</th>
        <th>Aksi</th>
        <th>Hapus</th>
    </thead>
    <tbody>
        <?php 
        include "koneksitoko.php";
        if($_SESSION['level']=="petugas"){
            $qry_histori=mysqli_query($conn,"select * from transaksi order by id_transaksi desc");
        }elseif($_SESSION['level']=="pelanggan"){
            $qry_histori=mysqli_query($conn,"select * from transaksi where id_petugas ='".$id."' order by id_transaksi desc");
        }
        $no=0;
        while($dt_histori=mysqli_fetch_array($qry_histori)){
            $no++;
            //menampilkan produk yang dibeli
            $produk_dibeli="<ol>";
            $qry_produk=mysqli_query($conn,"select * from  detail_transaksi join produk on produk.id_produk=detail_transaksi.id_produk where id_transaksi = '".$dt_histori['id_transaksi']."'");
            while($dt_produk=mysqli_fetch_array($qry_produk)){
                $produk_dibeli.="<li>".$dt_produk['nama_produk']."</li>";
            }
            $produk_dibeli.="</ol>";
            //menampilkan status sudah kembali atau belum
            $qry_cek_sampai=mysqli_query($conn,"select * from produk_sampai where id_transaksi = '".$dt_histori['id_transaksi']."'");
            if(mysqli_num_rows($qry_cek_sampai)>0){
                $dt_sampai=mysqli_fetch_array($qry_cek_sampai);
                $denda="denda Rp. ".$dt_sampai['denda'];
                $status_sampai="<label class='alert alert-success'>Sudah sampai <br>".$denda."</label>";
                $button_sampai="";
            } else {
                $status_sampai="<label class='alert alert-danger'>Belum sampai</label>";
                $button_sampai="<a href='sampai.php?id=".$dt_histori['id_transaksi']."' class='btn btn-warning' onclick='return confirm(\"Apakah anda yakin?\")'>Sampai</a>";
            }
            $button_hapus="<a href='hapus_history.php?id_transaksi=".$dt_histori['id_transaksi']."' class='btn btn-danger' onclick='return confirm(\"Apakah anda yakin menghapus data ini?\")'>Hapus</a>";
        ?>
            <tr>
                <td><?=$no?></td>
                <td><?=$dt_histori['tanggal_bayar']?></td>
                <td><?=$dt_histori['tanggal_sampai']?></td>
                <td><?=$produk_dibeli?></td>
                <td><?=$status_sampai?></td>
                <td><?=$button_sampai?></td>
                <td><?=$button_hapus?></td>
            </tr>
        <?php
        }
        ?>
    </tbody>
</table>
</html>
<?php 
    include "footer_toko.php";
?>