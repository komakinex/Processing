//Circleクラスのインスタンスを宣言
Circle c1, c2, c3;

void setup()
{
  size(400, 400);
  noStroke();
  fill(0);
  
  //インスタンスを作成
  c1 = new Circle(100, 10, 1.0);
  c2 = new Circle(300, 40, 3.5);
  c3 = new Circle(200, 80, 2);
  
}


void draw()
{
  background(255);
  
  //c1インスタンスのクラスであるCircleクラスのupdate(), display()メソッドを実行
  c1.update();
  c1.display();
  
  c2.update();
  c2.display();
  
  c3.update();
  c3.display();
}



class Circle
{
  float x, y, eSize, velocity;
  
  
  //初期化用メソッド
  Circle(float _y, int _eSize, float _velocity)
  {
    //x, yの初期値設定
    x = 0;
    y = _y;
    eSize =_eSize;
    velocity = _velocity;
  }
  
  //円の位置を更新するメソッド；
  void update()
  {
    x += velocity;
    //x座標が幅を超えたら0へ戻す
    if(x > width)
    {
      x = 0;
    }
  }
  
  void display()
  {
    ellipse(x, y, eSize, eSize);
  }
  
}
