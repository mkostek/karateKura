
<a href="kulup/kulupGir.php">Kulüp Girişi</a>
<div>
<table>
<tr><th>Organizasyon Başkanı</th><th>Organizasyon Tarihi</th><th>Organizasyon Bitiş</th><th>Son Başvuru Tarihi</th><th>Turnuva Yeri</th><th>Katıl</th><Ayrıntılar</tr>
<?php
include "bag.php"; 
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
$sql="select turnuva.turnuvaId,turnuva.bitis,turnuva.orgBaskan,turnuva.tar,turnuva.sonBasTar,il.ilAd,ilce.ilceAd,turnuva.reglaman from turnuva,il,ilce where turnuva.ilceId=ilce.ilceId and ilce.ilId=il.ilId and turnuva.sonBasTar>NOW()";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<tr><td>".$row["orgBaskan"]."</td><td>".$row["tar"]."</td><td>".$row["bitis"]."</td><td>".$row["sonBasTar"]."</td><td>".$row["ilAd"]." ".$row["ilceAd"]."</td><td><a href=".$base_url."/kulup/sporcuTurnuva/sporcuTurnuvaEkle.php?tur=".$row["turnuvaId"].">Seç</a></td><td><a href=".$base_url."/Ayrinti.php?id=".$row["turnuvaId"].">Ayrıntı</a></td></tr>";
    }
	
?>

</table>
<h3>Son Bir Hafta İçinde Olan Müsabakaların Sonuçları</h3>
<table><tr><th>ilçe</th><th>Maç numarası</th><th>Birinci Takım</th><th>İkinci takım</th></tr>
<?php

$sql="select (select ilceAd from ilce where ilceId in(select ilceId from turnuva where turnuvaId=mac.turnuvaId)) as i,macId,( select sporcuAdSoyad from sporcu where sporcu.TCNo=mac.sporcuId ) as a,( select sporcuAdSoyad from sporcu where sporcu.TCNo=mac.sporcuIdi ) as b,sonuc from mac where turnuvaId in( select turnuvaId from turnuva where tar>ADDDate(NOW(),-7) ) order by macId";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<tr><td>".$row["i"]."</td><td>".$row["macId"]."</td><td";
		if($row["sonuc"]==0)echo " bgColor=#6699ff";
		echo ">".$row["a"]."</td><td";
		if($row["sonuc"]==1)echo " bgColor=#6699ff";
		echo ">".$row["b"]."</td></tr>";
    }

?>	</table></div>