<?php
include "../../bag.php";
include "../include.php";
	$sql="delete from gorevli where gId=".$_GET['gId']."";
	if ($conn->query($sql) === TRUE) {
    echo "görevli başarı ile silindi...<br>";
	} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
	}
	header("Refresh: 1; url=".$base_url."/hakem/hakemGir.php?id=".$_GET['id']."");	
	?>