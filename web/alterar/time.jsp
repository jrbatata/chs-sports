<%-- 
    Document   : times
    Created on : 18/05/2019, 18:05:55
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <!-- Required meta tags -->
        <title>Editar time</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="../js/jquery.js"></script>
    </head>
    
    <body class="body-home">
        <jsp:include page="../header.jsp"></jsp:include>
        
        <div class="container" style="background-color: white; margin-bottom: 2%">
            <div class="row">
                <!-- Imagem do Campeonato -->
                <div class="col-sm-12">
                    <h3><b>Editar time</b></h3>
                    <h5 class="help-block">Preencha apenas os campos que você deseja que seja alterado.</h5>

                    <div class="text-center">
                        <h4><b>Alterar a foto</b></h4>
                        <!-- Icone -->
                        <img src="../imagens/championship-icon.png" class="avatar img-circle img-thumbnail" alt="avatar" width="150" style="margin-bottom: 16px" id = "time">
                        <!-- Alterar Imagem -->
                        <input type="file" class="text-center center-block file-upload" id = "alterar-imagem">
                    </div>
                </div>

                <div class="col-sm-12">
                    <form class="form" action="##" method="post" id="register">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <label>Nome do Time</label>
                                <input type="text" class="form-control" id="nome" placeholder="Nome" title="Informe o nome do campeonato">
                            </div>

                            <div class="col-xs-12">
                                 <!-- Box de Descrição -->
                                 <label for="comment">Descrição</label>
                                 <textarea class="form-control" rows="3" id="descricao" placeholder="Descrição sobre o time: fale sobre o time, os jogadores..."></textarea>
                            </div>
                        </div>
                           
                        <div class="col-xs-6">
                            <!-- Combo-box de Modalidade -->
                            <label>Modalidade</label>
                            <select class="form-control" id="modalidade">
                                <option>Selecione uma modalidade...</option>
                                <option>Basquete</option>
                                <option>Futebol</option>
                                <option>Vôlei</option>
                            </select>
                        </div>
 
                        <div class="col-xs-6">
                            <!-- Combo-box de Classificação -->
                            <label>Número de jogarores</label>
                            <a href="#"><i class="material-icons" style="font-size:14px; color: grey">help_outline</i></a>
                            <select class="form-control" id="quantidade">
                                <option>Selecione uma quantidade...</option>
                                <option>5</option>
                            </select>
                        </div>

                        <div class="col-xs-6">
                            <!-- Botões de Cancelar -->
                            <button class="btn btn-cancel" onclick="location.href='../jsp/meus-times.jsp'" type="button"><i class="glyphicon glyphicon-remove"></i> Cancelar</button>
                        </div>
                        
                        <div class="col-xs-6" style="margin-bottom: 10%">
                            <!-- Botões de Prosseguir -->
                            <button class="btn btn-lg btn-primary" onclick="alterarDados()" style="float: right" type="button"> </i>Alterar</button>
                        </div>
                        <p></p>
                    </form>           
                </div>
            </div>
        </div>
        <script src="../js/time/alterar.js"></script>
        <jsp:include page="../footer.jsp"></jsp:include>
    </body>
    
    
</html>