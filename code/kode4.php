<?php
  // buka database
  $file_db = new PDO('sqlite:cobapesan.db');

  // set atribut
  $file_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


  // update tabel
  $judul_baru = $file_db->quote("Hi''\'''\\\"\"!'\"");

  // update
  $update = "UPDATE pesan SET judul = {$judul_baru} 
            WHERE datetime(waktu) > datetime('2012-06-01 15:48:07')";
  $file_db->exec($update);
  $hasil = $file_db->query('SELECT * FROM pesan');

  foreach($hasil as $baris) {
      echo "ID : " . $baris['id'] . "\n";
      echo "Judul : " . $baris['judul'] . "\n";
      echo "Pesan : " . $baris['pesan'] . "\n";
      echo "Waktu : " . $baris['waktu'] . "\n";
      echo "\n";
  }


?>