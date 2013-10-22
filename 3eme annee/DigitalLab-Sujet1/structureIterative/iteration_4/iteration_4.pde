int w, h;
int res;

void setup()
{
  size(500, 200, P2D);
  smooth(8);
  
  w = 15;
  h = 15;
  res = 10;
}

void draw()
{
  background(255);
  
  noFill();
 
  for (int i=0; i<width; i+=res)
  {
    for (int j=0; j<height; j+=res)
    {
      color c = color(0, 0, random(255));
      noStroke();
      fill(c);
      rect(i, j, w, h);
    }
  }
}

void mousePressed()
{
  w = int(random(5, 30));
  h = int(random(5, 30));
  res = int(random(5, 50));

}


void keyPressed()
{
  if(key == ' ')
  {
    saveFrame("example_#####.tif");
  }
}
