String prenom = "Alexandre";
String comparaison1 = "Alexandre";
String comparaison2 = "Jean Dujardin";

String resultat1 = "nop pas identique";
String resultat2 = "nop pas identique";

void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  if(prenom == comparaison1)
  {
    resultat1 = "Prenom et comparaison1 sont identique";
  }
  if(prenom == comparaison2)
  {
    resultat2 = "Prenom et comparaison1 sont identique";
  }


  textAlign(CENTER);
  text(prenom, width/2, height/2);
    text(resultat1, width/2, height/2+30);
    text(resultat2, width/2, height/2+60);
}



