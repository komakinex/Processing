
void setup()
{
  size(960, 540, P3D);
}

void draw()
{
  background(0, 15, 30);
  
  // 原点を画面中心に
  translate(width/2, height/2, 0);
  // x軸を中心に世界を回転
  rotateX(frameCount * 0.005);
  // z軸を中心に回転
  rotateZ(frameCount * 0.005);
  
  // 円状に点を描く
  float radius = 200; //半径
  for (int s = 0; s <= 180; s += 10)
  {
    //角度をラジアンに
    float radianS = radians(s);
    
    //0<=s<=180なので、-1 <= cos(radianS) <= 1
    //よってzは-radius <= z <= radius
    float z = radius * cos (radianS);
    
    for (int t = 0; t < 360; t += 10)
    {
        float radianT = radians(t);

        // 点の座標を計算
        // sin(radian)は0→1→0の順で変化するので
        // radius*sin(raduanS)は0→200→0になる
        float x = radius * sin(radianS) * cos(radianT);
        float y = radius * sin(radianS) * sin(radianT);
        
        // 点を描画
        stroke(0, 128, 128);
        strokeWeight(8);
        point(x, y, z);
    }
  }
}

    
