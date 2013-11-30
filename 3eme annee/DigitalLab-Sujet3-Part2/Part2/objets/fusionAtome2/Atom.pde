class Atom
{
  //variables de l'atome
  float x, y; //position de l'atome
  float masse; //masse de l'atome, ici son diamètre
  float velocite, vx, vy; //velocité des atome, celles-ci seront dépandantent de la masse des atomes
  color cF, cS; //couleur de l'atome

  //variable des electrons
  int nbElectrons;
  float[] posX; //position des electrons
  float[] posY; //position des electrons
  float[] r; //rayon des electrons sur le cercle trigonométrique
  float[] angle; //angle des electrons sur le cercle trigonométrique
  float[] vr; //vitesse des electrons
  float[] vAngle; //vitesse de l'angle des electrons
  float[] origin; //rayon d'origine qui établir notre limite haute de mouvement

  //constructeur
  Atom(float _x, float _y, float _masse, int _nbElec)
  {
    this.x = _x;
    this.y = _y;
    this.masse = _masse;
    this.cF = color(random(160, 180), random(70, 100), random(2, 10), random(70, 100));
    this.cS = color(random(160, 180), random(70, 100), random(10, 20), random(70, 100));

    //calcul des velocités
    this.vx = this.x;
    this.vy = this.y;
    this.velocite = map(this.masse, 5, 30, 5, 1);
    this.vx = this.velocite*random(-1, 1);
    this.vy = this.velocite*random(-1, 1);

    //electrons
    createElectron(_nbElec);
  }

  //--------
  //methodes
  //--------

  //constructeur des Electrons
  void createElectron(int _nbElectrons)
  {
    nbElectrons = _nbElectrons;
    posX = new float[nbElectrons];
    posY = new float[nbElectrons];
    r = new float[nbElectrons];
    angle = new float[nbElectrons];
    vr = new float[nbElectrons]; 
    vAngle = new float[nbElectrons];
    origin = new float[nbElectrons]; 
    for (int i=1; i<nbElectrons; i++) { 
      angle[i] = ((2*PI)/nbElectrons)*i; //Ici nous divisons le cercle 2PI par le nombre de particule multiplier par i pour obtenir l'angle de chaque particule et les placer à équidistance les une des autres
      vr[i] = random(-0.5, -0.1);
      vAngle[i] =radians(1);// radians(random(-1, 1));
      r[i] = random(this.masse/2, this.masse);
      origin[i] = r[i]; 
      posX[i] = this.x+cos(angle[i])*r[i]; //position x sur le cercle x = cos(angle)*rayon
      posY[i] = this.y+sin(angle[i])*r[i]; //position y sur le cercle y = cos(angle)*rayon
    }
  }

  //deplacement
  void motion()
  { 
    this.x += this.vx; 
    this.y += this.vy;
  }

  void checkEdge()
  {
     if (this.x<0)
    {
      this.x = 1;
      this.vx *=-1;
    }
    else if(this.x>width)
    {
      this.x = width-1;
      this.vx *=-1;
    }

    if (this.y<0)
    {
      this.y = 1;
      this.vy *=-1;
    }
    else if(this.y>height)
    {
      this.y = height-1;
      this.vy *=-1;
    }
  }

  //dessin et mouvement des electrons
  void electrons()
  {
    for (int i=1; i<nbElectrons; i++) { 
      r[i] += vr[i]; // reduction du rayon
      angle[i] += vAngle[i];
      if (r[i]>origin[i]+1 || r[i]<this.masse/2-1)
      {
        vr[i] *=-1;
      }
      //position des partciules
      posX[i] = this.x+cos(angle[i])*r[i];
      posY[i] = this.y+sin(angle[i])*r[i];
      stroke(0, 0, 100, 30);
      noFill();
      //dessin de la fleur
      ellipse(posX[i], posY[i], 3, 3);
      line(posX[i], posY[i], this.x, this.y);
      if (i != nbElectrons-1)
      {
        line(posX[i], posY[i], posX[i+1], posY[i+1]);
      }
      else
      {
        line(posX[i], posY[i], posX[1], posY[1]);
      }
    }
  }

  //affichages
  void display()
  {

    //dessin l'atome
    //noStroke();
    electrons();
    fill(0, 0, 100, 5);//this.cF);
    stroke(0, 0, 100, 20);//this.cS);
    ellipse(this.x, this.y, this.masse/2, this.masse/2);
    point(this.x, this.y);
  }
}

