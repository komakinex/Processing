// 色、円の半径、付随する線の長さ・太さにrandomを用い、水滴感を表現

void setup()
{
  size(1000, 700);
  background(0);
  colorMode(HSB, 360, 100, 100);
}

void draw(){}


void mouseClicked() 
{
  //土台の円(mouseでクリックした場所に生成)
  float X = mouseX; 
  float Y = mouseY;
  float dia = random(50,100); 
  float c = random(360);
  
  noStroke();
  fill(c, 50, 100);
  ellipse(X, Y, dia, dia);
  
  
  // 円に付随する円と線の情報
  
  // 付随する円の中心(もしくは線の端点)の存在幅
  int s = 25;
  int t = 75;
  
  // 中心点の候補
  // 第一象限
  float xa = random(0,s);
  float xb = random(s,t);
  float ya = random(s,t);
  float yb = random(0,s);
  // 第二象限
  float xc = random(s,t);
  float xd = random(0,s);
  float yc = random(0,s);
  float yd = random(s,t);
  // 第三象限
  float xe = random(0,s);
  float xf = random(s,t);
  float ye = random(s,t);
  float yf = random(0,s);
  // 第四象限
  float xg = random(s,t);
  float xh = random(0,s);
  float yg = random(0,s);
  float yh = random(s,t);
  
  // 円と線の描画
  float[] x = {X+xa,X+xb,X+xc,X+xd,X-xe,X-xf,X-xg,X-xh};
  float[] y = {Y+ya,Y+yb,Y-yc,Y-yd,Y-ye,Y-yf,Y+yg,Y+yh};
  
  for (int i = 0; i < x.length; i++)
  {
    float dia2 = random(10,30); //直径
    ellipse(x[i], y[i], dia2, dia2);
  }
  
  stroke(c, 50, 100);
  for (int i = 0; i < x.length; i++)
  {
    strokeWeight(random(3,7));
    line(X, Y, x[i], y[i]);
  }

}
