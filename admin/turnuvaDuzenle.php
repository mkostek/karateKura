<head>
<?php include "../bag.php";
include "include.php";
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
<?php
if($_POST){
$sql="UPDATE turnuva 
SET tar='".tarih_ver($_POST["tarih"])."',
bitis='".tarih_ver($_POST["bitis"])."',
sonBasTar='".tarih_ver($_POST["sonBasvur"])."',
ilceId=".$_POST["ilce"].",
orgBaskan='".$_POST["baskan"]."',
reglaman='".htmlspecialchars($_POST["reglaman"],ENT_QUOTES)."',
yetkiliKisi='".$_POST["yetkili"]."',
iletisim='".$_POST["iletisim"]."' 
WHERE turnuvaId=".$_POST["id"]."";
if ($conn->query($sql) === TRUE) {
    echo " başarı ile güncellendi...<br>";
	header("Refresh: 1;url=".$base_url."/hakem/hakemGir.php?id=".$_POST["id"]."");	
} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
}
}
else{
echo '<div><h3>Organizasyon Guncelleme Ekranı</h3>';
$sql="select *from turnuva where turnuvaId=".$_GET["id"]."";
$result = $conn->query($sql);
if($result->num_rows>0)
{
 while($row = $result->fetch_assoc()) { ?>
<form method="POST" action="turnuvaDuzenle.php">
<input type="hidden" value="<?php echo $_GET["id"];?>"  name="id">
<p>Son Başvuru tarihi <input type="text" name="sonBasvur" value="<?php echo tarih_al($row["sonBasTar"]); ?>"  class="datepicker"></p>
<p>Organizasyon tarihi <input type="text" name="tarih" value="<?php echo tarih_al($row["tar"]); ?>"class="datepicker"></p>
<p>Bitiş tarihi <input type="text" name="bitis" value="<?php echo tarih_al($row["bitis"]); ?>"class="datepicker"></p>
<p>Organizasyon başkanı <input type="text" name="baskan" value="<?php echo $row["orgBaskan"]; ?>"></p>

<p>Ayrıntılar <textarea name="reglaman" rows="33" cols="100">
<?php echo html_entity_decode($row["reglaman"]); ?></textarea> <p>
<p>Yetkili kişi <input type="text" name="yetkili" value="<?php echo $row["yetkiliKisi"]; ?>"></p>
<p>İletişim <input type="text" name="iletisim" value="<?php echo $row["iletisim"];$i=$row["ilceId"]; ?>"></p>
<?php } } ?> 
<p>Müsabaka yeri il <select name="il" id="il" onchange="showHint()">
<?php
$sql="select *from il";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<option  selected value=".$row["ilId"].">".$row["ilAd"]."</option>";
    }
?>
</select>
ilce <select name="ilce" id="ilce">
<?php
$sql="select *from ilce";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
			echo '<option ';
			if($i==$row["ilceId"])echo "selected";
			echo  ' value="'.$row["ilceId"].'">'.$row["ilceAd"].'</option>';
			}
    $conn->close();
?>

</select>
 </p>
<p><input type="submit" value="gonder"></p></div>
<?php } ?>