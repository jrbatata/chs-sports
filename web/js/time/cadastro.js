var arquivo;
var ref = firebase.storage().ref('imagem');
//vai ser executado depois de toda a página ser carregada
window.onload = function () {

    //variaveis de referencia da imagem e do input 
    var uploadfoto = document.getElementById('alterar-imagem');
    var fotopreview = document.getElementById('time');

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
};




function prosseguir() {
    var nome = document.getElementById("nome").value;
    var descricao = document.getElementById("descricao").value;
    var modalidade = document.getElementById('modalidade').value;
    var quantidade = document.getElementById('quantidade').value;

    if (!isEmpty(nome) && !isEmpty(descricao) && !isEmpty(modalidade) && !isEmpty(quantidade)) {
        adicionar(nome, descricao, modalidade, quantidade);
    } else {
        alert("Erro: Preencha todos os campos obrigatórios (*)");
    }
}

function isEmpty(val) {
    return (val === undefined || val == null || val.length <= 0) ? true : false;
}

function adicionar(nome, descricao, modalidade, quantidade){
    var id = firebase.auth().currentUser.uid;
    var uid = gerarUid();
    firebase.database().ref().child('time/' + uid).set({
        nome: nome,
        descricao: descricao,
        timeId: uid,
        modalidade: modalidade,
        quantidade: quantidade,
        idGerente : id
    });


    const reader = new FileReader();
    reader.readAsDataURL(arquivo);
    reader.onload = function () {
        console.log(reader.result);
        const base64 = reader.result.split('base64,')[1];
        firebase.storage().ref('time/').child(uid).putString(base64, 'base64', {contentType: 'image/png'}).then(snapshot => {
            console.log('snapshot', snapshot);
            window.location.href='../jsp/meus-times.jsp';
        });
    }
}

function gerarUid() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}
