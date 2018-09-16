//線の軌道
float y = 0;
float x = 0;

void setup()
{
  size(500, 500, P3D);
  stroke(255);
  
  //frameRate(1);
  
}

void draw()
{
  //background(0);
  

  translate(width/2, height/2, 0);
  //カメラ
  camera(350.0, -100.0, 250.0, // 視点X, 視点Y, 視点Z
         -100.0, 0.0, 0.0, // 中心点X, 中心点Y, 中心点Z
         0.0, 1, 0.0); // 天地X, 天地Y, 天地Z
  
  //補助線
  strokeWeight(0.5);
  line(0, 0, 0, 250, 0, 0);
  line(0, 400, 0, 0, -400, 0);
  line(0, 0, 0, 0, 0, 250);
  
  strokeWeight(0.5);
  line(200, 0, 0, 200, 0, 200);
  
  
  
  
  strokeWeight(1);
  x = 100*sin(y/20.0);
  line(int(y), int(x), 200,  int(y)+1, int(x)+1, 200); 
  
  y += .3;
  
  
  
  
}
  
