<head>
</head>
<html>
<ul>
  <li><a href="<?php echo $base_url; ?>">Turnuva İşlemleri</a></li>
  <li><a href="<?php echo $base_url; ?>/hakem">Hakem İşlemleri</a></li>
  <li><a href="<?php echo $base_url; ?>/cikis.php">Çıkış</a></li>
</ul>
	
<html>

<?php
 session_start();
 if(!isset($_SESSION['UserID'])){
 header("location:../../giris.php");
 }
?>