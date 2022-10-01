import processing.serial.*;

final int BAUDRATE = 9600;

Serial serialPort;

String input = "0;0;0;0";
String[] sensors;
int sAmplitude, sRate, sJump, sNextMusic;

void setup() {
  String serialPortName = Serial.list()[0];
  serialPort = new Serial(this, serialPortName, BAUDRATE);
}

void draw() {
  if(serialPort.available() > 0) {
    input = serialPort.readStringUntil('\n');
    
    sensors = split(input, ';');
  
    sAmplitude = int(sensors[0]);
    sRate = int(sensors[1]);
    sJump = int(sensors[2]);
    sNextMusic = int(sensors[3]);
  }
  
  println(sAmplitude, sRate, sJump, sNextMusic);
  
  delay(500);
}
