float ratio = 16.0/9.0;
int pWidth = 800;
int pHeight = int(pWidth/ratio);

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
  
  nbCube = 6;
  cubeWidth = new float[nbCube];
  cubeHeight = new float[nbCube];
  cubeDepth = new float[nbCube];
  cubeRotateX = new float[nbCube];
  cubeRotateY = new float[nbCube];
  cubeRotateZ = new float[nbCube];
  hue = new float[nbCube];
  
  initCube();
}

void draw()
{
  background(0);
  drawAxis(100);
  
  pushMatrix();
  translate(width/2, height/2);
  
  for(int i=0; i<nbCube; i++)
  {
    float angleX = cubeRotateX[i];
    float angleY = cubeRotateY[i];
    float angleZ = cubeRotateZ[i];
    
    float cWidth = cubeWidth[i];
    float cHeight = cubeHeight[i];
    float cDepth = cubeDepth[i];
    
    float cHue = hue[i];
    
    noStroke();
    fill(cHue, 100, 100);
    
    rotateX(angleX);
    rotateY(angleY);
    rotateZ(angleZ);
    
    box(cWidth, cHeight, cDepth);
  }
  popMatrix();
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

void initCube()
{
  for(int i=0; i<nbCube; i++)
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

void mousePressed()
{
  initCube();
}
