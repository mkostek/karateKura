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
 function liste($turnuva)
 {
	 include "../../bag.php";
	 	 echo "<div><h4>Sonuçları Gir</h4>";
$sql="select macId,(select sporcuAdSoyad from sporcu where TCNO=sporcuId)as birinci,(select sporcuAdSoyad from sporcu where TCNO=sporcuIdi) as ikinci,sonuc,flag from mac where turnuvaId=".$turnuva." order by flag asc";
$result=$conn->query($sql);
if($result->num_rows>0){
		echo "<table><th>Maç numarası</th><th>  </th<th>Sol</th><th>birinci</th><th>ikinci</th><th>Sonuc</th><th>Sağ</th><th>Derecesi</th></tr>";
	 while($row = $result->fetch_assoc()) { 
			echo "<tr><td>".$row["macId"]."<td><a href=macKazandi.php?tur=".$turnuva."&id=".$row["macId"].">Sol kazandı</a></td><td>".$row["birinci"]."</td><td>".$row["ikinci"]."</td><td>".$row["sonuc"]."</td><td><a href=macKazandi.php?tur=".$turnuva."&idi=".$row["macId"].">Sağ kazandı</a></td><td>".$row["flag"]."</td></tr>";	 
	 }
	 echo "</table></div>";
}
 }
 $flag=false;
 	 include "../../bag.php";
 if($_POST){
liste($_POST["tur"]);$tur=$_POST["tur"];
 }else if($_GET){
liste($_GET["tur"]);$tur=$_GET["tur"];	 
 }
 $flag=false;
 $sql="select count(*) as a from mac where sonuc=2 and turnuvaId=".$tur." and flag in(select max(flag) from mac where turnuvaId=".$tur.") ";
$result=$conn->query($sql);
if($result->num_rows>0){
	 while($row = $result->fetch_assoc()) { 
			if($row["a"]==0){
				$kişi =$row["a"];
			}
	 }
}

 $sql="select count(*) as a  from mac where sonuc=2 and turnuvaId=".$tur."  ";
$result=$conn->query($sql);
if($result->num_rows>0){
	 while($row = $result->fetch_assoc()) { 
			if($row["a"]==0){
				$flag=true;	 
			}
	 }
}
$sql="select max(flag) as f  from mac where turnuvaId=".$tur."  ";
$result=$conn->query($sql);
if($result->num_rows>0){
	 while($row = $result->fetch_assoc()) { 
				$x=$row["f"];
			}
	 }

 if($flag&&$kişi!=1)
{	
unset($a);
	$c=0;
	$sql="SELECT sporcuId,sporcuIdi,sonuc FROM mac WHERE  turnuvaId=".$tur." and flag=".$x."";
	$conn->query($sql);
	$result=$conn->query($sql);
		if($result->num_rows>0){
				 while($row = $result->fetch_assoc()) { 
				 if($row["sonuc"]==0)
					 $a[$c++]=$row["sporcuId"];
				 else if($row["sonuc"]==1)
					 $a[$c++]=$row["sporcuIdi"];
				 }
		}
		$x+=1;
		if($c==1)
		{
			$sql="insert into mac(turnuvaId,sporcuId,sporcuIdi,sonuc,flag) values(".$tur.",".$a[0].",".$a[0].",2,".$x.")";
			if($conn->query($sql)==TRUE)echo $a[0]." kazandı...";
		}else{
			echo "Yeni eşleşmeler belli oldu<br>";
		for($d=0;$d<$c;){
					$sql="insert into mac(turnuvaId,sporcuId,sporcuIdi,sonuc,flag) values(".$tur.",".$a[$d++].",".$a[$d++].",2,".$x.")";
					if($conn->query($sql)==TRUE){
					echo $a[$d-2]."-".$a[$d-1]."<br>";
					}
		
			}
		
}
$conn->close();


}