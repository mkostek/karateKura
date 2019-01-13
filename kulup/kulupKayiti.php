<?php
$flag=1;
require_once "../bag.php";
require_once '../PHPMailer.php';
$ilce=$_POST["ilce"];
$maili=$_POST["mail"];
$kulup=$_POST["kulup"];
$psw=$_POST["psw"];
$rpsw=$_POST["rpsw"];
$kullanıcıad=$_POST["kullanıcıad"];
$sql="select *from kulup where kullaniciAd='".$kullanıcıad."'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
	echo "Aynı ada sahip bir kullanıcı bulunmaktadır!<br>";
	$flag=0;
}
if(empty($kullanıcıad))
{
	echo "kullanıcı ad boş geçilemez<br>";
	$flag=0;
}
if(empty($ilce))
{
	echo "ilçe boş geçilemez<br>";
	$flag=0;
}
if(empty($maili))
{
	echo "mail boş geçilemez<br>";
	$flag=0;
}
if(empty($kulup))
{
	echo "kulup boş geçilemez<br>";
	$flag=0;
}
if(empty($psw))
{
	echo "şifre boş geçilemez<br>";
	$flag=0;
}
if(empty($rpsw))
{
	echo "şifre onay boş geçilemez<br>";
	$flag=0;
}
if(strcmp($psw,$rpsw))
{
	echo "şifre onay yanlış<br>";
	$flag=0;
}
$sql="select *from kulup where kulupAd='".$kulup."' and ilceId=".$ilce."";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
	echo "Kulüp adı ve ilce adında bir kayıt mevcuttur!<br>";
	$flag=0;
}
if(!filter_var($maili, FILTER_VALIDATE_EMAIL)){
echo "Geçersiz email adresi<br>";
$flag=0;
}
$sql="select *from kulup where mail='".$maili."'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
	echo "Bu mail adresi kullanımdadır!<br>";
	$flag=0;
}
if($flag==0){
	echo "Lütfen bilgilerinizin doğruluğundan emin olun!";
	header("Refresh: 2;url=".$base_url."/kulup/kulupKayit.php");	
}
else{
	$sql="INSERT INTO kulup(kulupAd,kullaniciAd,kulupSifre, kulupMail, ilceId,aktif) VALUES('".$kulup."','".$kullanıcıad."','".$psw."','".$maili."',".$ilce.",0)";
	if ($conn->query($sql) === TRUE) 
	$id=$conn->insert_id;
			if(!empty($id)) {
						$mail = new PHPMailer();
			$mail->SMTPAuth = true;
			$mail->IsSMTP();
			$mail->Host = 'smtp.yandex.com';
			$mail->Port = 465;
			$mail->SMTPSecure = 'ssl';
			$mail->Username = 'eliteboymusti@yandex.com';
			$mail->Password = 'zinedinezidane';
			$mail->SetFrom('eliteboymusti@yandex.com', "Üyelik Onayla");
			$mail->AddAddress($maili, 'mkostek');
			$mail->CharSet = 'UTF-8';
			$mail->Subject = "Kullanıcı Aktivasyon Maili";
			//$message="";
			$actual_link = "".$base_url."/kulup/aktif.php?id=".(6*$id-4)."";
			$message="<p>Linki tıklayarak aktivasyonu tamamlayın.<a href='" . $actual_link . "'>" . $actual_link . "</a></p>";
			$mail->MsgHTML($message);

			if($mail->Send())
			{
			echo ' Mail gönderildi!';
			header("Refresh: 1;url=".$base_url."/kulup/kulupGir.php");	
			} else {
			echo 'Mail gönderilirken bir hata oluştu: ' . $mail->ErrorInfo;
			}
			}else echo "Veritabanı ekleme hatası";			
}
?>