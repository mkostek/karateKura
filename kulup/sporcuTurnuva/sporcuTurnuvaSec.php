<?php 
include "../../bag.php";
include "../include.php";
  session_start();
if(isset($_SESSION["id"])){
echo	'<table>
<tr><th>Organizasyon Başkanı<th><th>Organizasyon Tarihi</th><th>Son Başvuru Tarihi</th><th>Turnuva Yeri</th><th>Ayrıntılar</th></tr>
';
	$sql="select turnuva.turnuvaId,turnuva.orgBaskan,turnuva.tar,turnuva.sonBasTar,il.ilAd,ilce.ilceAd,turnuva.reglaman from turnuva,il,ilce where turnuva.ilceId=ilce.ilceId and ilce.ilId=il.ilId and turnuva.sonBasTar>NOW()";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<tr><td>".$row["orgBaskan"]."</td><td></td><td>".$row["tar"]."</td><td>".$row["sonBasTar"]."</td><td>".$row["ilAd"]." ".$row["ilceAd"]."</td><td>".$row["reglaman"]."</td><td><a href=sporcuTurnuvaEkle.php?tur=".$row["turnuvaId"].">katıl</a></td></tr>";
    }
}else header('Location:'.$base_url.'/kulup/kulupGir.php');
?>
<table>
