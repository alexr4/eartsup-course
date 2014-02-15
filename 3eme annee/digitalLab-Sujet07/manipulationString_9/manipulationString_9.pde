String[] etudiants = {"Valérie", "Robin", "Mélanie", "Romain", "Arthur", "Thomas", "Sophie", "Vincent", "Joséphine"};
String ensemble;
void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  ensemble = "les étudiants de 4ème années sont : "+join(etudiants, ", ");

  textAlign(CENTER);
  text(ensemble, width/2, height/2);
    
    
}



