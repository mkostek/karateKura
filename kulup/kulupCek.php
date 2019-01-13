<?php
include '../bag.php';
$id=$_REQUEST["id"];
$sql = "select * from kulup where ilceId=".$id."";
$result = $conn->query($sql);
    // output data of each row
    while($row = $result->fetch_assoc()) {  
		echo	"<option value=".$row["kulupId"].">".$row["kulupAd"]."</option>";
} 
?>