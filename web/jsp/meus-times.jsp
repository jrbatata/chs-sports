<%-- 
    Document   : meus-times
    Created on : 18/05/2019, 18:11:10
    Author     : junio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <!-- Required meta tags -->
        <title>Meus Times</title>
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

    <jsp:include page="../header.jsp"></jsp:include>
        <body class="body-home">
            <div class="container" style="background-color: white; height: 550px;" id = "listar">
                <div class="col-sm-12">
                    <h3><b>Meus times</b></h3>
                </div>

                <div class="col-sm-8">
                    <h5 class="help-block" style="margin-bottom: 1%">Nesta seção, você tem acesso a todos os times criados por você.</h5>
                </div>

                <div class="col-sm-4">
                    <button class="button btn-sm" onclick="location.href = '../cadastro/time.jsp'" style="float: right; margin-bottom: 2%;">Criar</button>
                </div>

                <!-- Modal-->
                <div class="modal fade"  id="confirmarexclusao"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span>&times;</span>
                                </button>
                                <h4 class="modal-title">Excluir Time?</h4>
                            </div>
                            <div class="modal-body">
                                <p>Você realmente deseja <b>EXCLUIR</b> o Time?</p>
                            </div>
                            <div class="modal-footer center" id ="footer">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="../js/time/deletarListar.js"></script>
        </body>
    <jsp:include page="../footer.jsp"></jsp:include>
</html>