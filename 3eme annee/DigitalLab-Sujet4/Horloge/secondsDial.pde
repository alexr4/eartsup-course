class secondsDial
{
  //variables
  float posX, posY;
  float radius;
  ArrayList<Point> points;
  int countCycle;
  int secondes;
  int secondesLimite;

  //constructeur
  secondsDial(float radius_, float posX_, float posY_)
  {
    posX = posX_;
    posY = posY_;
    radius = radius_;
    countCycle = 0;
    secondes = 0;
    secondesLimite = millis()+60000;

    points = new ArrayList<Point>();
  }

  void run()
  {
    updateSeconde();
    update();
    display();
  }

  void update()
  {
    if (!cycle())
    {

      float theta = map(secondes, 0, 60, 0, 360);
      float x = radius*cos(radians(theta))+posX;
      float y = radius*sin(radians(theta))+posY;

      if (points.size()-1 != secondes)
      {
        points.add(new Point(x, y));
      }
    }
  }

  void updateSeconde()
  {
    if (millis()<=secondesLimite)
    {
      secondes = int(map(millis(), secondesLimite-60000, secondesLimite, 0, 60));
    }
    else
    {
      secondes = 60;
    }
  }

  boolean cycle()
  {
    if (countCycle == 0)
    {
      if (secondes >= 60)
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
      p.run();
    }
  }
}

