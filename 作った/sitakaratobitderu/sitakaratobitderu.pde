import processing.serial.*;
//Soundライブラリーの読み込み 
import processing.sound.*;
//サウンドプレイヤー 
SoundFile soundfile;




float x, y;    //ボールのy座標
float velX = 1.0;    //ボールのx軸の初速
float velY = 30.0;    //ボールのy軸の初速
float gravity = 0.6;    //ボールにかかる重力
float reaction = 0.9;    //ボールの反発力
float damp = 0.9;    //摩擦による減衰
 
void setup() {
  size(500, 500);
  background(255);
  noStroke();
  fill(0);
  x = width/2;
  y = height;  //x, yを0.0で初期化
  
  
   //サウンドファイルを読み込んでプレイヤーを初期化 
  soundfile = new SoundFile(this, "Allweknow.mp3"); 
  //ループ再生
  soundfile.loop();
}
 
void draw() {
  //フェードする時はtrue、しない場合はfalse
  fade(false);
 
  ellipse(x, y, 20, 20);    //ボールを描く
 
  velY += gravity;    //スピードに重力が加算される
 
  x += velX;//ボールにスピードを加算
  y += velY;
 
  //ボールが画面の横幅を超えたら反対の向きになる
  if (x > width || x < 0) velX = -velX;
 
  if (y > height) {    //もしボールが画面の下まで落ちたら、
    velY *= -reaction;    //反発力によって上に上がる
    velX *= damp;    //velXを減衰
    y = height;    //ボールは画面の外に外れない
  }
}
 
//フェード用関数
void fade(boolean _fadeFlag) {
  if (_fadeFlag) {
    fill(255, 10);  //透明度のあるrectを描画
    rect(0, 0, width, height);
    fill(0);      //オブジェクトは黒
  } else {
    background(255);
  }
}
