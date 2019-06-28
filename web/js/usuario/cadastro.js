var arquivo;
 var ref = firebase.storage().ref('usuario');
//vai ser executado depois de toda a página ser carregada
window.onload = function () {
   
    //variaveis de referencia da imagem e do input 
    var uploadfoto = document.getElementById('alterar-imagem');
    var fotopreview = document.getElementById('perfil');

    uploadfoto.addEventListener('change', function(e) {
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
    var sobrenome = document.getElementById("sobrenome").value;
    var email = document.getElementById('useremail').value;
    var cpf = document.getElementById('cpf').value;
    var senha = document.getElementById("usersenha").value;
    var confirmarsenha = document.getElementById("confirmarsenha").value;

    if (!isEmpty(nome) && !isEmpty(sobrenome) && !isEmpty(email) && !isEmpty(cpf)
        && !isEmpty(senha) && !isEmpty(confirmarsenha)){
        if(checkCPf(cpf)){
            if(senha == confirmarsenha){
                firebase.auth().createUserWithEmailAndPassword(email, senha).then(user =>{ 
                    adicionar(nome, sobrenome, email, cpf, senha);
                }).catch(function(error){
                    var errorMessage = error.message;
                    alert("Erro: " + errorMessage);
                });  
            }else{
                alert("Erro: Senhas não correspondem entre si");
            }
        }else{
            alert("Erro: CPF inválido");
        } 
    }else{
        alert("Erro: Preencha todos os campos obrigatórios (*)");
        console.log("Nome: " + isEmpty(nome));
        console.log("Sobrenome: " + isEmpty(sobrenome));
        console.log("email: " + isEmpty(email));
        console.log("cpf: " + isEmpty(cpf));
        console.log("senha: " + isEmpty(senha));
        console.log("conf: " + isEmpty(confirmarsenha));
        
    }
}

function isEmpty(val){
    return (val === undefined || val == null || val.length <= 0) ? true : false;
}

function adicionar(nome, sobrenome, email, cpf, senha){
    var id = firebase.auth().currentUser.uid;
    firebase.database().ref().child('usuarios/'+id).set({
        id: id,
        nome: nome,
        sobrenome: sobrenome,
        email: email,
        cpf: cpf,
        senha: senha
    });
    
    
    const reader = new FileReader();
    reader.readAsDataURL(arquivo);
    reader.onload = function(){
        console.log(reader.result);
        const base64 = reader.result.split('base64,')[1];
        
        ref.child(id).putString(base64, 'base64',{ contentType: 'image/png'}).then(snapshot =>{
            console.log('snapshot',snapshot);
             firebase.auth().signOut().then(() =>{
            });
            window.location.href='../index.jsp'; 
        });
    }
    
}

/* @codigofonte.com.br */
function checkCPf(strCPF) {
    var Soma;
    var Resto;
    Soma = 0;
  if (strCPF == "00000000000") return false;
     
  for (i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
  Resto = (Soma * 10) % 11;
   
    if ((Resto == 10) || (Resto == 11))  Resto = 0;
    if (Resto != parseInt(strCPF.substring(9, 10)) ) return false;
   
  Soma = 0;
    for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;
   
    if ((Resto == 10) || (Resto == 11))  Resto = 0;
    if (Resto != parseInt(strCPF.substring(10, 11) ) ) return false;
    return true;
}

function logout(){
  firebase.auth().signOut().then(() =>{
    window.location.href='../jsp/home.jsp';
   });
};

