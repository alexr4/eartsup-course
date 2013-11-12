int[] table = {1, 2, 3};

void setup()
{
  size(500, 500, P2D);
}

void draw()
{
  background(255);
  
  println(table); //pour lire tout le tableau
  println(table[0]); // pour ne lire que l'element 0 du tableau
}
