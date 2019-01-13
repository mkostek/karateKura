<?php include "../bag.php"; ?>
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
<form action="kulupKayiti.php" method="post">
<h4>Kulüp Kaydı</h4>
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
			echo '<option  value="'.$row["ilceId"].'">'.$row["ilceAd"].'</option>';
			}
$conn->close();
?>

</select>
</p>
<p>
kulüp Ad <input type="text" name="kulup" >
</p>
<p>
kullanıcı ad<input type="text" name="kullanıcıad"></p>
<p>
mail <input type="text" name="mail" >
</p>
<p>
Şifre <input type="password" name="psw" >
</p>
<p>
Şifre(aynısını) <input type="password" name="rpsw" >
</p>
<p><input type="submit" value="kayıt ol"></p>

</p>
</form> 
</div>