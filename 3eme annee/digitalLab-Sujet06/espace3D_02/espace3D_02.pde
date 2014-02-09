float angleX, angleY, angleZ;

void setup()
{
  size(700, 350, P3D);
  smooth();
}

void draw()
{
  background(255);
  rectMode(CENTER);
  fill(127);
  stroke(0);
  
  pushMatrix();
  translate(width/2, height/2, -100);
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  
  rect(0,0, 100, 100);
  popMatrix();
  
  angleX += 0.01;
  angleY += 0.02;
  angleZ += 0.03;
}
