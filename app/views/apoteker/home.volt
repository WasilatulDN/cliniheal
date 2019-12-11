{% extends "dashboard/baseibu.volt" %}

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
        <div class="dok-hello">
            <h1 style="padding: 0px 5px">
            ini halaman apoteker <br>
                Hallo, {{ session.get('auth')['username'] }}!
                
            </h1>
        </div>

    </div>
    <script>
        var table = new Tabulator("#daftar-kms", {
            height: "311px",
            layout: "fitColumns",
            placeholder: "Tidak Ada KMS",
            columns: [
                {title: "No", field: "no", formatter: "rownum", width: 10},
                {title: "Nama", field: "nama"},
                {title: "Tanggal", field: "tanggal"},
                // {title: "Tanggal Lahir", field: "tglLahir"},
                {
                    title: "Lihat", field: "link", formatter: "link", formatterParams: {
                        labelField: "name",
                        label: "Lihat",
                        urlPrefix: "{{ url('ibu/detail-kms/') }}",
                        target: "_blank",
                    }
                },
                // {
                //     title: "Hapus", field: "link", formatter: "link", formatterParams: {
                //         labelField: "name",
                //         label: "Hapus",
                //         urlPrefix: "{{ url('dokter/hapuspasien/') }}",
                //         // target: "_blank",
                //     }
                // }
            ],
        });
        table.setData("{{ url('ibu/list-kms') }}");
    </script>
{% endblock %}