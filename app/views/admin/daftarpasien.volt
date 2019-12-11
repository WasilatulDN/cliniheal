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
        <div>{{flashSession.output()}}</div>
        <div class="home-content">
            <h2 class="dashboard-title">Daftar Pasien</h2>
            <div id="daftar-pasien"></div>
        </div>
    </div>
     <script>
        var table = new Tabulator("#daftar-pasien", {
            height: "311px",
            layout: "fitColumns",
            placeholder: "Tidak Ada Pasien",
            columns: [
                {title: "No", field: "no", formatter: "rownum", width: 10},
                {title: "NIK", field: "nik"},
                {title: "Nama", field: "nama"},
                {title: "Alamat", field: "alamat"},
                {title: "Jenis Kelamin", field: "jkel"},
                {title: "Tanggal Lahir", field: "tgllahir"},
            ],
        });
        table.setData("{{ url('admin/list-pasien') }}");
    </script>
{% endblock %}