// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Wolfram Cellular Automata

// Simple demonstration of a Wolfram 1-dimensional cellular automata

CA ca;   // An instance object to describe the Wolfram basic Cellular Automata


void setup() {
  size(1200, 800);
  background(255);
  ca = new CA();                 // Initialize CA
  frameRate(60);
}

void draw() {
  ca.display();    // Draw the CA
  if (ca.generation < 400) {
    ca.generate();
  }
  
}
