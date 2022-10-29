void ratear(){
    if(float(sRate) < 5){
      sRate = "8";
    }else if(float(sRate) > 130){
      sRate = "130";
    }
    
    
    file_1.rate(map(float(sRate), 8, 130, 2, 1));
    file_2.rate(map(float(sRate), 8, 130, 2, 1));
}

void jumpear(){
    float duracao1 = file_1.position(); 
    float duracao2 = file_2.position();
    
    duracao1 = duracao1 - voltar;
    duracao2 = duracao2 - voltar;
  
    if(float(sJump) < 15){
    
      if(file_1.isPlaying()){
        file_1.jump(duracao1);
      }else if(file_2.isPlaying()){
        file_2.jump(duracao2);
      }
    }
    
}

void ampliar(){
    if(float(sAmplitude) < 8){
    sAmplitude = "8";
    }else if(float(sAmplitude) >= 130){
      sAmplitude = "130";
    }
    
    file_1.amp(map(float(sAmplitude), 8, 130, 1, 0.1)); // Altera o volume de acordo com a distancia do sensor
    file_2.amp(map(float(sAmplitude), 8, 130, 1, 0.1));
}

boolean taTocando(SoundFile a){
  if (a.isPlaying()){
    a.jump(0);
    a.pause();
    return true;
  }else{
    return false;
  }
  
}

void blink(){
  long previousMillis = 0;
  long currentMillis = millis();
  long interval = 2000;
  
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
    
    if(float(sNextMusic) <= 10){
     print("caraio alek");
      if (taTocando(file_1)){
        file_2.play();
      }else if (taTocando(file_2)){
        file_1.play();
      }
   }
  }
}
