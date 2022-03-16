float x = 0.5;
float y = 10;
float z = 0;
float dt = 0.005;
float a = 10.0;
float p = 28.0;
float b = 9.0/3.0;

void setup() {
  size(500, 500);
  background(0);
  stroke(255);
  strokeWeight(0.3);
  colorMode(HSB);
  frameRate(300);
}

void draw() {  
  float dx = (a*(y - x))*dt;
  float dy = (x*(p - z) - y)*dt;
  float dz = (x*y - b*z)*dt;
  
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  translate(width/2, height/2);
  scale(6);
  stroke(abs(z)*2, 200, 255);
  point(x, y);
}
  
