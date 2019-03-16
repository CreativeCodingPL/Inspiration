float x = 0.7;
int i = 0;
float r = 3.9832;

void setup()
{
  size(500, 500);
  background(255);
  frameRate(30);
  stroke(0, 50);
  strokeWeight(10);
}

void draw()
{
  background(255);
  r = map(mouseX, 0, 500, 2, 4);
  println(r);
  x = 0.1;
  for (int i=0; i<500; i++) {
    x = r*x*(1-x);
    point(x*500, i);
  }
}