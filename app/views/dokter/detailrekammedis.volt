{% extends "dashboard/basedokter.volt" %}

{% block title %}Detail KMS{% endblock %}

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

        <h3>Rekam medis</h3>
        tanggal : {{rm.tanggal}} <br>
        keluhan : {{rm.keluhan}} <br>
        anamnesa : {{rm.anamnesa}} <br>
        obyektif : {{rm.obyektif}} <br>
        diagnosis : {{rm.diagnosis}} <br>
        prognosis : {{rm.prognosis}} <br>
        resep : {{resep.resep}}
    </div>

       
{% endblock %}