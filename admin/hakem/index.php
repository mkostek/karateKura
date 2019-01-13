<?php
include '../../bag.php';
include "../include.php";
error_reporting(0);
if($_GET["gun"]){//guncelleme mi
	$sql=("SELECT * FROM hakem where hakemId=".$_GET["gun"]."");
	$rs = $conn->query($sql);
	while($row = $rs->fetch_assoc()) {
	echo '<form method="POST" action="index.php"> 
<h4>güncelle</h4><p>Ad <input type="text" style="width:300" name="hakemAd" value="'.$row["hakemAd"].'"></p>
<p>Soyad<input type="text" style="width:300" name="hakemSoyad" value="'.$row["hakemSoyad"].'"></p>
<input type="hidden" name="birinci" value="'.$row["hakemId"].'">
<p><input type="submit" value="güncelle"></p>
</form>';
	}
}else
{
//ekleme için aşağısı?>
<div>
<form method="post" action="index.php"> 
<p>Hakem Ad <input type="text" name="hakem" value="ekle"></p>
<p>Hakem Soyad <input type="text" name="hakemSoyad" value="ekle"></p>
<p><input type="submit" value="ekle"></p>
</form>
<?php
}
if($_GET["sil"]){//sileceksen bu
$sql="delete from hakem where hakemId=".$_GET["sil"]."";
if ($conn->query($sql) === TRUE)
echo "başarı ile silindi";
}else if($_POST["hakem"]){//eklemeyse bu
$sql="INSERT INTO hakem(hakemAd,hakemSoyad) VALUES(' ".$_POST["hakem"]."','".$_POST["hakemSoyad"]."')";
if ($conn->query($sql) === TRUE)echo "başarı ile eklendi";
}else if($_POST["birinci"]){//buysa güncellemedir
$sql="UPDATE `hakem` SET `hakemAd`='".$_POST["hakemAd"]."',`hakemSoyad`='".$_POST["hakemSoyad"]."' WHERE `hakemId`=".$_POST["birinci"]."";
if ($conn->query($sql) === TRUE)echo "başarı ile güncellendi";
}
// son sql
$rs = $conn->query("SELECT * FROM hakem");
echo "<h4>Hakemler</h4><table><tr><th>Ad</th><th>Soyad</th>";

	while($row = $rs->fetch_assoc()) {
    echo "<tr><td>".$row["hakemAd"]."</td><td>".$row["hakemSoyad"]."</td><td><a href=".$base_url."/admin/hakem/index.php?sil=".$row["hakemId"].">sil</a></td><td><a href=".$base_url."/admin/hakem/index.php?gun=".$row["hakemId"].">güncelle</a></td></tr>";
} 
echo "</table>";
$conn->Close(); 
?>
</div>