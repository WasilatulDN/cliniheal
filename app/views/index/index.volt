{% extends "layouts/base.volt" %}

{% block title %}Sistem Pencatatan Posyandu Online{% endblock %}

{% block content %}
    {% include 'layouts/navbar.volt' %}
    <div class="full-page" style="position: static!important;">
        <div class="page-content">
            <h1 align="center">
                <img src="{{ url('img/posiana-logo.png') }}" style="max-width: 380px">
            </h1>
            <h1 align="center">
                <b>
                    Sistem Pencatatan Posyandu Online
                </b>
            </h1>
        </div>
    </div>
    
    <div class="footer">
        <p align="center">Copyright &copy; 2019 — <a href="{{ url() }}" style="text-decoration: none; color: #ea194b">Posiana</a>
        </p>
    </div>
{% endblock %}