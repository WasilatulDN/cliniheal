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
            <div class="dok-hello">
            <h1 style="padding: 0px 5px">
            ini halaman admin <br>
                Hallo, {{ session.get('auth')['username'] }}!
                
            </h1>
        </div>
        <form action="{{ url("admin/search-pasien") }}" method="post">
            <h3>Masukkan NIK </h3>
            <div class="input-group">
                <div class="input-group-ctn">
                    <input type="text" name="nik" id="nik" style="padding: 5%">
                </div>
                <div class="input-group-back">
                    <input type="submit" value="Tambah">
                </div>
            </div>
        </form>

        <div class="home-content">
            <h2 class="dashboard-title">List Antrian</h2>
            <div id="list-antrian"></div>
        </div>
    </div>
     <script>
        var table = new Tabulator("#list-antrian", {
            height: "311px",
            layout: "fitColumns",
            placeholder: "Tidak Ada Antrian",
            columns: [
                {title: "No", field: "no", formatter: "rownum", width: 10},
                {title: "Nama Pasien", field: "nama"},
                {title: "Alamat", field: "alamat"},
                {title: "Status", field: "status"},
                {
                    title: "Selesai", field: "link", formatter: "link", formatterParams: {
                        labelField: "name",
                        label: "Selesai",
                        urlPrefix: "{{ url('admin/update-antrian/') }}",

                    }
                },
                {
                    title: "Hapus", field: "link", formatter: "link", formatterParams: {
                        labelField: "name",
                        label: "Hapus",
                        urlPrefix: "{{ url('admin/delete-antrian/') }}",

                    }
                },
            ],
        });
        table.setData("{{ url('admin/list-antrian') }}");
    </script>
{% endblock %}