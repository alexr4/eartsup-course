import peasy.*;
PeasyCam cam;

int pWidth = 1000;
int pHeight = 500;

int maxAngle;
int resAngle;
int gridWidth;
int gridDepth;
int resX;
int resD;
int cols, rows;
PVector[][] vertices;
float[][] radius;

float xInc, xOff, yInc, yOff, zInc, zOff;

void setup()
{
  size(pWidth, pHeight, P3D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);

  //defineGrid
  maxAngle = 360;
  resAngle = 5;
  gridWidth = pWidth;
  gridDepth = pWidth;
  resX = 10;
  resD = 40;
  xOff = 0.4;
  yOff = 0.4;
  zOff = 0.5;


  rows = maxAngle/resAngle;
  cols = gridDepth/resD;

  vertices = new PVector[cols][rows];
  radius = new float[cols][rows];

  for (int i = 0; i<gridDepth/resD; i++)
  {
    float z = (resD*i)*-1;
    float incSpiral = map(i, 0, gridDepth/resD-1, 0, PI);

    float noiseR = map(noise(xInc, zInc), 0, 1, -50, 50);

    for (int j = 0; j<maxAngle/resAngle; j++)
    {
      float phi = incSpiral+map(j, 0, (maxAngle/resAngle)-1, 0, TWO_PI);

      float noise;

      if (j == 0 || j == maxAngle/resAngle-1)
      {
        noise = map(noise(xInc, 0, zInc), 0, 1, 0, 40);
      }
      else
      {
        noise = map(noise(xInc, yInc, zInc), 0, 1, 0, 40);
      }

      radius[i][j] = 100+noise;

      float x = noiseR+cos(phi)*radius[i][j];
      float y = noiseR+sin(phi)*radius[i][j];

      PVector loc = new PVector(x, y, z);

      vertices[i][j] = loc;

      yInc += yOff;
    }
    xInc += xOff;
    zInc += zOff;
  }


  //Peasy
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1000);
}

void draw()
{
  background(0, 0, 100);
  //axes(100);
  //world(width);

  //Spherical grid
  beginShape(QUAD_STRIP);
  for (int i =0; i<cols-1; i++)
  {
    for (int j=0; j<rows-1; j++)
    {
      PVector v0 = vertices[i][j];
      PVector v1 = vertices[i][j+1];
      PVector v2 = vertices[i+1][j];
      PVector v3 = vertices[i+1][j+1];

      float r = radius[i][j];

      float h = 0;
      float s = 0;
      float b = map(v0.z, -pWidth, 0, 0, 100);

    
      float alpha = 10;

      stroke(255, alpha);
      strokeWeight(1);
      noStroke();
      //noFill();
      fill(h,s,b);
      vertex(v0.x, v0.y, v0.z);
      
      vertex(v1.x, v1.y, v1.z);
      
      vertex(v2.x, v2.y, v2.z);
      
      vertex(v3.x, v3.y, v3.z);
    }
  }

  endShape(CLOSE);
}

void axes(int taille)
{
  pushStyle();
  stroke(255, 0, 0);
  line(0, 0, 0, taille, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, taille, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, taille);
  popStyle();
}

void world(int taille)
{
  pushStyle();
  stroke(127);
  noFill();
  box(taille);
  popStyle();
}

