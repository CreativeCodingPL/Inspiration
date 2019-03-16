float x = 0.1;

void setup()
{
  size(500, 500);
  background(0);
  frameRate(60);
  stroke(255,250,0, 3);
  strokeWeight(1);
}

float s=200;
float ns=200;
void draw()
{
  background(0);
  float r = map(mouseX, 0, 500, 2, 4);
  if(s - ns < 0.2) 
  {
    x = r*x*(1-x);
    ns = 200*x;
  }
  s = s + (ns - s)*0.2; 
  ellipse(250, 250, s, s);
}