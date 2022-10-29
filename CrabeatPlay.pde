import processing.sound.*;
import processing.serial.*;


SoundFile file_1; 
SoundFile file_2;

Serial serialPort;

final int BAUDRATE = 9600;
float voltar = 0.5; // Tempo em segundos que a musica vai voltar na função jump()

String input; // variavel tipo String que recebe o dado dos ultrassom
String[] sensors; // Vetor que vai receber o split dos dados do arduino

String sAmplitude, sRate, sJump, sNextMusic; // Declaara as variaveis que serão usadas para controle das funções

void setup(){
  String serialPortName = Serial.list()[0]; // Vai usar o arduino [0] para pegar o input
  serialPort = new Serial(this, serialPortName, BAUDRATE);
  
  file_1 = new SoundFile(this, "3-POR-10.wav"); // Vai colocar a musica dentro da variavel (trocar arquivo de musica)
  file_2 = new SoundFile(this, "MIRAGEM.wav");
  
  file_1.loop();
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
    blink();
   
   //Amplitude
    ampliar();
  
    //Jump
    jumpear();
    
    //Feature Rate
    ratear();
}
