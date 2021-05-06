import peasy.PeasyCam;

PeasyCam kamera;
float x = 0.1;
float y = 0;
float z = 0;
float dt = 0.01;
float a = 10.0;
float p = 28.0;
float b = 12.0/3.0;

ArrayList<PVector> punkty = new ArrayList<PVector>();

void setup() {
  size(500, 500, P3D);
  background(0);
  stroke(255);
  strokeWeight(0.3);
  kamera = new PeasyCam(this, 400);
}

void draw() {  
  float dx = (a*(y - x))*dt;
  float dy = (x*(p - z) - y)*dt;
  float dz = (x*y - b*z)*dt;
  
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  punkty.add(new PVector(x,y,z));
  
  translate(0, 0, -100);
  scale(6);
  background(0);
  noFill();
  beginShape();
  for(PVector punkt : punkty){ 
    stroke(20*abs(punkt.x), 20*abs(punkt.y), 20*abs(punkt.z));
    vertex(punkt.x, punkt.y, punkt.z);
  }
  endShape();
}
  
