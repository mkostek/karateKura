<?php 
include "../bag.php";
  session_start();
if(isset($_SESSION["id"])){
	$sql="select *from kulup where kulupId=".$_SESSION['id']."";
	$result = $conn->query($sql);
		if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) { 
		{ 
			$id=$row["kulupId"];
			$kulupAd=$row["kulupAd"];
			$kullaniciAd=$row["kullaniciAd"];
			$kulupMail=$row["kulupMail"];
			$ilceId=$row["ilceId"];
		}
	}
}
}
else if($_POST){
$sql="select *from kulup where kullaniciAd='".$_POST["kullanıcıad"]."' and kulupSifre='".$_POST["psw"]."' and aktif=0";
$result = $conn->query($sql);
if ($result->num_rows == 1) {
 while($row = $result->fetch_assoc()) { 
echo "<br>Mail adresinize gelen üyeliği aktifleştirmeden giriş yapamazsınız!<br>";
header("Refresh: 1;url=".$base_url."/kulup/kulupGir.php");	
}
}	
else{
	$sql="select *from kulup where kullaniciAd='".$_POST["kullanıcıad"]."' and kulupSifre='".$_POST["psw"]."' and aktif=1";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
 while($row = $result->fetch_assoc()) { 
	$_SESSION['id']=$row["kulupId"];
$kulupAd=$row["kulupAd"];
$kullaniciAd=$row["kullaniciAd"];
$kulupMail=$row["kulupMail"];
$ilceId=$row["ilceId"];
}
}
}
}
 if(!isset($_SESSION["id"])){ 
header('Refresh 1:'.$base_url.'/kulup/kulupGir.php');
 }else{
	 include 'include.php';
?>
<div><form method="" action="">
<h4>Kulüb bilgileriniz</h4>
<p>Numara <?php echo $_SESSION["id"];?></p>
<p>Kulüp adı <?php echo $kulupAd;?></p>
<p>Kullanıcı Ad <?php echo $kullaniciAd;?></p>
<p>Kulüp mail <?php echo $kulupMail ;?></p>
<p><?php
$sql="select l.ilAd,c.ilceAd from ilce c,il l where l.ilId=c.ilId and c.ilceId=".$ilceId."";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
 while($row = $result->fetch_assoc()) { 
 echo "Kulup yeri ".$row["ilAd"]." ".$row["ilceAd"];
 }
}
echo "</p><p>";
$sql="select count(*) as a from sporcu where kulupId=".$_SESSION["id"]."";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
 while($row = $result->fetch_assoc()) { 
 echo "Kulubünüzdeki sporcu sayısı ".$row["a"]." dır.<br>";
 }
}
echo "</p></form></div>";
 }
 ?>