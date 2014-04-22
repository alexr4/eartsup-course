class Walker
{
  PVector location; //position
  PVector velocity; //direction - vitesse
  PVector acceleration; // acceleration de l'objet


  float limite;
  float taille;
  float masse;
  float attractorField;

  Walker()
  {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.0, 0);
    masse = random(5);
    taille =  masse*10;
  }

  void walk()
  {
  checkEdge();
  
    velocity.add( acceleration);
    location.add( velocity);
    acceleration.mult(0);
  }

  void checkEdge()
  {

    if ( location.x > width-(taille/2)) {
      location.x = width-(taille/2);
      velocity.x *= -1;
    } 
    else if ( location.x < taille/2) {
      velocity.x *= -1;
      location.x = taille;
    }


    if ( location.y > height-(taille/2)) {
      velocity.y *= -1;
      location.y = height-(taille/2);
    }
  }

  void applyForce(PVector _f)
  {
    PVector force = PVector.div(_f, masse);
    acceleration.add(force);
  }


  void display()
  {
    stroke(0);
    fill(127);
    ellipse(location.x, location.y, taille, taille);
  }
}

