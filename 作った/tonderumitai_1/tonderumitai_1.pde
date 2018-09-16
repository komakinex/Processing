import processing.sound.*;
//サウンドプレイヤー 
SoundFile soundfile;



int num = 50;

float a, b, c, d, s, t;



float[] x = new float[num];
float[] y = new float[num];

//背景の速さ
float[] speedX = new float[num];


float[] dia = new float[num];


color[] col = new color[num];




void setup()
{
  size(1024, 768);
  background(0);

  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  rectMode(CENTER);

  //初期値
  for (int i=0; i<num; i++)
  {

    x[i] = random(0, width);
    y[i] = random(height);
    speedX[i] = random(-10, -5);


    dia[i] = random(10, 30);

    col[i] = color(random(50, 200), 35, 100, 80);
  }
  
  
  t = 0;
  s = 90;
  
  
  //サウンドファイルを読み込んでプレイヤーを初期化 
  soundfile = new SoundFile(this, "twobirds.mp3"); 
  //ループ再生
  soundfile.loop();
  
}


void draw()
{
  background(331, 22, 100);

  for (int i=0; i<num; i++)
  {

    fill(col[i]);


    rect(x[i], y[i], 60, 3);
    x[i] += speedX[i];

    if (x[i]<=0) {
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
