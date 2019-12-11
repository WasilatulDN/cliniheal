{% extends "dashboard/basedokter.volt" %}

{% block title %}KMS Ibu{% endblock %}

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
        <label>Formulir Rekam Medis</label>
        <form class="data-form" action="{{ url("dokter/store-rekam-medis") }}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="idPasien" id="idPasien" value= {{ pasien.idPasien }}> <br>
            <div class="form-group">
                <label for="tanggal">Tanggal Kunjungan</label><br>
                <input class="form-control" type="date" name="tanggal" id="tanggal">
            </div>
            <div class="form-group">
                <label for="keluhan">keluhan</label><br>
                <input type="text" name="keluhan" id="keluhan">
            </div>
            <div class="form-group">
                <label for="anamnesa">anamnesa</label><br>
                <input type="text" name="anamnesa" id="anamnesa">
            </div>
            <div class="form-group">
                <label for="obyektif">obyektif</label><br>
                <input type="text" name="obyektif" id="obyektif"> <br>
            </div>
            <div class="form-group">
                <label for="diagnosis">diagnosis</label><br>
                <input type="text" name="diagnosis" id="diagnosis"> <br>
            </div>
            <div class="form-group">
                <label for="prognosis">prognosis</label><br>
                <input type="text" name="prognosis" id="prognosis">
            </div>
            <div class="form-group">
                <label for="resep">resep</label><br>
                <input type="text" name="resep" id="resep">
            </div>

            <input class="log-btn" type="submit" value="Simpan">
        </form>
    </div>

{% endblock %}