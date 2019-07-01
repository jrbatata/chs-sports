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
        exibirOpcoes(snap.idGerente, snap.temChaveamento);
        top.document.title = snap.nome;
    });

}

function exibirOpcoes(idGerente, temChaveamento) {
    var seguir = document.getElementById("seguirCampeonato");
    var divSeguir = document.getElementById("divSeguir");
    
    if(!temChaveamento){
        var divPartidas = document.getElementById("partidas");
        divPartidas.parentNode.removeChild(divPartidas);
    }
    
    //Se o campeonato for do usuario logado
    if (idUsuario == idGerente) {
        divSeguir.parentNode.removeChild(divSeguir);
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
    
    listarTimes();
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

function notificacao() {
    var uid = gerarUid();
    var conteudo = document.getElementById("message-text").value;

    var data = new Date();
   // var localdate = data.getDate() + '/' + (dNow.getMonth() + 1) + '/' + dNow.getFullYear() + ' ' + dNow.getHours() + ':' + dNow.getMinutes();

    firebase.database().ref().child('campeonato/' + idCampeonato + "/notificacoes/" + uid).set({
        conteudo: conteudo,
        data :data.getDate()+"-"+ (data.getMonth() + 1) +"-"+ data.getFullYear(),

    });

}

function listarTimes(){
    inscritos = firebase.database().ref("campeonato/" + idCampeonato + "/times");
    timesRef = firebase.database().ref("time");
    var times = [];
    var i = 1;
    
    var tbody = document.getElementById("dadosTimes");
    tbody.innerHTML=""; 
    
    inscritos.once('value').then(snapshot => {
        snapshot.forEach(value => {
            times.push(value.key);
        });
    });
    
    timesRef.once('value').then(snapshot => {
        snapshot.forEach(value => {
            for(var j = 0; j < times.length; j++){
                if(times[j] == value.val().timeId){
                    adicionaTabela(value.val(), tbody, i);
                }
            }
        });
    });
}

function adicionaTabela(informacao, tbody, indice, inscrito){                
    var tr = document.createElement("tr");
    var td = document.createElement("td");
    td.setAttribute("style","vertical-align: middle");
    td.textContent = indice + "º";
    tr.appendChild(td);
    
    var td2 = document.createElement("td");
    var center = document.createElement("center");
    var img = document.createElement("img");
    img.setAttribute("src","../imagens/team-icon.png");
    img.setAttribute("id","imagemCarregada");
    
    firebase.storage().ref().child("time/" + informacao.timeId).getDownloadURL().then(url => {
        img.src = url;
        informacoes();

    });
    img.setAttribute("class","avatar img-circle");
    img.setAttribute("alt","avatar");
    img.setAttribute("width","80%");
    center.appendChild(img);
    td2.appendChild(center);
    tr.appendChild(td2);
    
    var td3 = document.createElement("td");
    td3.setAttribute("style","vertical-align: middle");
    var a = document.createElement("a");
    a.setAttribute("style","color: #171a1d");
    a.textContent = informacao.nome;
    td3.appendChild(a);
    tr.appendChild(td3);
    
    var nomeSobrenome;
    ref = firebase.database().ref("usuarios");   
    var td4 = document.createElement("td");
    td4.setAttribute("style","vertical-align: middle; color: #171a1d");
    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            if(value.val().id == informacao.idGerente){
                nomeSobrenome = value.val().nome + " " + value.val().sobrenome;
                td4.textContent = nomeSobrenome;
            }
        });
    });  
    tr.appendChild(td4);
    
    /*<tbody id="dadosTimes">
        <tr>
            <td style="text-align: center; vertical-align: middle">0</td>
            <td style="text-align: center; vertical-align: middle">0</td>
            <td style="text-align: center; vertical-align: middle">0</td>
            <td style="text-align: center; vertical-align: middle">0</td>
            <td style="text-align: center; vertical-align: middle">0</td>
        </tr>
    </tbody>*/
    
    var td5 = document.createElement("td");
    td5.setAttribute("style","text-align: center; vertical-align: middle");
    td5.textContent = 0;
    tr.appendChild(td5);
    
    var td6 = document.createElement("td");
    td6.setAttribute("style","text-align: center; vertical-align: middle");
    td6.textContent = 0;
    tr.appendChild(td6);
    
    var td7 = document.createElement("td");
    td7.setAttribute("style","text-align: center; vertical-align: middle");
    td7.textContent = 0;
    tr.appendChild(td7);
    
    var td8 = document.createElement("td");
    td8.setAttribute("style","text-align: center; vertical-align: middle");
    td8.textContent = 0;
    tr.appendChild(td8);
    
    var td9 = document.createElement("td");
    td9.setAttribute("style","text-align: center; vertical-align: middle");
    td9.textContent = 0;
    tr.appendChild(td9);

    tbody.appendChild(tr);
    indice+= 1;
}

function gerarUid() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
} 