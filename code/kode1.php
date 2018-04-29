<?php
  // buka database
  $file_db = new PDO('sqlite:cobapesan.db');

  // set atribut
  $file_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // buat tabel
  $file_db->exec("CREATE TABLE IF NOT EXISTS pesan (
                  id INTEGER PRIMARY KEY,
                  judul TEXT,
                  pesan TEXT,
                  waktu INTEGER)");
?>