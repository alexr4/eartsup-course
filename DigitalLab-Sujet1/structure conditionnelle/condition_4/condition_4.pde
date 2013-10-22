
void setup()
{
  size(500, 200, P2D);
  smooth(8);
}

void draw()
{
  background(255);


  for (int i=0; i<width; i++)
  {
    int pattern = i%3;
    switch (pattern)
    {
    case 0:
      fill(255, 0, 0);
      break;
    case 1:
      fill(0, 255, 0);
      break;
    case 2:
      fill(0, 0, 255);
      break;
    }
    ellipse(i*40, height/2, 30, 30);
  }
}

