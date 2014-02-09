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
  float generation;
  float alpha;
  float limite;


  //constructeur
  Point(float r_, float a_, float margeX_, float margeY_, float generation_, float limite_)
  {
    radius = r_;
     limite = limite_;
    theta = a_;
    margeX = margeX_;
    margeY = margeY_;

    x = cos(theta)*radius+margeX;
    y = sin(theta)*radius+margeY;

    vRadius = 4;
    taille = 4;
    vie = true;
    exploded = false;
    generation = generation_;
    alpha = map(generation, 0, limiteCycle, 255, 0);
   


    monTimer = new Timer(500);
    monTimer.start();
    
  }

  //methodes
  void run()
  {
    
    updateRadius();
    displayPoint();
    displayLine();
  }

  void updateRadius()
  {
    if (monTimer.isFinished() == true)
    {
      vie = false;
    }
    else
    {
      if (radius < limite)
      {
        radius += vRadius;
      }
      x = cos(theta)*radius+margeX;
      y = sin(theta)*radius+margeY;
    }
  }

  void displayPoint()
  {
    noStroke();
    fill(255, 255);
    ellipse(x, y, taille, taille);
  }

  void displayLine()
  {
    noFill();
    stroke(255, 30);
    line(x, y, margeX, margeY);
  }
}

