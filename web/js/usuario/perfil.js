var currentUser;

document.addEventListener("DOMContentLoaded", function () {
    //Observa se há um usúario e mudanças na autenticação (login e logout)
    firebase.auth().onAuthStateChanged((usuario) => {
        if (usuario) {
            currentUser = usuario;
            //trocar a foto do usuario 
            var fotopreview = document.getElementById('perf');
            firebase.storage().ref().child("usuario/" + currentUser.uid).getDownloadURL().then(url => {
                fotopreview.src = url;
                informacoes();

            });
        } else {
            console.log("nao tem usuario logado");
        }

    });
});

//função para mostrar informações do perfil
function informacoes() {
    var nome = document.getElementById("nome");
    var email = document.getElementById("email");
    var segue = document.getElementById("segue");
    var quantidadeSeguindo = 0;
    ref = firebase.database().ref();

    ref.once('value').then(snapshot => {
        var snap = snapshot.child('usuarios/' + currentUser.uid).val();
        nome.innerHTML = "Nome Completo: ".bold() + snap.nome;
        email.innerHTML = "Email: ".bold() + snap.email;
    });

    ref = firebase.database().ref("campeonato");

    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            if (snapshot.hasChild(value.val().campeonatoId + "/seguidores")) {
                firebase.database().ref("campeonato/" + value.val().campeonatoId + "/seguidores").once('value').then(snapshot => {
                    snapshot.forEach(valor => {
                        if (valor.val().id === currentUser.uid) {
                            quantidadeSeguindo += 1;
                        }
                    });
                   segue.innerHTML = "Segue <b>" + quantidadeSeguindo + "</b> campeonatos";
                });
            }
        });

    });

    
}