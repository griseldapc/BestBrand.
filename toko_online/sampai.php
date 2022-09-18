<?php 
if($_GET['id']){
    include "koneksitoko.php";
    $id_transaksi=$_GET['id'];
    $cek_terlambat=mysqli_query($conn, "select * from transaksi where id_transaksi = '".$id_transaksi."' ");
    $dt_bayar=mysqli_fetch_array($cek_terlambat);
    if(strtotime($dt_bayar['tanggal_sampai'])>=strtotime(date('Y-m-d'))){
        $denda=0;
    } else{
        $harga_denda_perhari=5000;
        $tanggal_sampai = new DateTime();
        $tgl_harus_sampai = new DateTime($dt_bayar['tanggal_sampai']); 
        $selisih_hari = $tanggal_sampai->diff($tgl_harus_sampai)->d;
        $denda=$selisih_hari*$harga_denda_perhari;
    }
    mysqli_query($conn, "insert into produk_sampai (id_transaksi, tanggal_sampai,denda) value('".$id_transaksi."','".date('Y-m-d')."','".$denda."')");
    header('location: history_pembelian.php');
}
?>