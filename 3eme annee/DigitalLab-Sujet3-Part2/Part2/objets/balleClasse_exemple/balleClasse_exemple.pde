Balle maBalle;

void setup()
{
  size(400, 200, JAVA2D);
  smooth();
  maBalle = new Balle();
}

void draw()
{
  background(255);
  maBalle.display();
}
