
void setup()
{
  size(500, 200, P2D);
  smooth(8);
}

void draw()
{
  background(255);
  
  noFill();
  stroke(0);
  for (int i=0; i<width; i+=40)
  {
    for (int j=0; j<height; j+=40)
    {
      ellipse(i+15, j+15, 30, 30);
    }
  }
}

