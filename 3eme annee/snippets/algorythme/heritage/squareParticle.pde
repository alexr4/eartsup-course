class squareParticle extends Particle
{
  color c;
  
  squareParticle(PVector l)
  {   
    super(l);
    
    c = color(random(160, 220), random(40, 100), random(40, 100));
  }
  
  void display()
  {
    noStroke();
    fill(c, lifeSpan);
    rectMode(CENTER);
    pushMatrix();   
    translate(location.x, location.y);
    rotate(a);
    rect(0, 0, taille, taille);
    popMatrix();
  }
}
