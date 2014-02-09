int sWidth = 1920;
int sHeight = sWidth/2;

float angleX, angleY, angleZ;

void setup()
{
  size(sWidth, sHeight, P3D);
  smooth(8);
}

void draw()
{
  background(255);

  pushMatrix();
  translate(width/2, height/2, -100);
  
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  
  drawAxis(100);
  noFill();
  box(200);
  popMatrix();
  
  angleX += 0.01;
  angleY += 0.01;
  angleZ += 0.01;
  
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

