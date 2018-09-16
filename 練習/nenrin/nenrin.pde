float[] x;
float[] y;

int shapeRes = 5; //これを増やすと多角形になる
float startRadius = 100; //内側の多角形の大きさ
float[] noiseArgument; //パーリンノイズの引用数
float increase = 0.8; //noiseArgumentの更新用
float angle;

float deltaLength = 2.5; //頂点の最大移動量

void setup()
{
  fullScreen();
  background(255);
  
  //pixelDensity(displayDensity()); //retinaディスプレイ用
  
  noFill();
  stroke(0, 20);
  
  angle = TWO_PI / shapeRes; //何度間隔で頂点を打つか（ラジアン）
  
  x = new float[shapeRes];
  y = new float[shapeRes];
  
  noiseArgument = new float[shapeRes];
  
  for(int i = 0; i < shapeRes; i++)
  {
    noiseArgument[i] = random(10000);
  }
  
  for(int i = 0; i < shapeRes; i++)
  {
    x[i] = cos(angle * i) * startRadius;
    y[i] = sin(angle * i) * startRadius;
  }
}


void draw()
{
  translate(width/2, height/2);
  
  beginShape(); //curveVertex()を使う前にこれを書く決まり
  
  curveVertex(x[shapeRes - 1], y[shapeRes -1]);
  
  for (int i = 0; i < shapeRes; i++)
  {
    curveVertex(x[i], y[i]);
  }
  
  curveVertex(x[0], y[0]);
  curveVertex(x[1], y[1]);
  
  endShape(); //curve~の後に書く決まり
  
  
  //頂点の座標を更新
  
  for (int i = 0; i < shapeRes; i++)
  {
    float length = noise (noiseArgument[i]) * deltaLength * 2 - deltaLength;
    x[i] -= cos(angle * i) * length;
    y[i] -= sin(angle * i) * length;
    noiseArgument[i] += increase;
  }
}


void keyPressed()
{
  if (key == 's')
  {
    saveFrame(frameCount + ".png");
  }
}
  
