import processing.serial.*;

//シリアル型の変数
Serial port;

//Arduinoから受け取るための変数
float val = 0;

void setup()
{
  size(900, 700);
  
  //自分のポート番号を確認
  //println(Serial.list());
  
  String arduinoPort = Serial.list()[12];
  //Arduinoとの接続
  port = new Serial(this, arduinoPort, 9600);
  
}

void draw(){
  
  if(port.available() > 0)
  {
    //ポートから来た値を保存
    val = port.read();
    
    println(val);
  }
  //float angle = map(val, 0, 1023, 0, 179);
  background(val);
  
}
