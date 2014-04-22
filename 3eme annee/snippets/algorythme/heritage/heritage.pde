ArrayList<particleSystem> ps;

void setup()
{
  size(500, 500, OPENGL);
  colorMode(HSB, 360, 100, 100, 100);
  smooth(8);
  ps = new ArrayList<particleSystem>();

  ps.add(new particleSystem(new PVector(width/2, height/2)));
}

void draw()
{
  background(0, 0, 100);

  //applyforce

  float incW = map(mouseX, 0, width, -1, 1);
  float incH = map(mouseY, 0, width, -1, 2);

  PVector wind = new PVector(incW, incH);
  PVector gravity = new PVector(0, 0.5);



  for (particleSystem p : ps)
  {
    p.run();
    p.addParticle();

    p.applyForce(wind);
    p.applyForce(gravity);
  }

  fill(0);
  text(frameRate, 10, 20);
}

void mouseReleased()
{
  ps.add(new particleSystem(new PVector(mouseX, mouseY)));
}

