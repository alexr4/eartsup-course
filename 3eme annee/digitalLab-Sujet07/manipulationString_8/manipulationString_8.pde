char keyLetter = char(100);
int keyLetterInt = int('Z');

void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  

  textAlign(CENTER);
  text(keyLetter+" est le caractère 100 et Z est le caractère "+keyLetterInt, width/2, height/2);
    
    
}



