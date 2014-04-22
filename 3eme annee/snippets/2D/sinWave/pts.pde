class Points
{
  //variables
  float x;
  float y;

  
  //constructeur
  Points(float x_, float y_)
  {
    x = x_;
    y = y_;
  }
  //methode
  void run()
  {
   
    display();
  }
  
  
  void display()
  {
    pushStyle();
    fill(0);
    noStroke();
    ellipse(x, y, 5, 5);
    popStyle();
  }
}
