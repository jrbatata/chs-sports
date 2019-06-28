var idUsuario;
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

var id;
document.addEventListener("DOMContentLoaded", function () {
    id = queryString("campeonato");
    var fotopreview = document.getElementById('imagemCampeonato');
    firebase.storage().ref().child("campeonato/" +id).getDownloadURL().then(url => {
        fotopreview.src = url;
        informacoes();

    });

});

//função para mostrar informações do perfil
function informacoes() {
    var nome = document.getElementById("nomeCampeonato");
    var descricao = document.getElementById("descricao");
    ref = firebase.database().ref();

    ref.once('value').then(snapshot => {
        var snap = snapshot.child('campeonato/' + id).val();
        nome.innerHTML = snap.nome.bold();
        descricao.innerHTML = snap.descricao;
        exibirOpcoes(snap.idGerente, snap.temChaveamento)
    });

}

function exibirOpcoes(idGerente, temChaveamento){
    var seguir = document.getElementById("seguirCampeonato");
    //Se o campeonato for do usuario logado
    if(idUsuario == idGerente){
        seguir.parentNode.removeChild(seguir);
    }
}
