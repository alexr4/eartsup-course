class ellipseParticle extends Particle
{
  color c;
  
  ellipseParticle(PVector l)
  {  
    super(l);
    
    c = color(random(100, 160), random(40, 100), random(40, 100));
  }
  
  void display()
  {
    noStroke();
    fill(c, lifeSpan);
    ellipseMode(CENTER);
    pushMatrix();   
    translate(location.x, location.y);
    rotate(a);
    ellipse(0, 0, taille, taille);
    popMatrix();
  }
}
