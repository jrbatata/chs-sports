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
        <title>Chaveamentos</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="../css/style.css" rel="stylesheet">
        <script src="../js/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>

    <body class="body-home">
        <jsp:include page="../header.jsp"/>

        <div class="container">
            <div class="row col-sm-12" style="background-color: white; margin-bottom: 5%">
                <h3><b>Chaveamento do Campeonato</b></h3>
                <h5 class="help-block">Nesta seção, você tem acesso a todas as partidas do campeonato.</h5>

                <div class="partida" style="margin-top: 2%">
                    <div class="titulo-chaveamento col-sm-12" style="background-color: #289D1C; text-align: center">
                        <h4 style="color: white; vertical-align: middle;"><b>TIME A x TIME B</b></h4>
                    </div>

                    <div class="col-sm-12" style="background-color: white; padding: 1%; border: 3px solid #289D1C; margin-bottom: 2%">
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
                                <td><button class="btn-sm" onclick="location.href = 'partida.jsp'" style="width: 100%;"/>Ver mais</td>
                                <td><h4><b>Time B</b></h4></td>
                            </tr>
                        </table>
                    </div>
                    <center style="margin-bottom: 2%">
                        <button class="button btn-dark" width="25px">1</button>
                        <button class="button btn-dark" width="25px">2</button>
                        <button class="button btn-dark" width="25px">3</button>
                    </center>
                </div>
            </div>
        </div>

        <jsp:include page="../footer.jsp"/>
    </body>
</html>
