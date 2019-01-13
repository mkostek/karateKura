<?php
include "../../bag.php";
include "../include.php";
session_start();
if(isset($_SESSION['id'])){
	$sql="delete from islem where TCNo=".$_GET["id"]."";
	if ($conn->query($sql) === TRUE) {
    echo "Turnuvadan sporcu başarı ile silindi...<br>";
	} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
	}	
	header("Refresh: 1; url=".$base_url."/kulup/sporcuTurnuva/sporcuTurnuvaEkle.php?tur=".$_GET["tur"]."");
}else header('Location:'.$base_url.'/kulup/kulupGir.php');
	?>
