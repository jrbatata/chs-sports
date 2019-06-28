<%-- 
    Document   : usuario
    Created on : 18/05/2019, 15:16:53
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">

    <head>
        <!-- Required meta tags -->
        <title>Registrar-se</title>
        <meta charset="utf-8">
        <!-- conexão com firebase -->
        <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase.js"></script>
        <script src="../js/jquery.js"></script>
        <script>
            $(document).ready(function () {
                $('#alert-msg').hide();
            });
        </script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="../css/style.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
        <script src="../js/usuario/cadastro.js"></script>
    </head>

    <body class="body-home">
        <nav class="navbar navbar-light nav" style="margin-bottom: 2%">
            <div class="container-fluid">
                <div class="navbar-header">
                    <!-- Define a logo posicionada na esquerda da janela -->
                    <a class="navbar-left" href="../index.jsp"><img src="../imagens/logo.png" width="270" height="45"></a>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="../imagens/login.png" width="25" height ="25" class="d-inline-block align-top"/> <span class="caret"> </span></a>
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
                    <li><button class="btn btn-primary" onclick="location.href = 'cadastro.html'" type="button">Registrar-se</button></li>
                </ul>
            </div>
        </nav>

        <div class="container" style="background-color: white; margin-bottom: 2%">
            <div class="row">
                <!-- Imagem do Campeonato -->
                <div class="col-sm-12">
                    <div class="col-sm-12">
                        <h3><b>Registrar-se</b></h3>
                        <h5 class="help-block">Preencha os campos abaixo com seus dados para realizar o cadastro. Campos com
                            <label class="asterisco">*</label> são obrigatórios.</h5>
                    </div>

                    <div class="text-center">
                        <h4><b>Adicionar uma foto</b></h4>
                        <!-- Icone -->
                        <img src="../imagens/default-avatar.png" class="avatar img-circle img-thumbnail" alt="avatar"
                             width="150" style="margin-bottom: 16px" id = "perfil">
                        <!-- Alterar Imagem -->
                        <input type="file" class="text-center center-block file-upload" id = "alterar-imagem" >
                    </div>
                </div>

                <div class="col-sm-12">
                    <form class="form" action="##" method="post" id="register">
                        <div class="form-group">
                            <!-- Box de Nome -->
                            <div class="col-xs-6">
                                <label>Nome</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" placeholder="Primeiro nome" id="nome">
                            </div>

                            <!-- Box de Sobrenome -->
                            <div class="col-xs-6">
                                <label>Sobrenome</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="sobrenome" placeholder="Segundo nome" title="Informe o seu segundo nome">
                            </div>

                            <!-- Box de Email -->
                            <div class="col-xs-6">
                                <label>Email</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" placeholder="Email" id="useremail">
                            </div>

                            <!-- Box de CPF -->
                            <div class="col-xs-6">
                                <label>CPF</label><label class="asterisco">*</label>
                                <input id="cpf" name="cpf" placeholder="XXX.XXX.XXX-XX" class="form-control input-md" type="text" maxlength="14" pattern="[0-9]+$">
                            </div>

                            <!-- Box de Senha -->
                            <div class="col-xs-6">
                                <label>Senha</label><label class="asterisco">*</label>
                                <input type="password" class="form-control" id="usersenha" placeholder="***********">
                            </div>

                            <!-- Box de Confirmar Senha -->
                            <div class="col-xs-6">
                                <label>Confirmar senha</label><label class="asterisco">*</label>
                                <input type="password" class="form-control" id="confirmarsenha" placeholder="***********">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-12 alerta" id="alert-msg">
                <span id="alert-text"><b>Erro: Preencha todos os campos obrigatórios (<label class="asterisco">*</label> ) de maneira correta.</b></span>
            </div>
            <div class="col-lg-12" style="margin-bottom: 5%">
                <button class="btn btn-primary" style="float: right; margin-top: 2%" type="button" onclick=prosseguir()>Prosseguir</button>
            </div> 
        </div>
    </body>

    <jsp:include page="../footer.jsp"></jsp:include>
</html>
