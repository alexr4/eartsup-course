//PVector : acceleration en fonction de la souris (attracteur)

Walker[] myWalker;
int nbWalker;

void setup()
{
  size(500, 500, JAVA2D);
  smooth();
  nbWalker = 100;
  myWalker = new Walker[nbWalker];
  for (int i=0; i<nbWalker; i++)
  {
    myWalker[i] = new Walker();
  }
  background(0);
}

void draw()
{
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);

  for (int i=0; i<nbWalker; i++)
  {
    myWalker[i].walk();
    myWalker[i].display();
  }
}

