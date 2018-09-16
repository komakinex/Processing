float y;
float x = 350;
int a = 10;

void setup()
{
  size(700, 700);
  y = 0;
  
  frameRate(30);
  
  //カラーモードをHSBに変更
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  
  noStroke();
  
  
  background(random(100,360));
  
  fill(random(100), 50, 100);
  triangle(250, 400, 600, 100, 400, 100);
  triangle(200, 600, 600, 200, 400, 200);
  
  y += 1.5;
  
  
  fill(200,100,100);
  ellipse(x, y, 4*a, 4.5*a);
  triangle(x, y-4.5*a, x-a*sqrt(3), y-1.15*a, x+a*sqrt(3), y-1.15*a);
  
  
  ellipse(x+100, y, 4*a, 4.5*a);
  triangle(x+100, y-4.5*a, x+100-a*sqrt(3), y-1.15*a, x+100+a*sqrt(3), y-1.15*a);
  
}
