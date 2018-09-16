Te te;


//寿司の位置、移動速度
float x;
float speedX;

void setup()
{
  size(500, 500);
  background(255);
  noCursor();
  x = width/2;
  
  speedX = 30;
  
  te = new Te(random(width), 8);
  
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
  
  /*
  //押したら弾発射、米が減る
  if(key == CODED)
  {
    if(keyCode == )
    {
      x += speedX;
    }
  }
  */
  
}

//降ってくる手のクラス
class Te{
  
  float tx, ty;
  Te(float x, float y)
  {
    tx = x;
    ty = y;
  }
  
  void update()
  {
    //手
    ty += 2;
    noStroke();
    fill(252, 226, 196);
    rect(tx, ty, 24, 8);
    rect(tx-8, ty+8, 8, 16);
    rect(tx+8, ty+8, 8, 16);
    
    //画面から出たら戻る
    if(ty >= height + 8)
    {
      ty = 8;
      tx = random(width);
    }
  
  }
  
}



void draw()
{
  background(255);
  
  
  te.update();
  
  rectMode(CENTER);
  //寿司
  
  //シャリ
  stroke(0);
  strokeWeight(1);
  fill(255, 255, 255);
  rect(x, 450, 40, 15);
  
  //ネタ（マグロ）
  noStroke();
  fill(255, 0, 0);
  rect(x, 437, 60, 13);
  
  
  if(x <= 30)
  {
    x = 30;
  }else if (x >= width - 30)
  {
    x = width - 30;
  }
  
  
}
