CA ca;   

void setup() {
  size(800, 800);
  //pixelDensity(2);
  frameRate(30);
  background(0);
  //int[] ruleset = {0,1,1,1,1,0,1,1};           // Rule 222  
  //int[] ruleset = {0,1,1,1,1,1,0,1};           // Rule 190  
  int[] ruleset = {0,1,1,1,1,0,0,0};           // Rule 30  
  //int[] ruleset = {0,1,1,1,0,1,1,0};             // Rule 110  
  
  ca = new CA(ruleset);                 
}

void draw() {
  ca.display();          
  ca.generate();
}
