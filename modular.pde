void ratear(int musicaAtual){
  
  if(float(sRate) < 8){ // Caso o valor lido (sRate) for menor que 8...
    sRate = "8"; // Altera o valor para 8
  }else if(float(sRate) > 65){ // Caso o valor lido (sRate) for maior que 130...
    sRate = "65"; // Altera o valor para 130
  }

  file[musicaAtual].rate(map(float(sRate), 8, 65, 2, 1)); // Altera a velocidade de acordo com a distancia do sensor...
  // (8, 130) - valor mais proximo e mais distante do sensor
  // (2, 1) - Valor max e min da velocidade (lembrando que entre 2 e 1 existem infinitos numeros)
  
}


void jumpear(int musicaAtual){
  
  float voltar = 2; // Tempo em segundos que a musica vai voltar
  float tempoAtual = file[musicaAtual].position(); //Tempo atual da musica
  
  tempoAtual = tempoAtual - voltar; 
  
  if(float(sJump) < 15){ // Caso a distancia medida pelo sensor for menor que 15cm...
    file[musicaAtual].jump(tempoAtual); //Vai fazer voltar 0.5 segundos
  }    
}


void ampliar(int musicaAtual){
  
  if(float(sAmplitude) < 8){ // Caso o valor lido (sAmplitude) for menor que 8...
    sAmplitude = "8"; // Altera o valor para 8
  }else if(float(sAmplitude) >= 130){ // Caso o valor lido (sAmplitude) for maior que 130...
    sAmplitude = "130"; // Altera o valor para 130
  }
  
  file[musicaAtual].amp(map(float(sAmplitude), 8, 130, 1, 0.1)); // Altera o volume de acordo com a distancia do sensor...
  // (8, 130) - valor mais proximo e mais distante do sensor
  // (1, 0.1) - Valor max e min da volume (lembrando que entre 1 e 0.1 existem infinitos numeros)
}


long tempoAnterior = 0; // Cria a variavel que será usada para o delay (ou blink)
int i = 0; // Variavel usado para definir qual musica está tocando no momento


int passaMusica(int numeroMusicas){
  
  if (float(sNextMusic) <= 8){ // Caso a distancia medida pelo sensor for menor que 10cm...
    if (millis() - tempoAnterior >= 1500){ // Caso o millis() (tempo atual em milissegundos) menos o tempoAnterior for menor que 2000 milissegundos (2 segundos)...
      tempoAnterior = millis(); //A variavel "tempoAnterior" recebe o tempo atual (millis())
      file[i].pause(); //Pausa a musica atual
      if (i == numeroMusicas-1){ //Caso i ja for igual ao total de musicas...
        i = 0; // i volta a ser 0
      }else{
        i++; // Senão i é incremetando em 1, assim passando a musica
      }
      file[i].loop(); // Inicia a proxima musica
    }
  }
  
  return i; // Retorna o valor de i para ser usado nas outras funções
  
}
