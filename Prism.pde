/*
 *  Prism - a simple input processing library for Aurora.
 *  Streams input data out to a serial connection
 *
 *  Eric McNiece, Dec 2015
 *  Limbic Media
 */
 
import java.net.*;
import java.util.Arrays;
import processing.serial.*;

public class Prism //implements Runnable
{
  Thread thread;
  String host;
  int port;
  
  int[] pixelLocations;
  byte[] packetData;
  byte firmwareConfig;
  String colorCorrection;
  boolean enableShowLocations;
  Serial myPort;
 
  Prism(PApplet parent, String host, int port)
  {
    this.host = host;
    this.port = port;
    thread = new Thread(this);
    thread.start();
    this.enableShowLocations = true;
    parent.registerMethod("draw", this);
    myPort = new Serial(parent, Serial.list()[2], 115200);
  }
}