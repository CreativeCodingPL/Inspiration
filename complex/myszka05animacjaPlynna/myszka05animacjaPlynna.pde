void setup()
{
  size(500, 500);
  background(0);
  frameRate(60);
  stroke(255,250,0, 3);
  strokeWeight(1);
}

float x=200;
float nx=200;
void draw()
{
  background(0);
  x = x + (nx - x)*0.1; 
  ellipse(x, 250, 30, 30);
}

void mousePressed()
{
  nx = mouseX;
}