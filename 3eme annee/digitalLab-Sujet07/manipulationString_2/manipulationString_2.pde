String mot = "Hello World, welwome on board";
String subst;

void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  subst = mot.substring(6, 11);


  textAlign(CENTER);
  text(mot, width/2, height/2);
  text(subst+" : est l'extrait du caractère 6 à 11 de la variable mot", width/2, height/2+30);
}



