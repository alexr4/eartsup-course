class BouncingClassic
{
  //variables
  float x, y;
  float vx, vy;
  float taille;
  
  BouncingClassic()
  {
    x = width/2;
    y = height/2;
    
    vx = random(-3, 3);
    vy = random(-3, 3);
    
    taille = 50;
  }
  
  void run()
  {
    update();
    checkEdge();
    display();
  }
  
  void update()
  {
    x += vx;
    y += vy;
  }
  
  void checkEdge()
  {
    if(x < 0 || x > width)
    {
      vx = -vx;
    }
    if(y < 0 || y > height)
    {
      vy = -vy;
    }
  }
  
  void display()
  {
    stroke(0);
    fill(127);
    ellipse(x, y, taille, taille);
    fill(0);
    text("bc", x, y);
  }
}
