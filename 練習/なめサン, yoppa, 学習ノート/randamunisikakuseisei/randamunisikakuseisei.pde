int numShapes = 10;

void setup()
{
  size(800, 700, P2D);
  pixelDensity(displayDensity());
  colorMode(HSB, 360, 100, 100, 100);
  noLoop();
  rectMode(CENTER);
  noStroke();
}

void draw()
{
  background(0, 0, 95);
  translate(width/2, height/2);
  
  
  for(int i=0; i<numShapes; i++)
  {
    float centerx = random(-width/2, width/2);
    float centery = random(-height/2, height/2);
    
    //boolean isVertical = random(1) < 0.5 ? true : false;
    boolean isVertical = random(1) < 0.5;
    
    int longSide = (int)random(200, 600);
    int shortSide = (int)random(10, 20);
    
    pushMatrix();
    translate(centerx, centery);
    
    if(isVertical) rotate(HALF_PI);
    
    fill(random(200, 360), 80, 80);
    rect(0, 0, longSide, shortSide);
    
    popMatrix();
  }
}

void keyPressed()
{
  redraw();
}
