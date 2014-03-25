float ratio = 16.0/9.0;
int pWidth = 800;
int pHeight = int(pWidth/ratio);

//3D parameters
float eyeX, eyeY, eyeZ, lookAtX, lookAtY, lookAtZ, upX, upY, upZ;

//lights
float lightX, lightY, lightZ;
float angleLight, radiusLight, speedLight;

//design
int nbSphere;
float[] sphereX;
float[] sphereY;
float[] sphereZ;
float[] sphereRadius;
float[] sphereDetails;
float[] sphereRotateX;
float[] sphereRotateY;
float[] sphereRotateZ;
float[] hue;


void setup()
{
  size(pWidth, pHeight, P3D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);

  nbSphere = 10;
  sphereX = new float[nbSphere];
  sphereY = new float[nbSphere];
  sphereZ = new float[nbSphere];
  sphereRotateX = new float[nbSphere];
  sphereRotateY = new float[nbSphere];
  sphereRotateZ = new float[nbSphere];
  sphereRadius = new float[nbSphere];
  sphereDetails = new float[nbSphere];
  hue = new float[nbSphere];

  initCube();
  initCamera();
  initLight();
}

void draw()
{
  background(0);

  camera(eyeX, eyeY, eyeZ, lookAtX, lookAtY, lookAtZ, upX, upY, upZ);

 lightSpecular(0, 0, 100);
ambientLight(160, 10, 10, lightX, lightY, lightZ);
  pointLight(160, 100, 100, lightX, lightY, lightZ);
  

  moveLight();
  drawLight();





  drawAxis(100);

  for (int i=0; i<nbSphere; i++)
  {
    float angleX = sphereRotateX[i];
    float angleY = sphereRotateY[i];
    float angleZ = sphereRotateZ[i];

    float x = sphereX[i];
    float y = sphereY[i];
    float z = sphereZ[i];

    float radius = sphereRadius[i];
    float detail =  sphereDetails[i];

    float cHue = hue[i];

    stroke(0, 0, 100, 25);
    fill(cHue, 0, 50);

    translate(x, y, z);

    rotateX(angleX);
    rotateY(angleY);
    rotateZ(angleZ);
    noStroke();

    specular(200, 50, 50);
    ambient(0, 100, 100);
    emissive(300, 100, 20);
    shininess(random(250));

    sphereDetail(int(detail));
    sphere(radius);
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
  for (int i=0; i<nbSphere; i++)
  {
    sphereX[i] = random(-40, 40);
    sphereY[i] = random(-40, 40);
    sphereZ[i] = random(-40, 40);
    sphereRotateX[i] = random(0, TWO_PI);
    sphereRotateY[i] = random(0, TWO_PI);
    sphereRotateZ[i] = random(0, TWO_PI);
    sphereRadius[i] = random(5, 30);
    sphereDetails[i] =  random(5, 20);
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

void initLight()
{
  angleLight = 0;
  radiusLight = 100;
  speedLight = 0.01;

  lightX = cos(angleLight)*radiusLight;
  lightY = 0;
  lightZ = sin(angleLight)*radiusLight;
}

void moveLight()
{
  angleLight += speedLight;

  if (angleLight > TWO_PI || angleLight < 0)
  {
    speedLight *=-1;
  }

  lightX = cos(angleLight)*radiusLight;
  lightY = 0;
  lightZ = sin(angleLight)*radiusLight;
}

void drawLight()
{
  pushStyle();
  strokeWeight(10);
  stroke(0, 0, 100);
  noFill();
  point(lightX, lightY, lightZ);
  popStyle();
}


void mousePressed()
{
  initCube();
}

void keyPressed()
{
}

