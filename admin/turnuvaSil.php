<?php 
include "../bag.php";
include "include.php";
	$sql="delete from turnuva where turnuvaId=".$_GET['id']."";
	if ($conn->query($sql) === TRUE) {
    echo "organizasyon başarı ile silindi...<br>";
	} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
	}
	header("Refresh: 1; url=".$base_url."/index.php");	