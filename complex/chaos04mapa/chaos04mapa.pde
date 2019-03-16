float x = 0.1;
int i = 0;
float r = 2.5;

void setup()
{
  size(500, 500);
  background(0);
  frameRate(300);
  stroke(255,250,0, 3);
  strokeWeight(1);
}

void draw()
{
  r = r + 0.001;
  for (int i=0; i<5000; i++) {
    x = r*x*(1-x);
    point(x*500, (r-2.5)*300);
  }
}