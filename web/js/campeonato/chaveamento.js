//Busca o id do usuario logado
firebase.auth().onAuthStateChanged((usuario) => {
    if (usuario) {
        informacoes(usuario.uid);
    } else {
        console.log("nao tem usuario logado");
    }

});

var existeTime = false;
//função para mostrar informações
function informacoes(id) {
    ref = firebase.database().ref("time");

    ref.once('value').then(snapshot => {
        snapshot.forEach(value => {
            gerarChaveamento(value.val(), id);
        });
        if (!existeTime) {
            naoTem();
        }
    });

}

function gerarChaveamento(times, id){
                var rand , i;
                var timeImpar = "0";
                var matTimes = [];
                var vetTimes = times.id.split(";"); //Assumindo que os times já estejam ordenados de forma que times[i + 1] seja adversário de times[i] caso o vetor contenha um número de elementos par
                
                if()
                if(vetTimes.length % 2 == 1){ //Caso o número seja ímpar, um time é escolhido aleatoriamente, removido da seleção e as partidas são marcadas de forma aleatória
                    rand = Math.floor((Math.random() * vetTimes.length) + 1);
                    rand--;
                    var aux = vetTimes[vetTimes.length - 1];
                    timeImpar = vetTimes[rand];
                    vetTimes[vetTimes.length - 1] = vetTimes[rand];
                    vetTimes[rand] = aux;
                    vetTimes.pop(); //Deleta o time escolhido aleatoriamente
                    vetTimes.sort(); 
                    
                    var limit = vetTimes.length;
                    var auxLength = vetTimes.length;
                    for(i = 0; i < limit/2; i++){
                        rand = Math.floor((Math.random() * (auxLength - 1)) + 2);
                        rand--;
                        /*document.write("[" + i + "] - Vetor: " + vetTimes + "<br>");
                        document.write("[" + i + "] - Índices escolhidos: " + 0 + " + " + rand + "<br>");
                        document.write("[" + i + "] - Valores escolhidos: " + vetTimes[0] + " + " + vetTimes[rand] + "<br><br>");*/
                        var row = [vetTimes[0], vetTimes[rand]];
                        matTimes.push(row);
                        
                        aux = vetTimes[auxLength - 1];
                        vetTimes[auxLength - 1] = vetTimes[rand];
                        vetTimes[rand] = aux;
                        vetTimes.pop(); //Deleta o time 2
                        auxLength--;
                        
                        aux = vetTimes[auxLength - 1];
                        vetTimes[auxLength - 1] = vetTimes[0];
                        vetTimes[0] = aux;
                        vetTimes.pop(); //Deleta o time 1
                        auxLength--;
                    }
                }
                else{ //Caso seja par, as partidas são marcadas assumindo o esquema times[i] x times[i+1]
                    for(i = 0; i < vetTimes.length; i+=2){
                        var row = [vetTimes[i], vetTimes[i + 1]];
                        /*document.write("[" + i + "] - Vetor: " + vetTimes + "<br>");
                        document.write("[" + i + "] - Índices escolhidos: " + 0 + " + " + rand + "<br>");
                        document.write("[" + i + "] - Valores escolhidos: " + vetTimes[0] + " + " + vetTimes[i+1] + "<br><br>");*/
                        matTimes.push(row);
                    }
                }
                var row = [timeImpar, timeImpar]; //Time ímpar contra ele mesmo = time automaticamente classificado
                matTimes.push(row)
                
                return matTimes;
            }
            
            var partidas = gerarChaveamento(times);
            for(var i = 0; i < partidas.length; i++){
                document.write(partidas[i][0] + " vs. " + partidas[i][1] + "<br>");
            }