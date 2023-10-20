Bit [] jose;
void setup()
{
  frameRate(15);
  size(1000, 1000);
  jose = new Bit[400];
  for (int i = 0; i < jose.length; i++) {
    jose[i] = new Bit();
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < jose.length; i++) {
    jose[i].show();
    jose[i].walk();
  }
}

class Bit
{
  float myX, myY, i, j;
  int Color;
  float gravity;
  Bit()
  {
    i = (float)(Math.random()*600)+200;
    j = (float)(Math.random()*600)+200;
    myX = i - (i%10);
    myY = j - (j%10);
    Color = 0;
  }
  void walk()
  {
    if (mouseX > myX){
      if (Math.random() > gravity){
      myX+=10;
      } else myX-=10;
    }
    if (mouseX < myX){
      if (Math.random() > gravity){
      myX-=10;
      } else myX+=10;
    }
    if (mouseY > myY){
      if (Math.random() > gravity){
      myY+=10;
      } else myY-=10;
    }
    if (mouseY < myY){
      if (Math.random() > gravity){
      myY-=10;
      } else myY+=10;
    }
    gravity = 0.45-10/(dist(myX,myY,mouseX,mouseY));
    Color = 255-(int)(dist(mouseX, mouseY, myX, myY)/3.5);
    if (Color <= 0) 
    {
      Color = 0;
    }
  }
  void show()
  {
    fill(Color);
    ellipse(myX, myY, 7, 7);
  }
}
