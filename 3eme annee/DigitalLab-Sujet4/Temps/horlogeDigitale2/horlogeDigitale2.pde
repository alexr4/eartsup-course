int sWidth = 800;
int sHeight = 400;

int largeur;
int hauteur;
int margeL;
int margeH;

PFont dsb;

void setup()
{
  size(sWidth, sHeight, P2D);

  largeur = 10;
  hauteur = 10;
  margeL = 100;
  margeH = 40;
  
  dsb = loadFont("dsb.vlw");
}

void draw()
{
  background(0);
  textFont(dsb);
  textAlign(RIGHT);
  text(hour()+" : "+minute()+" : "+second()+" : "+millis(), width/2-55, height/2);

  textAlign(LEFT);
  text(day()+" / "+month()+" / "+year(), width/2+100, height/2);

  noStroke();
  rectMode(CENTER);
  
  //secondes
  for (int i = 0; i<60; i++) {
    if (i == second()) {
      fill(127);
      hauteur = 20;
    }
    else {
      fill(255);
      hauteur = 10;
    }
    rect(margeL+largeur*i, margeH+(height/2)+20, largeur, hauteur);
  }


  //minutes
  for (int i = 0; i<60; i++) {
    if (i == minute()) {
      fill(127);
      hauteur = 20;
    }
    else {
      fill(255);
      hauteur = 10;
    }
    rect(margeL+largeur*i, margeH+(height/2), largeur, hauteur);
  }   


  //heure
  for (int i = 0; i<24; i++) {
    if (i == hour()) {
      fill(127);
      hauteur = 20;
    }
    else {
      fill(255);
      hauteur = 10;
    }
    rect(margeL+largeur*i, margeH+(height/2)-20, largeur, hauteur);
  }
}

