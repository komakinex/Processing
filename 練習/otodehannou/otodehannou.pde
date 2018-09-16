//Soundライブラリの読み込み
import processing.sound.*;
//サウンド入力
AudioIn in;
//高速フーリエ変換(FFT)
FFT fft;
//FFTサイズ
int bands = 2048;
//グラフの高さのスケールを設定
float scale = 20.0;


void setup()
{
  size(800, 600);
  
  //サウンド入力を初期化
  in = new AudioIn(this, 0);
  //入力したサウンドを初期化
  in.start();
  //FFTを初期化
  fft = new FFT(this, bands);
  fft.input(in);
}

//グラフ化
void draw()
{
  background(200);
  //FFT解析実行
  fft.analyze();
  noFill();
  stroke(225, 0, 0);
  //線分の描画
  beginShape();
  //FFTバンドの数だけ繰り返し
  for(int i=0; i<bands; i++)
  {
    //FFTの解析結果を高さにグラフ
    vertex(i * width/float(bands), height - fft.spectrum[i] * height * scale);
  }
  //線分の描画終了
  endShape();
}
  
