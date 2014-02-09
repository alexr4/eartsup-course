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

  //snow
  ArrayList<particleSystem> ps;
  boolean showSnow;


  boolean showAll;
  CameraObject myCam;
  Timer timerCam;
  int randomTimer;

  //constructeur
  Alinea(int tempsSequenceTimer_)
  {

    pt = new ArrayList<PointObject>();
    myCam = new  CameraObject(70, sWidth, sHeight, new PVector(0, 0, 2000), new PVector(0, 0, 0));

    //timer Begin

    tempsTimerBegin = 1000;
    nbTotalElement = 8000/1000;
    timerBegin = new Timer(tempsTimerBegin);
    timerBegin.start();

    //tempsTimerColor
    tempsTimerColor = 37000;
    timerColor = new Timer(tempsTimerColor);
    changeColor = false;

    timerColor.start();

    //timerglobal
    tempsSequenceTimer = tempsSequenceTimer_;
    sequenceTimer = new Timer(tempsSequenceTimer);
    sequenceTimer.start();

    //timerCAm
    randomTimer = int(random(2, 4)*1000);
    timerCam  = new Timer(randomTimer);
    timerCam.start();

    //snow
    ps = new ArrayList<particleSystem>();
    ps.add(new particleSystem(new PVector(0, -width/2, 0)));
  }

  //methodes
  void run()
  {
    myCam.run();
    changeCameraWithTime();
    calculateSequence();
    if (showAll)
    {
      for (int i=0; i<4; i++)
      {
        float theta = map(i, 0, 9, 0, TWO_PI);
        pushMatrix();
        rotateY(theta);
        display();
        popMatrix();
      }

      if (showSnow)
      {
        displaySnow();
      }

      displayGround();
    }
  }

  void calculateSequence()
  {
    if (sequenceTimer.isFinished() == false)
    {
      showAll = true;
      if (pt.size() < nbTotalElement)
      {
        beginLine();
      }
      else
      {
        changeColor();
        showSnow = true;
      }
    }
    else
    {
      showAll = false;
    }
  }

  void beginLine()
  {
    if (timerBegin.isFinished())
    {
      float mr = 200;
      float largeurLine = (((width/2)+mr)/nbTotalElement);
      //println(largeurLine*nbTotalElement);
      float marge = -width/4;
      float x = marge+largeurLine*(pt.size()+1)-mr;//( width/nbTotalElement)*pt.size();//(width+marge)/nbTotalElement*(pt.size()-1);

      pt.add(new PointObject(x, 0, pt.size()));

      timerBegin.reset(tempsTimerBegin);
      timerBegin.start();
    }
  }

  void changeColor()
  {
    if (timerColor.isFinished() == true)
    {
      changeColor = true;
      ps.get(0).reactToSound = true;
    }
    else
    {
    }
  }


  void display()
  {
    pushMatrix();
    rotateZ(radians(90));
    translate(280, 0, 0);
    for (int i=0; i<pt.size(); i++)
    {

      int indexCol0 = i;
      int indexCol1;

      if (i != pt.size()-1)
      {
        indexCol1 = i+1;
      }
      else
      {
        indexCol1 = 0;
      }

      float incY=  map(i, 0, pt.size()-1, 5, 500);

      PointObject myPt0 = pt.get(indexCol0);
      PointObject myPt1 = pt.get(indexCol1);
      float FFTLevel = fftObj.getFFTLevel(indexCol0)*10;
      float FFTLevel2 = fftObj.getFFTLevel(indexCol1)*10;


      PVector a = new PVector(myPt0.x, myPt0.y, 0);
      PVector b = new PVector(myPt0.x, 0, myPt0.z);
      PVector c = new PVector(myPt0.x, myPt0.yMinus, 0);
      PVector d = new PVector(myPt0.x, 0, -myPt0.z);

      PVector a_ = new PVector(myPt1.x, myPt1.y, 0);
      PVector b_ = new PVector(myPt1.x, 0, myPt1.z);
      PVector c_ = new PVector(myPt1.x, myPt1.yMinus, 0);
      PVector d_ = new PVector(myPt1.x, 0, -myPt1.z);


      noStroke();


      fill(107, 50, 89);

      drawFace(a, a_, b, b_);
      drawFace(a, a_, d, d_);
      drawFace(c, c_, b, b_);
      drawFace(c, c_, d, d_);

      drawFace(a, b, d, c);
      drawFace(a_, b_, d_, c_);




      if (pt.size() >= nbTotalElement)
      {

        myPt0.y = -incY-FFTLevel;
        myPt0.yMinus = incY+FFTLevel;
        myPt0.z =  incY+FFTLevel;

        pushMatrix();
        translate(pt.get(pt.size()-1).x, 0, 0);
        fill(27, 58, 57);
        box(200, 50, 50);
        popMatrix();

        //myPt0.run();
      }
      else
      {
        //myPt0.run();
      }
    }


    popMatrix();
  }


  void drawFace(PVector a, PVector b, PVector c, PVector d)
  {
    beginShape(QUAD_STRIP);
    vertex(a.x, a.y, a.z);
    vertex(b.x, b.y, b.z);
    vertex(c.x, c.y, c.z);
    vertex(d.x, d.y, d.z);
    endShape(CLOSE);
  }

  void displaySnow()
  {
    for (particleSystem p : ps)
    {
      p.run();
      //p.addParticle();
    }
  }

  void displayGround()
  {
    pushStyle();
    pushMatrix();
    translate(0, width/2, 0);
    rotateX(radians(90));
    fill(0, 0, 100);
    box(width, width, 5);
    popMatrix();
    popStyle();
  }

  void changeCameraWithTime()
  {
    if (timerCam.isFinished())
    {

      randomTimer = round(random(4, 8))*1000;
      int randomCam = round(random(2));
      myCam.setCameraBehavior(randomCam);


      timerCam.reset(randomTimer);
      timerCam.start();
    }
  }
}

