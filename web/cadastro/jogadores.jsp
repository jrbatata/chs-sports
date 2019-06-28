<%-- 
    Document   : jogadores
    Created on : 18/05/2019, 15:46:16
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <!-- Required meta tags -->
        <title>Adicionar jogadores</title>
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
                <!-- Nome dos jogadores -->
                <div class="col-sm-12">
                    <h3><b>Adicionar jogadores</b></h3>
                    <h5 class="help-block">Para finalizar o cadastro do seu time, adicione os jogadores participantes</h5>
                </div>

                <div class="col-sm-12">
                    <form class="form" action="##" method="post" id="register">
                        <div class="form-group">
                            <div class="col-xs-6">
                                <label>Jogador</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="jogador1" placeholder="Nome" title="Nome">
                            </div>
                            <div class="col-xs-6">
                                <label>Número</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="numero1" placeholder="Nome" title="Nome">
                            </div>

                            <div class="col-xs-6">
                                <label>Jogador</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="jogador2" placeholder="Nome" title="Nome">
                            </div>
                            <div class="col-xs-6">
                                <label>Número</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="numero2" placeholder="Nome" title="Nome">
                            </div>

                            <div class="col-xs-6">
                                <label>Jogador</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="jogador3" placeholder="Nome" title="Nome">
                            </div>
                            <div class="col-xs-6">
                                <label>Número</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="numero3" placeholder="Nome" title="Nome">
                            </div>

                            <div class="col-xs-6">
                                <label>Jogador</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="jogador4" placeholder="Nome" title="Nome">
                            </div>
                            <div class="col-xs-6">
                                <label>Número</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="numero4" placeholder="Nome" title="Nome">
                            </div>

                            <div class="col-xs-6">
                                <label>Jogador</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="jogador5" placeholder="Nome" title="Nome">
                            </div>
                            <div class="col-xs-6">
                                <label>Número</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="numero5" placeholder="Nome" title="Nome">
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <!-- Botões de Cancelar -->
                            <button class="btn btn-cancel" onclick="location.href = '../jsp/meus-times.jsp'" type="button"><i class="glyphicon glyphicon-remove"></i> Cancelar</button>
                        </div>

                        <div class="col-xs-6" style="margin-bottom: 10%">
                            <!-- Botões de Prosseguir -->
                            <button class="btn btn-primary" style="float: right" onclick="location.href = '../jsp/home.jsp'" type="button" style="position: absolute; float: right">Prosseguir</button>
                        </div>                       
                    </form>           
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
    </body>
</html>