void setup()
{
   //初期設定
  size(800, 800);
  background(255);
  
  frameRate(10);
  
  //カラーモードをHSBに変更
  colorMode(HSB, 360, 100, 100);

}

void draw()
{
  noStroke();
  fill(random(100), 50, 100);
  triangle(250, 400, 600, 100, 400, 100);
  triangle(200, 600, 600, 200, 400, 200);
  
  stroke(255);
  fill(random(250,360), 50, 100);
  line(random(800), random(800), random(800), random(800));
  
  /*
  float a, b;
  a = random(400);
  b = random(400, 800);
  triangle(a, b, random(200, 600), a, b, b);
  */
}
