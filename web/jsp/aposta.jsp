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
                    <div class="col-sm-12" style="background-color: white; padding: 1%;margin-bottom: 2%;height: 400px">
                        <table class="col-sm-12" style="text-align: center">
                            <tr>
                                <td><img src="../imagens/team-icon.png" class="avatar img-circle img-thumbnail" alt="avatar" width="150" style="margin-bottom: 16px" id = "time"></td>
                                <td>
                                    <table class="col-sm-12" style="text-align: center">
                                        <tr>
                                            <td>
                                        <center>
                                            <h4><b>Número de Gols:</b></h4>
                                            <input type="text" id="golsA">
                                        </center></td>
                                <td><h4 style="font-size: 24pt"><b>x</h4></td>
                                <td>
                            <center>
                                <h4><b>Número de Gols:</b></h4>
                                <input type="text" id="golsA">
                            </center></td>
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
                                <i style="color: gray">Porcentagem referente às apostas</i><br><br>
                                <input type="button" value="Cancelar" class="btn-sm" onclick="location.href = 'campeonato.jsp'" style="background-color: #696969; width: 48%; margin-left: 2%; margin-right: 2%"/>
                                <input type="button" value="Enviar aposta" class="btn-sm" onclick="location.href = 'partida.jsp'" style="width: 48%;"/>
                            </td>
                            <td><h4><b>Time B</b></h4></td>
                        </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../footer.jsp"/>
    </body>
</html>
