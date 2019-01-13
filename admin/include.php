<head>
<?php
 session_start();
 if(!isset($_SESSION['UserID'])){
 header("location:../giris.php");
 }
?>
</head>
<html>
<ul>
  <li><a href=<?php echo $base_url."/admin";?>>Turnuva İşlemleri</a></li>
  <li><a href=<?php echo $base_url."/admin/hakem";?>>Hakem İşlemleri</a></li>
  <li><a href=<?php echo $base_url."/admin/cikis.php";?>>Çıkış</a></li>
  <li><a href=<?php echo $base_url."/admin/kura"?>>Kura</a></li>
</ul>

<html>