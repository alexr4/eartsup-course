class lineParticle extends Particle
{
  color c;
  
  lineParticle(PVector l)
  {   
    super(l);
    
    c = color(random(220, 300), random(40, 100), random(40, 100));
  }
  
  void display()
  {
    noFill();
    stroke(c, lifeSpan);
    strokeWeight(2);
    pushMatrix();   
    translate(location.x, location.y);
    rotate(velocity.heading());
    line(0, 0, velocity.mag()*2, 0);
    popMatrix();
  }
}
