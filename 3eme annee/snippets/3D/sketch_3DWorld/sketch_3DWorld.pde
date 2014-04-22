/*
FLOWER 3D - a simulation of natural world
 -----------------------------------------
 v.0.001
 
 Design et Developpment by Bonjour, interactive lab.
 */
import peasy.*;

PeasyCam cam;

void setup()
{
  size(800, 800, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  smooth(4);
  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2000);
}

void draw()
{
  background(0, 0, 100);
  showWorld();
  //1-Translate World
  pushMatrix();

  translate(0, height);
  rotateX(radians(180));
  showWorldOrigine(50, 50, width, height);

  popMatrix();
  frame.setTitle(" " + int(frameRate));
}

void showWorld()
{
  pushMatrix();
  translate(width/2, height/2, -height/2);
  noFill();
  stroke(0);
  box(height);
  popMatrix();
}

void showWorldOrigine(int gridSizeX, int gridSizeZ, float width_, float profondeur_)
{
  pushStyle();
  strokeWeight(4);
  //Red Line : X Axis
  stroke(0, 100, 100);
  line(0, 0, 0, 100, 0, 0);

  //Green Line : Y Axis
  stroke(120, 100, 100);
  line(0, 0, 0, 0, 100, 0);

  //Blue Line : Z Axis
  stroke(200, 100, 100);
  line(0, 0, 0, 0, 0, 100);
  popStyle();

  for (int i = 0; i<width_/gridSizeX; i++)
  {
    for (int j = 0; j<profondeur_/gridSizeZ; j++)
    {
      stroke(0);
      float x = i*gridSizeX;
      float y = 0;
      float z = j*gridSizeZ;
      //X lines;
      line(x, 0.0, 0.0, x, 0.0, profondeur_);
      //Z lines;
      line(0.0, 0.0, z, width_, 0.0, z);
    }
  }
}

