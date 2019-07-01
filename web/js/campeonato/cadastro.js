var arquivo;
var arquivoRegras = document.getElementById("regras");
var regras;
var id;

//Busca o id do usuario logado
firebase.auth().onAuthStateChanged((usuario) => {
    if (usuario) {
        id = usuario.uid;
    } else {
        console.log("nao tem usuario logado");
    }

});


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

function prosseguir(timesInscritos) {
    var nome = document.getElementById("nome").value;
    var descricao = document.getElementById("descricao").value;
    var modalidade = document.getElementById("modalidade").value;
    var classificacao = document.getElementById("classificacao").value;
    var dataInicio = document.getElementById("dataInicio").value;
    var dataFim = document.getElementById("dataFim").value;

    if (!isEmpty(nome) && !isEmpty(descricao) && !isEmpty(modalidade) && !isEmpty(classificacao) && !isEmpty(dataInicio) && !isEmpty(dataFim)) {
        adicionar(nome, descricao, modalidade, classificacao, dataInicio, dataFim, timesInscritos);
    } else {
        alert("Erro: Preencha todos os campos obrigatórios (*)");
    }
}

function isEmpty(val) {
    return (val === undefined || val == null || val.length <= 0) ? true : false;
}

function validaTimes(){
    var checks = document.getElementsByName("options");
    var times = [];
    for(var i = 0; i < checks.length; i++){
        if(checks[i].checked == true){
           times.push(checks[i].value);
        }
    }
    if(times.length < 2){
        alert("Selecione ao menos dois time");
    }else{
        prosseguir(times);
    }
    
}

function carregarDados(){
    var table = document.createElement("table");
    ref = firebase.database().ref("time");
    
    var tbody = document.getElementById("dadosCampeonatos");
    tbody.innerHTML=""; 
    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            if(value.val().idGerente == id){
                adicionaTabela(value.val(), tbody);
            }
        });
    });
}

function adicionaTabela(informacao, tbody){  
    var tr = document.createElement("tr");
    var td = document.createElement("td");
    var span = document.createElement("span");
    span.setAttribute("class", "custom-checkbox");
    
    var input = document.createElement("input");
    input.setAttribute("type","checkbox");
    input.setAttribute("id","check");
    input.setAttribute("name","options");
    input.setAttribute("value",informacao.timeId);
    
    span.appendChild(input);
    td.appendChild(span);
    tr.appendChild(td);
    
    var td2 = document.createElement("td");
    td2.textContent = informacao.nome;
    tr.appendChild(td2);
    
    var td3 = document.createElement("td");
    td3.textContent = informacao.modalidade;
    tr.appendChild(td3);
    
    var td4 = document.createElement("td");
    td4.textContent = informacao.quantidade + " jogadores";
    tr.appendChild(td4);
    
    tbody.appendChild(tr);
}

function adicionar(nome, descricao, modalidade, classificacao, dataInicio, dataFim, times){
    var uid = gerarUid();
    var ref = firebase.database().ref().child('campeonato/' + uid);
    ref.set({
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

    var newItem = ref.child('times');
    for(var i = 0; i < times.length; i++){
        newItem.child(times[i]).child("status").set("Inscrito");
        newItem.child(times[i]).child("p").set(0);
        newItem.child(times[i]).child("j").set(0);
        newItem.child(times[i]).child("v").set(0);
        newItem.child(times[i]).child("d").set(0);
        newItem.child(times[i]).child("s").set(0);
    }
    
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

