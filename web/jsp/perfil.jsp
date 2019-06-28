<%-- 
    Document   : perfil
    Created on : 11/05/2019, 22:46:43
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- Required meta tags -->
        <title>Meu perfil</title>
        <script src="../js/jquery.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="../css/style.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>

    <jsp:include page="../header.jsp"/>
    <body class="body-home">
        <script src="../js/usuario/perfil.js"></script>
        <div class="container" style="background-color: white; padding: 16px; height: 540px">
            <!-- Imagem do Campeonato -->
            <div class="col-sm-12">
                <h3><b>Dados pessoais</b></h3>
                <table>
                    <tr>
                        <td class="col-sm-2">
                            <img src="../imagens/default-avatar.png" class="avatar img-circle img-thumbnail" alt="avatar"
                                 width="150" style="float: left; margin-bottom: 16px" id = "perf">
                        </td>
                        <td class="col-sm-8" style="vertical-align: top">
                            <h5>Segue <b>0</b> campeonatos</h5>
                            <h5 id="nome"><b>Nome Completo:</b> Nome + Sobrenome</h5>
                            <h5 id ="email"><b>Email:</b> Email</h5>
                            <h5><b>Sobre mim:</b> Amante de sports</h5>
                        </td>
                        <td class="col-sm-2" style="vertical-align: top">
                            <button class="btn-sm" style="float: right">Editar</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>
