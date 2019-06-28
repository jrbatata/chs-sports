<%-- 
    Document   : index
    Created on : 12/05/2019, 00:36:15
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt">
    <head>
        <!-- Required meta tags -->
        <title>CHS Sports: Um gerenciador de campeonatos esportivos</title>
        <meta charset="utf-8">
        <!-- conexão com firebase -->
        <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/usuario/login.js"></script>
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link href="css/style.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>

    <body>
        <nav class="navbar navbar-light nav">
            <div class="container-fluid">
                <div class="navbar-header">
                    <!-- Define a logo posicionada na esquerda da janela -->
                    <a class="navbar-left" href="index.html"><img src="imagens/logo.png" width="270" height="45"></a>
                </div>
                <!-- Posiciona os outros componentes a direita da janela -->
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <form class="navbar-form" role="search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Pesquisar" name="q">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </li>

                    <!-- Login Dropdown -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="imagens/login.png" width="25" height ="25" class="d-inline-block align-top"/> <span class="caret"> </span></a>
                        <ul id="login-dp" class="dropdown-menu">
                            <li>
                                <div class="row">
                                    <div class="col-md-12">
                                        <p style="text-align: center"><b>Acesse sua conta</b></p>
                                        <form class="form" role="form" method="post" id="login-nav">
                                            <div class="form-group">
                                                <input type="email" class="form-control" id="email" placeholder="Endereço de email" required="">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control" id="senha" placeholder="Senha" required="">
                                                <div class="help-block text-right" style="text-align: center; vertical-align: middle; margin-top: 5%">
                                                    <a href="#">Esqueceu sua senha?</a>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button type="button" class="btn btn-signin btn-block" onclick="entrar()">Entrar</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="bottom text-center">Novo aqui?
                                        <a href="cadastro.html"><b>Junte-se a nós</b></a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Botão Registrar-se -->
                    <li><button class="btn btn-primary" onclick="location.href = 'cadastro/usuario.jsp'" type="button">Registrar-se</button></li>
                </ul>
            </div>
            <!-- Slides -->
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="imagens/header-01.png " alt="Los Angeles" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="imagens/header-02.png" alt="Chicago" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="imagens/header-03.png" alt="New york" style="width:100%;">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="col-lg-12 text-center">
                <!-- Header, texto e botão -->

                <h2 style='padding-top: 3%'>Crie o seu campeonato, é gratuito!</h2>
                <button class="btn btn-register" style='margin-bottom: 3%' onclick="location.href = 'cadastro/usuario.jsp'" type="button">Registrar-se</button>
            </div>

            <div class="col-sm-12" style="margin-bottom: 3%">
                <div class="col-sm-6" style="float:left;">
                    <table class="table table-bordered">
                        <thead>
                        <td colspan="4" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538"><b>Campeonatos mais seguidos</b></td>
                        <tr style="color: #898989">
                            <th scope="col" style="text-align: center">FOTO</th>
                            <th scope="col">NOME DO CAMPEONATO</th>
                            <th scope="col" style="text-align: center">Nº DE SEGUIDORES</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><center>
                            <img src="imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40">
                        </center></td>
                        <td>Campeonato 1</td>
                        <td style="text-align: center">0 seguidores</td>

                        </tr>
                        <tr>
                        <tr>
                            <td><center>
                            <img src="imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40">
                        </center></td>
                        <td>Campeonato 2</td>
                        <td style="text-align: center">0 seguidores</td>

                        </tr>
                        <tr>
                        <tr>
                            <td><center>
                            <img src="imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40">
                        </center></td>
                        <td>Campeonato 3</td>
                        <td style="text-align: center">0 seguidores</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="col-sm-6" style="float: right">
                    <table class="table table-bordered">
                        <thead>
                        <td colspan="4" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538"><b>Campeonatos mais vistos</b></td>
                        <tr style="color: #898989">
                            <th scope="col" style="text-align: center">FOTO</th>
                            <th scope="col">NOME DO CAMPEONATO</th>
                            <th scope="col" style="text-align: center">Nº DE VIEWS</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><center>
                            <img src="imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40">
                        </center></td>
                        <td>Campeonato 1</td>
                        <td style="text-align: center">0 visualizações</td>

                        </tr>
                        <tr>
                        <tr>
                            <td><center>
                            <img src="imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40">
                        </center></td>
                        <td>Campeonato 2</td>
                        <td style="text-align: center">0 visualizações</td>

                        </tr>
                        <tr>
                        <tr>
                            <td><center>
                            <img src="imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40">
                        </center></td>
                        <td>Campeonato 3</td>
                        <td style="text-align: center">0 visualizações</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </nav>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
