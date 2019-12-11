<nav class="sidebar">
    <div class="side-header">
        <a href="{{ url('') }}">
            <img src="{{ url('img/posiana-pjg.png') }}" style="width: 100%">
        </a>
    </div>
    <div class="side-menu">
        <ul>
            <li>
                <a href="{{ url('ibu/home') }}">
                    <i class="fas fa-clipboard-list"> </i>
                    <span>KMS</span>
                </a>
            </li>
            <li>
                <a href="{{ url() }}">
                    <i class="fas fa-users"> </i>
                    <span>Anak</span>
                </a>
                <div class="side-submenu">
                    <ul>
                        <li>
                            <a href="{{ url('ibu/list-anak') }}">
                                <i class="fas fa-list-ul"></i>
                                <span>Daftar Anak</span>
                            </a>
                        </li>
                        <li>
                            <a href="{{ url('ibu/add-anak') }}">
                                <i class="fas fa-user-plus"></i>
                                <span>Tambah Anak</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            
        </ul>
    </div>
</nav>