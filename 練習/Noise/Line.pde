class Line
{
  public float angle;//線の角度
  public PVector center, point1, point2; //線の中点、端点12
  public float length = 1200; //線の長さ
  
  // コンストラクタ
  Line()
  {
    center = new PVector();
    point1 = new PVector();
    point2 = new PVector();
  }
  
  
  // 線の角度、中点の位置から両端の点を算出するメソッド
  public void CalPoint()
  {
    point1.y = sin(angle) * length + center.y;
    point1.x = cos(angle) * length + center.x;
    point2.y = -sin(angle) * length + center.y;
    point2.x = -cos(angle) * length + center.x;
  }
}
