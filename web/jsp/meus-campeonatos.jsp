
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Meus campeonatos</title>
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


        <div class="container" style="background-color: white; height: 550px" id="listar">
            <div class="col-sm-12">
                <h3><b>Meus campeonatos</b></h3>
            </div>

            <div class="col-sm-8">
                <h5 class="help-block" style="margin-bottom: 1%">Nesta seção, você tem acesso a todos os campeonatos criados por você.</h5>
            </div>

            <div class="col-sm-4">
                <button class="button btn-sm" onclick="location.href = '../cadastro/campeonato.jsp'" style="float: right; margin-bottom: 2%;">Criar</button>
            </div>

        </div>


        <!-- Modal-->
        <div class="modal fade"  id="confirmarexclusao"  aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                        <h4 class="modal-title">Excluir Campeonato?</h4>
                    </div>
                    <div class="modal-body">
                        <p>Você realmente deseja <b>EXCLUIR</b> o Campeonato?</p>
                    </div>
                    <div class="modal-footer center" id ="footer">
                    </div>
                </div>
            </div>
        </div>

        <script src="../js/campeonato/deletarListar.js"></script>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>

