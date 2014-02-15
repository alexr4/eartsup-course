class Lettre
{
  //variable
  float x;
  float y;
  float z;

  char lettre;

  float hue;
  float sat;
  float bright;
  
  boolean clicked;

  //constructeur
  Lettre(float x_, float y_, float z_)
  {
    x = x_;
    y = y_;
    z = z_;
  }

  //methodes
  void run()
  {
    display();
    changeBehavior();
  }

  void display()
  {
    noStroke();
    fill(hue, sat, bright);
    textAlign(CENTER, CENTER);
    textFont(type);
    text(lettre, x, y, z);
    
    stroke(0, 0, 80);
    line(x, y, 0, x, y, z);
  }

  void defineLetter(char lettre_)
  {
    lettre = lettre_;

    float corresspondanceASCII = int(lettre);
    hue = map(corresspondanceASCII, 65, 122, 130, 230);
    sat = 0;
    bright = 50;
  }
  
  void changeBehavior()
  {
    if(clicked == true)
    {
      
      z = 100;
      sat = 100;
      bright = 100;
    }
    else
    {
      z = 0;
      sat = 0;
      bright = 50;
    }
  }
}

