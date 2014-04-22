//PVector : Premier moteur physique

Walker myWalker;

void setup()
{
  size(500, 500, JAVA2D);
  smooth();
  myWalker = new Walker();
}

void draw()
{
  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);
  myWalker.walk();
  myWalker.display();
}

