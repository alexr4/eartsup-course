int[] table;

void setup()
{
  size(500, 500, P2D);
  
  table = new int[3];
}

void draw()
{
  background(255);


  for (int i=0; i<3; i++) // puis nous définisons chaque element comme un valeur de 255;
  {
    table[i] = i;
  }

  println(table); //pour lire tout le tableau
  println("la variable contenu dans la colonne 0 est : "+table[0]); // pour ne lire que l'element 0 du tableau
  println("la taille de mon tableau est : "+table.length);
}

