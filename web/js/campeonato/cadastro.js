var arquivo;
var arquivoRegras = document.getElementById("regras");
var regras;

//vai ser executado depois de toda a página ser carregada
window.onload = function () {

    //variaveis de referencia da imagem e do input
    var uploadfoto = document.getElementById('alterar-imagem');
    var fotopreview = document.getElementById('campeonato');


    uploadfoto.addEventListener('change', function (e) {
        arquivo = e.target.files[0];
        showThumbnail(this.files);
    });

    arquivoRegras.onchange = function (event) {
        regras = event.target.files[0];
    };

    function showThumbnail(files) {
        if (files && files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                fotopreview.src = e.target.result;
            }
            reader.readAsDataURL(files[0]);
        }
    }
};

function prosseguir() {
    var nome = document.getElementById("nome").value;
    var descricao = document.getElementById("descricao").value;
    var modalidade = document.getElementById("modalidade").value;
    var classificacao = document.getElementById("classificacao").value;
    var dataInicio = document.getElementById("dataInicio").value;
    var dataFim = document.getElementById("dataFim").value;

    if (!isEmpty(nome) && !isEmpty(descricao) && !isEmpty(modalidade) && !isEmpty(classificacao) && !isEmpty(dataInicio) && !isEmpty(dataFim)) {
        adicionar(nome, descricao, modalidade, classificacao, dataInicio, dataFim);
    } else {
        alert("Erro: Preencha todos os campos obrigatórios (*)");
    }
}

function isEmpty(val) {
    return (val === undefined || val == null || val.length <= 0) ? true : false;
}
function adicionar(nome, descricao, modalidade, classificacao, dataInicio, dataFim){
    var id = firebase.auth().currentUser.uid;
    var uid = gerarUid();
    firebase.database().ref().child('campeonato/' + uid).set({
        nome: nome,
        descricao: descricao,
        campeonatoId: uid,
        modalidade: modalidade,
        classificacao: classificacao,
        dataInicio: dataInicio,
        dataFim: dataFim,
        idGerente : id,
        temChaveamento : false
    });

    firebase.storage().ref('Regras/'+id).child(nome).put(regras).then(snapshot => {
        console.log("snapshot", snapshot);
        firebase.storage().ref('Regras').child(nome).getDownloadURL().then(url => {
            console.log("string para download", url);
        });
    });

    const reader = new FileReader();
    reader.readAsDataURL(arquivo);
    reader.onload = function () {
        console.log(reader.result);
        const base64 = reader.result.split('base64,')[1];

        firebase.storage().ref('campeonato/').child(uid).putString(base64, 'base64', {contentType: 'image/png'}).then(snapshot => {
            console.log('snapshot', snapshot);
            window.location.href='../jsp/campeonato.jsp?campeonato='+uid;
        });
    }
     
}

function gerarUid() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}

