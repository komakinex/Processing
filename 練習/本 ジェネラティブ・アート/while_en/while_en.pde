int dia = 10;
float centX, centY;
int a =10;

void setup()
{
  size(500, 800);
  frameRate(2);
  smooth();
  
  background(100);
  centX = width/2;
  centY = height/2;
/*  stroke(0);
  strokeWeight(5);
  fill(255, 50);*/
}

void draw()
{
  if(dia <= 400)
  {
    //background(100);
    strokeWeight(1);
    fill(255,30);
    ellipse(centX, centY-a, dia, dia);
    
    a += 30;
    strokeWeight(.5);
    fill(20, 30);
    
    int tempdia = dia;
    while(tempdia > 10)
    {
      ellipse(centX, centY+a, tempdia, tempdia);
      tempdia -= 50;
    }
    
    dia += 50;
  }
}
