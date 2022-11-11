void ratear(int musicaAtual){
    if(float(sRate) < 5){
      sRate = "8";
    }else if(float(sRate) > 130){
      sRate = "130";
    }
    
    file[musicaAtual].rate(map(float(sRate), 8, 130, 2, 1));
}

void jumpear(int musicaAtual){
  float voltar = 0.5; // Tempo em segundos que a musica vai voltar
  float duracao = file[musicaAtual].position(); 
  
  duracao = duracao - voltar;
  
  if(float(sJump) < 15){
    file[musicaAtual].jump(duracao);
  }    
}
void ampliar(int musicaAtual){
    if(float(sAmplitude) < 8){
    sAmplitude = "8";
    }else if(float(sAmplitude) >= 130){
      sAmplitude = "130";
    }
    
    file[musicaAtual].amp(map(float(sAmplitude), 8, 130, 1, 0.1)); // Altera o volume de acordo com a distancia do sensor
}

long tempoAnterior = 0;
int i = 0;

int passaMusica(int numeroMusicas){
  
  if (float(sNextMusic) <= 10){
    if (millis() - tempoAnterior >= 2000){
      tempoAnterior = millis();
      file[i].pause();
      if (i == numeroMusicas-1){
        i = 0;
      }else{
        i++;
      }
      file[i].loop();
    }
  }
  
  return i;
  
}
