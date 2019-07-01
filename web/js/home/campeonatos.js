
firebase.auth().onAuthStateChanged((usuario) => {
    if (usuario) {
        recomendados(usuario.uid);
        informacoes(usuario.uid);
    } else {
        console.log("nao tem usuario logado");
    }

});

function recomendados(id) {
    ref = firebase.database().ref("campeonato");

    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            adicionarRecomendados(value.val(), id);
        });
    });

}


function adicionarRecomendados(informacao, id) {
    if (informacao.idGerente != id) {
        var idCampeonato = informacao.campeonatoId;

        var table = document.createElement("table");
        table.setAttribute("width", "100%");
        table.setAttribute("style", "border-bottom: 1px solid lightgrey;");

        var tr = document.createElement("tr");
        var td = document.createElement("td");
        var center = document.createElement("center");

        var a = document.createElement("a");
        var h5 = document.createElement("h5");
        h5.setAttribute("style", "color: black;");
        h5.innerHTML = "<b>" + informacao.nome + "</b>";

        a.appendChild(h5);
        center.appendChild(a);

        var img = document.createElement("img");
        img.setAttribute("src", "../imagens/championship-icon.png");
        img.setAttribute("class", "avatar img-circle");
        img.setAttribute("alt", "avatar");
        img.setAttribute("width", "80px");
        img.setAttribute("id", idCampeonato);

        center.appendChild(img);

        var p = document.createElement("p");
        p.setAttribute("style", "margin-top: 14px");
        p.innerText = informacao.descricao;

        center.appendChild(p);

        var input = document.createElement("input");
        input.setAttribute("type", "button");
        input.setAttribute("value", "ver campeonato");
        input.setAttribute("class", "btn-sm");
        input.setAttribute("onclick", "passaValor('" + idCampeonato + "','jsp/campeonato.jsp')");
        input.setAttribute("style", "width: 100%; margin-bottom: 14px");

        center.appendChild(input);

        td.appendChild(center);
        tr.appendChild(td);
        table.appendChild(tr);

        var recomendados = document.getElementById("recomendados");
        recomendados.appendChild(table);

        var fotopreview = document.getElementById(idCampeonato);
        firebase.storage().ref().child("campeonato/" + idCampeonato).getDownloadURL().then(url => {
            fotopreview.src = url;
        });
    }
}



var passaValor = function (valor, url)
{
    window.location = "../" + url + "?campeonato=" + valor;
}

function feed(notificacao,informacao,key) {
    var naosegue = document.getElementById("sem-campeonato");
    naosegue.parentNode.removeChild(naosegue);
    
    var table = document.createElement("table");
    table.setAttribute("width", "100%");
    table.setAttribute("style", "border-bottom: 1px solid lightgrey; margin-top: 1%;");

    var tr = document.createElement("tr");

    var td = document.createElement("td");
    td.setAttribute("width", "8%");

    var center = document.createElement("center");

    var img = document.createElement("img");
    img.setAttribute("src", "../imagens/championship-icon.png");
    img.setAttribute("class", "avatar img-circle");
    img.setAttribute("alt", "avatar");
    img.setAttribute("width", "80%");
    img.setAttribute("style", "margin-bottom: 16px; vertical-align: bottom");
    img.setAttribute("id", key);

    center.appendChild(img);
    td.appendChild(center);
    tr.appendChild(td);

    var td2 = document.createElement("td");
    var h4 = document.createElement("h4");
    h4.innerHTML = "<b>" + informacao.nome + "</b>";

    td2.appendChild(h4);

    var p = document.createElement("p");
    p.setAttribute("style", "overflow: hidden; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; vertical-align: bottom");
    p.setAttribute("width", "78%");
    p.innerText = notificacao.conteudo;

    td2.appendChild(p);

    tr.appendChild(td2);

    var td3 = document.createElement("td");
    td3.setAttribute("width", "14%");

    var p2 = document.createElement("p");
    p2.setAttribute("style", "text-align: end");
    p2.innerText = notificacao.data;

    td3.appendChild(p2);
    td3.appendChild(document.createElement("br"));


    var button = document.createElement("button");
    button.setAttribute("class", "btn-sm");
    button.setAttribute("onclick", "passaValor('" + informacao.campeonatoId + "','jsp/campeonato.jsp')");
    button.setAttribute("style", "float: right");
    button.innerText = "Ver mais";

    td3.appendChild(button);
    tr.appendChild(td3);
    table.appendChild(tr);

    var div = document.getElementById("feed");
    div.appendChild(table);
    
    var fotopreview = document.getElementById(key);
        firebase.storage().ref().child("campeonato/" + informacao.campeonatoId).getDownloadURL().then(url => {
            fotopreview.src = url;
        });
}

function informacoes(id) {
    ref = firebase.database().ref("campeonato");

    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            if (snapshot.hasChild(value.val().campeonatoId + "/seguidores")) {
                firebase.database().ref("campeonato/" + value.val().campeonatoId + "/seguidores").once('value').then(snapshot => {
                    snapshot.forEach(valor => {
                        if (valor.val().id === id) {
                            firebase.database().ref("campeonato/" + value.val().campeonatoId + "/notificacoes").once('value').then(snapshot => {
                                snapshot.forEach(notificacao => {
                                   feed(notificacao.val(),value.val(),notificacao.key);
                                });
                            });                         
                        }
                    });

                });
            }
        });

    });

}

var passaValor = function (valor, url)
{
    window.location = "../" + url + "?campeonato=" + valor;
}



