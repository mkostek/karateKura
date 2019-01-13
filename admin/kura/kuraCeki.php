<?php
include "../../bag.php";
include "../include.php";
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
	 $f=0;
$sql="select count(*) as a from mac where turnuvaId=".$_POST["tur"]."";
$result=$conn->query($sql);
if($result->num_rows>0)
	 while($row = $result->fetch_assoc()) 
	 $cekildimi=$row["a"];
	 
if($cekildimi==0)
{
$f=0;
$sql="select TCNo from islem where turnuvaId=".$_POST["tur"]." order by rand()";
$result=$conn->query($sql);
if($result->num_rows>0){
	 while($row = $result->fetch_assoc()) { 
	 $tc[$f++]=$row["TCNo"];
	 }
}
print_r($tc);
	for($c=10;$c>0;$c--){
		if(pow(2,$c+1)>=$f)
			$dongu=pow(2,$c);	
	}
	$f-=$dongu;
	$m=0;
	echo "<br>";
	for($i=0;$i<$dongu;$i++)
	{
		if($i<$f){
		$sql="insert into mac(turnuvaId,sporcuId,sporcuIdi,sonuc,flag) values(".$_POST["tur"].",".$tc[$m++].",".$tc[$m++].",2,0)";
		echo $i." müsabaka ".$tc[$m-2]."-".$tc[$m-1]."<br>";
		}
		else{
			$sql="insert into mac(turnuvaId,sporcuId,sonuc,flag) values(".$_POST["tur"].",".$tc[$m++].",2,0)";
		echo $i." müsabaka ".$tc[$m-1]."<br>";
		}
		
			
		if($conn->query($sql)===TRUE){
			echo "İşlenildi<br>";
		}else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
	}
 }else if($cekildimi>0){
 echo '<div>
<form action="kuraSonucGir.php" method="post">
<input type="hidden" name="tur" value='.$_POST["tur"].'>
<input type="submit" value="Kura Sonuçlarını Gir">
</form></div>';
 }
 }
 else if($_GET)
 {
$count=0;
$sql="select * from sporcu where TCNo in(select TCNo from islem where turnuvaId=".$_GET["tur"].")";
$result=$conn->query($sql);
echo "<h4>Kayıt Olan Sporcular</h4><table><tr><th>Sporcu Ad Soyad</th><th>Doğum Tarihi</th><th>Kilo</th><th>Lisans</th></tr>";
if($result->num_rows>0){
 while($row = $result->fetch_assoc()) { 
			echo "<tr><td>".$row["sporcuAdSoyad"]."</td><td>".tarih_al($row["dTarih"])."</td><td>".$row["kilo"]."</td><td><a href=http://127.0.0.1:8080/spor/kulup/sporcu/".$row["lisansResim"].">Lisans</a></td></tr>";
			$count++;
}
}
echo 'Toplam sporcu sayisi:'.$count.'<br>
<div><form action="kuraCeki.php" method="post">
<input type="hidden" name="tur" value='.$_GET["tur"].'>
<input type="submit" value="Kura Çek">
</form></div>';

}
