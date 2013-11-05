float y;
float x;
 
void setup()
{
  size(500, 500, P2D);
  smooth(8);
}
 
void draw()
{
  background(255);
  x= random(0, 500);
  y = random(0, 500);
  ellipse(x, y, 20, 20);
}
