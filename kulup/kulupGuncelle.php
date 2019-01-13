<?php include "../bag.php"; 
include "include.php";
session_start();
if(isset($_SESSION['id'])){
	$id=$_SESSION['id'];
	$sql="select *from kulup where kulupId=".$id."";
	$result=$conn->query($sql);
	if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		$kulupAd=$row['kulupAd'];
		$kullaniciAd=$row['kullaniciAd'];
		$kulupSifre=$row['kulupSifre'];
		$kulupMail=$row['kulupMail'];
		$ilceId=$row['ilceId'];
	}
	}
	if($_POST){
			$sql="update kulup set  
kulupAd='".$_POST["kulup"]."',kullaniciAd='".$_POST["kullanıcıad"]."', kulupSifre='".$_POST["psw"]."', kulupMail='".$_POST["mail"]."', ilceId=".$_POST["ilce"]." where kulupId=".$id."";
		$conn->query($sql);
		if ($conn->query($sql) === TRUE) 
		{	 echo "güncelleme başarılı<br>";
		}else{
		echo "güncelleme başarısız!<br>";
		}header("Refresh: 2;url=".$base_url."/kulup/kulupAna.php");
		}
			
					
?>
<head>
<script>
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
<form action="kulupGuncelle.php" method="post">
<h4>Kulüp Güncelleme</h4>
<p>Kulüp il <select name="il" id="il" onchange="showHint()">
<?php
$sql="select *from il";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
		echo	"<option   value=".$row["ilId"].">".$row["ilAd"]."</option>";
    }
?>
</select>
ilce <select name="ilce" id="ilce">
<?php
$sql="select *from ilce";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
			if($ilceId==$row["ilceId"])
			echo '<option selected  value="'.$row["ilceId"].'">'.$row["ilceAd"].'</option>';
			else
			echo '<option  value="'.$row["ilceId"].'">'.$row["ilceAd"].'</option>';	
			}
?>

</select>
</p>
<p>
kulüp Ad <input type="text" name="kulup" value="<?php echo $kulupAd; ?>" >
</p>
<p>
kullanıcı ad<input type="text" name="kullanıcıad" value="<?php echo $kullaniciAd; ?>"></p>
<p>
mail <input type="text" name="mail" value="<?php echo $kulupMail; ?>">
</p>
<p>
Şifre <input type="text" name="psw" value="<?php echo $kulupSifre; ?>" >
</p>
<p><input type="submit" value="Güncelle"></p>

</p>
</form> 
</div>
<?php
	}
	else  header('Location:'.$base_url.'/kulup/kulupGir.php');
?>