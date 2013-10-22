int r;
int res;

void setup()
{
  size(500, 200, P2D);
  smooth(8);
  
  r = 15;
  res = 10;
}

void draw()
{
  background(255);
  
  //noFill();
 
  for (int i=0; i<width; i+=res)
  {
    for (int j=0; j<height; j+=res)
    {
      color c = color(random(255), 0, random(255));
      noStroke();
      fill(c);
      ellipse(i+r/2, j+r/2, r*2, r*2);
    }
  }
 
}

void mousePressed()
{
  r = int(random(5, 30));
  res = int(random(5, 50));
}

void keyPressed()
{
  if(key == ' ')
  {
    saveFrame("example_#####.tif");
  }
}
