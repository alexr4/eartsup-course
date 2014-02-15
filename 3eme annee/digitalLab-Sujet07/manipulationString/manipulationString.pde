String mots = "Hello World!";
int position = 4;
char c;

void setup()
{
  size(800, 400, P2D);
  smooth();
}

void draw()
{
  background(0);

  //manipulation de string
  c = mots.charAt(position);


  textAlign(CENTER);
  text(mots, width/2, height/2);
  text("Le caratère numero "+mots+" est : "+c, width/2, height/2+30);
}

void keyPressed()
{
  switch(key) {
  case '0':
    position = 0;
    break;
  case '1':
    position = 1;
    break;
  case '2': 
    position = 2;
    break;
  case '3':
    position = 3; 
    break;
  case '4': 
    position = 4;
    break;
  case '5': 
    position = 5;
    break;
  }
}

