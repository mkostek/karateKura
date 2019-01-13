<?php
include "../bag.php";
include "include.php";

if(isset($_GET["id"])) {
	$sql = "UPDATE kulup set aktif = 1 WHERE kulupId=" .((4+$_GET["id"])/6). "";
	$result = $conn->query($sql);
		if($result) {
			session_start();
			$_SESSION["id"]=((4+$_GET["id"])/6);
			echo "Aktivasyon başarılı!Giriş sayfasına yönlendriliyorsunuz...";
			header("Refresh: 1;url=".$base_url."/kulup/kulupAna.php");
		} else {
			echo "Aktivasyon başarısız";
			header('Refresh 0;'.$base_url.'/kulup/kulupGir.php');
		}
	}
else header('Refresh 0;'.$base_url.'/kulup/kulupGir.php');