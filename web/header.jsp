<script src='http://code.jquery.com/jquery-2.1.3.min.js'></script>
<script src='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script>
    $(function () {
        $('.dropdown-toggle').dropdown();
    });
</script>

<!-- conexão com firebase -->
<script src="https://www.gstatic.com/firebasejs/5.9.2/firebase.js"></script>
<script>
// Initialize Firebase
    var config = {
        apiKey: "AIzaSyBPK18lbuQY_Gz8gElaSjrTQW0h6LerKZw",
        authDomain: "chs-sports.firebaseapp.com",
        databaseURL: "https://chs-sports.firebaseio.com",
        projectId: "chs-sports",
        storageBucket: "chs-sports.appspot.com",
        messagingSenderId: "869512249195"
    };
    firebase.initializeApp(config);
</script>
<!-- IMAGEM DO USUARIO-->
<script src="../js/usuario/usuario.js"></script>

<!-- Navbar -->
<nav class="navbar navbar-light nav">
    <div id="loader" class="loader"></div>
    <div style="display:none" id="tudo_page"><div></div>
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-left" href="../jsp/home.jsp"><img src="../imagens/logo.png" width="270" height="45"></a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <form class="navbar-form navbar-left">
                    <form class="navbar-form" role="search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Pesquisar" name="q">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i
                                        class="glyphicon glyphicon-search"></i></button>
                            </div>
                        </div>
                    </form>
                </form>
                <li>
                    <!-- Menu Dropdown -->
                    <div class="dropdown">
                        <button type="button" class="btn username dropdown-toggle" data-toggle="dropdown">
                            <div>
                                <img src="../imagens/default-avatar.png" height="35" style="margin-right: 5px" id="perfil"/>
                                <label id="username" name="username" for="username" style="color: black">Nome do Usuário </label>
                                <span class="caret"></span>
                            </div></button>
                        <div class="dropdown-menu" height="100" role="menu">
                            <a class="menu-item" href="../jsp/meus-campeonatos.jsp">Meus campeonatos</a><br>
                            <a class="menu-item" href="../jsp/meus-times.jsp">Meus times</a><br>
                            <a class="menu-item" href="../jsp/perfil.jsp">Meu perfil</a><br>
                            <a class="menu-item" href="../index.jsp" onclick="logout()">Sair</a><br>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
</nav>