// Importa as bibliotecas
import processing.sound.*; // Para trbalharmos com Som
import processing.serial.*; // Para trabalharmos com a comunicação serial com o arduino


SoundFile[] file; // Cria uma variavel do tipo Lista([]) de SoundFile
int nMusicas = 4; //A quantidade de musicas da playlist

Serial serialPort; // Cria a variavel do tipo Serial (responsavel pela comunicação serial)

final int BAUDRATE = 9600; // Define a frenquencia da comunicação serial (tem que estar igual no arduino)


String input; // variavel tipo String que recebe o dado dos ultrassom
String[] sensors; // Vetor que vai receber o split dos dados do arduino

String sAmplitude, sRate, sJump, sNextMusic; // Declara as variaveis que serão usadas para controle das funções

// Função padrão do processing para definir como o programa irá começar
void setup(){
  String serialPortName = Serial.list()[0]; // Coloca o arduino [0] na variavel serialPortName
  serialPort = new Serial(this, serialPortName, BAUDRATE); // Coloca dentro da variavel "serialPort" a porta serial que vai se comunicar com o arduino
  
  file = new SoundFile[nMusicas]; // Cria uma lista de arquivos de musicas com a quantidade de musicas desejada
  file[0] = new SoundFile(this, "3-POR-10.wav"); // Vai colocar a musica dentro do item 0 da lista
  file[1] = new SoundFile(this, "MIRAGEM.wav"); // Vai colocar a musica dentro do item 1 da lista
  file[2] = new SoundFile(this, "Hóspedes da Rua Rosa - Eu tô muito é pior.wav");
  file[3] = new SoundFile(this, "Mangroov - MANGROOV.wav");
  // Adicionar mais musicas à playlist: file[n] = new SoundFile(this, "NOMEDAMUSICA");
  
  file[0].loop(); // Inicia o loop da musica
}

// Função padrão do processing que vai funcionar como um loop infinito.
void draw(){
  if(serialPort.available() > 0){ // Caso a porta serial estivar disponivel...
    input = serialPort.readStringUntil('\n'); // Vai ler a string enviada pelo arduino até o \n (pula linha)
    
    sensors = split(input, ';'); // Divide a string lida em items de uma lista
    
    
    if (sensors != null && sensors.length == 4){ // Caso "sensors" for diferente de null (vazio) e seu tamano for de 4 itens...
    
      sAmplitude = sensors[0]; // Coloca o item 0 na variavel que será usada para amplitude (volume)
      sRate = sensors[2]; // Coloca o item 1 na variavel que será usada para rate (velocidade)
      sJump = sensors[1]; // Coloca o item 2 na variavel que será usada para jump (faz a musica ir até um ponto especifico, nesse caso, voltar 0.5seg)
      sNextMusic = sensors[3]; // Coloca o item 3 na variavel que será usada para trocar de musica
      print(sensors); // Essa linha é usada apenas para acompanharmos os valores dos sensores    
  
      //Passar a musica
      int musicaAtual = passaMusica(nMusicas); // Passa para a proxima musica da playlist (recebe como parametro o numero de musicas existentes)
      serialPort.write(musicaAtual); // Escreve na porta serial (manda para o arduino) o numero que corresponde à musica atual
     
      //Volume
      ampliar(musicaAtual); // Altera o volume (recebe como parametro o numero que corresponde à musica atual)
    
      //Voltar a musica
      jumpear(musicaAtual); // Volta 0.5 segundos na musica (recebe como parametro o numero que corresponde à musica atual)
      
      //Velocidade
      ratear(musicaAtual); //Altera a velocidade da musica (recebe como parametro o numero que corresponde à musica atual)
    
    }
  }
}
