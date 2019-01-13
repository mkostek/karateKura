<?php
include "../bag.php";
include 'include.php';
session_destroy();
echo "Çıkışa yönlendiriliyorsunuz...!";
header("Refresh: 1; url=".$base_url."");
?>