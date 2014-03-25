float ratio = 16.0/9.0;
int pWidth = 800;
int pHeight = int(pWidth/ratio);

//3D parameters
boolean pers;
String persValue;
//perspectuve values
float fov, aspectRatio, zNear, zFar;
//orthogonal value
float left, right, bottom, top, near, far;


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

  nbCube = 1;
  cubeWidth = new float[nbCube];
  cubeHeight = new float[nbCube];
  cubeDepth = new float[nbCube];
  cubeRotateX = new float[nbCube];
  cubeRotateY = new float[nbCube];
  cubeRotateZ = new float[nbCube];
  hue = new float[nbCube];

  initCube();
  initPers();
}

void draw()
{
  background(0);


  pushMatrix();
  translate(width/2, height/2);

  if (!pers)
  {
    persValue = "orthogonal";
    ortho(left, right, bottom, top, near, far);
    //defaultValue
    //ortho();
  }
  else
  {
    persValue = "perspective";
    perspective(fov, aspectRatio, zNear, zFar);
    //defautlValue
    /*
    float camZ = ((height/2.0)/tan(PI*60.0/360.0));
     perspective(PI/3.0, width/height, camZ/10.0, camZ*10.0);
     */
  }



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
  popMatrix();


  println(persValue);
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

void initPers()
{
  fov = random(TWO_PI);
  aspectRatio = ratio;
  zNear = 200;
  zFar = -200;

  left = 0;
  right = width;
  bottom = 0;
  top = height;
  near = 500;
  far = -500;
}

void mousePressed()
{
  initCube();
}

void keyPressed()
{

  pers = !pers;
  initPers();
}

