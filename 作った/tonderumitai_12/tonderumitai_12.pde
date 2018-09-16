import processing.sound.*;
//サウンドプレイヤー 
SoundFile soundfile;

//Arduinoと連携
import processing.serial.*;
Serial port; //Arduinoとシリアル通信する変数
float val = 0; // Arduinoからくる値を保存する変数
int mapVal = 1;

//背景の線の数
int num = 30;


float a, b, c, d, s, t;






float[] x = new float[num];
float[] y = new float[num];

//背景の速さ
float[] speedX = new float[num];

color[] col = new color[num];




void setup()
{
  fullScreen();
  //size(1024, 768);
  colorMode(HSB, 360, 100, 100, 100);
  background(331, 0, 100);
  noStroke();
  rectMode(CENTER);

  //初期値
  for (int i=0; i<30; i++)
  {

    x[i] = random(0, width);
    y[i] = random(height);
    speedX[i] = random(-10, -5);

    col[i] = color(random(50, 200), 35, 100, 80);
  }
  
  
  t = 0;
  s = 90;
  
  
  //サウンドファイルを読み込んでプレイヤーを初期化 
  soundfile = new SoundFile(this, "twobirds2.mp3"); 
  //ループ再生
  soundfile.loop();
  
  // 自分のポート番号がSerial.list()配列の何番目かを調べる
  //println(Serial.list());
  
  // Serial.list()[]の配列に自分のポート番目をいれる 
  String arduinoPort = Serial.list()[3];
  
  // 変数portにarduinoからの通信を繋ぐ　
  port = new Serial(this, arduinoPort, 9600);
  
}


void draw()
{
  
  if(mapVal < 5)
  {
    background(331, 22*mapVal*0.3, 100);
    
      
      
    if (port.available() > 0)
    {
       // ポートの値をvalに保存
       val = port.read();
       mapVal = (int)map(val,0,255, 0, 5);
       println(mapVal);
    }
    
    
  
    for (int i=0; i<num; i++)
    {
      fill(col[i]);
      rect(x[i], y[i], 60, 3);
      x[i] += speedX[i]*mapVal;
      
      if (x[i]<=0)
      {
        x[i] = width;
      }
    }
    
  
    t += 0.03;
    s += 0.02;
    b = 40*sin(t);
     
    d = 80*sin(s);
     
    fill(130, 50, 100);
    ellipse(width/2+a+80, height/2+b-180, 60, 25);
    
    fill(190, 50, 100);
    ellipse(width/2+c-40, height/2+d+150, 80, 40);
   
  




  }
  if(mapVal == 5){
    background((random(120, 210)), 50, 100);
    
      
      
    if (port.available() > 0)
    {
       // ポートの値をvalに保存
       val = port.read();
       mapVal = (int)map(val,0,255, 0, 5);
       println(mapVal);
    }
    
    
  
    for (int j=0; j<30; j++)
    {
      fill(330, 70, 100, 50);
      rect(x[j], y[j], 60, 5);
      x[j] += speedX[j]*mapVal*2;
      
      if (x[j]<=0)
      {
        x[j] = width;
      }
    }
    
  
    t += 0.08;
    s += 0.04;
    b = 40*sin(t);
     
    d = 80*sin(s);
     
    fill(0, 0, 70);
    rect(width/2+a+80, height/2+b-180, 60, 25);
    
    fill(60, 100, 100);
    rect(width/2+c-40, height/2+d+150, 80, 40);
   
  




  }
  
 
  

  

}
