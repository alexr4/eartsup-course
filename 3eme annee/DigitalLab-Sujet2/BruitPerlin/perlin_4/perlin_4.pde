float x;
float xInc;

void setup()
{
  size(200, 200, P2D);
}

void draw() {
  background(255);

  x = noise(xInc);
  x = map(x, 0, 1, 0, 100);
  xInc+= 0.01;
  
  println("x = "+x);
}

