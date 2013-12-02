class Point
{
  //variables
  float x;
  float y;
  float taille;
  float rgb;
  
  Point(float x_, float y_)
  {
    x = x_;
    y = y_;
    taille = 5;
    rgb = 0;
  }
  
  void run()
  {
    display();
  }
  
  void display()
  {
    fill(127);
    noStroke();
    ellipse(x, y, taille, taille);
  }
}
