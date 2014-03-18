float oX, oY, d; //cible et distance de la cible
float[] posX; //position des partciules
float[] posY; //position des partciules
color[] c; //couleurs des particules
float[] r; //rayon des particules sur le cercle trigonométrique
float[] angle; //angle des particules sur le cercle trigonométrique
float[] vr; //vitesse des particules
float colorRatio; //plage de couleur

boolean etat = false;//animation on/off
int nbParticules;//notre de point

float angleGlobal; //angle de rotation de notre skecth
float vAngle; //sens de la rotation

float count; //notre décompte. Toute les 500 frame nous effacerons notre fleur pour en dessiner une nouvelle.

void setup()
{
  size(500, 500, P2D);
  colorMode(HSB, 360, 100, 100, 100); // ici nous passons en mode colorimétrique Teinte Saturation Luminosité. Ce qui nous pemrettra de définir plus aisement nos plages de couleur
  update();  //fonction initialisant nos valeurs
  background(0);
}

void draw()
{

  pushMatrix();
  /*rotation de la fleur*/
  if (etat == false) //si nous activons la rotation de la fleur
  {

    angleGlobal += vAngle;
  }
  else if (etat == true) //sinon la fleur reste droite
  {
    angleGlobal = angleGlobal;
  }
  translate(oX, oY);
  rotate(radians(angleGlobal));

  /*calcul des nouvelles positions de notre fleur*/
  for (int i=1; i<nbParticules; i++) { 
    r[i] += vr[i]; // reduction du rayon

    if (r[i]>200 || r[i]<0) //limite de la fleur. Si une des particules atteint le centre alors nous re initinalisons un cycle à l'aide de la fonction update();
    {
      update();
    }
    //position des partciules
    posX[i] = cos(angle[i])*r[i];
    posY[i] = sin(angle[i])*r[i];
    stroke(c[i], 5);
    noFill();
   //dessin de la fleur
    if (i != nbParticules-1)
    {
      line(posX[i], posY[i], posX[i+1], posY[i+1]);
    }
    else
    {
      line(posX[i], posY[i], posX[1], posY[1]);
    }
  }
  popMatrix();
  //decompte
  count++;
  if(count >= 1000)
  {
    count = 0;
    background(0);
  }
}

void keyPressed()
{
  if (key == 'a')
  {
    etat = !etat;
  }
}

//interactivité
void mousePressed()
{
  background(0);
  update();
}

void update()
{
  vAngle = random(-0.1, 0.1); //définition du sens de rotation du sketch 
  colorRatio = random(0, 300); //choix d'un plage de couleur entre 0 et 300° - notre plage sera entre cette valeur et cette valeur+60
  nbParticules = 50; 
  oX = width/2;
  oY = width/2;
  posX = new float[nbParticules];
  posY = new float[nbParticules];
  r = new float[nbParticules];
  angle = new float[nbParticules];
  vr = new float[nbParticules];  
  c = new color[nbParticules];

  for (int i=1; i<nbParticules; i++) { 
    angle[i] = ((2*PI)/nbParticules)*i; //Ici nous divisons le cercle 2PI par le nombre de particule multiplier par i pour obtenir l'angle de chaque particule et les placer à équidistance les une des autres
    vr[i] = random(-0.5, -0.1); 
    r[i] = 200; //ici nos particules ont un rayon de départ identique pour former notre cercle mais nous pouvons aussi le définir en random et obtenir un autre visuel random(150, 200);
    posX[i] = oX+cos(angle[i])*r[i]; //position x sur le cercle x = cos(angle)*rayon
    posY[i] = oY+sin(angle[i])*r[i]; //position y sur le cercle y = cos(angle)*rayon
    d = dist(posX[i], posY[i], oX, oY); //distance entre les particules et la cible
    c[i] = color(random(colorRatio, colorRatio+60),random(80, 100), random(80,100)); //définissions de la couleur
  }
}
