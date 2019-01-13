
<html>
<head>
</head>
<body>

<h2>Admin Girişi</h2>


  <form action="action_page.php" method="POST">
    <div class="imgcontainer">
      <img src="d.jpg" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label for="uname"><b>Kullanıcı adı</b></label>
      <input type="text" placeholder="Kullanıcı adı" name="uname" required><br>

      <label for="psw"><b>Şifre</b></label>
      <input type="password" placeholder="Parola" name="psw" required>
        
      <button type="submit">Giriş</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Hatırla
      </label>
    </div>

    <div class="container" style="background-color:#5555">
      <span class="psw">Hatırla <a href="#">parola?></span>
    </div>
  </form>
</body>
</html>
