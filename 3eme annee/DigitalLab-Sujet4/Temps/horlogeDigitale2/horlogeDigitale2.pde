int sWidth = 800;
int sHeight = 400;

int largeur;
int hauteur;
int margeL;
int margeH;

void setup()
{
  size(sWidth, sHeight, P2D);

  largeur = 10;
  hauteur = 10;
  margeL = 100;
  margeH = 40;
}

void draw()
{
  background(0);
  textSize(30);

  textAlign(RIGHT);
  text(hour()+" : "+minute()+" : "+second()+" : "+millis(), width/2-20, height/2);

  textAlign(LEFT);
  text(day()+" / "+month()+" / "+year(), width/2+20, height/2);

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

