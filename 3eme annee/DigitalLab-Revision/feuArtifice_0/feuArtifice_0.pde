int sWidth = 1920;
int sHeight = sWidth/2;

ArrayList<Point> mesPoints;
float cycle;
int nbNewPts;
int limiteCycle;

void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);
  mesPoints = new ArrayList<Point>();
  nbNewPts = int(random(3, 10));
   limiteCycle = int(random(2, 4));

  mesPoints.add(new Point(0, (3*PI)/2, width/2, height-400));
}

void draw()
{
  background(255);

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
          mesPoints.add(new Point(0, angle, pts.x, pts.y));
        }

        pts.exploded = true;
        println(cycle);
      }
    }
  }
  
  cycle = round(log(mesPoints.size()-1) / log(nbNewPts));

  
}

void mousePressed()
{
  mesPoints.clear();
  cycle = 0;
  nbNewPts = int(random(3, 10));
  limiteCycle = int(random(2, 4));
  
  mesPoints.add(new Point(0, (3*PI)/2, width/2, height-200));
}

