import processing.sound.*;
SoundFile soundfile;
AudioIn in;
FFT fft;
int bands = 128;
float scale = 10000;

void setup()
{
  size(800, 600, P3D);
  noStroke();
  
  colorMode(HSB, 360, 100, 100, 100);
  
  in = new AudioIn(this, 0);
  in.start();
  
  fft = new FFT(this, bands);
  fft.input(in);
  
  frameRate(30);
}

void draw()
{
  blendMode(ADD);
  background(0);
  
  fft.analyze();
  
  //FFTのバンドの数だけ繰り返し
  for(int i=0; i<bands; i++)
  {
    float hue = map(i, 0, bands/4, 180, 270);
    fill(hue, 100, 100, 30);
    
    float boxSize = map(fft.spectrum[i], 0, 1, 0, scale);
    float rot = map(i, 0, bands, 0, PI*8);
    
    pushMatrix();
    
    translate(width/2, height/2);
    rotateX(rot + frameCount/frameRate);
    rotateY((rot + frameCount/frameRate) * 1.2);
    
    box(100+boxSize, 200, 200);
    
    popMatrix();
    
    
  }
  
}
