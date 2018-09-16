//寿司の位置、移動速度
float x;
float speedX;

void setup()
{
  
  size(500, 500);
  background(255);
  
  x = width/2;
  
  speedX = 30;
  
}

void keyPressed()
{
  //十字キーで横移動
  if(key == CODED)
  {
    if(keyCode == RIGHT)
    {
      x += speedX;
    }else if(keyCode == LEFT)
    {
      x -= speedX;
    }    
  }
  
  //押したら弾発射、米が減る
  if(key == CODED)
  {
    if(keyCode == )
    {
      x += speedX;
    }
  }
  
  
}



void draw()
{
  background(255);
  rectMode(CENTER);
  
  //シャリ
  stroke(0);
  strokeWeight(1);
  fill(255, 255, 255);
  rect(x, 400, 40, 15);
  
  //ネタ（マグロ）
  noStroke();
  fill(255, 0, 0);
  rect(x, 387, 60, 13);
  
  
  if(x <= 30)
  {
    x = 30;
  }else if (x >= width - 30)
  {
    x = width - 30;
  }
  
  
  
  
  
}
