class PointObject
{
  //variables
  float x;
  float y;
  float z;
  float yMinus;
  float vx;
  float vy;
  float hue;
  float sat;
  float bright;
  float alpha;
  float taille;
  int index;
  
  //constructeur
  PointObject(float x_, float y_, int index_)
  {
    x = x_;
    y = y_;
    z = 100 ;
    yMinus = y;
    index = index_;
    vx = 1;
    vy = 1;
    hue = 0;
    sat = 0;
    bright = 100;
    alpha = 100;
    taille = 10;
  }
  
  void run()
  {
    display();
  }
  
  void updateY()
  {
    y += vy;
  }
  
  void display()
  {
    fill(hue, sat, bright, alpha);
    noStroke();
    ellipse(x, y, taille, taille);
  }
}
