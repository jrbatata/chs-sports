var arquivo;
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
var uploadfoto;

document.addEventListener("DOMContentLoaded", function () {
    id = queryString("campeonato");

    //variaveis de referencia da imagem e do input
    uploadfoto = document.getElementById('alterar-imagem');
    var fotopreview = document.getElementById('campeonato');


    uploadfoto.addEventListener('change', function (e) {
        arquivo = e.target.files[0];
        showThumbnail(this.files);
    });

    function showThumbnail(files) {
        if (files && files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                fotopreview.src = e.target.result;
            }
            reader.readAsDataURL(files[0]);
        }
    }

    firebase.storage().ref().child("campeonato/" + id).getDownloadURL().then(url => {
        fotopreview.src = url;
    });

    informacoes();

});

function informacoes() {
    var nome = document.getElementById("nome");
    var descricao = document.getElementById("descricao");
    var modalidade = document.getElementById("modalidade");
    var classificacao = document.getElementById("classificacao");
    var dataInicio = document.getElementById("dataInicio");
    var dataFim = document.getElementById("dataFim");

    firebase.database().ref().once('value').then(snapshot => {
        var snap = snapshot.child('campeonato/' + id).val();
        nome.value = snap.nome;
        descricao.value = snap.descricao;
        modalidade.value = snap.modalidade;
        classificacao.value = snap.classificacao;
        dataInicio.value = snap.dataInicio;
        dataFim.value = snap.dataFim;
    });
}
function alterarDados() {
    var nome = document.getElementById("nome").value;
    var descricao = document.getElementById("descricao").value;
    var modalidade = document.getElementById("modalidade").value;
    var classificacao = document.getElementById("classificacao").value;
    var dataInicio = document.getElementById("dataInicio").value;
    var dataFim = document.getElementById("dataFim").value;
    firebase.database().ref("campeonato").child(id).update({
        nome: nome,
        descricao: descricao,
        modalidade: modalidade,
        classificacao: classificacao,
        dataInicio: dataInicio,
        dataFim: dataFim
    }).then(() => {
        if (uploadfoto.value != "") {
            firebase.storage().ref('campeonato').child(id).delete().then(function () {
                const reader = new FileReader();
                reader.readAsDataURL(arquivo);
                reader.onload = function () {
                    console.log(reader.result);
                    const base64 = reader.result.split('base64,')[1];

                    firebase.storage().ref('campeonato/').child(id).putString(base64, 'base64', {contentType: 'image/png'}).then(snapshot => {
                        console.log('snapshot', snapshot);
                        alert("Dados alterados");
                        window.location = "../jsp/meus-campeonatos.jsp";

                    });
                }
            }).catch(function (error) {

                console.log("erro: ", error);
            });

        } else {
            alert("Dados alterados");
            window.location = "../jsp/meus-campeonatos.jsp";

        }

    });
}
