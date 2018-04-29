<?php
  // buka database
  $file_db = new PDO('sqlite:cobapesan.db');

  // set atribut
  $file_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


  // coba data array
  $messages = array(
                array('judul'=>'Hellow', 'pesan'=>'Ini hanya percobaan elemen array1', 'waktu'=>'1327301464'),
                array('judul'=>'Hellow again', 'pesan'=>'Ini hanya percobaan elemen array2', 'waktu'=>'1339428612'),
                array('judul'=>'Hi', 'pesan'=>'Ini hanya percobaan terakhir', 'waktu'=>'1327214268'));

  // persiapan
  $insert = "INSERT INTO pesan (judul, pesan, waktu)
             VALUES (:judul, :pesan, :waktu)";
  
  $stmt = $file_db->prepare($insert);

 
?>