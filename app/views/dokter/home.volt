{% extends "dashboard/basedokter.volt" %}

{% block title %}Beranda{% endblock %}

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
        <div class="dok-hello">
            <h1 style="padding: 0px 5px">
            ini halaman dokter <br>
                Hallo, {{ session.get('auth')['username'] }}!
                
            </h1>
        </div>
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
                     {
                    title: "Aksi", field: "link", formatter: "link", formatterParams: {
                        labelField: "name",
                        label: "Buat Rekam Medis",
                        urlPrefix: "{{ url('dokter/create-rekam-medis/') }}",

                    }
                },
                ],
            });
            table.setData("{{ url('dokter/list-pasien') }}");
        </script>
{% endblock %}