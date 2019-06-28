
firebase.auth().onAuthStateChanged((usuario) => {
    if (usuario) {
        recomendados(usuario.uid);
    } else {
        console.log("nao tem usuario logado");
    }

});

function recomendados(id) {
    ref = firebase.database().ref("campeonato");

    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            adicionarRecomendados(value.val(),id);
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




