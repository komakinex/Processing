
import ddf.minim.*;

Minim minim;
AudioSample son, kan;

int xSonB, ySonB, dSonB;
int xKanB, yKanB, dKanB;

void setup()
{
  size(300, 200);
  smooth();
  
  xSonB = int (width * (1.0/4));
  ySonB = int (height * (1.0/2));
  dSonB = 50;
  
  xKanB = int (width * (3.0/4));
  yKanB = int (height * (3.0/2));
  dKanB = 50;
  
  minim = new Minim(this);
  
  son = minim.loadSample("son.wav");
  kan = minim.loadSample("kan.wav");
}

void draw()
{
  background(0);
  
  ellipseMode(RADIUS);
  fill(0, 0, 255);
  ellipse(xSonB, ySonB, dSonB, dSonB);
  fill(0, 255, 255);
  ellipse(xKanB, yKanB, dKanB, dKanB);
}

void mouseClicked()
{
  if (dist(mouseX, mouseY, xSonB, ySonB) < dSonB)
  {
    son.trigger();
  }
  if (dist(mouseX, mouseY, xKanB, yKanB) < dKanB)
  {
    kan.trigger();
  }
}


void stop()
{
  son.close();
  kan.close();
  
  minim.stop();
  
  super.stop();
}
