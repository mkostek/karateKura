<?php include "../../bag.php";
include "../include.php";
function tarih_al($date)//tarih pars edilirse bu şekilde
 {
	 $var=date_parse($date);
	 return $var["day"]."-".$var["month"]."-".$var["year"];
 }
 function tarih_ver($date)//tarih pars edilirse bu şekilde
 {
	 $var=date_parse($date);
	 return $var["year"]."-".$var["month"]."-".$var["day"];
 }

  session_start();
if(isset($_SESSION["id"])){
if(isset($_GET["tc"])&&isset($_GET["tur"])){
$sql="insert into islem(turnuvaId,TCNo) values(".$_GET["tur"].",".$_GET["tc"].")";
	if ($conn->query($sql) === TRUE) 
    echo "sporcu başarı ile eklendi...<br>";
	else 
	echo "sporcu ekleme işlemi başarısız...<br>";
	}
?>
<div><h4>Turnuvaya Eklenecek Olan Sporcularınızı Seçiniz</h4>
<table>
<tr><th>Kulüp ad<th><th>Merkezi</th><th>Kuşak</th><th>Ad Soyad</th><th>Kilo</th><th>Doğum Tarihi</th></tr>
<?php
	$sql="SELECT sporcu.TCNo,kulup.kulupAd,il.ilAd,ilce.ilceAd,kusak.kusakAd,sporcu.sporcuAdSoyad,sporcu.kilo,sporcu.dTarih
	FROM kulup,kusak,ilce,il,sporcu 
	where kulup.kulupId=sporcu.kulupId and kusak.kusakId=sporcu.kusakId and ilce.ilId=il.ilId and kulup.ilceId=ilce.ilceId and kulup.kulupId=".$_SESSION["id"]." and sporcu.TCNo not in(select TCNo from islem where turnuvaId=".$_GET["tur"].")";
	$result = $conn->query($sql);
	while($row = $result->fetch_assoc()) { 
	echo "<tr><td>".$row['kulupAd']."</td><td>".$row['ilAd']." ".$row['ilceAd']."</td><td>".$row['kusakAd']."</td><td>".$row['sporcuAdSoyad']."</td><td>".$row['kilo']."</td><td>".tarih_al($row['dTarih'])."</td><td><a href=sporcuTurnuvaEkle.php?tc=".$row["TCNo"]."&tur=".$_GET["tur"].">ekle</a></td></tr>";
	}
echo "</table><h4>Eklenen Sporcular<table><tr><th>Ad Soyad</th><th>kilo</th><th>Doğum tarihi</th>";
$sql="select *from sporcu where  kulupId=".$_SESSION["id"]." and TCNo in(select TCNo from islem where turnuvaId=".$_GET["tur"].")";
$result = $conn->query($sql);
if($result->num_rows>0){
	while($row = $result->fetch_assoc()) { 
	echo "<tr><td>".$row["sporcuAdSoyad"]."</td><td>".$row["kilo"]."</td><td>".tarih_al($row["dTarih"])."</td><td><a href=sporcuTurnuvaSil.php?id=".$row["TCNo"]."&tur=".$_GET["tur"].">sil</a></td></tr>";
	}
}else echo "<td>0 sonuç...</td>";
echo "</table></div>";
}else header('Location:'.$base_url.'/kulup/kulupGir.php');


?>