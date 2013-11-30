class newAtom
{
  //variable du nouvel atome
  float x, y; //position du nouvel atome
  float masse; //masse du nouvel atome
  float velocite, vx, vy; //velocité des atome, celles-ci seront dépandantent de la masse des atomes

  //valeur d'origine de l'atome
  float masse1, masse2;
  int nbElec1, nbElec2;


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
  newAtom(float _x, float _y, float _masse, int _nbElec, float _masse1, float _masse2, int _nbElec1, int _nbElec2)
  {
    this.x = _x;
    this.y = _y;
    this.masse = _masse;

    //origine de l'atome
    this.masse1 = _masse1;
    this.masse2 = _masse2;
    this.nbElec1 = _nbElec1;
    this.nbElec2 = _nbElec2;

    //vitesse
    this.velocite = map(this.masse, 10, 60, 3, 1);
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
      stroke(0, 0, 100, 15);
      noFill();
      
      posX[i] = this.x+cos(angle[i])*r[i];
      posY[i] = this.y+sin(angle[i])*r[i];
      ellipse(posX[i], posY[i], 4, 4);
      
      posX[i] = this.x+cos(angle[i])*(r[i]-4);
      posY[i] = this.y+sin(angle[i])*(r[i]-4);
      ellipse(posX[i], posY[i], 2, 2);
      
      posX[i] = this.x+cos(angle[i])*(r[i]+10);
      posY[i] = this.y+sin(angle[i])*(r[i]+10);
      line(posX[i], posY[i], this.x, this.y);
      
    }
  }

  void display()
  {
    electrons();
    fill(0, 0, 100, 10);
  }
}

