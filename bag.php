
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "spor";
$base_url="http://127.0.0.1:8080/spor";

echo '<head><link rel="stylesheet" type="text/css" href="'.$base_url.'/style.css"></head>';
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
?>