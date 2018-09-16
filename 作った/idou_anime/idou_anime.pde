int x = 0;
int y = 0;
int dia = 20;


void setup()
{
  size(500, 500);
  noStroke();
  fill(0, 255, 0);
  
  frameRate(5);
  
}


void draw()
{
  background(255);
  x += random(10);
  y += random(10);
  ellipse(x, y, dia, dia);
}


void mouseClicked()
{
  if (x-15<mouseX && mouseX<x+15 && y-15<mouseY && mouseY<y+15)
  {
    fill(255, 0, 0);
    dia = 100;
  }
  
  if(dia == 100 &&x-60<mouseX && mouseX<x+60 && y-60<mouseY && mouseY<y+60)
  {
    fill(0,255,0);
  }
  
}
