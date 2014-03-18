//Cliquez pour lancer l'animation
float posX, posY, oX, oY, d, angle, r, v;
boolean etat = true;

void setup()
{
  size(500, 500);
  update();
}

void draw()
{
  background(255);
  //calcul de l'angle
  angle = atan2(posY - oY, posX - oX);
  //deplacement de la balle
  if (etat == true)
  {
    r=d; //si nous n'activons pas l'attracteur le rayon est égale à la distance entre nos éléments
  }
  if (etat == false)
  {
    r+=v; //sinon notre rayon s'incrémente de la vitesse (-1 donc négative)
  }

  if ( r<1 || r>d)
  {
    v = -v;//si nous atteignons les limite rayon ou 0 notre vitesse s'inverse. Nous attirons puis repoussons notre balle
  }

  //position de la balle
  posX = oX+cos(angle)*r;
  posY = oY+sin(angle)*r;

  //balle
  stroke(0);
  strokeWeight(5);
  point(posX, posY);
  strokeWeight(1); 
  stroke(255, 0, 0);
  line(posX, posY, oX, oY);
  ellipse(posX, posY, 15, 15);

  //cercle trigonométrique
  stroke(0);
  point(oY, oY);
  strokeWeight(1);
  noFill();
  ellipse(oX, oY, d*2, d*2);
  fill(255);
  ellipse(oX, oY, 10, 10);
}

void keyPressed()
{
  if (key == 'a')
  {
    update();
  }
}

void mousePressed()
{
  etat = !etat;  
}

//fonction initialisant notre balle
void update()
{
  oX = width/2;
  oY = width/2;
  posX = random(width);
  posY = random(height);
  d = dist(posX, posY, oX, oY);
  v = -1;
}
