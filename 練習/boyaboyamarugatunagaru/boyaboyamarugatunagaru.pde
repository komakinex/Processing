Blob[] blobs = new Blob[7];

void setup()
{
  size(600, 400);
  colorMode(HSB);
  
  for(int i=0; i<blobs.length; i++)
  {
    // このblobを最初のposに代入
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw()
{
  background(0);
  
  // Pixelsを使えるように読み込む
  // pushMatrix()みたいなイメージ？
  loadPixels();
  
  for(int x=0; x<width; x++)
  {
    for(int y=0; y<height; y++)
    {
      
      // y*widthでx=0の時の横の列全部（テンプレ的存在）
      // Pixelsを読み込んだ状態において(x, y)は、pixels[y*width + x]で得られる
      int index = x + y * width;
      
      float sum = 0;
      
      for(Blob b: blobs)
      {
        // dist関数は2点間の距離を求める
        float d = dist(x, y, b.pos.x, b.pos.y);
        
        sum += 100 * blobs[0].r / d;
        
        // costrain()はsumの範囲を0~220に制限する
        // 各Blobを恒星にするイメージ
        pixels[index] = color(constrain(sum, 0, 220), 255, 255);
      }
    }
  }
  
  // popMatrix()みたいに閉じる時に使う
  updatePixels();
  
  for(Blob b: blobs)
  {
    b.update();
    b.show();
  }
}


class Blob
{
  PVector pos;//位置ベクトル
  float r;
  PVector vel;//方向ベクトル
  
  Blob(float x, float y)
  {
    // posの位置ベクトルを決定
    pos = new PVector(x, y);
    // 単位ベクトルのPVector2Dのrandom
    vel = PVector.random2D();
    // スカラー倍する
    vel.mult(random(5, 10));
    // 半径
    r = 40;
  }
  
  
  // posを移動させる
  void update()
  {
    // ベクトルの足し算
    pos.add(vel);
    
    if(pos.x > width || pos.x < 0)
    {
      vel.x *= -1;
    }
    if(pos.y > height || pos.y < 0)
    {
      vel.y *= -1;
    }
  }
  
  // Bolbの輪郭を表示する
  void show()
  {
    noFill();
    stroke(0);
    strokeWeight(4);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
  
}
