Prism prism;
PImage dot;

void setup()
{
  size(1024, 720);

  // Load a sample image
  dot = loadImage("dot.png");

  // Connect to the local instance of fcserver
  prism = new Prism(this, "127.0.0.1", 7890);

  // Map an 8x8 grid of LEDs to the center of the window
  prism.ledGrid8x8(0, width/2, height/2, height / 12.0, 0, false);
}

void draw()
{
  background(0);

  // Draw the image, centered at the mouse location
  float dotSize = height * 0.7;
  image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
}