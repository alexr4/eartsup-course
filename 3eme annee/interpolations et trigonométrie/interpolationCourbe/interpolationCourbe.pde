float ratio = 4.0/3.0;
int pWidth = 600;
int pHeight = int(600/ratio);

//coordonées d'origines Bézier
float ox;
float oy;

//coordonées d'arrivées Bézier
float tx;
float ty;

//anchor Point de bézier
float aox;
float aoy;
float atx;
float aty;

//Coordonées de l'objet bézier
float bx;
float by;

//Coordonées de l'objet catmull
float cx;
float cy;


//rang et vitesse
float progress;
float vp;

void setup()
{
  size(pWidth, pHeight, P2D);

  ox = random(width);
  oy= random(height);

  tx= random(width);
  ty= random(height);

  aox= random(width);
  aoy= random(height);

  atx= random(width);
  aty= random(height);



  progress = 0;
  vp = random(0.001, 0.01);
}

void draw()
{
  background(255);
  strokeWeight(1);

  noFill();
  //trajectoire Bézier
  stroke(255, 102, 0);
  line(aox, aoy, ox, oy);
  line(atx, aty, tx, ty);
  stroke(0, 255, 0);
  bezier(aox, aoy, ox, oy, tx, ty, atx, aty);


  stroke(255, 102, 0);
  stroke(0, 0, 255);
  curve(aox, aoy, ox, oy, tx, ty, atx, aty);

  stroke(255, 0, 0);
  strokeWeight(5);
  point(aox, aoy);
  point(atx, aty);


  //objet
  if (progress < 1)
  {
    progress += vp;
  }
  else
  {
    ox = random(width);
    oy= random(height);

    tx= random(width);
    ty= random(height);

    aox= random(width);
    aoy= random(height);

    atx= random(width);
    aty= random(height);
    progress = 0;
    vp = random(0.001, 0.01);
  }

  cx = curvePoint(aox, ox, tx, atx, progress);
  cy = curvePoint(aoy, oy, ty, aty, progress);
  
  bx = bezierPoint(aox, ox, tx, atx, progress);
  by = bezierPoint(aoy, oy, ty, aty, progress);

  //objet
  noFill();
  strokeWeight(1);
  stroke(0);
  ellipse(cx, cy, 20, 20);
  ellipse(bx, by, 20, 20);
}

