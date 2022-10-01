String input = "100;125;52;40";
String[] sensors;
int sAmplitude, s2, s3, s4;

void setup() {
}

void draw() {
  sensors = split(input, ';');
  
  sAmplitude = int(sensors[0]);
  s2 = int(sensors[1]);
  s3 = int(sensors[2]);
  s4 = int(sensors[3]);
  
  println(sAmplitude, s2, s3, s4);
  
  delay(500);
}
