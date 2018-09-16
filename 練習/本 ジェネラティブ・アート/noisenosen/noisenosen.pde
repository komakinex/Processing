

void setup()
{
  size(500, 100);
  background(255);
  strokeWeight(2);
  smooth();
  
  stroke(0, 30);
  line(20, height/2, 480, height/2);
  
  stroke(255, 50, 70);
  
  float xstep = 10;
  float ystep = 10;
  float lastx = 20;
  float lasty = 50;
  
  float y = 50;

  for(int x = 20; x <= 480; x += xstep)
  {
    ystep = random(20)-10;
    y += ystep;
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
  
  
}
