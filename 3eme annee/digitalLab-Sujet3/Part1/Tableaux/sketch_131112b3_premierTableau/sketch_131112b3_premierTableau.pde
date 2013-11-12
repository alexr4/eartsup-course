float[] couleur;
int nbEllipse;
char[] touche = {
  'a', 'z', 'e'
};

void setup()
{
  size(500, 500, P2D);

  nbEllipse = 3;
  couleur = new float[nbEllipse];

  for (int i = 0; i<couleur.length; i++)
  {
    couleur[i] = 255;
  }
}

void draw()
{
  background(255);

  for (int i = 0; i<couleur.length; i++)
  {
    float taille = 50;
    float y = i*taille;

    fill(couleur[i]);
    stroke(0);
    ellipse(taille/2, y+taille/2, taille, taille);
  }
}

void keyReleased()
{
  for (int i = 0; i<touche.length; i++)
  {
    if (key == touche[i])
    {
      couleur[i] = 0;
    }
    else
    {
      couleur[i] = 255;
    }
  }
}

