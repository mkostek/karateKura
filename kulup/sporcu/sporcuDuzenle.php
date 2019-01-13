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
	 $sql="update sporcu set  sporcuAdSoyad='".$_POST["adSoyad"]."', kilo=".$_POST["kilo"].", dTarih='".tarih_ver($_POST["dTarih"])."', kusakId=".$_POST["kusak"]." where TCNo=".$_POST["tcNo"]."";
	 foreach ($_FILES["resimler"]["error"] as $anahtar => $hata) {
    if ($hata == UPLOAD_ERR_OK) {
        $tmp_name = $_FILES["resimler"]["tmp_name"][$anahtar];
        $name = $_FILES["resimler"]["name"][$anahtar];
        move_uploaded_file($tmp_name, "resim/".$name);
		unlink('resim/'.$_POST["tcNo"].'.jpg');
		rename('resim/'.$name.'','resim/'.$_POST["tcNo"].'.jpg');
		$konum='resim/'.$_POST["tcNo"].'.jpg';
			$sql="update sporcu set  lisansResim='".$konum."',sporcuAdSoyad='".$_POST["adSoyad"]."', kilo=".$_POST["kilo"].", dTarih='".tarih_ver($_POST["dTarih"])."', kusakId=".$_POST["kusak"]." where TCNo=".$_POST["tcNo"]."";
		}
		$conn->query($sql);
		if ($conn->query($sql) === TRUE) 
		{	 echo "güncelleme başarılı<br>";
		}else{
		echo "güncelleme başarısız!<br>";
		}
		}
			header("Refresh: 3;url=".$base_url."/kulup/sporcu/sporcuEkle.php");	

 } else if($_GET['id'])
 {
 $sql="select *from sporcu where kulupId=".$id." and TCNo=".$_GET['id']."";
 $result=$conn->query($sql);
if ($result->num_rows > 0) {
 while($row = $result->fetch_assoc()) {
	$tc=$row["TCNo"];
	$resim=$row["lisansResim"];
	$adSoyad=$row["sporcuAdSoyad"];
	$kilo=$row["kilo"];
	$tarih=$row["dTarih"];
	$kulupId=$row["kulupId"];
	$kusakId=$row["kusakId"];
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
<div><form action="sporcuDuzenle.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="kulupId" value="<?php echo $kulupId; ?>">
<input type="hidden" name="tcNo" value="<?php echo $tc; ?>">
<p>Doğum tarihi <input type="text" class="datepicker" name="dTarih" value="<?php echo tarih_al($tarih);?>"></p>
<p>Kilo <select name="kilo" id="kilo">
<?php 
for($i=10;$i<120;$i++)
{
if($i==$kilo)
echo "<option selected value=".$i.">".$i."</option>";
else
echo "<option  value=".$i.">".$i."</option>";
}
?>
</select></p>
<p>Kusak <select name="kusak" id="kusak">
<?php
$sql="select *from kusak";
$result=$conn->query($sql);
if ($result->num_rows > 0) {
 while($row = $result->fetch_assoc()) {
if($kusakId==$row["kusakId"]) echo "<option selected  value=".$row["kusakId"].">".$row["kusakAd"]."</option>";
else echo "<option value=".$row["kusakId"].">".$row["kusakAd"]."</option>";
}
}
?>
</select></p>
<p>Resim<img src="<?php echo $resim; ?>" style="width:320;height:240; ">
<p>Lisans resmini yükleyiniz:<input type="file"  name="resimler[]" /></p>
<p>Sporcu Ad Soyadı <input type="text" name="adSoyad" value="<?php echo $adSoyad; ?>"></p>
<input type="submit" value="güncelle">
</form></div>
 <?php }
} else
 header("location:".$base_url."/kulup/kulupGir.php");
 
 ?>
