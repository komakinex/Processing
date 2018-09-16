void setup()
{
  size(600, 300);
  //frameRate(5);
}

void draw()
{
  fill(204, 50);
  noStroke();
  rect(0, 0, width, height);
  
  // ランダムな位置、傾き、サイズで星を描画できるよう座標変換
  translate(random(width), random(height));
  rotate(random(PI));
  scale(random(0.1, 0.5));
  
  int[] x = {50, 29, 83, 17, 71};
  int[] y = {18, 82, 43, 43, 82};
  
  // 点を順に線で結んで星を描く
  // 星を原点へ
  translate(-50, -50);
  
  fill(255);
  stroke(0);
  
  beginShape();
  for(int i=0; i<x.length; i++)
  {
    vertex(x[i] + random(-5, 5), y[i] + random(-5, 5));
  }
  endShape(CLOSE);
}

  
  
