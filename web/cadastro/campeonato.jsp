<%-- 
    Document   : campeonato
    Created on : 11/05/2019, 19:24:45
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pt">

    <head>
        <!-- Required meta tags -->
        <title>Criar campeonato</title>
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
        <jsp:include page="../header.jsp"/>
  
    </head>

    <body class='body-home'>      
        <div class="container" style="background-color: white; margin-bottom: 2%">
            <div class="row col-sm-12" style="padding: 16px">
                <!-- Imagem do Campeonato -->
                <div class="col-sm-12">
                    <h3><b>Criar campeonato</b></h3>
                    <h5 class="help-block">Preencha os campos abaixo com seus dados do seu campeonato. Campos com <label class="asterisco">*</label> são obrigatórios.</h5>

                    <div class="text-center">
                        <h4><b>Adicionar uma foto</b></h4>
                        <!-- Icone -->
                        <img src="../imagens/championship-icon.png" class="avatar img-circle img-thumbnail" alt="avatar" width="150" style="margin-bottom: 16px" id="campeonato">
                        <!-- Alterar Imagem -->
                        <input type="file" class="text-center center-block file-upload" id="alterar-imagem">
                    </div>
                </div>

                <div class="col-sm-12">
                    <form class="form" action="##" method="post" id="register">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <label>Nome do Campeonato</label><label class="asterisco">*</label>
                                <input type="text" class="form-control" id="nome" placeholder="Nome" title="Informe o nome do campeonato">
                            </div>

                            <div class="col-xs-12">
                                <!-- Box de Descrição -->
                                <label for="comment">Descrição</label><label class="asterisco">*</label>
                                <textarea class="form-control" rows="3" id="descricao" placeholder="Descrição sobre o campeonato: fale sobre o time, os jogadores..."></textarea>
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <!-- Combo-box de Modalidade -->
                            <label>Modalidade</label><label class="asterisco">*</label>
                            <select class="form-control" id="modalidade">
                                <option>Selecione uma modalidade...</option>
                                <option>Basquete</option>
                                <option>Futebol</option>
                                <option>Vôlei</option>
                            </select>
                        </div>

                        <div class="col-xs-6">
                            <!-- Combo-box de Classificação -->
                            <label>Classificação</label><label class="asterisco">*</label>
                            <a href="#"><i class="material-icons" style="font-size:14px; color: grey">help_outline</i></a>
                            <select class="form-control" id="classificacao">
                                <option>Selecione uma classificação...</option>
                                <option>Mata-mata</option>
                                <option>Campeonato</option>
                            </select>
                        </div>

                        <div class="col-xs-6">
                            <!-- Caixa de Texto da Data de Início -->
                            <label>Data de Início</label><label class="asterisco">*</label>
                            <input type="date" class="form-control datas" placeholder="DD/MM/AAAA" id="dataInicio">
                        </div>

                        <div class="col-xs-6">
                            <label>Data de Fim</label>
                            <input type="date" class="form-control datas" placeholder="DD/MM/AAAA" id="dataFim">
                        </div>

                        <div class="col-xs-12">
                            <!-- Box de Enviar arquivo de regra -->
                            <div class="custom-file">
                                <label class="custom-file-label" style="margin-left: 0%; margin-top: 1%" for="customFile">Enviar as regras (.pdf)</label>
                                <input type="file" class="custom-file-input" style="margin-left: 0%" id="regras">
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <!-- Botões de Cancelar -->
                            <button class="btn btn-cancel" onclick="location.href = '../jsp/meus-campeonatos.jsp'" type="button"><i class="glyphicon glyphicon-remove"></i> Cancelar</button>
                        </div>

                        <div class="col-xs-6" style="margin-bottom: 2%">
                            <!-- Botões de Prosseguir -->
                            <button class="btn btn-lg btn-primary" style="float: right" onclick="prosseguir()" type="button"> </i>Prosseguir</button>
                        </div>
                        <p></p>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
        <script src="../js/campeonato/cadastro.js"></script>
    </body>

</html>