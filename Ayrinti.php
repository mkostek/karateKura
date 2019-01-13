<a href="kulup/kulupGir.php">Kulüp Girişi</a>
<div>
<h3>Turnuva Ayrıntıları</h3>
<?php
include "bag.php"; 
$sql="select reglaman,turnuvaId from turnuva where turnuvaId=".$_GET["id"]."";
$result = $conn->query($sql);
 while($row = $result->fetch_assoc()) { 
echo '<p>Ayrıntılar <textarea name="reglaman" rows="25" cols="50">
'.html_entity_decode($row["reglaman"]).'</textarea> <p>
<p><a href='.$base_url.'/kulup/sporcuTurnuva/sporcuTurnuvaEkle.php?tur='.$row["turnuvaId"].'>Katıl</a></p>';
    }
?>
</div>
