// ラの音を出力
import ddf.minim.*;
import ddf.minim.signals.*;

// 音声出力用のオブジェクト
Minim minim;
AudioOutput aout;
SineWave wave;

// 2の12乗根
float FREQ_RATE = 1.0594631;
// ラの周波数
float FREQ_BASE = 440;
// 休止の確率
float PAUSE_PERCENTAGE = 0.25;
// 演奏する音階の範囲
int TONE_RANGE = 4;







void setup()
{
  size(250, 250);
  
  // 初期設定
  minim = new Minim(this);
  aout = minim.getLineOut(Minim.STEREO);
  // サイン波を440Hz(ラ)、大きさ80%を指定
  wave = new SineWave(440, 1, aout.sampleRate());
  aout.addSignal(wave);
  
  // 一秒間に８回draw関数を呼び出す
  frameRate(8);
  
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  float freq;
  int temp;
  
  if(random(1) < PAUSE_PERCENTAGE)
  {
    // 休止では周波数を0に
    freq = 0;
  }else{
    // -tone_rageからtone_rageまでの乱数を生成
    temp = (int)(random(-TONE_RANGE, TONE_RANGE));
    
    /* ラの周波数に（２の１２乗根）をかける
    こうすることでtempだけ違う音階を出力できる*/
    freq = FREQ_BASE * pow(FREQ_RATE, temp);
  }
  
  wave.setFreq(freq);
  
  background(random(360),100, 100);
  

}
