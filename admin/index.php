<head>
<?php include "../bag.php";
include "include.php";
?>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' }).val();
  } );
  function showHint()
			{
			var str=document.getElementById("il").value;
			if(str=="")
			{
			document.getElementById("ilce").innerHTML="";
			return;
			}else
			{
			if(window.XMLHttpRequest)
			{
			xmlhttp=new XMLHttpRequest();
			}
			else{
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
			{
			if(xmlhttp.readyState==4&&xmlhttp.status==200)
			{
			document.getElementById("ilce").innerHTML=xmlhttp.responseText;
			}
			};
			xmlhttp.open("GET","getHint.php?q="+str,true);
			xmlhttp.send();
			}
			}
  </script>	
</head>	
<div>
<h3>Organizasyon Girme Ekranı</h3>
<form method="POST" action="hakem/hakemGir.php">
<p>Son Başvuru tarihi <input type="text" name="sonBasvur" class="datepicker"></p>
<p>Organizasyon tarihi <input type="text" name="tarih" class="datepicker"></p>
<p>Organizasyon başkanı <input type="text" name="baskan"></p>
<p>Müsabaka yeri il <select name="il" id="il" onchange="showHint()">
<?php
$sql="select *from il";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<option selected value=".$row["ilId"].">".$row["ilAd"]."</option>";
    }
?>
</select>
ilce <select name="ilce" id="ilce">
<?php
$sql="select *from ilce";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<option selected value=".$row["ilceId"].">".$row["ilceAd"]."</option>";
    }
?>

</select>
 </p>
<p>Ayrıntılar <textarea name="ayrıntı" rows="8" cols="75">
At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies. 
</textarea><p>
<p>Yetkili kişi <input type="text" name="yetkili"></p>
<p>İletişim <input type="text" name="iletisim"></p>
<p><input type="submit" value="gonder"></p>
</div>
<div>
<h3>Organizasyonlar</h3>
<table>
<tr><th>Son Başvuru Tarihi</th><th>Organizasyon Tarihi</th><th>Son Başvuru Tarihi</th><th>Organizasyon Başkanı
</th><th>Organizasyon Başkanı</th><th>Müsabaka ili</th><th>Ayrıntılar</th><th>Yetkili Kişi</th><th>İletişim</th></tr>
<?php $sql="SELECT t.turnuvaId,t.tar,t.sonBasTar,t.yoneticiId,i.ilceAd,t.orgBaskan,t.reglaman,t.yetkiliKisi,t.iletisim ,i.ilceAd from turnuva t,ilce i where i.ilceId=t.ilceId and t.sonBasTar>NOW()";
$result = $conn->query($sql);
if($result->num_rows>0)
{
 while($row = $result->fetch_assoc()) { 
echo	"<tr><td><a href=turnuvaSil.php?id=".$row["turnuvaId"].">sil</a></td><td>".$row["tar"]."</td><td>".$row["sonBasTar"]."</td><td>".$row["ilceAd"]."</td>
<td>".$row["orgBaskan"]."</td><td>".$row["reglaman"]."</td><td>".$row["yetkiliKisi"]."</td><td>".$row["iletisim"]."</td>
<td><a href=turnuvaDuzenle.php?id=".$row["turnuvaId"].">Düzenle</a></td></tr>";
    }
}else echo "<td>0 kayıt...</td></table></form></div>";
 $conn->close(); ?>
 
 