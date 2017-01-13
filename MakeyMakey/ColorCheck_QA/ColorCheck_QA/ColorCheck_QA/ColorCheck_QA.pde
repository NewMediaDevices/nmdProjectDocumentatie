// import oscP5 library
import netP5.*;
import oscP5.*;

//variables
OscP5 oscP5;
NetAddress myRemoteLocation;
int value = 0;

void setup(){
size(200,200); // screen size 
 oscP5 = new OscP5(this, 3334);
  myRemoteLocation = new NetAddress("127.0.0.1", 3333);
  //make a call to API to get a string right from the start
}

void drawRect(int x, int y){
  rect(x, y, 50, 50);
}

void draw() {
}

void sendMessage(String message){
  OscMessage myMessage = new OscMessage("/MakeyMakeyKleuren/WelkeKleur");
  myMessage.add(message);
  oscP5.send(myMessage, myRemoteLocation);
}

// when a specific button is pressed, it sends it value to the osc client
//example: when "z" is pressed its send the message "ROOD" to the client
void keyPressed() {
  if (key == 'z' || key == 'Z') {
    sendMessage("ROOD");
    fill(207,9,20);
    drawRect(25, 25); 
  }
  
  if (key == 'q' || key == 'Q') {
    sendMessage("GROEN");
    fill(125,244,66);
    drawRect(25, 75); 
  }
  
  if (key == 's' || key == 'S') {
    sendMessage("BLAUW");
    fill(18,52,226);
    drawRect(25, 125);
  }
  
  if (key == 'd' || key == 'D') {
    sendMessage("ROOS");
    fill(255,0,199);
    drawRect(75, 25);
  }
  
  if (key == 'g' || key == 'G') {
    sendMessage("GEEL");
    fill(255,250,0);
    drawRect(75, 75);
  }
  
  if (key == CODED) {
    if (keyCode == UP){
      sendMessage("APPELBLAUWZEEGROEN");
      fill(13,186,174);
      drawRect(75, 125); 
    }
  }  
}