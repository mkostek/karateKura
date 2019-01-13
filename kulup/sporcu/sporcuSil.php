<?php
include "../../bag.php";
session_start();
if(isset($_SESSION['id'])){
	if(unlink("resim/".$_GET['id'].".jpg"))echo " ".$_GET['id'].".jpg silindi";
	$sql="delete from sporcu where TCNo=".$_GET['id']."";
	if ($conn->query($sql) === TRUE) {
    echo "Sporcu başarı ile silindi...<br>";
	} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
	}
	header("Refresh: 1; url=".$base_url."/kulup/sporcu/sporcuEkle.php");
}
else header('Location:'.$base_url.'');
	?>