/**
 * Words. 
 * 
 * The text() function is used for writing words to the screen.
 * The letters can be aligned left, center, or right with the 
 * textAlign() function. 
 */
  
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress serverLocation;

  float x = 0.5;//elke frame aanpassen
  float y = -0.1;
  float q = -0.5;
  float z = 0.2;

void setup() {
   oscP5 = new OscP5(this,12000);
   background(0);
   size(1300, 700);
   frameRate(30);
   serverLocation = new NetAddress("127.0.0.1",12000);
   oscP5.send("/waarden",new Object[] {new Float(0.7), new Float(-0.7),new Float(-0.5),new Float(1.0)}, serverLocation);//wat mathias moet verzenden van de occulus rift
  
}

void draw() {
 
 
  fill(255);
  noStroke();
  translate(width/2,height/2);
  int scale=300;
  rect(x*width/2,y*height/2,q*scale,z*scale);
}
void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */  
  if(theOscMessage.checkAddrPattern("/waarden")==true) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      float firstValue = theOscMessage.get(0).floatValue();  // get the first osc argument
      float secondValue = theOscMessage.get(1).floatValue(); // get the second osc argument
      float thirdValue = theOscMessage.get(2).floatValue(); // get the third osc argument
      float fourthValue = theOscMessage.get(3).floatValue(); // get the fourth osc argument
      print("### received an osc message /test with typetag ifs.");
      println(" values: "+firstValue+", "+secondValue+", "+thirdValue+","+fourthValue);
      x = firstValue;
      y = secondValue;
      z = thirdValue;
      q = fourthValue;
      draw();
      return;
    
  }
  println("### received an osc message. with address pattern "+
          theOscMessage.addrPattern()+" typetag "+ theOscMessage.typetag());
}
