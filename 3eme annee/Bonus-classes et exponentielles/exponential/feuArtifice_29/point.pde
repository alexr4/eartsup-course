class Point
{
  //variables
  float x;
  float y;
  float z;
  float theta;
  float phi;
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
  
  float ox, oy, oz;


  //constructeur
  Point(float r_, float a_, float b_, float margeX_, float margeY_, float generation_, float limite_, float ox_, float oy_, float oz_)
  {
    radius = r_;
     limite = limite_;
    theta = a_;
    phi = b_;
    margeX = margeX_;
    margeY = margeY_;

    x = cos(phi)*cos(theta)*radius;
    y =  cos(phi)*sin(theta)*radius;
    z = sin(phi)*radius;

    vRadius = 4;
    taille = 4;
    vie = true;
    exploded = false;
    generation = generation_;
    alpha = map(generation, 0, limiteCycle, 255, 0);
   
    ox = ox_;
    oy = oy_;
    oz = oz_;

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
      x = cos(phi)*cos(theta)*radius;
    y =  cos(phi)*sin(theta)*radius;
    z = sin(phi)*radius;
    }
  }

  void displayPoint()
  {
    /*noStroke();
    fill(255, 255);
    ellipse(x, y, taille, taille);*/
    pushStyle();
    strokeWeight(5);
    stroke(255);
    point(x, y, z);
    popStyle();
  }

  void displayLine()
  {
    noFill();
    stroke(255, 30);
    line(ox, oy, oz, x, y, z);
  }
}

