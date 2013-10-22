
void setup()
{
  size(500, 200, P2D);
  smooth(8);
}

void draw()
{
  background(255);

  for (int i=0; i<width; i+=40)
  {

      ellipse(i+15, height/2, 30, 30);

  }
}

