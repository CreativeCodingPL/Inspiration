float x;
int i = 0;
float r = 3.65;

void setup()
{
  size(500, 500);
  background(255);
  frameRate(30);
  x = 0.1;
  stroke(0, 50);
  strokeWeight(10);
}

void draw()
{
  x = r*x*(1-x);
  point(x*200,i);
  i++;
}