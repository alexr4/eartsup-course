String monTexte = "Hello World, welcome on board";
int indexMonTexte;

void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  indexMonTexte = monTexte.indexOf("b");


  textAlign(CENTER);
  text(monTexte, width/2, height/2);
  text(indexMonTexte+" : la lettre b est la "+indexMonTexte+"eme lettre de prenom", width/2, height/2+30);
}



