class Walker
{
  PVector location; //position
  PVector velocity; //direction - vitesse
  PVector acceleration; // acceleration de l'objet
  float limite;
  float taille; 
  color c;



  Walker()
  {
     location = new PVector(random(width), random(height));
     velocity = new PVector(0, 0);
     acceleration = new PVector(0.0, 0);
     limite = 2;
     taille = random(1, 5);
     c = color(random(255), random(255), random(255));
  }

  void walk()
  {   
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    mouse.normalize();
    mouse.mult(0.05);
    /* Dans P2.08
     mouse.setMag(0.5);
     */
     acceleration = mouse;

     velocity.add( acceleration);
     location.add( velocity); //ce qui revient à remplacer  x =  x+ vx et  y =  y+ vy;
     velocity.limit( limite);

    //println(" acceleration : "+ acceleration);
    //println(" velocity : "+ velocity);

    if (location.x>width)// || location.x<0)
    {
      location.x = 0;
    }
    if (location.x<0)// || location.x<0)
    {
      location.x = width;
    }
    if (location.y>height)// || location.y<0)
    {
      location.y = 0;
    }
    if (location.y<0)// || location.y<0)
    {
      location.y = height;
    }
  }

  void colorChanging()
  {
     c ++;
  }

  void display()
  {
    colorChanging();
    noStroke();
    fill(c);
    ellipse(location.x, location.y, taille, taille);
  }
}

