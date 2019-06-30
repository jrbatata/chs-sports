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
        <title>Nome do Campeonato</title>
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
                    <h3><b id="nomeCampeonato">Nome do Cameponato</b></h3>

                    <table class="col-sm-12">
                        <tr>
                            <td class="col-sm-2">
                                <img src="../imagens/championship-icon.png" class="avatar img-circle" alt="avatar" width="100%" style="margin-bottom: 16px" id="imagemCampeonato">                           
                            </td>
                            <td class="col-sm-3" style="vertical-align: top">
                                <h5 id = "seguidores"><b>0</b> visualizações <b>0</b> seguidores</h5>
                                <h5 id = "descricao">Descrição do campeonato</h5>
                            </td>
                            <td id="divSeguir" class="col-sm-3" style="vertical-align: top;">
                                <button class="button btn-sm" id="seguirCampeonato" style="font-variant-caps: normal; width: 100%; margin-right: 1%; float: right" onclick="seguir()">Seguir</button>
                            </td>
                            <td id="divChaveamento" class="col-sm-2" style="vertical-align: top;">
                                <button class="button btn-sm" id="gerarChaveamento" style="font-variant-caps: normal; width: 100%; float: right">Gerar Chaveamento</button><br>
                            </td>
                            <td id="divAtualizaçao" class="col-sm-2" style="vertical-align: top;">
                                <button class="button btn-sm" id="publicarAtualizacao" data-toggle="modal" data-target="#adicionarpublicacao" style="font-variant-caps: normal; width: 100%; float: right">Publicar atualização</button>
                            </td>

                        <div class="modal fade" id="adicionarpublicacao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLabel" style="font-size: 18pt">Nova publicação</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Título:</label>
                                                <input type="text" class="form-control" id="recipient-name">
                                            </div>
                                            <div class="form-group">
                                                <label for="message-text" class="col-form-label">Mensagem:</label>
                                                <textarea class="form-control" id="message-text"></textarea>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Fechar</button>
                                        <button type="button" class="btn btn-primary">Enviar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </tr>
                    </table> 

                    <div id="partidas">
                        <div class="col-sm-6" style="float: left">
                            <table class="table table-bordered">
                                <thead>
                                <td colspan="3" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538; vertical-align: middle"><b>Jogo Anterior</b></td>
                                <td colspan="2" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538; border-left: hidden"><button class="button btn-sm" onclick="location.href = 'chaveamento.jsp'" style="float: right; width: 100%;">Chaveamento completo</button></td>
                                <tr style="color: #898989">
                                    <th scope="col" width="35%" style="text-align: center">TIME A</th>
                                    <th scope="col" width="10%" style="text-align: center">GOLS</th>
                                    <th scope="col" width="10%" style="text-align: center">x</th>
                                    <th scope="col" width="10%" style="text-align: center">GOLS</th>
                                    <th scope="col" width="35%" style="text-align: center">TIME B</th>
                                </tr>
                                </thead>
                                <tr>
                                    <td style="text-align: center; vertical-align: middle">Time A</td>
                                    <td style="text-align: center; vertical-align: middle">0</td>
                                    <td style="text-align: center; vertical-align: middle">x</td>
                                    <td style="text-align: center; vertical-align: middle">0</td>
                                    <td style="text-align: center; vertical-align: middle">Time B</td>
                                </tr>
                            </table>
                        </div>

                        <div class="col-sm-6" style="float: right">
                            <table class="table table-bordered">
                                <thead>
                                <td colspan="4" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538; vertical-align: middle"><b>Próximo Jogo</b></td>
                                <td colspan="1" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538; border-left: hidden"><button class="button btn-sm" onclick="location.href = 'aposta.jsp'" style="float: right">Apostar</button></td>
                                <tr style="color: #898989">
                                    <th scope="col" width="35%" style="text-align: center">TIME A</th>
                                    <th scope="col" width="10%" style="text-align: center">GOLS</th>
                                    <th scope="col" width="10%" style="text-align: center">x</th>
                                    <th scope="col" width="10%" style="text-align: center">GOLS</th>
                                    <th scope="col" width="35%" style="text-align: center">TIME B</th>
                                </tr>
                                </thead>
                                <tr>
                                    <td style="text-align: center; vertical-align: middle">Time A</td>
                                    <td style="text-align: center; vertical-align: middle">0</td>
                                    <td style="text-align: center; vertical-align: middle">x</td>
                                    <td style="text-align: center; vertical-align: middle">0</td>
                                    <td style="text-align: center; vertical-align: middle">Time B</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="col-sm-12" style="float: left">
                        <table class="table table-bordered">
                            <thead>
                            <td colspan="9" style="background-color: #F3F3F3; font-size: 16px; color: #3E8538; "><b>Ranking dos times</b></td>
                            <tr style="color: #898989">
                                <th scope="col" width="1%" style="text-align: center">#</th>
                                <th scope="col" width="5%" style="text-align: center">FOTO</th>
                                <th scope="col" width="25%" style="text-align: center">TIME</th>
                                <th scope="col" width="25%" style="text-align: center">GERENTE</th>
                                <th scope="col" width="5%" style="text-align: center">P</th>
                                <th scope="col" width="5%" style="text-align: center">J</th>
                                <th scope="col" width="5%" style="text-align: center">V</th>
                                <th scope="col" width="5%" style="text-align: center">D</th>
                                <th scope="col" width="5%" style="text-align: center">S</th>
                            </tr>
                            </thead>
                            <tr>
                            <tr>
                                <td style="vertical-align: middle">1°</td>
                                <td>
                            <center>
                                <img src="../imagens/team-icon.png" class="avatar img-circle " alt="avatar" width="80%">
                            </center>

                            </td>
                            <td style="vertical-align: middle"><a href="time.jsp" style="color: #171a1d">Nome do time</a></td>
                            <td style="vertical-align: middle"><a href="perfil.jsp" style="color: #171a1d">Nome do gerente</a></td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle">2°</td>
                                <td>
                            <center>
                                <img src="../imagens/team-icon.png" class="avatar img-circle " alt="avatar" width="80%">
                            </center>
                            </td>
                            <td style="vertical-align: middle"><a href="time.jsp" style="color: #171a1d">Nome do time</a></td>
                            <td style="vertical-align: middle"><a href="perfil.jsp" style="color: #171a1d">Nome do gerente</a></td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            <td style="text-align: center; vertical-align: middle">0</td>
                            </tr>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="../js/campeonato/verMais.js"></script>

    </body>

    <jsp:include page="../footer.jsp"></jsp:include>
</html>
