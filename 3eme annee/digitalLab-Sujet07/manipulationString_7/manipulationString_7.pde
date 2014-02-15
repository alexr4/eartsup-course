String nombre;
int nb = 1234567890;

void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  nombre = str(nb);


  textAlign(CENTER);
  text(nombre, width/2, height/2);
    
    
}



