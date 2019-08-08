<?php
function tarih_ver($date)//tarih pars edilirse bu şekilde
 {
	 $var=date_parse($date);
	 return $var["year"]."-".$var["month"]."-".$var["day"];
 }
include '../../bag.php';
include "../include.php";
if($_POST)
{
$sql="insert into `turnuva`( `tar`, `sonBasTar`, `ilceId`, `orgBaskan`, `reglaman`, `yetkiliKisi`, `iletisim`,`bitis`) values('".tarih_ver($_POST["bas"])."','".tarih_ver($_POST["son"])."',".$_POST["ilce"].",'".$_POST["baskan"]."','".htmlspecialchars($_POST["ayrıntı"],ENT_QUOTES)."','".$_POST["yetkili"]."','".$_POST["iletisim"]."','".tarih_ver($_POST["bit"])."')";
if ($conn->query($sql) === TRUE) {
    echo " başarı ile eklendi...<br>";
	$id=$conn->insert_id;
	header("Refresh:	url=".$base_url."/admin/hakem/hakemGir.php?id=".$id."");	
} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
}
}
else if(isset($_GET["id"])&&isset($_GET["hakem"])){
	$id=$_GET["id"];
	$sql="insert into gorevli(hakemId,turnuvaId) values(".$_GET["hakem"].",".$_GET["id"].")";
	if ($conn->query($sql) === TRUE) {
    echo "görevli başarı ile eklendi...<br>";
		header("Refresh:1;	url=".$base_url."/admin/hakem/hakemGir.php?id=".$id."");	
	} else {
    echo "hata: " . $sql . "<br>" . $conn->error;
	}
	
}else{
		$id=$_GET["id"];
	}
?>
<form action="hakemGir.php" method="GET">
<input type="hidden" name="id" value='<?php echo $id;?>'>
<div>
<p>hakemler<select name="hakem">
<?php
$sql="select *from hakem";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<option value=".$row["hakemId"].">".$row["hakemAd"]." ".$row["hakemSoyad"]."</option>";
    }
?>
</select></p>
<input type="submit" value="ekle">
</form>
<h4>Seçilen Hakemler</h4>
<table>
<tr><th>Ad</th><th>Soyad</th><tr>
<?php
$sql="select gorevli.gId,hakem.hakemAd,hakem.hakemSoyad from hakem,gorevli,turnuva where gorevli.hakemId=hakem.hakemId and gorevli.turnuvaId=turnuva.turnuvaId and turnuva.turnuvaId=".$id."";
$result = $conn->query($sql);
 if ($result->num_rows > 0) 
{
	while($row = $result->fetch_assoc()) { 
		echo	"<tr><td>".$row["hakemAd"]."</td><td>".$row["hakemSoyad"]."</td><td><a href=hakemSil.php?gId=".$row["gId"]."&id=".$id.">sil</a></td	></tr>";
    }
}else echo "<td> 0 kayıt var!</td>";
?>
</table>

<p><a onclick="javascript:void window.open('<?php  echo $base_url; ?>/admin/hakem/index.php','a','width=700,height=500');return false;">hakem işlemleri için</a> </p>
</div>