String mots = "Hello World, Welcome on Board";
String bdc;
String CAP;

void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  bdc = mots.toLowerCase();
  CAP = mots.toUpperCase();
  

  textAlign(CENTER);
  text(mots, width/2, height/2);
  text(bdc, width/2, height/2+30);
  text(CAP, width/2, height/2+60);
}



