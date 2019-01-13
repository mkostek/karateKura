<?php 
include "../PHPMailer.php";
include "../bag.php";
if($_POST)
{
$sql="select kulupSifre from kulup where kullaniciad='".$_POST["kullaniciad"]."' and kulupMail='".$_POST["maili"]."'";
$result = $conn->query($sql);
if($result->num_rows>0)
{
	while($row = $result->fetch_assoc()) {  
		$kulupSifre=$row["kulupSifre"];
	}
	$mail = new PHPMailer();
			$mail->SMTPAuth = true;
			$mail->IsSMTP();
			$mail->Host = 'smtp.yandex.com';
			$mail->Port = 465;
			$mail->SMTPSecure = 'ssl';
			$mail->Username = 'eliteboymusti@yandex.com';
			$mail->Password = 'zinedinezidane';
			$mail->SetFrom('eliteboymusti@yandex.com', "Üyelik Şifreniz");
			$mail->AddAddress($_POST["maili"], 'mkostek');
			$mail->CharSet = 'UTF-8';
			$mail->Subject = "Kullanıcı Şifre Bilgilendirmesi";
			//$message="";
			$message="<p>Şifrenizi unutmayın!...<b>".$kulupSifre."</b></p>";
			$mail->MsgHTML($message);

			if($mail->Send())
			{
			echo '<p>Şifreniz mailinize gönderildi!</p>';
			} else {
			echo '<p>Mail gönderilirken bir hata oluştu:</p> ' . $mail->ErrorInfo;
			}	
}else echo "p>Böyle bir kullanıcı kayıtlarda bulunmamaktadır</p>";	
}

?>
<div>
<form action="sifreUnuttum.php" method="post">
<h4>Sifremi Unuttum </h4>
<p>Kullanıcı adınızı giriniz:<input type="text" name="kullaniciad"></p>
<p>Mail adresinizi giriniz:<input type="text" name="maili"></p>
<input type="submit" value="onayla">
</div>
