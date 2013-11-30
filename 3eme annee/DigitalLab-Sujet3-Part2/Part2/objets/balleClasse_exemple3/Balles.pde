class Balle
{
  //variables globales
  float x; //position x de la balle
  float y; //position y de la balle
  float vx; //vitesse x de la balle
  float vy; //vitesse y de la balle
  float t; // taille de la balle

  //Mon constructeur, celui doit toujours avoir le même nom que la class afin d'être reconnu comme un constructeur.
  Balle(float x_, float y_)
  {
    //initialisation des variables.
    t = random(5, 10);
    x = x_;
    y = y_;
    vx = random(-3, 3);
    vy = random(-3, 3);
  }

  void display()
  {
    //mise à jour des variables
    x += vx;
    y += vy;

    //detection des murs
    if (x <= 0 || x >= width)
    {
      vx = -vx;
    }
    if (y <= 0 || y >= height)
    {
      vy = -vy;
    }
    fill(255);
    stroke(0);
    ellipse(x, y, t*2, t*2);
  }
}

