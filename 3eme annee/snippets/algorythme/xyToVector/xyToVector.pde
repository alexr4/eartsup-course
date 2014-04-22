//Bouncing Ball Classique vs Vecteur

BouncingClassic bc;
BouncingVector bv;

void setup()
{
  size(500, 500, JAVA2D);
  smooth();
  
  bc = new BouncingClassic();
  bv = new BouncingVector();
}

void draw()
{
  background(255);
  
  bc.run();
  bv.run();
}

