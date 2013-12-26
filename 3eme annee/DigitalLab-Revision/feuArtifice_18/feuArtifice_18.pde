int sWidth = 1280;
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

  mesPoints.add(new Point(0, (3*PI)/2, width/2, height-200, cycle));
}

void draw()
{
  background(0);

  for (int i=0; i<mesPoints.size(); i++)
  {
    Point pts = mesPoints.get(i);
    
    for (int j=i+1; j<mesPoints.size(); j++)
    {
      Point pts2 = mesPoints.get(j);
      
      float d = dist(pts.x, pts.y, pts2.x, pts2.y);
      float a = map(d, 0, 200, 255, 0);
      float d2 = dist(pts.x, pts.y, mesPoints.get(0).x, mesPoints.get(0).y);
      float a2 = map(d2, 0, width/3, 255, 0);
      
      if(d>30 && d<100)
      {
        
        stroke(255, a2);
        line(pts.x, pts.y, pts2.x, pts2.y);
      }
    }

    
    pts.run();
    if (cycle < limiteCycle)
    {
      if (pts.vie == false && pts.exploded == false)
      {
        for (int j=0; j<nbNewPts; j++)
        {
          float angle = map(j, 0, nbNewPts, 0, TWO_PI);
          mesPoints.add(new Point(0, angle, pts.x, pts.y, cycle));
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
  limiteCycle = int(random(2, 4));
  
  mesPoints.add(new Point(0, (3*PI)/2, width/2, height-200, cycle));
}

