import processing.sound.*;
//サウンドプレイヤー 
SoundFile soundfile;

//Arduinoと連携
import processing.serial.*;
Serial port; //Arduinoとシリアル通信する変数

/*
float val = 0; // Arduinoからくる値を保存する変数
int mapVal = 1;
*/

int sensorsNUM = 2;
int[] val = new int[sensorsNUM]; //センサーの値を格納する配列


int val1 = 0;
int val2 = 1;


//背景の線の数
int num = 10;

float a, b, c, d, s, t;



float[] x = new float[num];
float[] y = new float[num];

//背景の速さ
float[] speedX = new float[num];

color[] col = new color[num];




void setup()
{
  size(1024, 768);
  colorMode(HSB, 360, 100, 100, 100);
  background(331, 22, 100);
  noStroke();
  rectMode(CENTER);

  //初期値
  for (int i=0; i<num; i++)
  {

    x[i] = random(0, width);
    y[i] = random(height);
    speedX[i] = random(-10, -5);

    col[i] = color(random(50, 200), 35, 100, 80);
  }
  
  
  t = 0;
  s = 90;
  
  
  //サウンドファイルを読み込んでプレイヤーを初期化 
  soundfile = new SoundFile(this, "twobirds.mp3"); 
  //ループ再生
  soundfile.loop();
  
  // 自分のポート番号がSerial.list()配列の何番目かを調べる
  //println(Serial.list());
  
  // Serial.list()[]の配列に自分のポート番目をいれる 
  String arduinoPort = Serial.list()[3];
  
  // 変数portにarduinoからの通信を繋ぐ　
  port = new Serial(this, arduinoPort, 9600);
  port.bufferUntil('\n');
  
}


void draw()
{
  background(331, 22, 100);
  
  
  while (port.available () > 0) {
        serialEvent(port.read());
    }
  
  /*
  if (port.available() > 0)
  {
     // ポートの値をvalに保存
     val = port.read();
     mapVal = (int)map(val,0,255, 0, 5);
     println(mapVal);
  }
  */

  for (int i=0; i<num; i++)
  {
    fill(col[i]);
    rect(x[i], y[i], 60, 3);
    x[i] += speedX[i];
    
    if (x[i]<=0)
    {
      x[i] = width;
    }
  }
  

  t += 0.04;
  s += 0.03;
  b = 25*sin(t);
   
  d = 40*sin(s);
   
  fill(130, 50, 100);
  ellipse(width/2+a+50, height/2+b-100, 60, 25);
  
  fill(190, 50, 100);
  ellipse(width/2+c-40, height/2+d+100, 80, 40);


}


/*

int NEWLINE = 10;
String buff = "";

void serialEvent(int serial){
  
  
  if (serial != NEWLINE) {
    // シリアルで届いた値を文字列にしてbuffeに加える
    buff += char(serial);
    
    println(buff);
    //buff = "";
    
    
  }
  
  
  
  
  String myString = port.readStringUntil('\n');
  myString = trim(myString);
  val = int(split(myString, ','));
  
  
  println(val[0]);
  
  
}


*/


void serialEvent(int serial){
  
  String myString = port.readStringUntil('\n');
  myString = trim(myString);
  
  val = int(split(myString, ','));
  
  val1 = val[0];
  val2 = val[1];
  
  println(val1);
  println(val2);
  }


/*
void serialEvent(Serial port){
  
  String myString = port.readStringUntil('\n');
  myString = trim(myString);
  
  val = int(split(myString, ','));
  
  
  println(val[0]);
  
}

*/
