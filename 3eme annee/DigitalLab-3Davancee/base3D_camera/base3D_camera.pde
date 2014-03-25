float ratio = 16.0/9.0;
int pWidth = 800;
int pHeight = int(pWidth/ratio);

//3D parameters
float eyeX, eyeY, eyeZ, lookAtX, lookAtY, lookAtZ, upX, upY, upZ;


//design
int nbCube;
float[] cubeWidth;
float[] cubeHeight;
float[] cubeDepth;
float[] cubeRotateX;
float[] cubeRotateY;
float[] cubeRotateZ;
float[] hue;


void setup()
{
  size(pWidth, pHeight, P3D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);

  nbCube = 10;
  cubeWidth = new float[nbCube];
  cubeHeight = new float[nbCube];
  cubeDepth = new float[nbCube];
  cubeRotateX = new float[nbCube];
  cubeRotateY = new float[nbCube];
  cubeRotateZ = new float[nbCube];
  hue = new float[nbCube];

  initCube();
  initCamera();
}

void draw()
{
  background(0);

  camera(eyeX, eyeY, eyeZ, lookAtX, lookAtY, lookAtZ, upX, upY, upZ);



  drawAxis(100);

  for (int i=0; i<nbCube; i++)
  {
    float angleX = cubeRotateX[i];
    float angleY = cubeRotateY[i];
    float angleZ = cubeRotateZ[i];

    float cWidth = cubeWidth[i];
    float cHeight = cubeHeight[i];
    float cDepth = cubeDepth[i];

    float cHue = hue[i];

    stroke(0,0,100);
    fill(cHue, 100, 100);

    rotateX(angleX);
    rotateY(angleY);
    rotateZ(angleZ);

    box(cWidth, cHeight, cDepth);
  }
 
}


void drawAxis(float l)
{
  pushStyle();
  strokeWeight(1);
  //x-axis
  stroke(0, 100, 100); 
  line(0, 0, 0, l, 0, 0);
  //y-axis
  stroke(160, 100, 100); 
  line(0, 0, 0, 0, l, 0);
  //z-axis
  stroke(230, 100, 100); 
  line(0, 0, 0, 0, 0, l);

  popStyle();
}

void initCube()
{
  for (int i=0; i<nbCube; i++)
  {
    cubeWidth[i] = random(40, 100);
    cubeHeight[i] = random(40, 100);
    cubeDepth[i] = random(40, 100);
    cubeRotateX[i] = random(0, TWO_PI);
    cubeRotateY[i] = random(0, TWO_PI);
    cubeRotateZ[i] = random(0, TWO_PI);
    hue[i] = random(160, 260);
  }
}

void initCamera()
{
  eyeX = 0;
  eyeY = 0;
  eyeZ = 200;
 
  lookAtX = 0;
  lookAtY = 0; 
  lookAtZ = 0;
 
  upX = 0;
  upY = 1; 
  upZ = 0;
}


void mousePressed()
{
  initCube();
}

void keyPressed()
{

}

