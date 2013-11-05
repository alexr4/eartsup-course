float noise1D, noise2D, noise3D;
float x, y, z;

void setup()
{
  size(200, 200, P2D);
  x = 10;
  y = 20;
  z = 50;
}

void draw() {
  background(255);
  noise1D = noise(x);
  noise2D = noise(x, y);
  noise3D = noise(x, y, z);
  
  x += 0.01;
  y += 0.03;
  z += 0.05;
  
  println("noise1D = "+noise1D);
  println("noise2D = "+noise2D);
  println("noise3D = "+noise3D);
  println("--------------------");
}
