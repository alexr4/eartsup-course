Balle[] maBalle;
int nbBalle;

void setup()
{
  size(200, 200, JAVA2D);
  smooth();
  nbBalle = 100;
  maBalle = new Balle[nbBalle];
  for(int i = 0; i < maBalle.length; i++)
  {
    maBalle[i] = new Balle();
  }
}

void draw()
{
  background(255);
  for(int i = 0; i < maBalle.length; i++)
  {
    maBalle[i].display();
  }
}
