class particleSystem
{
  //variables
  PVector location;

  ArrayList<Particle> particle;
  int nbParticle;

  //constructeur
  particleSystem(PVector l)
  {
    location = l.get();

    particle = new ArrayList<Particle>();
    nbParticle = (int)random(10, 20);

    for (int i=0; i<nbParticle; i++)
    {
      particle.add(new Particle(location));
    }
  }

  //methode
  void display()
  {
    for (int i=particle.size()-1; i>0; i--)
    {
      Particle p = particle.get(i);

      p.walk();
      p.display();
      p.rotation();



      if (p.isDead())
      {
        particle.remove(i);
      }
    }
  }

  void applyForce(PVector force)
  {
    for (Particle p:particle)
    {
      p.acceleration.add(force);
    }
  }

  void update()
  {
    if (particle.size() > 300)
    {
      particle.remove(0);
    }
  }

  void addParticle()
  {
    float r = random(1);
    /*polymorphisme :
     
     • SquarePart. ellipsePart. & linePart. sont les enfant de particle. Par extension, ils sont donc des particules
     du tableau "particle". Le polymorphisme permet donc de faire une tableau de plusieurs type d'objet
     
     */

    for (int i=0; i<nbParticle; i++)
    {
      if (r < 0.33)
      {
        particle.add(new ellipseParticle(location));
      }
      else if (r>0.3 && r<0.66)
      {
        particle.add(new squareParticle(location));
      }
      else
      {
        particle.add(new lineParticle(location));
      }
    }
  }

  void run()
  {
    display();
  }
}

