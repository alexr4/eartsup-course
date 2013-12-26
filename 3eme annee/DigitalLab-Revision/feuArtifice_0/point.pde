class Point
{
  //variables
  float x;
  float y;
  float theta;
  float radius;
  float vRadius;
  boolean vie;
  boolean exploded;
  float taille;
  float margeX;
  float margeY;
  Timer monTimer;


  //constructeur
  Point(float r_, float a_, float margeX_, float margeY_)
  {
    radius = r_;
    theta = a_;
    margeX = margeX_;
    margeY = margeY_;
    
    x = cos(theta)*radius+margeX;
    y = sin(theta)*radius+margeY;

    vRadius = 3;
    taille = 5;
    vie = true;
    exploded = false;


    monTimer = new Timer(500);
    monTimer.start();
  }

  //methodes
  void run()
  {
    updateRadius();
    displayLine();
    displayPoint();
  }

  void updateRadius()
  {
    if (monTimer.isFinished() == true)
    {
      vie = false;
    }
    else
    {
      radius += vRadius;
      x = cos(theta)*radius+margeX;
      y = sin(theta)*radius+margeY;
    }
  }

  void displayPoint()
  {
    noStroke();
    fill(0);
    ellipse(x, y, taille, taille);
  }
  
  void displayLine()
  {
    noFill();
    stroke(127);
    line(x, y, margeX, margeY);
  }
}

