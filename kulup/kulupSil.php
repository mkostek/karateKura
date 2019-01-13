<?php
include "../bag.php";
session_start();
if(isset($_SESSION['id'])){
	$id=$_SESSION['id'];
	$sql = "select lisansResim from sporcu where kulupId=".$id."";
	$result = $conn->query($sql);
    // output data of each row
    while($row = $result->fetch_assoc()) {  
		if(unlink($row["lisansResim"]))echo $row["lisansResim"]." lisansi silindi!"; 
	} 
	$sql="delete from sporcu where kulupId=".$id."";
	if ($conn->query($sql) === TRUE) {
    echo "Sporcu başarı ile silindi...<br>";
	} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
	}
	$sql="delete from kulup where kulupId=".$id."";
	if ($conn->query($sql) === TRUE) {
    echo "Kulüp başarı ile silindi...<br>";
	} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
	}
	}	
	session_destroy();
	header("Refresh: 1; url=".$base_url."/kulup/kulupGir.php");
	?>
