<%-- 
    Document   : chaveamentos
    Created on : 11/05/2019, 15:45:54
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <title>Time A x Time B</title>
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

        <div class="container">
            <div class="col-sm-12" style="background-color: white; margin-bottom: 5%">
                <div class="col-sm-12">
                    <h3><b>Time A x Time B</b></h3>
                </div>

                <div class="partida">
                    <div class="col-sm-12" style="background-color: white; padding: 1%;margin-bottom: 2%">
                        <table class="col-sm-12" style="text-align: center">
                            <tr>
                                <td><img src="../imagens/team-icon.png" class="avatar img-circle img-thumbnail" alt="avatar" width="150" style="margin-bottom: 16px" id = "time"></td>
                                <td>
                                    <table class="col-sm-12" style="text-align: center">
                                        <tr>
                                            <td><h4 style="font-size: 28pt"><b>0</b></h4></td>
                                            <td><h4 style="font-size: 24pt"><b>x</h4></td>
                                            <td><h4 style="font-size: 28pt"><b>0</b></h4></td>
                                        </tr>
                                    </table>
                                    <p>Data: DD/MM/AAAA<br>
                                        Horário: HH:MM<br>
                                        Local: Campus Manaus Centro
                                    </p>
                                </td>
                                <td><img src="../imagens/team-icon.png" class="avatar img-circle img-thumbnail" alt="avatar" width="150" style="margin-bottom: 16px" id = "time"></td>
                            </tr>
                            <tr>
                                <td><h4><b>Time A</b></h4></td>
                                <td><b>0%</b> chances de ganhar x <b>0%</b> chances de ganhar<br>
                                    <i style="color: gray">Porcentagem referente às apostas</i></td>
                                <td><h4><b>Time B</b></h4></td>
                            </tr>
                        </table>
                    </div>

                    <div class="col-sm-12" style="float: left">
                        <table class="table table-bordered">
                            <thead>
                            <td colspan="6" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538; "><b>Ranking de apostas</b></td>
                            <tr style="color: #898989">
                                <th scope="col" width="1%" style="text-align: center">#</th>
                                <th scope="col" width="2%" style="text-align: center">FOTO</th>
                                <th scope="col" width="25%">USUÁRIO</th>
                                <th scope="col" width="10%" style="text-align: center">DATA</th>
                                <th scope="col" width="10%" style="text-align: center">HORÁRIO</th>
                                <th scope="col" width="10%" style="text-align: center">PLACAR</th>
                            </tr>
                            </thead>
                            <tr>
                                <td style="vertical-align: middle">1°</td>
                                <td>
                            <center>
                                <img src="../imagens/default-avatar.png" class="avatar img-circle " alt="avatar" width="80%">
                            </center>

                            </td>
                            <td style="vertical-align: middle">Nome do usuário</td>
                            <td style="text-align: center; vertical-align: middle">DD/MM/YYYY</td>
                            <td style="text-align: center; vertical-align: middle">HH:MM</td>
                            <td style="text-align: center; vertical-align: middle">Time A <b>0</b> <i style="color: gray">x</i> <b>0</b> Time B</td>
                            </tr>

                            <tr>
                                <td style="vertical-align: middle">2°</td>
                                <td>
                            <center>
                                <img src="../imagens/default-avatar.png" class="avatar img-circle " alt="avatar" width="80%">
                            </center>

                            </td>
                            <td style="vertical-align: middle">Nome do usuário</td>
                            <td style="text-align: center; vertical-align: middle">DD/MM/YYYY</td>
                            <td style="text-align: center; vertical-align: middle">HH:MM</td>
                            <td style="text-align: center; vertical-align: middle">Time A <b>0</b> <i style="color: gray">x</i> <b>0</b> Time B</td>
                            </tr>

                            <tr>
                                <td style="vertical-align: middle">3°</td>
                                <td>
                            <center>
                                <img src="../imagens/default-avatar.png" class="avatar img-circle " alt="avatar" width="80%">
                            </center>

                            </td>
                            <td style="vertical-align: middle">Nome do usuário</td>
                            <td style="text-align: center; vertical-align: middle">DD/MM/YYYY</td>
                            <td style="text-align: center; vertical-align: middle">HH:MM</td>
                            <td style="text-align: center; vertical-align: middle">Time A <b>0</b> <i style="color: gray">x</i> <b>0</b> Time B</td>
                            </tr>

                            <tr>
                                <td style="vertical-align: middle">4°</td>
                                <td>
                            <center>
                                <img src="../imagens/default-avatar.png" class="avatar img-circle " alt="avatar" width="80%">
                            </center>

                            </td>
                            <td style="vertical-align: middle">Nome do usuário</td>
                            <td style="text-align: center; vertical-align: middle">DD/MM/YYYY</td>
                            <td style="text-align: center; vertical-align: middle">HH:MM</td>
                            <td style="text-align: center; vertical-align: middle">Time A <b>0</b> <i style="color: gray">x</i> <b>0</b> Time B</td>
                            </tr>

                            <tr>
                                <td style="vertical-align: middle">5°</td>
                                <td>
                            <center>
                                <img src="../imagens/default-avatar.png" class="avatar img-circle " alt="avatar" width="80%">
                            </center>

                            </td>
                            <td style="vertical-align: middle">Nome do usuário</td>
                            <td style="text-align: center; vertical-align: middle">DD/MM/YYYY</td>
                            <td style="text-align: center; vertical-align: middle">HH:MM</td>
                            <td style="text-align: center; vertical-align: middle">Time A <b>0</b> <i style="color: gray">x</i> <b>0</b> Time B</td>
                            </tr>
                        </table>
                    <input type="button" value="Voltar" class="btn-sm" onclick="location.href = 'campeonato.jsp'" style="background-color: #696969; float: left"/>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../footer.jsp"/>
    </body>
</html>
