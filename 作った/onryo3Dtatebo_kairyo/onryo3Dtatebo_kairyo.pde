//Soundライブラリーの読み込み 
import processing.sound.*;
//サウンドプレイヤー 
SoundFile soundfile;
//FFT
FFT fft;
int bands = 1024;
float scale = 20;


float[] x, z;



void setup()
{
  size(700, 700, P3D);
  stroke(255);
  //サウンドファイルを読み込んでプレイヤーを初期化 
  soundfile = new SoundFile(this, "Dear Boy.mp3"); 
  //ループ再生
  soundfile.loop();
  fft = new FFT(this, bands);
  fft.input(soundfile);
  
  
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
  fft.analyze();
  

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
  
  
  
  
  strokeWeight(2);
  
  stroke(320, 70, 100, 70);
  
  
  beginShape(); //FFTのバンドの数だけくりかえし
  for (int i = 0; i < bands; i++)
  {
    
      
    //FFTの解析結果を高さにグラフを描く
    vertex(200 - i * 200/float(bands), - fft.spectrum[i] * 50 * scale, 100);
   }
  //線分の描画終了
  endShape();
  
  //補助線
  stroke(0, 0, 100);
  strokeWeight(1);
  line(0, 0, 0, 400, 0, 0);
  line(0, 0, 0, 0, -400, 0);
  line(0, 0, 0, 0, 0, 400);
    
  
 
  
  
  
  
}
  
