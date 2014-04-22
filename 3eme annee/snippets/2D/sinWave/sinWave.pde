ArrayList<Points> pts;
int nbPts;

float theta = 0.0;
float amplitude = 200;
float period = 45;
float dx;

void setup()
{
  size(800, 400, P2D);
  smooth(8);

  pts = new ArrayList<Points>();
  nbPts = 100;
  theta = 0.0;
  amplitude = 200;
  period = nbPts-1;
  dx = (TWO_PI / period)*(nbPts); //division de 360°

  for (int i=0; i<nbPts; i++)
  {
    float x = map(i, 0, nbPts, 0, width);
    float y = height/2;

    pts.add(new Points(x, y));
  }
}

void draw()
{
  background(255);

  theta += map(mouseX, 0, width, 0.01, 0.09); // vitesse de l'angle
  amplitude = map(mouseY, 0, height, 5, 200);
  float incrementSinus = theta;

  beginShape();
  for (int i=0; i<pts.size(); i++)
  {

    Points pt0 = pts.get(i);
    //pt0.run();+++
    pt0.y = height/2+sin(incrementSinus)*amplitude;
    incrementSinus += dx;

    stroke(255, 0, 0);
    strokeWeight(1);
    vertex(pt0.x, pt0.y);

    vertex(pt0.x, pt0.y);
  }
  endShape();

  for (Points pt : pts)
  {
    //pt.run();
  }
}

void keyPressed()
{
  if(key == '+')
  {
    period ++;
    println("period = "+period);
  }
  if(key == '-')
  {
    period --;
    println("period = "+period);
  }
  updatePeriod();
}

void updatePeriod()
{
  if(period >= nbPts)
  {
    period = 1;
  }
  else if(period <= 0)
  {
    period = nbPts-1;
  }
  dx = (TWO_PI / period)*(nbPts);
}
