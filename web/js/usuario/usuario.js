var currentUser;

jQuery(window).load(function () {
    $(".loader").delay(1500).fadeOut("slow"); //retire o delay quando for copiar!
    $("#tudo_page").toggle("fast");
});

document.addEventListener("DOMContentLoaded", function () {
    //Observa se há um usúario e mudanças na autenticação (login e logout)
    firebase.auth().onAuthStateChanged((usuario) => {
        if (usuario) {
            currentUser = usuario;
            //trocar a foto do usuario 
            var fotopreview = document.getElementById('perfil');
            firebase.storage().ref().child("usuario/" + currentUser.uid).getDownloadURL().then(url => {
                fotopreview.src = url;
                nomeUsuario();

            });
        } else {
            console.log("nao tem usuario logado");
        }

    });
});

//função para mudar a label do nome do usuario
function nomeUsuario() {
    var nome = document.getElementById("username");
    ref = firebase.database().ref();

    ref.once('value').then(snapshot => {
        var snap = snapshot.child('usuarios/' + currentUser.uid).val();
        nome.innerHTML = snap.nome + " " + snap.sobrenome;
    });

}

function logout() {
    firebase.auth().signOut().then(() => {
    });

}

function pesquisar(){
    var pesquisa = document.getElementById("search").value;
    
     ref = firebase.database().ref("campeonato");

    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            if(value.val().nome === pesquisa){
                 window.location = "../jsp/campeonato.jsp?campeonato=" + value.val().campeonatoId;
            }

        });
    });
}