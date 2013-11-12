float c1=255;
float c2=255;
float c3=255;
 
void setup()
{
  size(500, 500, P2D);
}
 
void draw()
{
  background(255);
  ellipseMode(CORNER);
  fill(c1);
  ellipse(0, 0, 50, 50);
  fill(c2);  
  ellipse(0, 50, 50, 50);
  fill(c3);
  ellipse(0, 100, 50, 50);
}
 
void keyReleased()
{
  if (key == 'a')
  {
    c1 = 0;
    c2 = 255;
    c3 = 255;
  }  
  if (key == 'z')
  {
    c2 = 0;
    c1 = 255;
    c3 = 255;
  }  
  if (key == 'e')
  {
    c3 = 0;
    c1 = 255;
    c2 = 255;
  }
}
