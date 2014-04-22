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

  //defineGrid
  maxAngle = 360;
  resAngle = 70;//70;
  gridWidth = pWidth;
  gridDepth = pWidth;
  resX = 10;
  resD = 50;
  xOff = 0.1;
  yOff = 0.4;
  zOff = 0.5;


  rows = maxAngle/resAngle;
  cols = gridDepth/resD;

  vertices = new PVector[cols][rows];
  radius = new float[cols][rows];

  for (int i = 0; i<gridDepth/resD; i++)
  {
    float z = 500+(resD*i)*-1;

    float noiseY = map(noise(xInc), 0, 1, -200, 200);
    float noiseX = map(noise(xInc), 0, 1, -200, 200);

    float phiInc = map(i*10, 0, gridDepth/resD*10, 0, PI);

    for (int j = 0; j<maxAngle/resAngle; j++)
    {
      float phi = phiInc+map(j, 0, (maxAngle/resAngle)-1, 0, TWO_PI);

      float noise;

      if (j == 0 || j == maxAngle/resAngle-1)
      {
        noise = map(noise(xInc, 0, zInc), 0, 1, 100, 200);
      }
      else
      {
        noise = map(noise(xInc, yInc, zInc), 0, 1, 100, 200);
      }

      radius[i][j] = 100;//noise;

      float x = cos(phi)*radius[i][j]+noiseX;
      float y = sin(phi)*radius[i][j]+noiseY;

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
  background(255);
  axes(100);
  world(width);

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

      float r0 = map(v0.x, -r, r, 0, 255);
      float g0 = map(v0.y, -r, r, 0, 255);
      float b0 = map(v0.z, -r, r, 0, 255);

      float r1 = map(v1.x, -r, r, 0, 255);
      float g1 = map(v1.y, -r, r, 0, 255);
      float b1 = map(v1.z, -r, r, 0, 255);

      float r2 = map(v2.x, -r, r, 0, 255);
      float g2 = map(v2.y, -r, r, 0, 255);
      float b2 = map(v2.z, -r, r, 0, 255);

      float r3 = map(v3.x, -r, r, 0, 255);
      float g3 = map(v3.y, -r, r, 0, 255);
      float b3 = map(v3.z, -r, r, 0, 255);

      float alpha = 255;


      stroke(255, 20);
      strokeWeight(1);
      fill(r0, g0, b0, alpha);
      vertex(v0.x, v0.y, v0.z);
      fill(r1, g1, b1, alpha);
      vertex(v1.x, v1.y, v1.z);
      fill(r2, g2, b2, alpha);
      vertex(v2.x, v2.y, v2.z);
      fill(r3, g3, b3, alpha);
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

