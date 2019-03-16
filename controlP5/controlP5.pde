import controlP5.*;

ControlP5 cp5;
float suwak = 0.0;
color myColor;

void setup(){
  
  size(800,600);
  
  cp5 = new ControlP5(this);
  cp5.addSlider("suwak");
  
  cp5.addColorWheel("myColor").setPosition(0,50);
  
  cp5.loadProperties("props.json");
  
}


void draw(){
  
  background(127);
  
  fill(myColor);
  noStroke();
  ellipse( width/2, height/2, suwak*2, suwak*2 );
  
}

void keyPressed(){
  
  if( key == 's' ){
    cp5.saveProperties("props.json");
  }
  
  if( key == 'v' ){
    if( cp5.isVisible()){
      cp5.hide();
    }else{
      cp5.show(); 
    }
  }
  
}
