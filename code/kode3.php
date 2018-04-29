<?php
  // buka database
  $file_db = new PDO('sqlite:cobapesan.db');

  // set atribut
  $file_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // atur parameter
  $stmt->bindParam(':judul', $judul);
  $stmt->bindParam(':pesan', $pesan);
  $stmt->bindParam(':waktu', $waktu);

  // looping untuk semua pesan
  foreach ($messages as $m) {
  $judul = $m['judul'];
  $pesan = $m['pesan'];
  $waktu = $m['waktu'];

  // eksekusi
  $stmt->execute();
  } // end foreach


?>