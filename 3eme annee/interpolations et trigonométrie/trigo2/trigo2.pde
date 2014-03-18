//Cliquez pour lancer l'animation

float oX;
float oY;
float nbParticles;
float[] d;
float[] angle;
float[] posX;
float[] posY;
float[] posX_2;
float[] posY_2;
float[] v;
float[] r;

boolean etat = true;
boolean dessin = true;

void setup()
{
  size(500, 500);
  //frameRate(2); 
  update();
}

void draw()
{

  background(255);
  oX = mouseX;
  oY = mouseY;
  for (int i = 0; i<nbParticles; i++)
  {
    angle[i] = atan2(posY[i] - oY, posX[i]  - oX);
    d[i] = dist(posX[i], posY[i], oX, oY);
    //deplacement de la lettre
    if (etat == true)
    {
      r[i]=d[i];
    }
    if (etat == false)
    {
      r[i]+=v[i];
    }

    if ( r[i]<1)
    {
      v[i] = -v[i];
    }
    if ( r[i]>d[i])
    {
      v[i]= -v[i];
      r[i]=d[i];
    }

    //position de la lettre 
    posX_2[i] = oX+cos(angle[i])*r[i];
    posY_2[i] = oY+sin(angle[i])*r[i];

    if(dessin == true)
    {
    float a = map(d[i], 0, width, 0, 50);  
     stroke(0, a);
     ellipse(oX, oY, d[i]*2, d[i]*2);
     //dessin de l'origine de point
    stroke(0);
    strokeWeight(5);
    point(posX[i], posY[i] );
    strokeWeight(1);
    line(posX[i], posY[i], oX, oY);
    stroke(255, 0, 0);
    strokeWeight(1);
    line(posX_2[i], posY_2[i], oX, oY);
    }

    //dessin de lettre
    stroke(255, 0, 0);
    strokeWeight(1);
    ellipse(posX_2[i], posY_2[i], 15, 15);

  }

  //ellipse 
  strokeWeight(1);
  stroke(255, 100);
  point(oY, oY);
  noFill();

}

void keyPressed()
{
  if (key == 'a')
  {
    update();
    etat = true;
  }
  if(key == 'z')
  {
    dessin = !dessin;
  }
}

void mousePressed()
{
  etat = !etat;

}

void update()
{

  nbParticles = 20;
  oX = width/2;
  oY = height/2;
  posX = new float[20];
  posY = new float[20];
  d = new float[20];
  v = new float[20];
  angle = new float[20];
  r = new float[20];
  posX_2 = new float[20];
  posY_2 = new float[20];
  for (int i = 0; i<nbParticles; i++)
  {
    posX[i] = random(width);
    posY[i] = random(height);
    d[i] = dist(posX[i], posY[i], oX, oY);
    v[i] = random(-4, -0.5);
  }
}
