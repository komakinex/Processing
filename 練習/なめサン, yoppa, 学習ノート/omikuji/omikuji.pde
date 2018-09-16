
String[] kuji = {"大吉", "中吉","小吉", "吉"};
//int count = 0;

void setup(){
  size(500, 500);
  background(255);
  noStroke();
  
}


void draw()
{
 /*
  background(255);
  fill(0);
  textAlign(CENTER);
  text(cha[count], width/2, height/2);
  count++;
  
  if(count >= cha.length) count=0;
  */
}


void mousePressed()
{
  fill(0);
  textAlign(CENTER);
  //background(255);
  int i = (int)random(0,100);
  if(i<10){
    text(kuji[0], mouseX, mouseY);
  }else if(i<30){
    text(kuji[1], mouseX, mouseY);
  }else if(i<60){
    text(kuji[2], mouseX, mouseY);
  }else{
    text(kuji[3], mouseX, mouseY);
  }
}
