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
    <h2 class="dashboard-title">Daftar Rekam Medis</h2>
                <div id="daftar-rekam-medis"></div>
            </div>
        </div>
        <script>
            var table = new Tabulator("#daftar-rekam-medis", {
                height: "311px",
                layout: "fitColumns",
                placeholder: "Tidak Ada Rekam Medis",
                columns: [
                    {title: "No", field: "no", formatter: "rownum", width: 10},
                    {title: "Tanggal", field: "tanggal"},
                    {title: "Nama", field: "nama"},
                     {
                    title: "Detail", field: "link", formatter: "link", formatterParams: {
                        labelField: "name",
                        label: "Detail Rekam Medis",
                        urlPrefix: "{{ url('dokter/detail-rekam-medis/') }}",

                    }
                },
                ],
            });
            table.setData("{{ url('dokter/list-rekam-medis') }}");
        </script>
{% endblock %}