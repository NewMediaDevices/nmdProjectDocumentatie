// import oscP5 library
import netP5.*;
import oscP5.*;


//variables
OscP5 oscP5;
NetAddress myRemoteLocation;
int a=1800; 
float s=100; 
float x, y;

void setup() {
  size(500, 500); // screen size
  
  oscP5 = new OscP5(this, 3334);
  myRemoteLocation = new NetAddress("127.0.0.1", 3333);
  //make a call to API to get a string right from the start
}


void draw() {
  background(0); // draw black background
  
  // when "f" is pressed ...
  if (keyPressed) { 
    if (key == 'f' || key == 'F') { 
      for (int i=0; i<=0.5*a; i++) {
        stroke(random(0, 1775)); // give line a random color (grayscale) 
        strokeWeight(random(1, 4)); // give line a random weight between 1 and 4
        x = random(0, a); // give random X position
        y = random(0, a); // gove random Y position
        line(x, y, x+random(0, s), y); // draw line with random values
      }
    }
  }
}

// if "f" key is pressed send a message "glitch is true" to OSC client
void keyPressed() {
  if (key == 'f' || key == 'F') {
    OscMessage myMessage = new OscMessage("/MakeyMakeyGlitch/GlitchActive");
    myMessage.add("Glitch is true");
    oscP5.send(myMessage, myRemoteLocation);
  }
}

// if "f" key is released send a message "glitch is false" to OSC client
void keyReleased() {
  if (key == 'f' || key == 'F') {
    OscMessage myMessage = new OscMessage("/MakeyMakeyGlitch/GlitchActive");
    myMessage.add("Glitch is false");
    oscP5.send(myMessage, myRemoteLocation);
  }
}