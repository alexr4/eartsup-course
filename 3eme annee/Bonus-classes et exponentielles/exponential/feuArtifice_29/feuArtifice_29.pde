import peasy.*;

PeasyCam cam;

int sWidth = 1280;
int sHeight = sWidth/2;

ArrayList<Point> mesPoints;
float cycle, nbCycle;
int nbNewPts;
int limiteCycle;

void setup()
{
  size(sWidth, sHeight, P3D);
  smooth(8);

  mesPoints = new ArrayList<Point>();
  nbNewPts = 4;
  limiteCycle = 5;

  mesPoints.add(new Point(0, (3*PI)/2, (3*PI)/2, width/2, height-200, cycle, 300, -300, 0, 0));

  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMinimumDistance(20);
  cam.setMaximumDistance(2000);
}

void draw()
{
  background(0);

  for (int i=0; i<mesPoints.size(); i++)
  {
    Point pts = mesPoints.get(i);

    /* for (int j=i+1; j<mesPoints.size(); j++)
     {
     Point pts2 = mesPoints.get(j);
     
     float d = dist(pts.x, pts.y, pts2.x, pts2.y);
     float a = map(d, 0, 25, 255, 0);
     
     
     if (d<25)
     {
     
     stroke(255, a);
     line(pts.x, pts.y, pts2.x, pts2.y);
     }
     }*/


    pts.run();

    if (cycle < limiteCycle)
    {

      if (pts.vie == false && pts.exploded == false)
      {
        float resA = 10;
        float resB = 10;
        for (int j=0; j<180/resA; j++)
        {
          for (int k=0; k<360/resB; k++)
          {
            float angle = map(j*resA, 0, 180, 0, PI);
            float angle2 = map(k*resB, 0, 360, 0, TWO_PI);
            mesPoints.add(new Point(0, angle, angle2, pts.x, pts.y, cycle, pts.limite*0.5, pts.x, pts.y, pts.z));
          }
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

void keyPressed()
{
  if (key == ' ')
  {
    mesPoints.clear();
    cycle = 0;
    nbNewPts = int(random(3, 10));
    limiteCycle = int(random(2, 4));

    mesPoints.add(new Point(0, (3*PI)/2, (3*PI)/2, width/2, height-200, cycle, 300, -300, 0, 0));
  }
}

