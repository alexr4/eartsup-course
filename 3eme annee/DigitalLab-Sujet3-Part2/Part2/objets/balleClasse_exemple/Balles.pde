class Balle
{
  //variables globales
  float x; //position x de la balle
  float y; //position y de la balle
  float vx; //vitesse x de la balle
  float vy; //vitesse y de la balle
  float t; // taille de la balle

  //Mon constructeur, celui doit toujours avoir le même nom que la class afin d'être reconnu comme un constructeur.
  Balle()
  {
    //initialisation des variables.
    t = random(5, 10);
    x = random(t, width-t);
    y = random(t, height-t);
    vx = random(-3, 3);
    vy = random(-3, 3);
  }

  void display()
  {
    //mise à jour des variables
    x += vx;
    y += vy;

    //detection des murs
    if (x <= t || x >= width-t)
    {
      vx = -vx;
    }
    if (y <= t || y >= height-t)
    {
      vy = -vy;
    }
    fill(255);
    stroke(0);
    ellipse(x, y, t*2, t*2);
  }
}

