
void setup()
{
  size(500, 200, P2D);
  smooth(8);
}

void draw()
{
  background(255);
  fill(255);
  
  for(int i=0; i<width; i+=40)
  {
    if(i > width/3*2)
    {
      fill(0,0,255);
    }
    else if(i > width/3)
    {
      fill(0,255,0);
    }
    else
    {
      fill(255,0,0);
    }
    ellipse(i+15, height/2, 30, 30);
  }
}

