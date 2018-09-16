int a, b, c, d, e;

void setup()
{
  size(1000, 720);
  background(255);
  
  frameRate(30);
  
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  noStroke();
  a = 240;
  b = 340;
  c = 380;
  d = 480;
  e = 720;
  
  if (mouseY<a)
  {
    fill(random(0,60),50,100);
  }else if(mouseY<b)
  {
    fill(random(60,120),50,100,70);
  }else if(mouseY<c)
  {
    fill(random(120,180),50,100);
  }else if(mouseY<d)
  {
    fill(random(180,240),50,100,70);
  }else if(mouseY<e)
  {
    fill(random(240,300),50,100);
  }else{
    fill(random(300,360),50,100);
  }
  
  if (mouseX<333)
  { 
    rect(mouseX, mouseY, random(100), random(100));
  }else if(mouseX <666){
    ellipse(mouseX, mouseY, random(100), random(100));
  }else{
    triangle(mouseX, mouseY, mouseX-random(100), mouseY+random(100), mouseX-random(100), mouseY-random(100));
  }
}
