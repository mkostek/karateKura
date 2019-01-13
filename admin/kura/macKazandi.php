<?php
include "../../bag.php";
function updater($i,$t,$v){
	include "../../bag.php";	
	$sql="update mac set sonuc=".$v." where macId=".$i." and turnuvaId=".$t."";
	if($conn->query($sql)==TRUE){
		echo "Maç sonucu başarı ile girildi";
	}else
	{
		echo "Maç sonucu güncellenemedi!";
	}
}
$tur=$_GET["tur"];
if(isset($_GET["idi"])){
	updater($_GET["idi"],$tur,1);
}else{
	updater($_GET["id"],$tur,0);
}	header("Refresh:0	; url=".$base_url."/admin/kura/kuraSonucGir.php?tur=".$tur."");

