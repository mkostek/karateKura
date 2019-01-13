<?php
include '../../bag.php';
include '../include.php';
session_start();
if(isset($_SESSION['id'])){
	$id=$_SESSION['id'];
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
 if($_POST){
	 foreach ($_FILES["resimler"]["error"] as $anahtar => $hata) {
    if ($hata == UPLOAD_ERR_OK) {
        $tmp_name = $_FILES["resimler"]["tmp_name"][$anahtar];
        $name = $_FILES["resimler"]["name"][$anahtar];
        move_uploaded_file($tmp_name, "resim/".$name);
		rename('resim/'.$name.'','resim/'.$_POST["TCNo"].'.jpg');
		$konum='resim/'.$_POST["TCNo"].'.jpg';
		echo $konum."<br>";
		$sql="INSERT INTO sporcu(TCNo, lisansResim, sporcuAdSoyad, kilo, dTarih, kulupId, kusakId)
 VALUES (".$_POST["TCNo"].",'".$konum."','".$_POST["adSoyad"]."',".$_POST["kilo"].",'".tarih_ver($_POST["dTarih"])."',".$id.",".$_POST["kusak"].")";
 $result=$conn->query($sql);
 if ($result) 
 {	 
echo "ekleme başarılı<br>";
 }else
 {
	 echo "ekleme başarısız!<br>";
    }
	} echo "başarı ile yüklendi...";
}
 }
?>

<head>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' }).val();
  } );
  </script>
 </head>
<div><form action="sporcuEkle.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="kulupId" value="<?php echo $id; ?>">
<p>Doğum tarihi <input type="text" class="datepicker" name="dTarih"</p>
<p>Kilo <select name="kilo" id="kilo">
<?php 
for($i=10;$i<120;$i++)
{
echo "<option value=".$i.">".$i."</option>";
}
?>
</select></p>
<p>Kusak <select name="kusak" id="kusak">
<?php
$sql="select *from kusak";
$result=$conn->query($sql);
if ($result->num_rows > 0) {
 while($row = $result->fetch_assoc()) {
echo "<option value=".$row["kusakId"].">".$row["kusakAd"]."</option>";
}
}
?>
</select></p>
<p>Lisans resmini yükleyiniz:<input type="file"  name="resimler[]" /></p>
<p>Sporcu Ad Soyadı <input type="text" name="adSoyad"></p>
<p>Sporcu TCNO'su <input type="text" name="TCNo"></p>
<p><input type="submit" value="gönder"></p>
</form></div><div>
<h4>Kulübünüzdeki Sporcular</h4>
<table>
<tr><th>Doğum Tarihi</th><th>Kilo</th><th>Kusak</th><th>Ad Soyad</th></tr>
<?php
$sql="select sporcu.TCNo,sporcu.dTarih,sporcu.kilo,kusak.kusakAd,sporcu.sporcuAdSoyad from sporcu,kusak where sporcu.kusakId=kusak.kusakId and sporcu.kulupId=".$id."";
$result=$conn->query($sql);
if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
echo '<tr><td>'.tarih_al($row["dTarih"]).'</td><td>'.$row["kilo"].'</td><td>'.$row["kusakAd"].'</td><td>'.$row["sporcuAdSoyad"].'</td><td><a href=sporcuSil.php?id='.$row["TCNo"].'>sil</a></td><td><a href=sporcuDuzenle.php?id='.$row["TCNo"].'>güncelle</a></td></tr>';
	}
}

echo "</table></div>";
}
?>