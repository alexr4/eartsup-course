import processing.opengl.*;

object3D obj;
PImage tex;

void setup()
{
  size(600,600, OPENGL);
  tex = loadImage("berlin-1.jpg");
  obj = new object3D(100);
}

void draw()
{
  background(255);
  translate(width/2, height/2);
  mouseMoved();
  obj.draw3D();
  obj.debug();
}

void mouseMoved()
{
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
}
