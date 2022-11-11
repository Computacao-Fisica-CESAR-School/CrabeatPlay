import processing.sound.*;
import processing.serial.*;


SoundFile[] file;
int nMusicas = 2; //A quantidade de musicas da playlist

Serial serialPort;

final int BAUDRATE = 9600;


String input; // variavel tipo String que recebe o dado dos ultrassom
String[] sensors; // Vetor que vai receber o split dos dados do arduino

String sAmplitude, sRate, sJump, sNextMusic; // Declara as variaveis que serão usadas para controle das funções

void setup(){
  String serialPortName = Serial.list()[0]; // Vai usar o arduino [0] para pegar o input
  serialPort = new Serial(this, serialPortName, BAUDRATE);
  
  file = new SoundFile[nMusicas]; // Cria uma lista de arquivos de musicas com a quantidade de musicas desejada
  file[0] = new SoundFile(this, "3-POR-10.wav"); // Vai colocar a musica dentro do item 0 da lista
  file[1] = new SoundFile(this, "MIRAGEM.wav"); // Vai colocar a musica dentro do item 1 da lista
  // Adicionar mais musicas à playlist
  
  file[0].loop(); // Inicia o loop da musica
}

void draw(){
  if(serialPort.available() > 0){
    input = serialPort.readStringUntil('\n');
    
    sensors = split(input, ';');
    
    
    if (sensors != null && sensors.length == 4){
    
      sAmplitude = sensors[0];
      sRate = sensors[1];
      sJump = sensors[2];
      sNextMusic = sensors[3];
      print(sensors);
      
    }
    
  }
   //Trocar de musica
    int i = passaMusica(nMusicas);
   
   //Amplitude
    ampliar(i);
  
    //Jump
    jumpear(i);
    
    //Feature Rate
    ratear(i);
}
