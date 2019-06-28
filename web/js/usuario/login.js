var currentUser;

function entrar(){
    var email = document.getElementById('email').value;
    var senha = document.getElementById('senha').value;
    var location = "" + document.location;

    console.log(email);
    console.log("\n" + senha);
    firebase.auth().signInWithEmailAndPassword(email,senha).then(() =>{
        window.location.href='/chs-sports/jsp/home.jsp';
        console.log("Redireciona");
    }).catch(err =>{
        alert("Email ou senha inválidos");
    });
};

/* CODIGO FUTURO PARA A PROXÍMA APRESENTACAO
document.addEventListener("DOMContentLoaded",function(){
   
    ref = firebase.database().ref();
    
   ref.once('value').then(snapshot =>{
      console.log(snapshot.child(id).val());
   });
    
});



window.addEventListener("load", function () {
    console.log(firebase.auth().currentUser);
});*/


document.addEventListener("DOMContentLoaded", function (){
    //Observa se há um usúario e mudanças na autenticação (login e logout)
    firebase.auth().onAuthStateChanged((usuario)=>{
        if(usuario){
            console.log("usuario",usuario);
            currentUser = usuario;
            ref = firebase.database().ref();
            ref.once('value').then(snapshot =>{
                console.log(snapshot.child('usuarios/'+currentUser.uid).val().nome);
            });
        }else{
            console.log("nao tem usuario logado");
        }
    });
    
    //var ref =  firebase.database().ref('card/');
    /*
    ref.once('value').then(snapshot =>{
        console.log(snapshot.val());
        snapshot.forEach(value =>{
           adicionaCardATela(value.val()); 
        });
    });*/


});
