<?php
include '../bag.php';
$q=$_REQUEST["q"];
$sql = "select * from ilce where ilId=".$q."";
$result = $conn->query($sql);
    // output data of each row
    while($row = $result->fetch_assoc()) {  
		echo	"<option value=".$row["ilceId"].">".$row["ilceAd"]."</option>";
} 
?>