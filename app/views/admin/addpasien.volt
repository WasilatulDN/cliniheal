{% extends "dashboard/baseadmin.volt" %}

{% block title %}Tambah Data Anak{% endblock %}

{% block content %}
    <div class="dashboard-header" align="right">
        <div class="dropdown-btn" style="float: right;">
            <button><i class="fas fa-user-md"> </i> Profil</button>
            <div class="dropdown-ctn">
                <ul>
                    <li>
                        <a href="{{ url('') }}">
                            Akun
                        </a>
                    </li>
                    <li>
                        <a href="{{ url('user/logout') }}">
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="home-content">
        <label>Form Tambah Pasien</label>
        <form class="data-form" action="{{ url("admin/store-pasien") }}" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="namaPasien">Nama Pasien</label><br>
                <input class="form-control" type="text" name="namaPasien" id="namaPasien">
            </div>
            <div class="form-group">
                <label for="tgllahir">Tanggal Lahir</label><br>
                <input type="date" name="tgllahir" id="tgllahir">
            </div>
            <div class="form-group">
                <label for="jkel">Jenis Kelamin</label><br>
                <input type="radio" name="jkel" value="Laki-laki"> Laki-laki
                <input type="radio" name="jkel" value="Perempuan"> Perempuan
            </div>
             <div class="form-group">
                <label for="alamat">Alamat</label><br>
                <input type="text" name="alamat" id="alamat">
            </div>
             <div class="form-group">
                <label for="telepon">Telepon</label><br>
                <input type="text" name="telepon" id="telepon">
            </div>
             <div class="form-group">
                <label for="nik">NIK</label><br>
                <input type="text" name="nik" id="nik">
            </div>

            <input class="log-btn" type="submit" value="Tambah">
        </form>
    </div>

{% endblock %}