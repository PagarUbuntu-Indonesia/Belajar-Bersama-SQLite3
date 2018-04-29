<?php
  // buka database
  $file_db = new PDO('sqlite:cobapesan.db');

  // set atribut
  $file_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);



  // drop table
  $file_db->exec("DROP TABLE pesan");
  echo "berhasil dihapus";

  // keluar dari koneksi database
  $file_db = null;  
  echo "berhasil keluar koneksi database";


?>