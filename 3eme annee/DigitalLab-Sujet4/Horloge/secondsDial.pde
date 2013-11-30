class secondsDial
{
  //variables

  float radius;
  ArrayList<Point> points;
  int countCycle;
  int millis;
  int millisLimite;

  //constructeur
  secondsDial(float radius_)
  {
    radius = radius_;
    countCycle = 0;
    millis = 0;
    millisLimite = millis()+60000;

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
      for (int i=0; i<60; i++)
      {
        float theta = map(i, 0, 59, 0, 360);
        float x = radius*cos(radians(theta));
        float y = radius*sin(radians(theta));

        if (millis == i)
        {
          points.add(new Point(x, y));
        }
      }
    }
  }
  
  void updateMillis()
  {
    if(millis()<=millisLimite)
    {
      millis = int(map(millis(), millisLimite-60000, millisLimite, 0, 59));
    }
    else
    {
      millis = 59;
    }
  }

  boolean cycle()
  {
    if (countCycle == 0)
    {
      if (millis >= 58)
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
    for (int i = 0; i<points.size(); i++)
    {
      Point p = points.get(i);
      float newRgb = map(i, 0, points.size(), 200, 0);
      p.rgb = newRgb;
      p.run();
    }
  }
}

