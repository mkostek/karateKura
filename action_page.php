<?php
include "bag.php";
session_start();
$sql="select * from yonetici where kullaniciad='".$_POST["uname"]."' and pass='".$_POST["psw"]."'";
$result = $conn->query($sql);
if ($result->num_rows >0){
	  while($row = $result->fetch_assoc()) {
					$_SESSION['UserID'] = $row["yoneticiId"];
					echo "<p>Giriş yapıldı yönlendiriliyorsunuz!</p>";
					header("Refresh: 1; url=".$base_url."/admin/index.php");
					}
}else{
	echo "Bilgilerinizi kontrol ediniz!";
header("Refresh: 1; url=".$base_url."/giris.php");
}
?>