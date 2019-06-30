var idUsuario;
var seguindo;
//Busca o id do usuario logado
firebase.auth().onAuthStateChanged((usuario) => {
    if (usuario) {
        idUsuario = usuario.uid;
    } else {
        console.log("nao tem usuario logado");
    }

});

// função pra ler querystring
function queryString(parameter) {
    var loc = location.search.substring(1, location.search.length);
    var param_value = false;
    var params = loc.split("&");
    for (i = 0; i < params.length; i++) {
        param_name = params[i].substring(0, params[i].indexOf('='));
        if (param_name == parameter) {
            param_value = params[i].substring(params[i].indexOf('=') + 1)
        }
    }
    if (param_value) {
        return param_value;
    } else {
        return undefined;
    }
}

var idCampeonato;
document.addEventListener("DOMContentLoaded", function () {
    idCampeonato = queryString("campeonato");
    var fotopreview = document.getElementById('imagemCampeonato');
    firebase.storage().ref().child("campeonato/" + idCampeonato).getDownloadURL().then(url => {
        fotopreview.src = url;
        informacoes();

    });

});

//função para mostrar informações do perfil
function informacoes() {
    var nome = document.getElementById("nomeCampeonato");
    var descricao = document.getElementById("descricao");
    var seguidores = document.getElementById("seguidores");
    
    ref = firebase.database().ref();

    ref.on('value',snapshot => {
        var snap = snapshot.child('campeonato/' + idCampeonato).val();
        seguidores.innerHTML ="<b>0</b> visualizações <b>"+snapshot.child('campeonato/'+ idCampeonato + "/seguidores").numChildren()+"</b> seguidores";
        nome.innerHTML = snap.nome.bold();
        descricao.innerHTML = snap.descricao;
        exibirOpcoes(snap.idGerente, snap.temChaveamento)
    });

}

function exibirOpcoes(idGerente, temChaveamento) {
    var seguir = document.getElementById("seguirCampeonato");
    var divSeguir = document.getElementById("divSeguir");
    //Se o campeonato for do usuario logado
    if (idUsuario == idGerente) {
        divSeguir.parentNode.removeChild(divSeguir);
        if(!temChaveamento){
            var divPartidas = document.getElementById("partidas");
            divPartidas.parentNode.removeChild(divPartidas);
            var btnGerar = document.createElement("button");
            btnGerar.setAttribute("type", "button");
            btnGerar.setAttribute("class", "button btn-sm");
            btnGerar.setAttribute("style", "float: right; width: 100%;");
            btnGerar.innerText = "Gerar Chaveamento";
            
        }
    } else {
        var divChaveamento = document.getElementById("divChaveamento");
        var divAtualizacao = document.getElementById("divAtualizaçao");
        divChaveamento.parentNode.removeChild(divChaveamento);
        divAtualizacao.parentNode.removeChild(divAtualizacao);
        
        firebase.database().ref().once('value').then(snapshot => {
            if (snapshot.hasChild('campeonato/' + idCampeonato + "/seguidores/" + idUsuario)) {
                seguir.setAttribute("class", "button btn-sm");
                seguir.setAttribute("style","background-color: white; color: #2CAD20; border: 2px solid #2CAD20; font-variant-caps: normal; float: right");
                seguir.innerText = "Seguindo";
                seguindo = true;
            } else {
                seguindo = false;
            }
        });
    }
}

function seguir() {
    var seguir = document.getElementById("seguirCampeonato");
    if (seguindo) {
        firebase.database().ref('campeonato/' + idCampeonato + "/seguidores").child(idUsuario).remove().then(() => {
            seguir.setAttribute("class", "button btn-sm");
            seguir.setAttribute("style","background-color: #2CAD20; color: white; border: none; font-variant-caps: normal; float: right");
            seguir.innerText = "Seguir";
            seguindo = false;

        });
    } else {
        seguir.setAttribute("class", "button btn-sm");
        seguir.setAttribute("style","background-color: white; color: #2CAD20; border: 2px solid #2CAD20; font-variant-caps: normal; float: right");
        seguir.innerText = "Seguindo";
        firebase.database().ref().child('campeonato/' + idCampeonato + "/seguidores/" + idUsuario).set({
            id: idUsuario
        });
        seguindo = true;
    }

}
