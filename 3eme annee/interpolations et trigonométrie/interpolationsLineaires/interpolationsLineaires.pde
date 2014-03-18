float ratio = 4.0/3.0;
int pWidth = 600;
int pHeight = int(600/ratio);

//coordonées d'origines
float ox;
float oy;

//coordonées d'arrivées
float tx;
float ty;

//Coordonées actuelles
float x;
float y;

//rang et vitesse
float progress;
float vp;

void setup()
{
  size(pWidth, pHeight, P2D);

  ox = width/2;
  oy = height/2;

  tx = random(width);
  ty = random(height);

  progress = 0;
  vp = random(0.01, 0.1);
}

void draw()
{
  background(255);

  //trajectoir
  stroke(127);
  line(ox, oy, tx, ty);

  /*
  tx = mouseX;
   ty = mouseY;
   */

  if (progress < 1)
  {
    progress += vp;
  }
  else
  {
    tx = random(width);
    ty = random(height);
    progress = 0;
    vp = random(0.01, 0.1);
  }

  x = lerp(ox, tx, progress);
  y = lerp(oy, ty, progress);

  //objet
  noFill();
  stroke(0, 0, 255);
  ellipse(x, y, 20, 20);
}

