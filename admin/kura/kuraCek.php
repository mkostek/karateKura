<?php
include "../../bag.php";
include "../include.php";
?>
<div>
<table>
<tr><th>Organizasyon Başkanı<th><th>Organizasyon Tarihi</th><th>Son Başvuru Tarihi</th><th>Turnuva Yeri</th><th>Ayrıntılar</th></tr>
<?php
$sql="select turnuva.turnuvaId,turnuva.orgBaskan,turnuva.tar,turnuva.sonBasTar,il.ilAd,ilce.ilceAd,turnuva.reglaman from turnuva,il,ilce where turnuva.ilceId=ilce.ilceId and ilce.ilId=il.ilId and turnuva.sonBasTar<NOW() and turnuva.tar>NOW()";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<tr><td>".$row["orgBaskan"]."</td><td></td><td>".$row["tar"]."</td><td>".$row["sonBasTar"]."</td><td>".$row["ilAd"]." ".$row["ilceAd"]."</td><td>".$row["reglaman"]."</td><td><a href=".$base_url."/admin/kura/kuraCeki.php?tur=".$row["turnuvaId"].">Seç</a></td></tr>";
    }
	
?>
</table>
</div>
