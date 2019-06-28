<%-- 
    Document   : campeonato
    Created on : 11/05/2019, 22:06:54
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <title>Nome do Time</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="../css/style.css" rel="stylesheet">
        <script src="../js/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>

    <body class="body-home">
        <jsp:include page="../header.jsp"/>
        <div class="container" style="background-color: white; margin-bottom: 2%">
            <div style="padding: 16px">
                <!-- Imagem do Campeonato -->
                <div class="col-sm-12">
                    <h3 id ="nomeTime"><b>Nome do Time</b></h3>

                    <table class="col-sm-12">
                        <tr>
                            <td class="col-sm-2">
                                <img src="../imagens/team-icon.png" class="avatar img-circle" alt="avatar" width="100%" style="margin-bottom: 16px">                           
                            </td>
                            <td class="col-sm-8" style="vertical-align: top">
                                <h5><b>0</b> jogadores <b>0</b> campeonatos inscritos</h5>
                                <h5 id = "descricao">Descrição do time</h5>
                            </td>
                            <td class="col-sm-2" style="vertical-align: top">
                                <button class="button btn-sm" style="float: right">Editar</button>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="col-sm-6">
                    <table class="table table-bordered col-sm-6">
                        <thead>
                        <td colspan="2" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538"><b>Jogadores</b></td>
                        <tr style="color: #898989">
                            <th scope="col" width="90%" >NOME</th>
                            <th scope="col" width="10%" style="text-align: center">NÚMERO</th>
                        </tr>
                        </thead>
                        <tr height="57px">
                            <td style="vertical-align: middle">Nome do Jogador 1</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                        </tr>
                        <tr height="57px">
                            <td style="vertical-align: middle">Nome do Jogador 2</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                        </tr>
                        <tr height="58px">
                            <td style="vertical-align: middle">Nome do Jogador 3</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                        </tr>
                    </table>
                </div>

                <div class="col-sm-6" style="float: right">
                    <table class="table table-bordered">
                        <thead>
                        <td colspan="4" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538"><b>Campeonatos inscritos</b></td>
                        <tr style="color: #898989">
                            <th scope="col" style="text-align: center">FOTO</th>
                            <th scope="col">NOME DO CAMPEONATO</th>
                            <th scope="col" style="text-align: center">Nº DE VIEWS</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><center>
                            <img src="../imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40px">
                        </center></td>
                        <td>Campeonato 1</td>
                        <td style="text-align: center">0 visualizações</td>

                        </tr>
                        <tr>
                        <tr>
                            <td><center>
                            <img src="../imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40px">
                        </center></td>
                        <td>Campeonato 2</td>
                        <td style="text-align: center">0 visualizações</td>

                        </tr>
                        <tr>
                        <tr>
                            <td><center>
                            <img src="../imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="40px">
                        </center></td>
                        <td>Campeonato 3</td>
                        <td style="text-align: center">0 visualizações</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="../js/supertime.js"></script>

        <jsp:include page="../footer.jsp"></jsp:include>
    </body>
</html>
