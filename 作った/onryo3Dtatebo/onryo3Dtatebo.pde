//Soundライブラリーの読み込み 
import processing.sound.*; 
//サウンドプレイヤー 
SoundFile soundfile;
//音量解析
Amplitude rms;

float[] x, z;



void setup()
{
  size(700, 700, P3D);
  stroke(255);
  //サウンドファイルを読み込んでプレイヤーを初期化 
  soundfile = new SoundFile(this, "Every Day.mp3"); 
  //ループ再生
  soundfile.loop();
  //音量解析を初期化
  rms = new Amplitude(this); 
  //音量解析の入力を設定 
  rms.input(soundfile);
  
  
  x = new float[11];
  z = new float[11];
  
  
  for(int i=0; i<x.length; i++)
  {
    x[i] = 20 * i;
  }
  for(int i=0; i<z.length; i++)
  {
    z[i] = 20 * i;
  }
  
  colorMode(HSB, 360, 100, 100, 100);
  
  
}

void draw()
{
  background(0);
  

  translate(width/2, height/2, 0);
  //カメラ
  camera(350, -200, 250, // 視点X, 視点Y, 視点Z
         -100, 0, 0, // 中心点X, 中心点Y, 中心点Z
         0, 1, 0); // 天地X, 天地Y, 天地Z
  
  //補助線
  stroke(0, 0, 100, 0);
  strokeWeight(2);
  line(0, 0, 0, 400, 0, 0);
  line(0, 0, 0, 0, -400, 0);
  line(0, 0, 0, 0, 0, 400);
  
  /*
  strokeWeight(0.5);
  line(200, 0, 0, 200, 0, 200);
  line(0, 0, 200, 200, 0, 200);
  */
  
  
  for(int i=0; i<x.length; i++)
  {
    float r = random(50);
    for(int j=0; j<z.length; j++)
    {
      strokeWeight(2);
      
      stroke(320, 70, 100, 70);
      float dia = map(rms.analyze(), 0, 1, 0, 5);
      line(x[i], 0, z[j], x[i], -(r+100*dia), z[j]); 
      
      //補助線
      stroke(0, 0, 100);
      strokeWeight(1);
      line(0, 0, 0, 400, 0, 0);
      line(0, 0, 0, 0, -400, 0);
      line(0, 0, 0, 0, 0, 400);
    }
  }
 
  
  
  
  
}
  
