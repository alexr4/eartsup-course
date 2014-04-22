class BouncingVector
{
  //variables
  PVector location, velocity;
  float taille;

  BouncingVector()
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-3, 3), random(-3, 3));
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
    location.add(velocity);
  }

  void checkEdge()
  {

    if (location.x < 0 || location.x > width)
    {
      velocity.x *= -1;
    }
    if (location.y < 0 || location.y > height)
    {
      velocity.y *= -1;
    }
  }

  void display()
  {
    stroke(0);
    fill(127);
    ellipse(location.x, location.y, taille, taille);
    fill(0);
    text("bv", location.x, location.y);
  }
}

