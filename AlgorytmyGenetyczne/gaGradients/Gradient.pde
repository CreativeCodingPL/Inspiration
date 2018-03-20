class Gradient {
  DNA dna;
  float x;
  float y;
  float fitness;
  
  Gradient(DNA _dna, float _x, float _y) {
    x = _x;
    y = _y;
    dna = _dna;
    fitness = 1;
  }
  void draw() {
    color tl = color(dna.genes[0]*255, dna.genes[1]*255, dna.genes[2]*255);
    color tr = color(dna.genes[3]*255, dna.genes[4]*255, dna.genes[5]*255);
    color bl = color(dna.genes[6]*255, dna.genes[7]*255, dna.genes[8]*255);
    color br = color(dna.genes[9]*255, dna.genes[10]*255, dna.genes[11]*255); 
    color m = color(dna.genes[12]*255, dna.genes[13]*255, dna.genes[14]*255);
    float w = map(dna.genes[15], 0, 1, 20, 80);
    float h = map(dna.genes[16], 0, 1, 20, 80);

    PVector mPos = new PVector(map(dna.genes[17], 0, 1, -w/2.0+5, w/2.0-5), map(dna.genes[18], 0, 1, -h/2.0+5, h/2.0-5));
    fill(255);
    //strokeWeight(0.5);
    //stroke(200);
    rect(x-40,y-40,80,80);
    noStroke();
    beginShape(TRIANGLE_FAN);
    fill(m);
    vertex(x+mPos.x, y+mPos.y);
    fill(tl);
    vertex(x-w/2.0, y-h/2.0);
    fill(tr);
    vertex(x+w/2.0, y-h/2.0); 
    fill(br);
    vertex(x+w/2.0, y+h/2.0);
    fill(bl);
    vertex(x-w/2.0, y+h/2.0); 
    fill(tl);
    vertex(x-w/2.0, y-h/2.0);
    endShape();
  }
  float getFitness() {
    return fitness;
  }
  DNA getDNA() {
    return dna;
  }
}