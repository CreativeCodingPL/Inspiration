float x = 0.1;

void setup()
{
  size(500, 500);
  background(0);
  frameRate(60);
  stroke(255,250,0, 3);
  strokeWeight(1);
}

void draw()
{
  background(0);
  float r = map(mouseX, 0, 500, 2, 4);
  x = r*x*(1-x);
  ellipse(250, 250, x*300, x*300);
}