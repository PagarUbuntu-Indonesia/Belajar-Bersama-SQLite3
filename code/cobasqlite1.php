<?php
  // buka database
  $file_db = new PDO('sqlite:cobasqlite.sqlite3');

  // set atribut
  $file_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // buat tabel
  $file_db->exec("CREATE TABLE IF NOT EXISTS pesan (
                  id INTEGER PRIMARY KEY,
                  judul TEXT,
                  pesan TEXT,
                  waktu INTEGER)");

  // coba data array
  $messages = array(
                array('judul'=>'Hellow', 'pesan'=>'Ini hanya percobaan elemen array1', 'waktu'=>'1327301464'),
                array('judul'=>'Hellow again', 'pesan'=>'Ini hanya percobaan elemen array2', 'waktu'=>'1339428612'),
                array('judul'=>'Hi', 'pesan'=>'Ini hanya percobaan terakhir', 'waktu'=>'1327214268'));

  // persiapan
  $insert = "INSERT INTO pesan (judul, pesan, waktu)
             VALUES (:judul, :pesan, :waktu)";
  
  $stmt = $file_db->prepare($insert);

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


  // drop table
  $file_db->exec("DROP TABLE pesan");

  // keluar dari koneksi database
  $file_db = null;  


?>