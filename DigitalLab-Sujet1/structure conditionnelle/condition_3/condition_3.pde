
void setup()
{
  size(500, 200, P2D);
  smooth(8);
}

void draw()
{
  background(255);
  
  
   for(int i=0; i<width; i++)
  {
    if(mouseY > height/2 || i%2 ==0)
    {
      fill(0,0,255);
    }
    else
    {
      fill(255, 0, 0);
    }
    ellipse(i*40, height/2, 30, 30);
  }
}

