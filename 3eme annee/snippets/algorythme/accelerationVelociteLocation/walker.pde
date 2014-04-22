class Walker
{
  PVector location; //position
  PVector velocity; //direction - vitesse
  PVector acceleration; // acceleration de lrobjet
  float sMax;

  Walker()
  {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.1, 0);
    sMax = 6;
  }

  void walk()
  {
    velocity.add(acceleration);
    velocity.limit(sMax); // limit() permet de limiter l 'incrementation d'un vecteur à une constante
    location.add(velocity); //ce qui revient à remplacer   x =  x+ vx et  y =  y+ vy;


    if (location.x>width)// || location.x<0)
    {
      location.x = 0;
    }
    if (location.y>height)// || location.y<0)
    {
      location.y = 0;
    }
  }

  void display()
  {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 20, 20);
  }
}

