int sWidth = 1920;
int sHeight = sWidth/2;

ArrayList<Point> mesPoints;
float cycle, nbCycle;
int nbNewPts;
int limiteCycle;

void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);

  mesPoints = new ArrayList<Point>();
  nbNewPts = 4;
  limiteCycle = 5;

  mesPoints.add(new Point(0, (3*PI)/2, width/2, height, 1500));
}

void draw()
{
  background(0);

  for (int i=0; i<mesPoints.size(); i++)
  {
    Point pts = mesPoints.get(i);
    pts.run();
    if (cycle < limiteCycle)
    {
      if (pts.vie == false && pts.exploded == false)
      {
        for (int j=0; j<nbNewPts; j++)
        {
          float angle = map(j, 0, nbNewPts, 0, TWO_PI);
          mesPoints.add(new Point(0, angle, pts.x, pts.y, int(pts.lifeTime*0.5)));
        }

        pts.exploded = true;
      }
    }
  }

  cycle = round(log(mesPoints.size()-1) / log(nbNewPts));


  if (cycle != nbCycle)
  {
    println(cycle);
  }
  nbCycle = cycle;
}

void mousePressed()
{
  mesPoints.clear();
  cycle = 0;
  nbNewPts = int(random(3, 10));
  limiteCycle = int(random(2, 5));

  mesPoints.add(new Point(0, (3*PI)/2, width/2, height, 1500));
}

