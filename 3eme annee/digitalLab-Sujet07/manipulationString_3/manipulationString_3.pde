String monTexte = "Hello World, welcome on board";
int len;

void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  len = monTexte.length();


  textAlign(CENTER);
  text(monTexte, width/2, height/2);
  text(len+" : est la taille de la variable monTexte", width/2, height/2+30);
}



