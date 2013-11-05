float x;
float y;
float xInc = 0.0;
float yInc = 0.0;

void setup()
{
  size(500, 500, P2D);
  smooth(4);
}

void draw()
{
  background(255);
  x= noise(xInc);
  y = noise(yInc);
  x = map(x, 0, 1, 0, 500);
  y = map(y, 0, 1, 0, 500);
  xInc += 0.01;
  yInc += 0.02;
  ellipse(x, y, 20, 20);
}
