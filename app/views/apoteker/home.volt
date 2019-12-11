{% extends "dashboard/baseapoteker.volt" %}

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
            ini halaman apoteker <br>
                Hallo, {{ session.get('auth')['username'] }}!
                
            </h1>
        </div>
        <h2 class="dashboard-title">Daftar Resep</h2>
        <div id="daftar-resep"></div>
        </div>
        </div>
        <script>
            var table = new Tabulator("#daftar-resep", {
                height: "311px",
                layout: "fitColumns",
                placeholder: "Tidak Ada Resep",
                columns: [
                    {title: "No", field: "no", formatter: "rownum", width: 10},
                    {title: "Tanggal", field: "tanggal"},
                    {title: "Nama", field: "nama"},
                    {title: "Alamat", field: "alamat"},
                    {title: "Resep", field: "resep"},
                    {title: "Status", field: "status"},
                     {
                    title: "Selesai", field: "link", formatter: "link", formatterParams: {
                        labelField: "name",
                        label: "Selesai",
                        urlPrefix: "{{ url('apoteker/update-resep/') }}",

                    }
                },
                ],
            });
            table.setData("{{ url('apoteker/list-resep') }}");
        </script>
{% endblock %}