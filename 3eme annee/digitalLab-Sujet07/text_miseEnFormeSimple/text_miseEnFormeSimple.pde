String monTexte = "Hello World!";

void setup()
{
  size(700, 250, P2D);
  smooth();
}

void draw()
{
  background(255);
  
  fill(0);
  textSize(23);
  text(monTexte, 20, height/2);
}
