class particleSystem
{
  //variables
  PVector location;

  ArrayList<Particle> particle;
  int nbParticle;
  boolean reactToSound;

  //constructeur
  particleSystem(PVector l)
  {
    location = l.get();

    particle = new ArrayList<Particle>();
    nbParticle = 1000;//(int)random(10, 30);

    addParticle(nbParticle);
  }

  //methode
  void display()
  {
    float windX;
    float windY;
    if(!reactToSound)
    {
      windX = 0.01;
      windY = 0.01;
    }
    else
    {
      float incWind =  constrain(fftObj.getFFTLevel(3), 0, 5);
      float inc = 0;
      if(incWind > 2)
      {
        inc = map(incWind, 2, 5, 0.1, 1);
      }
      else
      {
        inc = inc*-1;
      }
      windX = 0.01+inc;
      println(fftObj.getFFTLevel(3));
      windY = 0.01;
    }
    PVector wind = new PVector(windX, windY);
    
    for(int i=particle.size()-1; i>0; i--)
    {
      Particle p = particle.get(i);
      
      p.walk();
      p.display();
      p.rotation();
      
      p.applyForce(wind);
      if(p.isDead())
      {
        particle.remove(i);
        addParticle(1);
      }
    }
  }

  void update()
  {
    if(particle.size() > 300)
    {
      particle.remove(0);
    }
  }
  
  void addParticle(int nbParticles)
  {
   
      for (int i=0; i<nbParticles; i++)
    {
      float marge = width/2;
      float x = random(location.x-marge, location.x+marge);
      float y = -marge;
      float z = random(location.z-marge, location.z+marge);
      PVector loc = new PVector(x, y, z);
      particle.add(new Particle(loc));
    }
    
  }
  
  void reactToSoundFFT()
  {
    if(reactToSound)
    {
    }
  }
  
  void run()
  {
    display();
  }
}

