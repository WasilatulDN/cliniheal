<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
    <link rel="shortcut icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
    <link href="{{ url("css/logreg.css") }}" rel="stylesheet">
    <title>Masuk - Cliniheal</title>
</head>
<body>
<div class="full-page" style="background: #f98cff">
    <div>{{flashSession.output()}}</div>
    <div class="login-form">
        <form action="{{ url("user/login") }}" method="post">
            <h1 style="text-align: center">Silakan Masuk</h1>
            <div class="form-group ">
                <input type="text" name="username" id="username" class="form-control" placeholder="Username">
                <i class="fa fa-user"></i>
            </div>
            <div class="form-group log-status">
                <input type="password" name="password" id="password" class="form-control" placeholder="Kata Sandi">
                <i class="fa fa-lock"></i>
            </div>
             <div class="form-group log-status">
                <div>Saya seorang : </div>
                <input type="radio" name="tipe" value="dokter"> dokter
                <input type="radio" name="tipe" value="apoteker"> apoteker
                <input type="radio" name="tipe" value="admin"> admin
            </div>
            <span class="alert">Invalid Credentials</span>
            <input type="submit" class="log-btn" value="Masuk">
        </form>
        <p>
            Belum terdaftar?
            <a class="link" href="{{ url("user/register") }}">
                <b>Daftar sekarang!</b>
            </a>

        </p>
    </div>
</div>
</body>
</html>