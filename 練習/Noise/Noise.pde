
int lineNum = 600;

Line[] lines = new Line[lineNum]; //線の配列

float xseed = random(1);
float yseed = random(1);
float angleSeed = random(1);
float angleSeedIncrease = 0.004;
float posSeedIncrease = 0.2;


void setup()
{
  // fullScreen(P2D)
  size(800, 800);
  stroke(30, 180, 255, 100); //色指定
  strokeWeight(0.5);
  
  for (int i = 0; i < lineNum; i++)
  {
    lines[i] = new Line();
  }
  
  
  // このfor文で線の角度、中点の位置、両端の位置を決める
  for (int i = 0; i < lineNum; i++)
  {
    //角度を決める
    if (i <= 0)
    {
      lines[i].angle = noise(angleSeed) * 4 * PI;
    } else {
      lines[i].angle = noise(angleSeed) * 4 * PI;
    }
    
    if (i <= 0)
    {
      lines[i].center.x = noise(xseed);
      lines[i].center.y = noise(yseed);
    } else {
      lines[i].center.x = lines[i-1].center.x + noise(xseed) * 5;
      lines[i].center.y = lines[i-1].center.y + noise(yseed) * 3;
    }
    
    lines[i].CalPoint();
    angleSeed += angleSeedIncrease;
    xseed += posSeedIncrease;
    yseed += posSeedIncrease;
  }
}


void draw()
{
  background(255);
  
  for (int i = 0; i < lineNum; i++)
  {
    float y1;
    float x1;
    float y2;
    float x2;
    
    y1 = lines[i].point1.y;
    x1 = lines[i].point1.x;
    y2 = lines[i].point2.y;
    x2 = lines[i].point2.x;
    line(x1, y1, x2, y2);
  }
}
