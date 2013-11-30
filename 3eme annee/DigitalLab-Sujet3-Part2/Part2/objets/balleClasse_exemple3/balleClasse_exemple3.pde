ArrayList<Balle> maBalle;
int nbBalle;

void setup()
{
  size(400, 200, JAVA2D);
  smooth();
  nbBalle = 10;
  maBalle = new ArrayList<Balle>();
  for (int i=0; i<nbBalle; i++)
  {
    maBalle.add(new Balle(random(width), random(height)));
  }
}

void draw()
{
  background(255);
  
  if(mousePressed)
  {
     maBalle.add(new Balle(mouseX, mouseY));
  }
  
  if(maBalle.size() >= 30)
    {
      maBalle.remove(0);
    }
  
  for(int i = 0; i < maBalle.size(); i++)
  {
    Balle b = maBalle.get(i);
    b.display();
  }
}
