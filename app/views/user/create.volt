<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
    <link rel="shortcut icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
    <link href="{{ url("css/logreg.css") }}" rel="stylesheet">
    <title>Cliniheal - Register Akun</title>
</head>
<body>
<div class="full-page" style="background: #f98cff">
        
    </div>
    <div class="login-form">
        <form action="{{ url("user/register") }}" method="post">
            <h3>Pendaftaran pengguna baru</h3>
            <div class="form-group ">
                <input type="username" name="username" id="username" class="form-control form-logres"
                       placeholder="Username">
                <i class="fa fa-user"></i>
                <p class="block-content nice-copy">{{messages['usernamessagese']}}</p>
            </div>
            <div class="form-group ">
                <input type="nama" name="nama" id="nama" class="form-control form-logres"
                       placeholder="nama">
                <i class="fa fa-user"></i>
                <p class="block-content nice-copy">{{messages['nama']}}</p>
            </div>
            <div class="form-group ">
                <input type="email" name="email" id="email" class="form-control form-logres" placeholder="Email">
                <i class="fa fa-envelope"></i>
                <p class="block-content nice-copy">{{messages['email']}}</p>
            </div>
            <div class="form-group log-status">
                <input type="password" name="password" id="password" class="form-control form-logres"
                       placeholder="Kata Sandi">
                <i class="fa fa-lock"></i>
                <p class="block-content nice-copy">{{messages['password']}}</p>
            </div>
            <div class="form-group log-status">
                <input type="password" name="password2" id="password2" class="form-control form-logres"
                       placeholder="Konfirmasi Kata Sandi">
                <i class="fa fa-lock"></i>
                <p class="block-content nice-copy">{{messages['password2']}}</p>
            </div>
            <div class="form-group log-status">
                <input type="text" name="str" id="str" class="form-control form-logres"
                       placeholder="Nomor STR">
                <i class="fa fa-lock"></i>
            </div>
            <div class="form-group log-status">
                <div>Saya seorang : </div>
                <input type="radio" name="tipe" value="dokter"> dokter
                <input type="radio" name="tipe" value="apoteker"> apoteker
                <input type="radio" name="tipe" value="admin"> admin
            </div>
            <span class="alert">Invalid Credentials</span>
            <input type="submit" class="log-btn" value="Daftar">
        </form>
        <p>
            Sudah terdaftar?<br>
            <a class="link" href="{{ url("user/login") }}"> Masuk disini </a>
        </p>

    </div>
</div>
</body>
<script>
        
    
</script>
</html>