class Particle
{
  PVector location; //position
  PVector velocity; //direction - vitesse
  PVector acceleration; // acceleration de l'objet


  float limite;
  float taille;
  float masse;
  float attractorField;

  float a = 0.0;
  float aVelocity = 0.0;
  float aAcceleration = 0.001;
  
  float lifeSpan;
  
  color c;

  Particle(PVector l)
  {
    reset(l);
  }
  
  void rotation()
  {
    //aAcceleration = acceleration.x/100;//20.0;
    a += aVelocity;
    aVelocity += aAcceleration;
  }

  void walk()
  {
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
    
    lifeSpan -= 2;
  }
  
  void checkEdge()
  {
    if (this.location.x > width-(taille/2)) {
      this.location.x = width-(taille/2);
      this.velocity.x *= -1;
    } 
    else if (this.location.x < taille/2) {
      this.velocity.x *= -1;
      this.location.x = taille;
    }

    if (this.location.y > height-(taille/2)) {
      this.velocity.y *= -1;
      this.location.y = height-(taille/2);
    }
  }

  void applyForce(PVector _f)
  {
    PVector force = PVector.div(_f, masse);
    this.acceleration.add(force);
  }
  
  boolean isDead()
  {
    if(lifeSpan <= 0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void display()
  {
    /*
    noStroke();
    fill(c, lifeSpan);
    rectMode(CENTER);
    pushMatrix();   
    translate(location.x, location.y);
    rotate(a);
    rect(0, 0, taille, taille);
    popMatrix();
    */
  }
  
  void reset(PVector l)
  {
    lifeSpan = 100;
    
    this.velocity = new PVector(random(-1, 1), random(1, 5));
    this.acceleration = new PVector(random(-1, 1), 0.05);
    this.location = new PVector(random(l.x-20, l.x+20), random(l.y-20, l.y+20));
    
    this.masse = random(0.2, 1);
    this.taille = this.masse*10;
    this.a = 0.0;
    
    c = color(random(160, 220), random(40, 100), random(40, 100));
  }
}

