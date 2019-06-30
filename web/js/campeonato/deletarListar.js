//Busca o id do usuario logado
firebase.auth().onAuthStateChanged((usuario) => {
    if (usuario) {
        informacoes(usuario.uid);
    } else {
        console.log("nao tem usuario logado");
    }

});



document.addEventListener("DOMContentLoaded", function () {
    //Substituir as informações no modal
    $('#confirmarexclusao').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); //evento do botao que foi acionado
        var recipient = button.data('whatever');  //pega o valor que esta em data-whatever no botao acionado
        var modal = $(this);
        modal.find('#recipient-name').val(recipient);

        //Pega a referencia do footer do modal
        var modalFooter = document.getElementById("footer");
        modalFooter.innerHTML = ""; //limpar
        //Cria e configura o botao Excluir
        var btn = document.createElement("button");
        btn.setAttribute("type", "button");
        btn.setAttribute("class", "btn btn-primary");
        btn.setAttribute("style", "height: 50px");
        btn.setAttribute("data-dismiss", "modal");
        btn.setAttribute("onclick", "deletar('" + recipient + "')");
        btn.innerText = "Excluir";

        //Cria e configura o botao Cancelar
        var btnCancel = document.createElement("button");
        btnCancel.setAttribute("type", "button");
        btnCancel.setAttribute("class", "btn btn-cancel");
        btnCancel.setAttribute("style", "height: 50px");
        btnCancel.setAttribute("data-dismiss", "modal");
        btnCancel.innerText = "Cancelar";


        modalFooter.appendChild(btn);
        modalFooter.appendChild(btnCancel);
    });
});

var existeCampeonato = false;
//função para mostrar informações
function informacoes(id) {
    ref = firebase.database().ref("campeonato");

    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            adicionaCampeonatosATela(value.val(), id);

        });
        if (!existeCampeonato) {
            naoTem();
        }

    });

}

function deletar(idCampeonato) {
    firebase.database().ref('campeonato').child(idCampeonato).remove().then(() => {
        window.location.href = '../jsp/meus-campeonatos.jsp';

    });

    firebase.storage().ref('campeonato').child(idCampeonato).delete().then(function () {
    }).catch(function (error) {
        console.log("erro: ", error);
    });
    /*
     firebase.storage().ref("Regras").child(currentUser.uid + '/' + name).delete().then(function () {
     window.location.href = '../jsp/meus-campeonatos.jsp';
     }).catch(function (error) {
     console.log("erro: ", error);
     
     });*/
}

