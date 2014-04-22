/* Mesh is not finish, the last points is not in the loop*/

import peasy.*;
PeasyCam cam;

int resAlpha;
int resBeta;
float radius;
float alpha, beta, x, y, z;
int cols, rows;
PVector[][] vertice;


void setup()
{
  size(600, 600, P3D);
  smooth();

  //colorMode(HSB, 360, 100, 100, 100);

  cam = new PeasyCam(this, width/2, height/2, 0, 1500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2000);

  //varibales
  resAlpha = 30;
  resBeta = 30;
  radius = 200;

  cols = resAlpha;//360/resAlpha;
  rows = resBeta;///resBeta;

  println(cols-1);

  vertice = new PVector[cols][rows];

  initSphere();
}

void draw()
{
  background(255);

  //lightsBehavior();
  translate(width/2, height/2);

  drawAxis(100);





  readVerticeArray();

  frame.setTitle(" "+int(frameRate));
}

void initSphere()
{
  for (int i = 0; i<cols; i++)
  {

    for (int j = 0; j<rows; j++)
    { 
      alpha = map(i, 0, cols-1, 0, PI);
      beta = map(j, 0, rows-1, 0, TWO_PI);
      //radius = random(100, 110);

      x = sin(alpha)*cos(beta)*radius;
      y = sin(alpha)*sin(beta)*radius;
      z = cos(alpha)*radius;

      vertice[i][j] = new PVector(x, y, z);
    }
  }
}

void readVerticeArray()
{

  beginShape(QUAD_STRIP);
  for (int i =0; i<cols-1; i++)
  {
    for (int j=0; j<rows-1; j++)
    {
      PVector v0 = vertice[i][j];
      PVector v1 = vertice[i][j+1];
      PVector v2 = vertice[i+1][j];
      PVector v3 = vertice[i+1][j+1];

      float r0 = map(v0.x, -radius, radius, 0, 255);
      float g0 = map(v0.y, -radius, radius, 0, 255);
      float b0 = map(v0.z, -radius, radius, 0, 255);

      float r1 = map(v1.x, -radius, radius, 0, 255);
      float g1 = map(v1.y, -radius, radius, 0, 255);
      float b1 = map(v1.z, -radius, radius, 0, 255);

      float r2 = map(v2.x, -radius, radius, 0, 255);
      float g2 = map(v2.y, -radius, radius, 0, 255);
      float b2 = map(v2.z, -radius, radius, 0, 255);

      float r3 = map(v3.x, -radius, radius, 0, 255);
      float g3 = map(v3.y, -radius, radius, 0, 255);
      float b3 = map(v3.z, -radius, radius, 0, 255);

      float alpha = 255;


      stroke(255, 10);
      strokeWeight(1);
      //noFill();
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

void drawAxis(float l)
{
  pushStyle();
  strokeWeight(1);
  //x-axis
  stroke(255, 0, 0); 
  line(0, 0, 0, l, 0, 0);
  //y-axis
  stroke(0, 255, 0); 
  line(0, 0, 0, 0, l, 0);
  //z-axis
  stroke(0, 0, 255); 
  line(0, 0, 0, 0, 0, l);
  popStyle();
}

void lightsBehavior()
{
  pointLight(0, 255, 160, 0, 0, 100);
  drawLight(0, 255, 160, 0, 0, 100, 10); 

  pointLight(0, 160, 255, 50*30, 50*30, 300);
  drawLight(0, 160, 255, 50*30, 50*30, 300, 10);

  pointLight(0, 0, 100, 50*15, 50*15, 500);
  drawLight(0, 0, 100, 50*15, 50*15, 500, 10);

  pointLight(0, 160, 255, width, 0, -1000);
  drawLight(0, 160, 255, width, height, -1000, 10);
}

void drawLight(int r, int v, int b, float x, float y, float z, int t)
{
  pushStyle();
  stroke(r, v, b);
  strokeWeight(t);
  point(x, y, z);
  popStyle();
}

void keyPressed()
{
  if (key == ' ')
  {
    resAlpha = int(random(1, 10)*10);
    resBeta = int(random(1, 9)*10);


    cols = 360/resAlpha;
    rows = 360/resBeta;

    vertice = new PVector[cols][rows];

    initSphere();
  }
}

