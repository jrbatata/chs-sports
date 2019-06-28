<%-- 
    Document   : home
    Created on : 11/05/2019, 14:32:00
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt">

    <head>
        <!-- Required meta tags -->
        <title>CHS Sports: Um gerenciador de campeonatos esportivos</title>
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

        <div class="container col-sm-8" style="background-color: white; margin-bottom: 3%; padding-bottom: 5%; margin-left: 7%; height: 100%" >
            <h3><b>Feed de Atualizações</b></h3>
            <h5 class="help-block" style="margin-bottom: 1%">Nesta seção, você tem acesso a todas as notificações dos campeonatos que você segue.</h5>
            <!-- Se tiver post
            <table width="100%" style="border-bottom: 1px solid lightgrey;">
                <tr>
                    <td width="8%">
                <center>
                    <img src="../imagens/championship-icon.png" class="avatar img-circle " alt="avatar" width="80%" style="margin-bottom: 16px; vertical-align: bottom">
                </center>
                </td>
                <td>
                    <h4><b>Nome do Campeonato</b></h4>
                    <p width="78%" style="overflow: hidden; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; vertical-align: bottom">
                        Breaking India: Western Interventions in Dravidian and Dalit Faultlines is a book written by Rajiv Malhotra and Aravindan Neelakandan which argues that India's integrity is being undermined.</p>
                </td>
                <td width="14%">
                    <p style="text-align: end">há 0 minutos atrás</p><br>
                    <button class="btn-sm" onclick="location.href = '../jsp/campeonato.jsp'" style="float: right">Ver mais</button>
                </td>
                </tr>
            </table> -->
            
            <center id="no-championship" style="position: relative; top: 50%; margin: 8%;">
                <img src="../imagens/no-championship.png" width="150px" style="margin-bottom:0px"/>
                <h1 style="font-size: 24px">Você não está seguindo nenhum campeonato</h1>
            </center>

            <p style="color: white">AAAAAAAAAAAAAAAAAAAAAaaaa</p>
        </div>
        
        <div id="recomendados" class="container col-sm-2" style="background-color: white; margin-bottom: 3%; margin-left: 2%; padding-bottom: 1%; height: 100%" >
            <h3><b>Recomendados</b></h3>
            
        </div>
        
        <script src="../js/home/campeonatos.js"></script>
    </body>

    <jsp:include page="../footer.jsp"></jsp:include>
</html>