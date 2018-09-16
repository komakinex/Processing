int x, y, vx;

void setup(){
  x = ceil(random(width));
  y = ceil(random(height));
  vx = 1; // 速度用の変数
}

void draw(){
  background(0);
  ellipse(x, y, 4, 4);
  x += vx; // 速度の分、座標を変える
  if(x > width || x < 0){ // 画面外に出たら
    vx = -vx; // 速度を逆向きにする
  }
}
