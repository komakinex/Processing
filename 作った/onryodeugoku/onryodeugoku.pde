import processing.sound.*;
SoundFile soundfile;
Amplitude rm;


// グローバル変数 X座標を保存する
int x;
int dia; //直径
int speedX; //X移動の速度

void setup(){
  // 最初の1回だけ呼ばれる
  size(500,500);
  noStroke();
  x = width/2; //250;
  dia = 60;
  speedX = 15;
  
  soundfile = new SoundFile(this, "sonsonremix.mp3");
  soundfile.loop();
  
  rm = new Amplitude(this);
  rm.input(soundfile);
}


void draw(){
  background(70);
  // 繰り返し呼ばれる
  //println(frameCount);
  float a = map(rm.analyze(), 0, 1, 0, 400);
  float b = map(rm.analyze(), 0, 1, 0, 500);
  //色の変化
  if(b>100){
    fill(#ffffff);
  }else if(b>30){
    fill(#ccff33);
  }else{
    fill(#ffff00);
  }
  rectMode(CENTER);
  rect(x,height/2-a,dia+b, dia+b);
  rect(x,height/2+a,dia+b, dia+b);
  rect(x+b,height/2,dia+b, dia+b);
  rect(x-b,height/2,dia+b, dia+b);
  
  
  // 跳ね返る
  if(x > width - dia/2){
    speedX *= -1; 
  }else if (x < dia/2){
    speedX *= -1;
  }
  
  x += speedX;
}
