import processing.serial.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Serial myPort;  // Create object from Serial class
String val;

int linefeed = 10;
int numSensors = 2;
int value1;
int value2;

Minim minim; // Audio call
AudioSample xy_c;//player can be anything: "sound1"
AudioSample xy_f;
AudioSample xy_d1;
AudioSample xy_g;
AudioSample xy_a;

void setup() 
{
  size(400, 400, P3D); //my window is this size
  surface.setResizable(true); //makes screen dimensions adjustable
  myPort = new Serial(this, "COM6", 9600); //run dat stuff at 9600
  myPort.bufferUntil (linefeed);
  minim = new Minim(this);
  xy_c = minim.loadSample("xy_c.wav" ); //player again can be sound 1 / ,512 is a buffer
  xy_f = minim.loadSample("xy_f.wav"); //player again can be sound 1 / ,512 is a buffer
  xy_d1 = minim.loadSample("xy_d1.wav"); //player again can be sound 1 / ,512 is a buffer
  xy_g = minim.loadSample("xy_g.wav"); //player again can be sound 1 / ,512 is a buffer
  xy_a = minim.loadSample("xy_a.wav"); //player again can be sound 1 / ,512 is a buffer
}
void draw() {
  background (255, 204, 0); 
  fill(255);
  stroke(255);
  if ( myPort.available() > 0) 
  {  // If data is available,
    val = myPort.readStringUntil(','); // read it and store it in val
    if (val!=null) {
      println(val);
      if (val.equals("1,")) {
        //println("BLUE");
        xy_c.trigger();
        //delay(1);
      }
      if (val.equals("2,")) {
        //println("YELLOW");
        xy_d1.trigger();
        //delay(1);
      }
      if (val.equals("3,")) {
        println("YELLOW");
        xy_f.trigger();
        //delay(1);
      }
        if (val.equals("4,")) {
          //println("YELLOW");
          xy_g.trigger();
          //delay(1);
        }
        if (val.equals("5,")) {
          //println("YELLOW");
          xy_a.trigger();
          //println("hi");
          //delay(1);
        }
      
    }
  }
}
/*
void serialEvent(Serial myPort) { 
 // read the serial buffer:
 String myString = myPort.readStringUntil(linefeed);
 if (myString != null) 
 {
 // remove the linefeed
 myString = trim(myString);
 
 if (myString.length() > 0) {
 int numSensors[] = int(split(myString, ','));
 value1 = (numSensors[0]);
 value2 = (numSensors[1]);
 println("value1 " + value1 + ", value2 " + value2);
 }
 }
 }
 */
