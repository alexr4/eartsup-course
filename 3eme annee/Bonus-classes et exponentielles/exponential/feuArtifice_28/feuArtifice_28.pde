import peasy.*;

PeasyCam cam;

int sWidth = 1920;
int sHeight = sWidth/2;

ArrayList<Point> mesPoints;
float cycle, nbCycle;
int nbNewPts;
int limiteCycle;

void setup()
{
  size(sWidth, sHeight, P3D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);

  mesPoints = new ArrayList<Point>();
  nbNewPts = 4;
  limiteCycle = 5;

  mesPoints.add(new Point(0, (3*PI)/2, width/2, height-200, cycle, 300, 160));

  cam = new PeasyCam(this, width/2, height/2, 0, 500);
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

      float limite = 10;

      float d = dist(pts.x, pts.y, pts2.x, pts2.y);



      if (d<limite)
      {
        float a = map(d, 0, limite, 100, 0);
        stroke(map(d, 0, limite, 30, 80), 100, 100, a);
        line(pts.x, pts.y, pts2.x, pts2.y);
      }
    }*/


    pts.run();

    if (cycle < limiteCycle)
    {

      if (pts.vie == false && pts.exploded == false)
      {

        for (int j=0; j<nbNewPts; j++)
        {
          float angle = map(j, 0, nbNewPts, 0, TWO_PI);
          mesPoints.add(new Point(0, angle, pts.x, pts.y, cycle, pts.limite*0.5, pts.hue+20));
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
    limiteCycle = 4;//int(random(2, 4));

    mesPoints.add(new Point(0, (3*PI)/2, width/2, height-200, cycle, 300, 160));
  }
}

