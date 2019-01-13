<?php
include "../bag.php";
session_start();
session_destroy();
echo "Çıkışa kadar size geçirelim!<br>";
header("Refresh: 1; url=".$base_url."/kulup/kulupGir.php");
?>