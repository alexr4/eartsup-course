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
  int lifeTime;
  float alpha;
  Timer monTimer;


  //constructeur
  Point(float r_, float a_, float margeX_, float margeY_, int lifeTime_)
  {
    radius = r_;
    theta = a_;
    margeX = margeX_;
    margeY = margeY_;
    
    x = cos(theta)*radius+margeX;
    y = sin(theta)*radius+margeY;

    vRadius = 4;
    taille = 5;
    vie = true;
    exploded = false;
    lifeTime = lifeTime_;
    alpha = 255;

    monTimer = new Timer(lifeTime);
    monTimer.start();
  }

  //methodes
  void run()
  {
    updateRadius();
    //displayPoint();
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
      radius += vRadius;
      x = cos(theta)*radius+margeX;
      y = sin(theta)*radius+margeY;
    }
  }

  void displayPoint()
  {
    noStroke();
    fill(255, alpha);
    ellipse(x, y, taille, taille);
  }
  
  void displayLine()
  {
    noFill();
    stroke(255, alpha);
    line(x, y, margeX, margeY);
  }
}

