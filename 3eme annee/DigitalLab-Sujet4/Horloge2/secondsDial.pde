class secondsDial
{
  //variables

  float radius;
  ArrayList<Point> points;
  int countCycle;
  int millis;
  int millisLimite;
  float z;

  //constructeur
  secondsDial(float radius_, float z_)
  {
    radius = radius_;
    countCycle = 0;
    millis = 0;
    millisLimite = millis()+60000;
    z = z_;

    points = new ArrayList<Point>();
  }

  void run()
  {
    updateMillis();
    update();
    display();
  }

   void update()
  {
    if (!cycle())
    {

      float theta = map(millis, 0, 60, 0, 360);
      float x = radius*cos(radians(theta));
      float y = radius*sin(radians(theta));

      if (points.size()-1 != millis)
      {
        points.add(new Point(x, y));
      }
    }
  }
  void updateMillis()
  {
    if (millis()<=millisLimite)
    {
      millis = int(map(millis(), millisLimite-60000, millisLimite, 0, 60));
    }
    else
    {
      millis = 60;
    }
  }

  boolean cycle()
  {
    if (countCycle == 0)
    {
      if (millis >= 60)
      {
        countCycle = 1;
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return true;
    }
  }

  void display()
  {
    pushMatrix();
    translate(0, 0, z);
    for (int i = 0; i<points.size(); i++)
    {
      Point p = points.get(i);
      float newRgb = map(i, 0, points.size(), 50, 255);
      if (!cycle())
      {
        p.rgb = newRgb;
        drawSecondHand();
      }
      else
      {
        p.rgb = 50;
      }
      p.run();
    }
    popMatrix();
  }
  
  void drawSecondHand()
  {
    pushStyle();
    stroke(255);
    line(0,0,0, points.get(points.size()-1).x, points.get(points.size()-1).y, 0);
    popStyle();
  }
}

