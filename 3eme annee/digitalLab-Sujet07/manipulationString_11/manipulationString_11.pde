String phrase = "Hello World!";
char[] car;

void setup()
{
  size(800, 400, P2D);
  smooth();


  car = phrase.toCharArray();

  
  println(car);
}

void draw()
{
  background(0);

  //manipulation de string

  for (int i=0; i<car.length; i++)
  {
    text(car[i], width/2, 20+i*20);
  }
}