function adicionaCampeonatosATela(informacao, id) {
    var idCampeonato = informacao.campeonatoId;

    //Compara se o usuario atual e gerente do campeonato
    if (informacao.idGerente === id) {
        // Cria a div do campeonato
        var div = document.createElement("div");
        div.setAttribute("class", "col-sm-12");

        //Cria a tabela
        var table = document.createElement("table");
        table.setAttribute("style", "background: white; border-top :1px solid #C4C4C4; border-bottom :1px solid #C4C4C4; margin-bottom: 16px");

        //Cria tr
        var tr = document.createElement("tr");

        //Cria td
        var td = document.createElement("td");
        td.setAttribute("width", "8%");
        td.setAttribute("style", "padding: 8px; padding-right: 12px");

        //cria center
        var center = document.createElement("center");

        //cria img
        var img = document.createElement("img");
        img.setAttribute("src", "../imagens/championship-icon.png");
        img.setAttribute("class", "avatar img-circle");
        img.setAttribute("alt", "avatar");
        img.setAttribute("width", "90px");
        img.setAttribute("id", idCampeonato);

        //coloca a tag img dentro de center
        center.appendChild(img);

        //coloca a tag  center dentro de td
        td.appendChild(center);

        //coloca o td dentro do tr
        tr.appendChild(td);

        //Cria td1
        var td1 = document.createElement("td");
        td1.setAttribute("style", "vertical-align: top; margin-top: 8px");

        //cria a 
        var a = document.createElement("a");
        a.setAttribute("style", "font-size: 18px; color: #333333");
        a.setAttribute("onclick", "passaValor('" + idCampeonato + "','jsp/campeonato.jsp')");
        a.setAttribute("id", "nomeCampeonato");
        a.innerHTML = "<b>"+informacao.nome+"</b>";

        //coloca o a dentro do td1
        td1.appendChild(a);

        //cria um p
        var p = document.createElement("p");
        p.setAttribute("style", "text-align: justify;color: #878787");
        p.innerHTML = informacao.descricao;

        //coloca o p dentro do td1
        td1.appendChild(p);

        //coloca o td1 dentro tr
        tr.appendChild(td1);

        //Cria o td das opcoes de editar, excluir e ver mais
        var td2 = document.createElement("td");
        td2.setAttribute("style", "vertical-align: top; padding-top: 8px; text-align: right");

        //cria editar
        var editar = document.createElement("a");
        editar.setAttribute("style", "text-align: right; margin-right: 12px; vertical-align: bottom; text-transform: uppercase; color: rgba(0, 0, 0, 0.6)");
        editar.setAttribute("onclick", "passaValor('" + idCampeonato + "','alterar/campeonato.jsp')");
        ;
        //coloca um span dentro do editar
        editar.innerHTML = "<span class='glyphicon glyphicon-edit' ></span> Editar";
        //coloca editar dentro do td2
        td2.appendChild(editar);

        //cria o excluir
        var excluir = document.createElement("a");
        excluir.setAttribute("style", "text-align: right; margin-right: 12px; vertical-align: bottom; text-transform: uppercase; color: rgba(0, 0, 0, 0.6)");
        excluir.setAttribute("data-toggle", "modal");
        excluir.setAttribute("data-target", "#confirmarexclusao");
        excluir.setAttribute("data-whatever", informacao.campeonatoId);



        // cria um span dentro do excluir
        excluir.innerHTML = "<span class='glyphicon glyphicon-trash'></span> Excluir";
        //coloca o excluir dentro do t2
        td2.appendChild(excluir);


        //cria o ver Mais
        var ver = document.createElement("a");
        ver.setAttribute("style", "text-align: right; margin-right: 12px; vertical-align: bottom; text-transform: uppercase; color: rgba(0, 0, 0, 0.6)");
        ver.setAttribute("onclick", "passaValor('" + idCampeonato + "','jsp/campeonato.jsp')");

        // cria um span dentro do ver
        ver.innerHTML = "<span class='glyphicon  glyphicon-option-horizontal'></span> Ver Mais";
        //coloca o ver dentro do t2
        td2.appendChild(ver);

        //coloca o td2 dentro tr
        tr.appendChild(td2);



        //coloca o tr dentro do table
        table.appendChild(tr);

        //coloca o table dentro do div
        div.appendChild(table);

        //coloca o resultado do javascript dentro do hrml
        var listar = document.getElementById("listar");

        listar.appendChild(div);

        var fotopreview = document.getElementById(idCampeonato);
        firebase.storage().ref().child("campeonato/" + idCampeonato).getDownloadURL().then(url => {
            fotopreview.src = url;
        });
        existeCampeonato = true;
    }
}


var passaValor = function (valor, url)
{
    window.location = "../" + url + "?campeonato=" + valor;
}

function naoTem() {
    var center = document.createElement("center");
    center.setAttribute("style", "position: relative; top: 15%; margin: 10%;");

    var img = document.createElement("img");
    img.setAttribute("src", "../imagens/no-championship.png");
    img.setAttribute("width", "150px");
    img.setAttribute("style", "margin-bottom:0px");

    var h1 = document.createElement("h1");
    h1.setAttribute("style", "font-size: 24px");
    h1.innerText = "Você não criou nenhum campeonato ainda";

    var a = document.createElement("a");
    a.setAttribute("href", "../cadastro/campeonato.jsp");

    var h2 = document.createElement("h2");
    h2.setAttribute("style", "font-size: 20px");
    h2.innerText = "Clique aqui para começar";

    a.appendChild(h2);
    center.appendChild(img);
    center.appendChild(h1);
    center.appendChild(a);

    var abc = document.getElementById("listar");
    abc.appendChild(center);


}

