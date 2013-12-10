class Alinea
{
  //variables
  Timer sequenceTimer;
  int tempsSequenceTimer;

  //beginLine
  Timer timerBegin;
  int tempsTimerBegin;
  int nbTotalElement;

  //changeColor
  Timer timerColor;
  int tempsTimerColor;
  boolean changeColor;

  //line element
  ArrayList<PointObject> pt;

  //constructeur
  Alinea(int tempsSequenceTimer_)
  {

    pt = new ArrayList<PointObject>();

    //timer Begin
    nbTotalElement = 12;
    tempsTimerBegin = 500;
    timerBegin = new Timer(tempsTimerBegin);
    timerBegin.start();

    //tempsTimerColor
    tempsTimerColor = 13000;
    timerColor = new Timer(tempsTimerColor);
    changeColor = false;

    //timerglobal
    tempsSequenceTimer = tempsSequenceTimer_;
    sequenceTimer = new Timer(tempsSequenceTimer);
    sequenceTimer.start();
  }

  //methodes
  void run()
  {
    calculateSequence();

    display();
  }

  void calculateSequence()
  {
    if (sequenceTimer.isFinished() == false)
    {
      if (pt.size() < nbTotalElement)
      {
        beginLine();
      }
      else
      {
        timerColor.start();
        changeColor();
      }
    }
  }

  void beginLine()
  {

    if (timerBegin.isFinished())
    {
      float marge = 150;
      float x = (width+marge)/nbTotalElement*pt.size();

      pt.add(new PointObject(x, height/2));

      timerBegin.reset(tempsTimerBegin);
      timerBegin.start();
    }
  }

  void changeColor()
  {
    if (timerColor.isFinished() == true)
    {
      changeColor = true;
    }
    else
    {
    }
  }

  void display()
  {
    for (int i=0; i<pt.size(); i++)
    {
      PointObject myPt0 = pt.get(i);
      float FFTLevel = fftObj.getFFTLevel(i);

      for (int j=i+1; j<pt.size(); j++)
      {

        PointObject myPt1 = pt.get(j);

        float distance = dist(myPt0.x, myPt0.y, myPt1.x, myPt1.y);


        if (j == i+1)
        {
          if (pt.size() >= nbTotalElement)
          {
            float strokeWeightFFT = map(FFTLevel, 0, 100, 1, 20);
            strokeWeight(strokeWeightFFT);
          }
          else
          {
            strokeWeight(1);
          }

          if (changeColor == false)
          {
            stroke(0, 0, 100);
          }
          else
          {
            float hue = map(FFTLevel, 0, 70, 0, 360);
            stroke(hue, 100, 100, 100);

            for (int k = 0; k<10; k++)
            {
              float marge = map(FFTLevel, 0, 100, 0, 50);
              line(myPt0.x, myPt0.y-(marge*k), myPt1.x, myPt1.y-(marge*k));
            }
          }


          line(myPt0.x, myPt0.y, myPt1.x, myPt1.y);
        }
      }
      if (pt.size() >= nbTotalElement)
      {
        //myPt0.run();
        myPt0.y = height/2-FFTLevel;
      }
      else
      {
      }
    }
  }
}

